package com.thynkzone.pnc.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record CreatePostRequest(
        @NotBlank(message = "Post content cannot be empty")
        @Size(max = 5000, message = "Post content cannot exceed 5000 characters")
        String content,

        String imageUrl,

        int postType,

        int privacy
) {
    public CreatePostRequest {
        if (postType == 0) postType = 3; // Default: workplace update
        if (privacy == 0) privacy = 4;   // Default: public
    }
}
