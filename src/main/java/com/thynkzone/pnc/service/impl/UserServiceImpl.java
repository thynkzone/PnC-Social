package com.thynkzone.pnc.service.impl;

import com.thynkzone.pnc.dto.UpdateProfileRequest;
import com.thynkzone.pnc.dto.UserProfileDto;
import com.thynkzone.pnc.entity.UserProfile;
import com.thynkzone.pnc.repository.PostRepository;
import com.thynkzone.pnc.repository.UserProfileRepository;
import com.thynkzone.pnc.repository.UserRelationshipRepository;
import com.thynkzone.pnc.service.UserService;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

import com.thynkzone.pnc.entity.Post;
import com.thynkzone.pnc.repository.AdvertisementRepository;
import com.thynkzone.pnc.repository.NotificationRepository;
import com.thynkzone.pnc.repository.ReportRepository;
import com.thynkzone.pnc.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

    private final UserProfileRepository userProfileRepository;
    private final UserRelationshipRepository relationshipRepository;
    private final PostRepository postRepository;
    private final com.thynkzone.pnc.repository.ProfileReportRepository profileReportRepository;
    private final UserRepository userRepository;
    private final NotificationRepository notificationRepository;
    private final ReportRepository reportRepository;
    private final AdvertisementRepository advertisementRepository;

    public UserServiceImpl(UserProfileRepository userProfileRepository,
                           UserRelationshipRepository relationshipRepository,
                           PostRepository postRepository,
                           com.thynkzone.pnc.repository.ProfileReportRepository profileReportRepository,
                           UserRepository userRepository,
                           NotificationRepository notificationRepository,
                           ReportRepository reportRepository,
                           AdvertisementRepository advertisementRepository) {
        this.userProfileRepository = userProfileRepository;
        this.relationshipRepository = relationshipRepository;
        this.postRepository = postRepository;
        this.profileReportRepository = profileReportRepository;
        this.userRepository = userRepository;
        this.notificationRepository = notificationRepository;
        this.reportRepository = reportRepository;
        this.advertisementRepository = advertisementRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public UserProfileDto getUserProfile(String targetUserId, String currentUserId) {
        UserProfile profile = userProfileRepository.findById(targetUserId)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + targetUserId));

        long postsCount = postRepository.countByAuthorId(targetUserId);
        long followersCount = relationshipRepository.countByUserIdAndRelationshipType(targetUserId, 1);
        long followingCount = relationshipRepository.countByUserIdAndRelationshipType(targetUserId, 0);
        long coworkersCount = relationshipRepository.countByUserIdAndRelationshipType(targetUserId, 2);

        boolean isFollowing = false;
        boolean isCoworker = false;
        boolean isRequestSent = false;
        boolean isRequestReceived = false;

        if (currentUserId != null && !currentUserId.equals(targetUserId)) {
            isFollowing = relationshipRepository.existsByUserIdAndTargetUserIdAndRelationshipType(currentUserId, targetUserId, 0);
            isCoworker = relationshipRepository.existsByUserIdAndTargetUserIdAndRelationshipType(currentUserId, targetUserId, 2);
            isRequestSent = relationshipRepository.existsByUserIdAndTargetUserIdAndRelationshipType(currentUserId, targetUserId, 6);
            isRequestReceived = relationshipRepository.existsByUserIdAndTargetUserIdAndRelationshipType(currentUserId, targetUserId, 7);
        }

        return new UserProfileDto(
                profile.getId(),
                profile.getFirstName(),
                profile.getLastName(),
                profile.getFullName(),
                profile.getBirthDate(),
                profile.getGender(),
                profile.getAbout(),
                profile.getCountry(),
                profile.getPlace(),
                profile.getTimezone(),
                profile.getProfilePic(),
                profile.getBackgroundPic(),
                profile.getRating(),
                profile.calculateRank(),
                profile.getRole(),
                postsCount,
                followersCount,
                followingCount,
                coworkersCount,
                isCoworker,
                isFollowing,
                isRequestSent,
                isRequestReceived
        );
    }

    @Override
    @Transactional
    public UserProfileDto updateProfile(String userId, UpdateProfileRequest request) {
        UserProfile profile = userProfileRepository.findById(userId)
                .orElseGet(() -> new UserProfile(userId));

        profile.setFirstName(request.firstName());
        profile.setLastName(request.lastName());
        String fullName = (request.firstName() + " " + (request.lastName() != null ? request.lastName() : "")).trim();
        profile.setFullName(fullName);
        profile.setBirthDate(request.birthDate());
        profile.setGender(request.gender());
        profile.setAbout(request.about());
        profile.setCountry(request.country());
        profile.setPlace(request.place());
        profile.setTimezone(request.timezone());

        UserProfile saved = userProfileRepository.save(profile);
        return mapToDto(saved);
    }

    @Override
    @Transactional
    public void updateProfilePicture(String userId, String imageKey) {
        UserProfile profile = userProfileRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + userId));
        profile.setProfilePic(imageKey);
        userProfileRepository.save(profile);
    }

    @Override
    @Transactional
    public void updateBackgroundPicture(String userId, String imageKey) {
        UserProfile profile = userProfileRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + userId));
        profile.setBackgroundPic(imageKey);
        userProfileRepository.save(profile);
    }

    @Override
    @Transactional(readOnly = true)
    public List<UserProfileDto> searchUsers(String query, int page, int size) {
        return userProfileRepository.searchUsers(query, PageRequest.of(page, size))
                .stream()
                .map(this::mapToDto)
                .collect(Collectors.toList());
    }

    @Override
    @Transactional(readOnly = true)
    public List<UserProfileDto> getSuggestedUsers(String currentUserId, int limit) {
        return userProfileRepository.findSuggestedUsers(currentUserId, PageRequest.of(0, limit))
                .stream()
                .map(this::mapToDto)
                .collect(Collectors.toList());
    }

    private UserProfileDto mapToDto(UserProfile profile) {
        return new UserProfileDto(
                profile.getId(),
                profile.getFirstName(),
                profile.getLastName(),
                profile.getFullName(),
                profile.getBirthDate(),
                profile.getGender(),
                profile.getAbout(),
                profile.getCountry(),
                profile.getPlace(),
                profile.getTimezone(),
                profile.getProfilePic(),
                profile.getBackgroundPic(),
                profile.getRating(),
                profile.calculateRank(),
                profile.getRole(),
                0,
                0,
                0,
                0,
                false,
                false,
                false,
                false
        );
    }

    @Override
    @Transactional
    public void reportUser(String targetUserId, String reporterId, int reportType) {
        UserProfile reporter = userProfileRepository.findById(reporterId).orElse(null);
        String reporterName = reporter != null ? reporter.getFullName() : "Anonymous User";
        com.thynkzone.pnc.entity.ProfileReport report = new com.thynkzone.pnc.entity.ProfileReport(reporterId, reporterName, targetUserId, reportType);
        profileReportRepository.save(report);
    }

    @Override
    @Transactional
    public void deleteUserAccount(String userId) {
        // 1. Delete all posts by this user and associated post data
        List<Post> posts = postRepository.findByAuthorId(userId);
        for (Post p : posts) {
            notificationRepository.deleteByTargetPostId(p.getId());
            reportRepository.deleteByPostId(p.getId());
        }
        postRepository.deleteByAuthorId(userId);

        // 2. Delete all notifications where user is actor or target
        notificationRepository.deleteByTargetUserId(userId);
        notificationRepository.deleteByActorId(userId);

        // 3. Delete all user relationships
        relationshipRepository.deleteByUserId(userId);
        relationshipRepository.deleteByTargetUserId(userId);

        // 4. Delete reports submitted by or filed against user
        reportRepository.deleteByReporterId(userId);
        reportRepository.deleteByPosterId(userId);
        profileReportRepository.deleteByReporterId(userId);
        profileReportRepository.deleteByTargetUserId(userId);

        // 5. Delete advertisements
        advertisementRepository.deleteByAdOwnerId(userId);

        // 6. Delete user profile
        userProfileRepository.deleteById(userId);

        // 7. Delete user authentication record
        userRepository.deleteById(userId);
    }
}
