package com.thynkzone.pnc.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "notifications", indexes = {
    @Index(name = "idx_notif_target_user", columnList = "target_user_id"),
    @Index(name = "idx_notif_target_post", columnList = "target_post_id"),
    @Index(name = "idx_notif_actor_post", columnList = "actor_id, target_post_id, type")
})
public class Notification {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "actor_id", length = 32, nullable = false)
    private String actorId;

    @Column(name = "actor_full_name", length = 255)
    private String actorFullName;

    @Column(name = "target_post_id", length = 32)
    private String targetPostId;

    @Column(name = "target_user_id", length = 32, nullable = false)
    private String targetUserId;

    /**
     * Notification / Reaction Types:
     * 1 = Like
     * 2 = Dislike
     * 3 = Comment
     * 5 = Hide Post
     * 6 = Hide All Posts from User
     */
    @Column(name = "type", nullable = false)
    private int type;

    @Column(name = "comment_text", columnDefinition = "TEXT")
    private String commentText;

    @Column(name = "is_read", nullable = false)
    private boolean isRead = false;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    public Notification() {
    }

    public Notification(String actorId, String actorFullName, String targetPostId, String targetUserId, int type, String commentText) {
        this.actorId = actorId;
        this.actorFullName = actorFullName;
        this.targetPostId = targetPostId;
        this.targetUserId = targetUserId;
        this.type = type;
        this.commentText = commentText;
        this.createdAt = LocalDateTime.now();
        this.isRead = false;
    }

    @PrePersist
    protected void onCreate() {
        if (createdAt == null) {
            createdAt = LocalDateTime.now();
        }
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getActorId() {
        return actorId;
    }

    public void setActorId(String actorId) {
        this.actorId = actorId;
    }

    public String getActorFullName() {
        return actorFullName;
    }

    public void setActorFullName(String actorFullName) {
        this.actorFullName = actorFullName;
    }

    public String getTargetPostId() {
        return targetPostId;
    }

    public void setTargetPostId(String targetPostId) {
        this.targetPostId = targetPostId;
    }

    public String getTargetUserId() {
        return targetUserId;
    }

    public void setTargetUserId(String targetUserId) {
        this.targetUserId = targetUserId;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean read) {
        isRead = read;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
