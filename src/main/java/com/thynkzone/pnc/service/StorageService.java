package com.thynkzone.pnc.service;

import com.thynkzone.pnc.dto.PresignedUploadRequest;
import com.thynkzone.pnc.dto.PresignedUploadResponse;

public interface StorageService {

    PresignedUploadResponse createPresignedUploadUrl(String userId, PresignedUploadRequest request);

    String createPresignedDownloadUrl(String objectKey);

    String getPublicUrl(String objectKey);

    void deleteObject(String objectKey);
}
