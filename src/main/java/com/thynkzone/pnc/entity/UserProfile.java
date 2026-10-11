package com.thynkzone.pnc.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "user_profiles", indexes = {
    @Index(name = "idx_profile_fullname", columnList = "full_name"),
    @Index(name = "idx_profile_country", columnList = "country"),
    @Index(name = "idx_profile_rating", columnList = "rating")
})
public class UserProfile {

    @Id
    @Column(name = "id", length = 32, nullable = false, updatable = false)
    private String id;

    @Column(name = "first_name", length = 128)
    private String firstName;

    @Column(name = "last_name", length = 128)
    private String lastName;

    @Column(name = "full_name", length = 255)
    private String fullName;

    @Column(name = "birth_date", length = 32)
    private String birthDate;

    @Column(name = "gender", length = 32)
    private String gender;

    @Column(name = "about", columnDefinition = "TEXT")
    private String about;

    @Column(name = "country", length = 128)
    private String country;

    @Column(name = "place", length = 128)
    private String place;

    @Column(name = "timezone", length = 64)
    private String timezone;

    @Column(name = "profile_pic", length = 512)
    private String profilePic;

    @Column(name = "background_pic", length = 512)
    private String backgroundPic;

    @Column(name = "rating", nullable = false)
    private int rating = 0;

    @Column(name = "role", length = 32, nullable = false)
    private String role = "USER";

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    public UserProfile() {
    }

    public UserProfile(String id) {
        this.id = id;
        this.createdAt = LocalDateTime.now();
        this.updatedAt = LocalDateTime.now();
        this.rating = 0;
        this.role = "USER";
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

    public String calculateRank() {
        return switch (Integer.valueOf(rating)) {
            case Integer r when r >= 100000 -> "Luminary";
            case Integer r when r >= 50000 -> "Visionary";
            case Integer r when r >= 25000 -> "Innovator";
            case Integer r when r >= 10000 -> "Strategist";
            case Integer r when r >= 5000 -> "Master Thinker";
            case Integer r when r >= 2000 -> "Influencer";
            case Integer r when r >= 1000 -> "Thinker";
            case Integer r when r >= 500 -> "Contributor";
            case Integer r when r >= 100 -> "Apprentice";
            default -> "Novice";
        };
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getTimezone() {
        return timezone;
    }

    public void setTimezone(String timezone) {
        this.timezone = timezone;
    }

    public String getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }

    public String getBackgroundPic() {
        return backgroundPic;
    }

    public void setBackgroundPic(String backgroundPic) {
        this.backgroundPic = backgroundPic;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
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
