package com.thynkzone.pnc.service;

import com.thynkzone.pnc.dto.PresignedUploadRequest;
import com.thynkzone.pnc.dto.PresignedUploadResponse;
import org.springframework.web.multipart.MultipartFile;
import java.util.Map;

public interface StorageService {

    PresignedUploadResponse createPresignedUploadUrl(String userId, PresignedUploadRequest request);

    String createPresignedDownloadUrl(String objectKey);

    String getPublicUrl(String objectKey);

    void deleteObject(String objectKey);

    Map<String, String> uploadFile(String userId, MultipartFile file, String folder);
}
