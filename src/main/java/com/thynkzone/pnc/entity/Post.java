package com.thynkzone.pnc.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "posts", indexes = {
    @Index(name = "idx_post_author", columnList = "author_id"),
    @Index(name = "idx_post_created", columnList = "created_at"),
    @Index(name = "idx_post_privacy", columnList = "privacy")
})
public class Post {

    @Id
    @Column(name = "id", length = 32, nullable = false, updatable = false)
    private String id;

    @Column(name = "author_id", length = 32, nullable = false)
    private String authorId;

    @Column(name = "author_full_name", length = 255, nullable = false)
    private String authorFullName;

    @Column(name = "content", columnDefinition = "TEXT", nullable = false)
    private String content;

    @Column(name = "image_url", length = 512)
    private String imageUrl;

    /**
     * Post Types:
     * 1 = Meme
     * 2 = Fact
     * 3 = Workplace Update
     */
    @Column(name = "post_type", nullable = false)
    private int postType = 3;

    /**
     * Privacy:
     * 1 = Only Me (Private)
     * 2 = Coworkers Only
     * 3 = Coworkers & Followers
     * 4 = Public
     */
    @Column(name = "privacy", nullable = false)
    private int privacy = 4;

    @Column(name = "ad_ticket", length = 64)
    private String adTicket;

    @Column(name = "country", length = 128)
    private String country;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    public Post() {
    }

    public Post(String id, String authorId, String authorFullName, String content, String imageUrl, int postType, int privacy) {
        this.id = id;
        this.authorId = authorId;
        this.authorFullName = authorFullName;
        this.content = content;
        this.imageUrl = imageUrl;
        this.postType = postType;
        this.privacy = privacy;
        this.createdAt = LocalDateTime.now();
        this.updatedAt = LocalDateTime.now();
    }

    @PrePersist
    protected void onCreate() {
        if (createdAt == null) {
            createdAt = LocalDateTime.now();
        }
        updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAuthorId() {
        return authorId;
    }

    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }

    public String getAuthorFullName() {
        return authorFullName;
    }

    public void setAuthorFullName(String authorFullName) {
        this.authorFullName = authorFullName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getPostType() {
        return postType;
    }

    public void setPostType(int postType) {
        this.postType = postType;
    }

    public int getPrivacy() {
        return privacy;
    }

    public void setPrivacy(int privacy) {
        this.privacy = privacy;
    }

    public String getAdTicket() {
        return adTicket;
    }

    public void setAdTicket(String adTicket) {
        this.adTicket = adTicket;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
}
