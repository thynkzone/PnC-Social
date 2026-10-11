package com.thynkzone.pnc.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "advertisements", indexes = {
    @Index(name = "idx_ad_owner", columnList = "ad_owner_id"),
    @Index(name = "idx_ad_country", columnList = "country"),
    @Index(name = "idx_ad_approval", columnList = "approval")
})
public class Advertisement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "ad_owner_id", length = 32, nullable = false)
    private String adOwnerId;

    @Column(name = "owner_full_name", length = 255)
    private String ownerFullName;

    @Column(name = "post_id", length = 32, nullable = false)
    private String postId;

    @Column(name = "text", columnDefinition = "TEXT")
    private String text;

    @Column(name = "pic", length = 512)
    private String pic;

    @Column(name = "post_type", nullable = false)
    private int postType = 3;

    @Column(name = "privacy", nullable = false)
    private int privacy = 4;

    @Column(name = "country", length = 128)
    private String country;

    @Column(name = "ad_ticket", length = 64)
    private String adTicket;

    @Column(name = "bid")
    private Double bid = 0.0;

    @Column(name = "approval", nullable = false)
    private int approval = 0; // 0 = Pending, 1 = Approved, 2 = Rejected

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    public Advertisement() {
    }

    public Advertisement(String adOwnerId, String ownerFullName, String postId, String text, String pic, String country, String adTicket) {
        this.adOwnerId = adOwnerId;
        this.ownerFullName = ownerFullName;
        this.postId = postId;
        this.text = text;
        this.pic = pic;
        this.country = country;
        this.adTicket = adTicket;
        this.approval = 0;
        this.createdAt = LocalDateTime.now();
    }

    @PrePersist
    protected void onCreate() {
        if (createdAt == null) {
            createdAt = LocalDateTime.now();
        }
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAdOwnerId() {
        return adOwnerId;
    }

    public void setAdOwnerId(String adOwnerId) {
        this.adOwnerId = adOwnerId;
    }

    public String getOwnerFullName() {
        return ownerFullName;
    }

    public void setOwnerFullName(String ownerFullName) {
        this.ownerFullName = ownerFullName;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
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

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getAdTicket() {
        return adTicket;
    }

    public void setAdTicket(String adTicket) {
        this.adTicket = adTicket;
    }

    public Double getBid() {
        return bid;
    }

    public void setBid(Double bid) {
        this.bid = bid;
    }

    public int getApproval() {
        return approval;
    }

    public void setApproval(int approval) {
        this.approval = approval;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
