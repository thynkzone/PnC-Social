package com.thynkzone.pnc.service.impl;

import com.thynkzone.pnc.dto.ConnectionStatusDto;
import com.thynkzone.pnc.dto.UserProfileDto;
import com.thynkzone.pnc.entity.UserRelationship;
import com.thynkzone.pnc.repository.UserProfileRepository;
import com.thynkzone.pnc.repository.UserRelationshipRepository;
import com.thynkzone.pnc.service.ConnectionService;
import com.thynkzone.pnc.service.UserService;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ConnectionServiceImpl implements ConnectionService {

    private final UserRelationshipRepository relationshipRepository;
    private final UserProfileRepository userProfileRepository;
    private final UserService userService;

    public ConnectionServiceImpl(UserRelationshipRepository relationshipRepository,
                                 UserProfileRepository userProfileRepository,
                                 UserService userService) {
        this.relationshipRepository = relationshipRepository;
        this.userProfileRepository = userProfileRepository;
        this.userService = userService;
    }

    @Override
    @Transactional
    public void sendCoworkerRequest(String userId, String targetUserId) {
        if (userId.equals(targetUserId)) {
            throw new IllegalArgumentException("Cannot send a request to yourself.");
        }

        // Check if already coworkers or request already pending
        if (relationshipRepository.existsByUserIdAndTargetUserIdAndRelationshipType(userId, targetUserId, 2)) {
            throw new IllegalStateException("Already coworkers.");
        }

        relationshipRepository.deleteByUserIdAndTargetUserId(userId, targetUserId);
        relationshipRepository.deleteByUserIdAndTargetUserId(targetUserId, userId);

        // 6 = Request sent, 7 = Request received
        relationshipRepository.save(new UserRelationship(userId, targetUserId, 6));
        relationshipRepository.save(new UserRelationship(targetUserId, userId, 7));
    }

    @Override
    @Transactional
    public void acceptCoworkerRequest(String userId, String targetUserId) {
        relationshipRepository.deleteByUserIdAndTargetUserId(userId, targetUserId);
        relationshipRepository.deleteByUserIdAndTargetUserId(targetUserId, userId);

        // 2 = Mutual coworkers
        relationshipRepository.save(new UserRelationship(userId, targetUserId, 2));
        relationshipRepository.save(new UserRelationship(targetUserId, userId, 2));

        // Reward points to both for connecting
        userProfileRepository.findById(userId).ifPresent(p -> {
            p.setRating(p.getRating() + 5);
            userProfileRepository.save(p);
        });
        userProfileRepository.findById(targetUserId).ifPresent(p -> {
            p.setRating(p.getRating() + 5);
            userProfileRepository.save(p);
        });
    }

    @Override
    @Transactional
    public void cancelCoworkerRequest(String userId, String targetUserId) {
        relationshipRepository.deleteByUserIdAndTargetUserIdAndRelationshipType(userId, targetUserId, 6);
        relationshipRepository.deleteByUserIdAndTargetUserIdAndRelationshipType(targetUserId, userId, 7);
        relationshipRepository.deleteByUserIdAndTargetUserIdAndRelationshipType(userId, targetUserId, 7);
        relationshipRepository.deleteByUserIdAndTargetUserIdAndRelationshipType(targetUserId, userId, 6);
    }

    @Override
    @Transactional
    public void disconnectCoworker(String userId, String targetUserId) {
        relationshipRepository.deleteByUserIdAndTargetUserIdAndRelationshipType(userId, targetUserId, 2);
        relationshipRepository.deleteByUserIdAndTargetUserIdAndRelationshipType(targetUserId, userId, 2);
    }

    @Override
    @Transactional
    public void followUser(String userId, String targetUserId) {
        if (userId.equals(targetUserId)) {
            throw new IllegalArgumentException("Cannot follow yourself.");
        }

        if (!relationshipRepository.existsByUserIdAndTargetUserIdAndRelationshipType(userId, targetUserId, 0)) {
            // 0 = Following, 1 = Follower
            relationshipRepository.save(new UserRelationship(userId, targetUserId, 0));
            relationshipRepository.save(new UserRelationship(targetUserId, userId, 1));

            userProfileRepository.findById(targetUserId).ifPresent(p -> {
                p.setRating(p.getRating() + 2);
                userProfileRepository.save(p);
            });
        }
    }

    @Override
    @Transactional
    public void unfollowUser(String userId, String targetUserId) {
        relationshipRepository.deleteByUserIdAndTargetUserIdAndRelationshipType(userId, targetUserId, 0);
        relationshipRepository.deleteByUserIdAndTargetUserIdAndRelationshipType(targetUserId, userId, 1);
    }

    @Override
    @Transactional(readOnly = true)
    public ConnectionStatusDto getConnectionStatus(String userId, String targetUserId) {
        if (userId == null || targetUserId == null || userId.equals(targetUserId)) {
            return new ConnectionStatusDto(targetUserId, false, false, false, false, false);
        }

        boolean isCoworker = relationshipRepository.existsByUserIdAndTargetUserIdAndRelationshipType(userId, targetUserId, 2);
        boolean isFollowing = relationshipRepository.existsByUserIdAndTargetUserIdAndRelationshipType(userId, targetUserId, 0);
        boolean isFollower = relationshipRepository.existsByUserIdAndTargetUserIdAndRelationshipType(userId, targetUserId, 1);
        boolean isRequestSent = relationshipRepository.existsByUserIdAndTargetUserIdAndRelationshipType(userId, targetUserId, 6);
        boolean isRequestReceived = relationshipRepository.existsByUserIdAndTargetUserIdAndRelationshipType(userId, targetUserId, 7);

        return new ConnectionStatusDto(targetUserId, isCoworker, isFollowing, isFollower, isRequestSent, isRequestReceived);
    }

    @Override
    @Transactional(readOnly = true)
    public List<UserProfileDto> getCoworkers(String userId, int page, int size) {
        return getProfilesByType(userId, 2, page, size);
    }

    @Override
    @Transactional(readOnly = true)
    public List<UserProfileDto> getFollowers(String userId, int page, int size) {
        return getProfilesByType(userId, 1, page, size);
    }

    @Override
    @Transactional(readOnly = true)
    public List<UserProfileDto> getFollowing(String userId, int page, int size) {
        return getProfilesByType(userId, 0, page, size);
    }

    @Override
    @Transactional(readOnly = true)
    public List<UserProfileDto> getPendingRequests(String userId) {
        List<String> targetIds = relationshipRepository.findTargetUserIdsByUserIdAndType(userId, 7);
        if (targetIds.isEmpty()) return Collections.emptyList();
        return targetIds.stream()
                .map(id -> userService.getUserProfile(id, userId))
                .collect(Collectors.toList());
    }

    private List<UserProfileDto> getProfilesByType(String userId, int type, int page, int size) {
        List<UserRelationship> rels = relationshipRepository
                .findByUserIdAndRelationshipTypeOrderByCreatedAtDesc(userId, type, PageRequest.of(page, size))
                .getContent();

        if (rels.isEmpty()) return Collections.emptyList();

        return rels.stream()
                .map(r -> userService.getUserProfile(r.getTargetUserId(), userId))
                .collect(Collectors.toList());
    }
}
