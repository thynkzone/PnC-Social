package com.thynkzone.pnc.dto;

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
        boolean isCoworker,
        boolean isFollowing,
        boolean isRequestSent,
        boolean isRequestReceived
) {}
