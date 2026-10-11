package com.thynkzone.pnc.dto;

public record PresignedUploadResponse(
        String uploadUrl,
        String objectKey,
        String publicUrl,
        long expiresInSeconds
) {}
