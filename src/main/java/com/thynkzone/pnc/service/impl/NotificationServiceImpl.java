package com.thynkzone.pnc.service.impl;

import com.thynkzone.pnc.entity.Notification;
import com.thynkzone.pnc.repository.NotificationRepository;
import com.thynkzone.pnc.service.NotificationService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NotificationServiceImpl implements NotificationService {

    private final NotificationRepository notificationRepository;

    public NotificationServiceImpl(NotificationRepository notificationRepository) {
        this.notificationRepository = notificationRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Notification> getNotifications(String userId, int page, int size) {
        // Types 1 (like), 2 (dislike), 3 (comment) are user-facing notifications
        return notificationRepository.findByTargetUserIdAndTypeInOrderByCreatedAtDesc(
                userId,
                List.of(1, 2, 3),
                PageRequest.of(page, size)
        );
    }

    @Override
    @Transactional
    public void markAsRead(Long notificationId, String userId) {
        notificationRepository.findById(notificationId).ifPresent(n -> {
            if (n.getTargetUserId().equals(userId)) {
                n.setRead(true);
                notificationRepository.save(n);
            }
        });
    }
}
