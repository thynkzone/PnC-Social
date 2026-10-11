package com.thynkzone.pnc.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

public record PresignedUploadRequest(
        @NotBlank(message = "Content type is required")
        @Pattern(regexp = "^image/(jpeg|png|webp|gif)$", message = "Only JPEG, PNG, WEBP, or GIF images are permitted")
        String contentType,

        @NotBlank(message = "Folder is required")
        @Pattern(regexp = "^(profiles|covers|posts|ads)$", message = "Folder must be one of: profiles, covers, posts, ads")
        String folder
) {}
