package com.thynkzone.pnc.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public record SignupRequest(
        @NotBlank(message = "Email is required")
        @Email(message = "Valid email is required")
        String email,

        @NotBlank(message = "Password is required")
        @Size(min = 8, max = 64, message = "Password must be between 8 and 64 characters")
        @Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&+=_,.-/(){}\\[\\]])[A-Za-z\\d@$!%*#?&+=_,.-/(){}\\[\\]]{8,}$",
                 message = "Password must contain at least one letter, one number, and one special character")
        String password,

        @NotBlank(message = "Account recovery code is required")
        @Size(min = 3, message = "Recovery code must be at least 3 characters")
        String recoveryCode
) {
    public SignupRequest {
        if (email != null) {
            email = email.trim().toLowerCase();
        }
    }
}
