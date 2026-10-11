package com.thynkzone.pnc.service;

import com.thynkzone.pnc.dto.ConnectionStatusDto;
import com.thynkzone.pnc.dto.UserProfileDto;

import java.util.List;

public interface ConnectionService {

    void sendCoworkerRequest(String userId, String targetUserId);

    void acceptCoworkerRequest(String userId, String targetUserId);

    void cancelCoworkerRequest(String userId, String targetUserId);

    void disconnectCoworker(String userId, String targetUserId);

    void followUser(String userId, String targetUserId);

    void unfollowUser(String userId, String targetUserId);

    ConnectionStatusDto getConnectionStatus(String userId, String targetUserId);

    List<UserProfileDto> getCoworkers(String userId, int page, int size);

    List<UserProfileDto> getFollowers(String userId, int page, int size);

    List<UserProfileDto> getFollowing(String userId, int page, int size);

    List<UserProfileDto> getPendingRequests(String userId);
}
