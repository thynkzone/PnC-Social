package com.thynkzone.pnc.dto;

import java.time.LocalDateTime;
import java.util.List;

public record PostResponseDto(
        String id,
        String authorId,
        String authorFullName,
        String authorProfilePic,
        String content,
        String imageUrl,
        int postType,
        int privacy,
        LocalDateTime createdAt,
        String timeAgo,
        long likesCount,
        long dislikesCount,
        long commentsCount,
        boolean isLiked,
        boolean isDisliked,
        boolean isOwner,
        List<CommentDto> comments
) {}
