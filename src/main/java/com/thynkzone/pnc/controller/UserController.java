package com.thynkzone.pnc.controller;

import com.thynkzone.pnc.dto.ApiResponse;
import com.thynkzone.pnc.dto.UpdateProfileRequest;
import com.thynkzone.pnc.dto.UserProfileDto;
import com.thynkzone.pnc.service.AuthService;
import com.thynkzone.pnc.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/users")
public class UserController {

    private final UserService userService;
    private final AuthService authService;

    public UserController(UserService userService, AuthService authService) {
        this.userService = userService;
        this.authService = authService;
    }

    @GetMapping("/{userId}")
    public ResponseEntity<ApiResponse<UserProfileDto>> getUserProfile(
            @PathVariable String userId,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        UserProfileDto profile = userService.getUserProfile(userId, currentUserId);
        return ResponseEntity.ok(ApiResponse.ok(profile));
    }

    @PutMapping("/profile")
    public ResponseEntity<ApiResponse<UserProfileDto>> updateProfile(
            @Valid @RequestBody UpdateProfileRequest updateRequest,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(ApiResponse.error("Authentication required"));
        }
        UserProfileDto updated = userService.updateProfile(currentUserId, updateRequest);
        return ResponseEntity.ok(ApiResponse.ok("Profile updated successfully.", updated));
    }

    @GetMapping("/search")
    public ResponseEntity<ApiResponse<List<UserProfileDto>>> searchUsers(
            @RequestParam("q") String query,
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "size", defaultValue = "20") int size) {
        List<UserProfileDto> results = userService.searchUsers(query, page, size);
        return ResponseEntity.ok(ApiResponse.ok(results));
    }

    @GetMapping("/suggestions")
    public ResponseEntity<ApiResponse<List<UserProfileDto>>> getSuggestedUsers(
            @RequestParam(value = "limit", defaultValue = "10") int limit,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        List<UserProfileDto> suggestions = userService.getSuggestedUsers(currentUserId != null ? currentUserId : "", limit);
        return ResponseEntity.ok(ApiResponse.ok(suggestions));
    }

    @PutMapping("/profile-picture")
    public ResponseEntity<ApiResponse<Void>> updateProfilePicture(
            @RequestBody java.util.Map<String, String> body,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(ApiResponse.error("Authentication required"));
        }
        String imageUrl = body.get("imageUrl");
        if (imageUrl == null || imageUrl.isBlank()) {
            return ResponseEntity.badRequest().body(ApiResponse.error("Image URL is required"));
        }
        userService.updateProfilePicture(currentUserId, imageUrl);
        return ResponseEntity.ok(ApiResponse.ok("Profile picture updated successfully.", null));
    }

    @PutMapping("/background-picture")
    public ResponseEntity<ApiResponse<Void>> updateBackgroundPicture(
            @RequestBody java.util.Map<String, String> body,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(ApiResponse.error("Authentication required"));
        }
        String imageUrl = body.get("imageUrl");
        if (imageUrl == null || imageUrl.isBlank()) {
            return ResponseEntity.badRequest().body(ApiResponse.error("Image URL is required"));
        }
        userService.updateBackgroundPicture(currentUserId, imageUrl);
        return ResponseEntity.ok(ApiResponse.ok("Background picture updated successfully.", null));
    }

    @PostMapping("/{userId}/report")
    public ResponseEntity<ApiResponse<Void>> reportUser(
            @PathVariable String userId,
            @RequestBody(required = false) java.util.Map<String, Object> payload,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(ApiResponse.error("Authentication required to report user"));
        }
        int reportType = 1;
        if (payload != null && payload.containsKey("reportType")) {
            try {
                reportType = Integer.parseInt(payload.get("reportType").toString());
            } catch (Exception ignored) {}
        }
        userService.reportUser(userId, currentUserId, reportType);
        return ResponseEntity.ok(ApiResponse.ok("Thank you for your report. The profile has been submitted for moderation review.", null));
    }
}
