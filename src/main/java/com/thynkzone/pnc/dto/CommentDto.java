package com.thynkzone.pnc.dto;

import java.time.LocalDateTime;

public record CommentDto(
        Long id,
        String actorId,
        String actorFullName,
        String actorProfilePic,
        String commentText,
        LocalDateTime createdAt,
        boolean isOwner
) {}
