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
}
