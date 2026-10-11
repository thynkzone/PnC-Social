package com.thynkzone.pnc.service;

import com.thynkzone.pnc.entity.Notification;
import org.springframework.data.domain.Page;

public interface NotificationService {

    Page<Notification> getNotifications(String userId, int page, int size);

    void markAsRead(Long notificationId, String userId);
}
