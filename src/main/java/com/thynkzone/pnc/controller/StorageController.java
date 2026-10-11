package com.thynkzone.pnc.controller;

import com.thynkzone.pnc.dto.ApiResponse;
import com.thynkzone.pnc.dto.PresignedUploadRequest;
import com.thynkzone.pnc.dto.PresignedUploadResponse;
import com.thynkzone.pnc.service.AuthService;
import com.thynkzone.pnc.service.StorageService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@RestController
@RequestMapping("/api/storage")
public class StorageController {

    private final StorageService storageService;
    private final AuthService authService;

    public StorageController(StorageService storageService, AuthService authService) {
        this.storageService = storageService;
        this.authService = authService;
    }

    @PostMapping("/presigned-upload")
    public ResponseEntity<ApiResponse<PresignedUploadResponse>> getPresignedUploadUrl(
            @Valid @RequestBody PresignedUploadRequest request,
            HttpServletRequest httpRequest) {
        String currentUserId = authService.getCurrentUserId(httpRequest);
        if (currentUserId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(ApiResponse.error("Authentication required to generate upload URL"));
        }

        PresignedUploadResponse response = storageService.createPresignedUploadUrl(currentUserId, request);
        return ResponseEntity.ok(ApiResponse.ok("Presigned upload URL generated successfully.", response));
    }

    @PostMapping(value = "/upload", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<ApiResponse<Map<String, String>>> uploadFile(
            @RequestParam("file") MultipartFile file,
            @RequestParam(value = "folder", defaultValue = "posts") String folder,
            HttpServletRequest httpRequest) {
        String currentUserId = authService.getCurrentUserId(httpRequest);
        if (currentUserId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(ApiResponse.error("Authentication required to upload file"));
        }

        if (file.isEmpty()) {
            return ResponseEntity.badRequest().body(ApiResponse.error("Uploaded file cannot be empty"));
        }

        Map<String, String> result = storageService.uploadFile(currentUserId, file, folder);
        return ResponseEntity.ok(ApiResponse.ok("File uploaded successfully", result));
    }
}
