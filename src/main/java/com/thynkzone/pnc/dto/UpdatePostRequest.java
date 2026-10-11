package com.thynkzone.pnc.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record UpdatePostRequest(
        @NotBlank(message = "Post content cannot be empty")
        @Size(max = 5000, message = "Post content cannot exceed 5000 characters")
        String content,

        int postType,

        int privacy
) {
    public UpdatePostRequest {
        if (postType == 0) postType = 3;
        if (privacy == 0) privacy = 4;
    }
}
