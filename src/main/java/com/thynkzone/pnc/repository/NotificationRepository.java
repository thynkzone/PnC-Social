package com.thynkzone.pnc.repository;

import com.thynkzone.pnc.entity.Notification;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Long> {

    Page<Notification> findByTargetUserIdAndTypeInOrderByCreatedAtDesc(String targetUserId, List<Integer> types, Pageable pageable);

    List<Notification> findByTargetPostIdAndTypeOrderByCreatedAtAsc(String targetPostId, int type);

    long countByTargetPostIdAndType(String targetPostId, int type);

    Optional<Notification> findByActorIdAndTargetPostIdAndType(String actorId, String targetPostId, int type);

    boolean existsByActorIdAndTargetPostIdAndType(String actorId, String targetPostId, int type);

    void deleteByActorIdAndTargetPostIdAndType(String actorId, String targetPostId, int type);

    @Query("SELECT n.targetPostId FROM Notification n WHERE n.actorId = :actorId AND n.type = 5")
    List<String> findHiddenPostIdsByActorId(@Param("actorId") String actorId);

    @Query("SELECT n.targetUserId FROM Notification n WHERE n.actorId = :actorId AND n.type = 6")
    List<String> findHiddenAuthorIdsByActorId(@Param("actorId") String actorId);

    void deleteByActorIdAndType(String actorId, int type);
}
