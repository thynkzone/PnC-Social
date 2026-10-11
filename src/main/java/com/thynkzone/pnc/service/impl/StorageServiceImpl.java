package com.thynkzone.pnc.service.impl;

import com.thynkzone.pnc.dto.PresignedUploadRequest;
import com.thynkzone.pnc.dto.PresignedUploadResponse;
import com.thynkzone.pnc.service.StorageService;
import com.thynkzone.pnc.util.UidGenerator;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.GetObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.presigner.S3Presigner;
import software.amazon.awssdk.services.s3.presigner.model.GetObjectPresignRequest;
import software.amazon.awssdk.services.s3.presigner.model.PresignedGetObjectRequest;
import software.amazon.awssdk.services.s3.presigner.model.PresignedPutObjectRequest;
import software.amazon.awssdk.services.s3.presigner.model.PutObjectPresignRequest;

import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.core.sync.RequestBody;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.Duration;
import java.util.Map;

@Service
public class StorageServiceImpl implements StorageService {

    private final S3Client s3Client;
    private final S3Presigner s3Presigner;

    @Value("${cloudflare.r2.bucket:pnc}")
    private String bucket;

    @Value("${cloudflare.r2.public-url:https://cdn.thynkzone.eu.org}")
    private String publicUrlBase;

    public StorageServiceImpl(S3Client s3Client, S3Presigner s3Presigner) {
        this.s3Client = s3Client;
        this.s3Presigner = s3Presigner;
    }

    @Override
    public PresignedUploadResponse createPresignedUploadUrl(String userId, PresignedUploadRequest request) {
        String extension = switch (request.contentType()) {
            case "image/png" -> ".png";
            case "image/webp" -> ".webp";
            case "image/gif" -> ".gif";
            default -> ".jpg";
        };

        String objectKey = String.format("%s/%s_%s%s", request.folder(), userId, UidGenerator.generateId(), extension);

        PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                .bucket(bucket)
                .key(objectKey)
                .contentType(request.contentType())
                .build();

        PutObjectPresignRequest presignRequest = PutObjectPresignRequest.builder()
                .signatureDuration(Duration.ofMinutes(15))
                .putObjectRequest(putObjectRequest)
                .build();

        PresignedPutObjectRequest presignedRequest = s3Presigner.presignPutObject(presignRequest);
        String uploadUrl = presignedRequest.url().toString();
        String cdnUrl = getPublicUrl(objectKey);

        return new PresignedUploadResponse(uploadUrl, objectKey, cdnUrl, 900);
    }

    @Override
    public String createPresignedDownloadUrl(String objectKey) {
        GetObjectRequest getObjectRequest = GetObjectRequest.builder()
                .bucket(bucket)
                .key(objectKey)
                .build();

        GetObjectPresignRequest presignRequest = GetObjectPresignRequest.builder()
                .signatureDuration(Duration.ofHours(1))
                .getObjectRequest(getObjectRequest)
                .build();

        PresignedGetObjectRequest presignedRequest = s3Presigner.presignGetObject(presignRequest);
        return presignedRequest.url().toString();
    }

    @Override
    public String getPublicUrl(String objectKey) {
        if (objectKey == null || objectKey.isBlank()) return null;
        if (objectKey.startsWith("http://") || objectKey.startsWith("https://")) return objectKey;
        String base = publicUrlBase.endsWith("/") ? publicUrlBase.substring(0, publicUrlBase.length() - 1) : publicUrlBase;
        return base + "/" + objectKey;
    }

    @Override
    public void deleteObject(String objectKey) {
        if (objectKey == null || objectKey.isBlank()) return;
        try {
            DeleteObjectRequest deleteRequest = DeleteObjectRequest.builder()
                    .bucket(bucket)
                    .key(objectKey)
                    .build();
            s3Client.deleteObject(deleteRequest);
        } catch (Exception ignored) {
        }
    }

    @Override
    public Map<String, String> uploadFile(String userId, MultipartFile file, String folder) {
        String contentType = file.getContentType();
        if (contentType == null || contentType.isBlank()) {
            contentType = "image/jpeg";
        }
        String extension = switch (contentType) {
            case "image/png" -> ".png";
            case "image/webp" -> ".webp";
            case "image/gif" -> ".gif";
            default -> ".jpg";
        };

        String filename = String.format("%s_%s%s", userId, UidGenerator.generateId(), extension);
        String objectKey = String.format("%s/%s", folder, filename);

        // Try streaming to Cloudflare R2 first
        try {
            PutObjectRequest putRequest = PutObjectRequest.builder()
                    .bucket(bucket)
                    .key(objectKey)
                    .contentType(contentType)
                    .build();

            s3Client.putObject(putRequest, RequestBody.fromInputStream(file.getInputStream(), file.getSize()));
            String cdnUrl = getPublicUrl(objectKey);
            return Map.of(
                    "publicUrl", cdnUrl,
                    "downloadUrl", cdnUrl,
                    "objectKey", objectKey
            );
        } catch (Exception s3Ex) {
            // S3/R2 direct streaming failed (e.g. placeholder credentials, R2 network timeout)
            // Fall back to server local uploads directory
            try {
                Path uploadDir = Paths.get("uploads", folder);
                Files.createDirectories(uploadDir);
                Path targetPath = uploadDir.resolve(filename);
                Files.copy(file.getInputStream(), targetPath, StandardCopyOption.REPLACE_EXISTING);

                String localUrl = "/uploads/" + folder + "/" + filename;
                return Map.of(
                        "publicUrl", localUrl,
                        "downloadUrl", localUrl,
                        "objectKey", objectKey
                );
            } catch (IOException ioEx) {
                throw new RuntimeException("Failed to save uploaded file: " + ioEx.getMessage(), ioEx);
            }
        }
    }
}
