package com.thynkzone.pnc.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@JsonIgnoreProperties(ignoreUnknown = true)
public record UpdatePostRequest(
        @NotBlank(message = "Post content cannot be empty")
        @Size(max = 5000, message = "Post content cannot exceed 5000 characters")
        String content,

        int postType,

        int privacy,

        String imageUrl
) {
    public UpdatePostRequest(String content, int postType, int privacy) {
        this(content, postType, privacy, null);
    }

    public UpdatePostRequest {
        if (postType == 0) postType = 3;
        if (privacy == 0) privacy = 4;
    }
}
