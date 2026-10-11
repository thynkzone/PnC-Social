package com.thynkzone.pnc.controller;

import com.thynkzone.pnc.dto.ApiResponse;
import com.thynkzone.pnc.dto.ConnectionStatusDto;
import com.thynkzone.pnc.dto.UserProfileDto;
import com.thynkzone.pnc.service.AuthService;
import com.thynkzone.pnc.service.ConnectionService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/connections")
public class ConnectionController {

    private final ConnectionService connectionService;
    private final AuthService authService;

    public ConnectionController(ConnectionService connectionService, AuthService authService) {
        this.connectionService = connectionService;
        this.authService = authService;
    }

    @PostMapping("/request")
    public ResponseEntity<ApiResponse<Void>> sendRequest(
            @RequestBody Map<String, String> payload,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) return unauthorized();
        String targetUserId = payload.get("targetUserId");
        connectionService.sendCoworkerRequest(currentUserId, targetUserId);
        return ResponseEntity.ok(ApiResponse.ok("Coworker request sent.", null));
    }

    @PostMapping("/accept")
    public ResponseEntity<ApiResponse<Void>> acceptRequest(
            @RequestBody Map<String, String> payload,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) return unauthorized();
        String targetUserId = payload.get("targetUserId");
        connectionService.acceptCoworkerRequest(currentUserId, targetUserId);
        return ResponseEntity.ok(ApiResponse.ok("Coworker request accepted.", null));
    }

    @PostMapping("/cancel")
    public ResponseEntity<ApiResponse<Void>> cancelRequest(
            @RequestBody Map<String, String> payload,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) return unauthorized();
        String targetUserId = payload.get("targetUserId");
        connectionService.cancelCoworkerRequest(currentUserId, targetUserId);
        return ResponseEntity.ok(ApiResponse.ok("Coworker request cancelled.", null));
    }

    @PostMapping("/disconnect")
    public ResponseEntity<ApiResponse<Void>> disconnect(
            @RequestBody Map<String, String> payload,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) return unauthorized();
        String targetUserId = payload.get("targetUserId");
        connectionService.disconnectCoworker(currentUserId, targetUserId);
        return ResponseEntity.ok(ApiResponse.ok("Disconnected from coworker.", null));
    }

    @PostMapping("/follow")
    public ResponseEntity<ApiResponse<Void>> follow(
            @RequestBody Map<String, String> payload,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) return unauthorized();
        String targetUserId = payload.get("targetUserId");
        connectionService.followUser(currentUserId, targetUserId);
        return ResponseEntity.ok(ApiResponse.ok("Now following user.", null));
    }

    @PostMapping("/unfollow")
    public ResponseEntity<ApiResponse<Void>> unfollow(
            @RequestBody Map<String, String> payload,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) return unauthorized();
        String targetUserId = payload.get("targetUserId");
        connectionService.unfollowUser(currentUserId, targetUserId);
        return ResponseEntity.ok(ApiResponse.ok("Unfollowed user.", null));
    }

    @GetMapping("/status/{targetUserId}")
    public ResponseEntity<ApiResponse<ConnectionStatusDto>> getStatus(
            @PathVariable String targetUserId,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        ConnectionStatusDto status = connectionService.getConnectionStatus(currentUserId, targetUserId);
        return ResponseEntity.ok(ApiResponse.ok(status));
    }

    @GetMapping("/coworkers")
    public ResponseEntity<ApiResponse<List<UserProfileDto>>> getCoworkers(
            @RequestParam(value = "userId", required = false) String userId,
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "size", defaultValue = "20") int size,
            HttpServletRequest request) {
        String target = userId != null ? userId : authService.getCurrentUserId(request);
        if (target == null) return unauthorized();
        return ResponseEntity.ok(ApiResponse.ok(connectionService.getCoworkers(target, page, size)));
    }

    @GetMapping("/followers")
    public ResponseEntity<ApiResponse<List<UserProfileDto>>> getFollowers(
            @RequestParam(value = "userId", required = false) String userId,
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "size", defaultValue = "20") int size,
            HttpServletRequest request) {
        String target = userId != null ? userId : authService.getCurrentUserId(request);
        if (target == null) return unauthorized();
        return ResponseEntity.ok(ApiResponse.ok(connectionService.getFollowers(target, page, size)));
    }

    @GetMapping("/following")
    public ResponseEntity<ApiResponse<List<UserProfileDto>>> getFollowing(
            @RequestParam(value = "userId", required = false) String userId,
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "size", defaultValue = "20") int size,
            HttpServletRequest request) {
        String target = userId != null ? userId : authService.getCurrentUserId(request);
        if (target == null) return unauthorized();
        return ResponseEntity.ok(ApiResponse.ok(connectionService.getFollowing(target, page, size)));
    }

    @GetMapping("/pending")
    public ResponseEntity<ApiResponse<List<UserProfileDto>>> getPendingRequests(HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) return unauthorized();
        return ResponseEntity.ok(ApiResponse.ok(connectionService.getPendingRequests(currentUserId)));
    }

    private <T> ResponseEntity<ApiResponse<T>> unauthorized() {
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                .body(ApiResponse.error("Authentication required"));
    }
}
