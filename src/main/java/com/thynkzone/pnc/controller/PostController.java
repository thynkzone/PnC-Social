package com.thynkzone.pnc.controller;

import com.thynkzone.pnc.dto.*;
import com.thynkzone.pnc.service.AuthService;
import com.thynkzone.pnc.service.PostService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/posts")
public class PostController {

    private final PostService postService;
    private final AuthService authService;

    public PostController(PostService postService, AuthService authService) {
        this.postService = postService;
        this.authService = authService;
    }

    @GetMapping("/feed")
    public ResponseEntity<ApiResponse<Page<PostResponseDto>>> getFeed(
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "size", defaultValue = "15") int size,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        Page<PostResponseDto> feed = postService.getFeed(currentUserId, page, size);
        return ResponseEntity.ok(ApiResponse.ok(feed));
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<ApiResponse<Page<PostResponseDto>>> getUserPosts(
            @PathVariable String userId,
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "size", defaultValue = "15") int size,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        Page<PostResponseDto> posts = postService.getUserPosts(userId, currentUserId, page, size);
        return ResponseEntity.ok(ApiResponse.ok(posts));
    }

    @GetMapping("/{postId}")
    public ResponseEntity<ApiResponse<PostResponseDto>> getPost(
            @PathVariable String postId,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        PostResponseDto post = postService.getPostById(postId, currentUserId);
        return ResponseEntity.ok(ApiResponse.ok(post));
    }

    @PostMapping
    public ResponseEntity<ApiResponse<PostResponseDto>> createPost(
            @Valid @RequestBody CreatePostRequest createRequest,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(ApiResponse.error("Authentication required to create a post"));
        }
        PostResponseDto created = postService.createPost(currentUserId, createRequest);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.ok("Post published successfully.", created));
    }

    @PutMapping("/{postId}")
    public ResponseEntity<ApiResponse<PostResponseDto>> updatePost(
            @PathVariable String postId,
            @Valid @RequestBody UpdatePostRequest updateRequest,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(ApiResponse.error("Authentication required"));
        }
        PostResponseDto updated = postService.updatePost(postId, currentUserId, updateRequest);
        return ResponseEntity.ok(ApiResponse.ok("Post updated successfully.", updated));
    }

    @DeleteMapping("/{postId}")
    public ResponseEntity<ApiResponse<Void>> deletePost(
            @PathVariable String postId,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(ApiResponse.error("Authentication required"));
        }
        postService.deletePost(postId, currentUserId);
        return ResponseEntity.ok(ApiResponse.ok("Post deleted successfully.", null));
    }

    @PostMapping("/{postId}/report")
    public ResponseEntity<ApiResponse<Void>> reportPost(
            @PathVariable String postId,
            @RequestBody(required = false) Map<String, Object> payload,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(ApiResponse.error("Authentication required to report a post"));
        }
        int reportType = 1;
        if (payload != null && payload.containsKey("reportType")) {
            try {
                reportType = Integer.parseInt(payload.get("reportType").toString());
            } catch (Exception ignored) {}
        }
        postService.reportPost(postId, currentUserId, reportType);
        return ResponseEntity.ok(ApiResponse.ok("Thank you for your report. It has been submitted for moderation review.", null));
    }

    @PostMapping("/{postId}/react")
    public ResponseEntity<ApiResponse<Void>> reactToPost(
            @PathVariable String postId,
            @RequestBody Map<String, Integer> payload,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(ApiResponse.error("Authentication required to react"));
        }
        int type = payload.getOrDefault("type", 1); // 1 = Like, 2 = Dislike, 0 = Remove
        postService.reactToPost(postId, currentUserId, type);
        return ResponseEntity.ok(ApiResponse.ok("Reaction updated.", null));
    }

    @PostMapping("/{postId}/comments")
    public ResponseEntity<ApiResponse<CommentDto>> addComment(
            @PathVariable String postId,
            @RequestBody Map<String, String> payload,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(ApiResponse.error("Authentication required to comment"));
        }
        String commentText = payload.get("commentText");
        if (commentText == null || commentText.trim().isEmpty()) {
            return ResponseEntity.badRequest().body(ApiResponse.error("Comment cannot be empty"));
        }
        CommentDto comment = postService.addComment(postId, currentUserId, commentText);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.ok("Comment added.", comment));
    }

    @PutMapping("/{postId}/comments/{commentId}")
    public ResponseEntity<ApiResponse<CommentDto>> updateComment(
            @PathVariable String postId,
            @PathVariable Long commentId,
            @RequestBody Map<String, String> payload,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(ApiResponse.error("Authentication required to edit comment"));
        }
        String commentText = payload.get("commentText");
        if (commentText == null || commentText.trim().isEmpty()) {
            return ResponseEntity.badRequest().body(ApiResponse.error("Comment cannot be empty"));
        }
        CommentDto updated = postService.updateComment(commentId, currentUserId, commentText);
        return ResponseEntity.ok(ApiResponse.ok("Comment updated successfully.", updated));
    }

    @DeleteMapping("/{postId}/comments/{commentId}")
    public ResponseEntity<ApiResponse<Void>> deleteComment(
            @PathVariable String postId,
            @PathVariable Long commentId,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(ApiResponse.error("Authentication required"));
        }
        postService.deleteComment(commentId, currentUserId);
        return ResponseEntity.ok(ApiResponse.ok("Comment deleted.", null));
    }

    @PostMapping("/{postId}/hide")
    public ResponseEntity<ApiResponse<Void>> hidePost(
            @PathVariable String postId,
            @RequestParam(value = "hideAuthor", defaultValue = "false") boolean hideAuthor,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(ApiResponse.error("Authentication required"));
        }
        if (hideAuthor) {
            PostResponseDto post = postService.getPostById(postId, currentUserId);
            postService.hideAuthor(post.authorId(), currentUserId);
        } else {
            postService.hidePost(postId, currentUserId);
        }
        return ResponseEntity.ok(ApiResponse.ok("Post hidden from feed.", null));
    }

    @PostMapping("/unhide-all")
    public ResponseEntity<ApiResponse<Void>> unhideAll(HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(ApiResponse.error("Authentication required"));
        }
        postService.unhideAll(currentUserId);
        return ResponseEntity.ok(ApiResponse.ok("All hidden posts unhidden.", null));
    }
}
