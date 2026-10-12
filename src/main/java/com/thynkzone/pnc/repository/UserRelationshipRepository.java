package com.thynkzone.pnc.repository;

import com.thynkzone.pnc.entity.UserRelationship;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRelationshipRepository extends JpaRepository<UserRelationship, Long> {

    Optional<UserRelationship> findByUserIdAndTargetUserIdAndRelationshipType(String userId, String targetUserId, int relationshipType);

    Optional<UserRelationship> findByUserIdAndTargetUserId(String userId, String targetUserId);

    List<UserRelationship> findByUserIdAndRelationshipType(String userId, int relationshipType);

    Page<UserRelationship> findByUserIdAndRelationshipTypeOrderByCreatedAtDesc(String userId, int relationshipType, Pageable pageable);

    long countByUserIdAndRelationshipType(String userId, int relationshipType);

    boolean existsByUserIdAndTargetUserIdAndRelationshipType(String userId, String targetUserId, int relationshipType);

    void deleteByUserIdAndTargetUserIdAndRelationshipType(String userId, String targetUserId, int relationshipType);

    void deleteByUserIdAndTargetUserId(String userId, String targetUserId);

    void deleteByUserId(String userId);

    void deleteByTargetUserId(String targetUserId);

    @Query("SELECT r.targetUserId FROM UserRelationship r WHERE r.userId = :userId AND r.relationshipType = :type")
    List<String> findTargetUserIdsByUserIdAndType(@Param("userId") String userId, @Param("type") int type);

    @Query("SELECT r1.targetUserId FROM UserRelationship r1 " +
           "JOIN UserRelationship r2 ON r1.targetUserId = r2.targetUserId " +
           "WHERE r1.userId = :user1Id AND r2.userId = :user2Id " +
           "AND r1.relationshipType = 2 AND r2.relationshipType = 2")
    List<String> findMutualCoworkerIds(@Param("user1Id") String user1Id, @Param("user2Id") String user2Id);
}
