package com.thynkzone.pnc.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "user_relationships", indexes = {
    @Index(name = "idx_rel_user", columnList = "user_id"),
    @Index(name = "idx_rel_target", columnList = "target_user_id"),
    @Index(name = "idx_rel_user_target", columnList = "user_id, target_user_id"),
    @Index(name = "idx_rel_user_type", columnList = "user_id, relationship_type")
})
public class UserRelationship {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id", length = 32, nullable = false)
    private String userId;

    @Column(name = "target_user_id", length = 32, nullable = false)
    private String targetUserId;

    /**
     * Relationship Types:
     * 0 = Following (user follows target)
     * 1 = Follower (target follows user)
     * 2 = Coworker (mutual friend / verified coworker)
     * 6 = Coworker Request Sent (user sent request to target)
     * 7 = Coworker Request Received (user received request from target)
     */
    @Column(name = "relationship_type", nullable = false)
    private int relationshipType;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    public UserRelationship() {
    }

    public UserRelationship(String userId, String targetUserId, int relationshipType) {
        this.userId = userId;
        this.targetUserId = targetUserId;
        this.relationshipType = relationshipType;
        this.createdAt = LocalDateTime.now();
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

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTargetUserId() {
        return targetUserId;
    }

    public void setTargetUserId(String targetUserId) {
        this.targetUserId = targetUserId;
    }

    public int getRelationshipType() {
        return relationshipType;
    }

    public void setRelationshipType(int relationshipType) {
        this.relationshipType = relationshipType;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
