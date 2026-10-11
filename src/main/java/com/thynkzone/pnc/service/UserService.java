package com.thynkzone.pnc.service;

import com.thynkzone.pnc.dto.UpdateProfileRequest;
import com.thynkzone.pnc.dto.UserProfileDto;

import java.util.List;

public interface UserService {

    UserProfileDto getUserProfile(String targetUserId, String currentUserId);

    UserProfileDto updateProfile(String userId, UpdateProfileRequest request);

    void updateProfilePicture(String userId, String imageKey);

    void updateBackgroundPicture(String userId, String imageKey);

    List<UserProfileDto> searchUsers(String query, int page, int size);

    List<UserProfileDto> getSuggestedUsers(String currentUserId, int limit);

    void reportUser(String targetUserId, String reporterId, int reportType);
}
