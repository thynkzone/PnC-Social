package com.thynkzone.pnc.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

public record LoginRequest(
        @NotBlank(message = "Email is required")
        @Email(message = "Valid email is required")
        String email,

        @NotBlank(message = "Password is required")
        String password
) {
    // JEP 513 Flexible Constructor Body / validation before canonical store
    public LoginRequest {
        if (email != null) {
            email = email.trim().toLowerCase();
        }
    }
}
