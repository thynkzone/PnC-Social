package com.thynkzone.pnc.dto;

public record AuthResponse(
        String userId,
        String email,
        String fullName,
        String profilePic,
        boolean profileComplete,
        String sessionToken
) {}
