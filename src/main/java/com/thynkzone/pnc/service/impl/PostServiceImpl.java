package com.thynkzone.pnc.service.impl;

import com.thynkzone.pnc.dto.CommentDto;
import com.thynkzone.pnc.dto.CreatePostRequest;
import com.thynkzone.pnc.dto.PostResponseDto;
import com.thynkzone.pnc.dto.UpdatePostRequest;
import com.thynkzone.pnc.entity.Notification;
import com.thynkzone.pnc.entity.Post;
import com.thynkzone.pnc.entity.UserProfile;
import com.thynkzone.pnc.repository.NotificationRepository;
import com.thynkzone.pnc.repository.PostRepository;
import com.thynkzone.pnc.repository.UserProfileRepository;
import com.thynkzone.pnc.repository.UserRelationshipRepository;
import com.thynkzone.pnc.service.PostService;
import com.thynkzone.pnc.util.UidGenerator;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class PostServiceImpl implements PostService {

    private final PostRepository postRepository;
    private final NotificationRepository notificationRepository;
    private final UserProfileRepository userProfileRepository;
    private final UserRelationshipRepository relationshipRepository;

    public PostServiceImpl(PostRepository postRepository,
                           NotificationRepository notificationRepository,
                           UserProfileRepository userProfileRepository,
                           UserRelationshipRepository relationshipRepository) {
        this.postRepository = postRepository;
        this.notificationRepository = notificationRepository;
        this.userProfileRepository = userProfileRepository;
        this.relationshipRepository = relationshipRepository;
    }

    @Override
    @Transactional
    public PostResponseDto createPost(String authorId, CreatePostRequest request) {
        UserProfile profile = userProfileRepository.findById(authorId)
                .orElseThrow(() -> new IllegalArgumentException("Author profile not found: " + authorId));

        String postId = UidGenerator.generateId();
        Post post = new Post(
                postId,
                authorId,
                profile.getFullName(),
                request.content(),
                request.imageUrl(),
                request.postType(),
                request.privacy()
        );

        // Gamification points: +5 for posting
        profile.setRating(profile.getRating() + 5);
        userProfileRepository.save(profile);

        Post saved = postRepository.save(post);
        return mapToDto(saved, authorId, profile);
    }

    @Override
    @Transactional
    public PostResponseDto updatePost(String postId, String authorId, UpdatePostRequest request) {
        Post post = postRepository.findById(postId)
                .orElseThrow(() -> new IllegalArgumentException("Post not found: " + postId));

        if (!post.getAuthorId().equals(authorId)) {
            throw new SecurityException("You are not authorized to update this post.");
        }

        post.setContent(request.content());
        post.setPostType(request.postType());
        post.setPrivacy(request.privacy());

        Post saved = postRepository.save(post);
        UserProfile profile = userProfileRepository.findById(authorId).orElse(null);
        return mapToDto(saved, authorId, profile);
    }

    @Override
    @Transactional
    public void deletePost(String postId, String authorId) {
        Post post = postRepository.findById(postId)
                .orElseThrow(() -> new IllegalArgumentException("Post not found: " + postId));

        if (!post.getAuthorId().equals(authorId)) {
            throw new SecurityException("You are not authorized to delete this post.");
        }

        // Clean up notifications and reactions related to post
        List<Notification> notifs = notificationRepository.findByTargetPostIdAndTypeOrderByCreatedAtAsc(postId, 1);
        notificationRepository.deleteAll(notifs);

        postRepository.delete(post);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<PostResponseDto> getFeed(String currentUserId, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);

        if (currentUserId == null) {
            return postRepository.findPublicPosts(Collections.singletonList(""), pageable)
                    .map(p -> mapToDto(p, null, null));
        }

        List<String> coworkerIds = relationshipRepository.findTargetUserIdsByUserIdAndType(currentUserId, 2);
        List<String> followingIds = relationshipRepository.findTargetUserIdsByUserIdAndType(currentUserId, 0);
        List<String> hiddenPostIds = notificationRepository.findHiddenPostIdsByActorId(currentUserId);
        List<String> hiddenAuthorIds = notificationRepository.findHiddenAuthorIdsByActorId(currentUserId);

        if (coworkerIds.isEmpty()) coworkerIds = Collections.singletonList("");
        if (followingIds.isEmpty()) followingIds = Collections.singletonList("");
        if (hiddenPostIds.isEmpty()) hiddenPostIds = Collections.singletonList("");
        if (hiddenAuthorIds.isEmpty()) hiddenAuthorIds = Collections.singletonList("");

        Page<Post> posts = postRepository.findFeedPosts(currentUserId, coworkerIds, followingIds, hiddenPostIds, hiddenAuthorIds, pageable);
        return posts.map(p -> mapToDto(p, currentUserId, null));
    }

    @Override
    @Transactional(readOnly = true)
    public Page<PostResponseDto> getUserPosts(String targetUserId, String currentUserId, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return postRepository.findByAuthorIdOrderByCreatedAtDesc(targetUserId, pageable)
                .map(p -> mapToDto(p, currentUserId, null));
    }

    @Override
    @Transactional(readOnly = true)
    public PostResponseDto getPostById(String postId, String currentUserId) {
        Post post = postRepository.findById(postId)
                .orElseThrow(() -> new IllegalArgumentException("Post not found: " + postId));
        return mapToDto(post, currentUserId, null);
    }

    @Override
    @Transactional
    public void reactToPost(String postId, String actorId, int reactionType) {
        Post post = postRepository.findById(postId)
                .orElseThrow(() -> new IllegalArgumentException("Post not found: " + postId));

        UserProfile actorProfile = userProfileRepository.findById(actorId)
                .orElseThrow(() -> new IllegalArgumentException("Actor profile not found: " + actorId));

        // Remove existing reaction if any
        notificationRepository.deleteByActorIdAndTargetPostIdAndType(actorId, postId, 1);
        notificationRepository.deleteByActorIdAndTargetPostIdAndType(actorId, postId, 2);

        if (reactionType == 1 || reactionType == 2) {
            Notification notif = new Notification(
                    actorId,
                    actorProfile.getFullName(),
                    postId,
                    post.getAuthorId(),
                    reactionType,
                    null
            );
            notificationRepository.save(notif);

            // Reward author rating points for likes
            if (reactionType == 1 && !actorId.equals(post.getAuthorId())) {
                userProfileRepository.findById(post.getAuthorId()).ifPresent(authorProf -> {
                    authorProf.setRating(authorProf.getRating() + 2);
                    userProfileRepository.save(authorProf);
                });
            }
        }
    }

    @Override
    @Transactional
    public CommentDto addComment(String postId, String actorId, String commentText) {
        Post post = postRepository.findById(postId)
                .orElseThrow(() -> new IllegalArgumentException("Post not found: " + postId));

        UserProfile actorProfile = userProfileRepository.findById(actorId)
                .orElseThrow(() -> new IllegalArgumentException("Actor profile not found: " + actorId));

        Notification notif = new Notification(
                actorId,
                actorProfile.getFullName(),
                postId,
                post.getAuthorId(),
                3, // Type 3 = Comment
                commentText.trim()
        );

        Notification saved = notificationRepository.save(notif);

        // Reward comment engagement points
        if (!actorId.equals(post.getAuthorId())) {
            userProfileRepository.findById(post.getAuthorId()).ifPresent(authorProf -> {
                authorProf.setRating(authorProf.getRating() + 3);
                userProfileRepository.save(authorProf);
            });
        }

        return new CommentDto(
                saved.getId(),
                actorId,
                actorProfile.getFullName(),
                actorProfile.getProfilePic(),
                saved.getCommentText(),
                saved.getCreatedAt(),
                true
        );
    }

    @Override
    @Transactional
    public CommentDto updateComment(Long commentId, String actorId, String newText) {
        Notification comment = notificationRepository.findById(commentId)
                .orElseThrow(() -> new IllegalArgumentException("Comment not found: " + commentId));

        if (!comment.getActorId().equals(actorId)) {
            throw new SecurityException("You are not authorized to edit this comment.");
        }

        comment.setCommentText(newText.trim());
        Notification saved = notificationRepository.save(comment);

        UserProfile actorProfile = userProfileRepository.findById(actorId).orElse(null);
        String fullName = actorProfile != null ? actorProfile.getFullName() : saved.getActorFullName();
        String pic = actorProfile != null ? actorProfile.getProfilePic() : null;

        return new CommentDto(
                saved.getId(),
                actorId,
                fullName,
                pic,
                saved.getCommentText(),
                saved.getCreatedAt(),
                true
        );
    }

    @Override
    @Transactional
    public void deleteComment(Long commentId, String actorId) {
        Notification comment = notificationRepository.findById(commentId)
                .orElseThrow(() -> new IllegalArgumentException("Comment not found: " + commentId));

        if (!comment.getActorId().equals(actorId) && !comment.getTargetUserId().equals(actorId)) {
            throw new SecurityException("You are not authorized to delete this comment.");
        }

        notificationRepository.delete(comment);
    }

    @Override
    @Transactional
    public void hidePost(String postId, String actorId) {
        if (!notificationRepository.existsByActorIdAndTargetPostIdAndType(actorId, postId, 5)) {
            Notification hide = new Notification(actorId, null, postId, "", 5, null);
            notificationRepository.save(hide);
        }
    }

    @Override
    @Transactional
    public void hideAuthor(String authorId, String actorId) {
        if (!notificationRepository.existsByActorIdAndTargetPostIdAndType(actorId, null, 6)) {
            Notification hide = new Notification(actorId, null, null, authorId, 6, null);
            notificationRepository.save(hide);
        }
    }

    @Override
    @Transactional
    public void unhideAll(String actorId) {
        notificationRepository.deleteByActorIdAndType(actorId, 5);
        notificationRepository.deleteByActorIdAndType(actorId, 6);
    }

    @Override
    @Transactional(readOnly = true)
    public List<CommentDto> getPostComments(String postId, String currentUserId) {
        List<Notification> comments = notificationRepository.findByTargetPostIdAndTypeOrderByCreatedAtAsc(postId, 3);
        if (comments.isEmpty()) return Collections.emptyList();

        List<String> userIds = comments.stream().map(Notification::getActorId).distinct().toList();
        Map<String, UserProfile> profiles = userProfileRepository.findByIdIn(userIds).stream()
                .collect(Collectors.toMap(UserProfile::getId, p -> p, (a, b) -> a));

        return comments.stream().map(c -> {
            UserProfile prof = profiles.get(c.getActorId());
            String pic = prof != null ? prof.getProfilePic() : "prof.png";
            boolean isOwner = currentUserId != null && currentUserId.equals(c.getActorId());
            return new CommentDto(c.getId(), c.getActorId(), c.getActorFullName(), pic, c.getCommentText(), c.getCreatedAt(), isOwner);
        }).toList();
    }

    private PostResponseDto mapToDto(Post post, String currentUserId, UserProfile authorProfile) {
        String authorPic = "prof.png";
        if (authorProfile != null && authorProfile.getProfilePic() != null) {
            authorPic = authorProfile.getProfilePic();
        } else {
            java.util.Optional<UserProfile> profOpt = userProfileRepository.findById(post.getAuthorId());
            if (profOpt.isPresent() && profOpt.get().getProfilePic() != null) {
                authorPic = profOpt.get().getProfilePic();
            }
        }

        long likesCount = notificationRepository.countByTargetPostIdAndType(post.getId(), 1);
        long dislikesCount = notificationRepository.countByTargetPostIdAndType(post.getId(), 2);
        long commentsCount = notificationRepository.countByTargetPostIdAndType(post.getId(), 3);

        boolean isLiked = false;
        boolean isDisliked = false;
        boolean isOwner = false;
        if (currentUserId != null) {
            isLiked = notificationRepository.existsByActorIdAndTargetPostIdAndType(currentUserId, post.getId(), 1);
            isDisliked = notificationRepository.existsByActorIdAndTargetPostIdAndType(currentUserId, post.getId(), 2);
            isOwner = currentUserId.equals(post.getAuthorId());
        }

        List<CommentDto> comments = getPostComments(post.getId(), currentUserId);

        return new PostResponseDto(
                post.getId(),
                post.getAuthorId(),
                post.getAuthorFullName(),
                authorPic,
                post.getContent(),
                post.getImageUrl(),
                post.getPostType(),
                post.getPrivacy(),
                post.getCreatedAt(),
                formatTimeAgo(post.getCreatedAt()),
                likesCount,
                dislikesCount,
                commentsCount,
                isLiked,
                isDisliked,
                isOwner,
                comments
        );
    }

    private String formatTimeAgo(LocalDateTime dateTime) {
        if (dateTime == null) return "Just now";
        Duration duration = Duration.between(dateTime, LocalDateTime.now());
        long seconds = duration.getSeconds();
        if (seconds < 60) return "Just now";
        long minutes = seconds / 60;
        if (minutes < 60) return minutes + "m ago";
        long hours = minutes / 60;
        if (hours < 24) return hours + "h ago";
        long days = hours / 24;
        if (days < 30) return days + "d ago";
        return (days / 30) + "mo ago";
    }
}
