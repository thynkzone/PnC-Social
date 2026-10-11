package com.thynkzone.pnc.dto;

public record ConnectionStatusDto(
        String targetUserId,
        boolean isCoworker,
        boolean isFollowing,
        boolean isFollower,
        boolean isRequestSent,
        boolean isRequestReceived
) {}
