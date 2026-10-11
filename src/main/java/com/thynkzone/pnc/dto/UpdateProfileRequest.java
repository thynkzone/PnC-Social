package com.thynkzone.pnc.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record UpdateProfileRequest(
        @NotBlank(message = "First name is required")
        @Size(max = 100)
        String firstName,

        @Size(max = 100)
        String lastName,

        String birthDate,

        String gender,

        @Size(max = 1000)
        String about,

        String country,

        String place,

        String timezone
) {}
