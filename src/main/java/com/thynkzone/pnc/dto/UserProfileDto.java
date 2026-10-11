package com.thynkzone.pnc.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public record UserProfileDto(
        String id,
        String firstName,
        String lastName,
        String fullName,
        String birthDate,
        String gender,
        String about,
        String country,
        String place,
        String timezone,
        String profilePic,
        String backgroundPic,
        int rating,
        String rank,
        String role,
        long postsCount,
        long followersCount,
        long followingCount,
        long coworkersCount,
        @JsonProperty("isCoworker") boolean isCoworker,
        @JsonProperty("isFollowing") boolean isFollowing,
        @JsonProperty("isRequestSent") boolean isRequestSent,
        @JsonProperty("isRequestReceived") boolean isRequestReceived
) {
    @JsonProperty("coworker")
    public boolean coworker() {
        return isCoworker;
    }

    @JsonProperty("following")
    public boolean following() {
        return isFollowing;
    }

    @JsonProperty("requestSent")
    public boolean requestSent() {
        return isRequestSent;
    }

    @JsonProperty("requestReceived")
    public boolean requestReceived() {
        return isRequestReceived;
    }
}
