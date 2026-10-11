package com.thynkzone.pnc.repository;

import com.thynkzone.pnc.entity.UserProfile;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserProfileRepository extends JpaRepository<UserProfile, String> {

    @Query("SELECT p FROM UserProfile p WHERE " +
           "LOWER(p.fullName) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
           "LOWER(p.firstName) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
           "LOWER(p.lastName) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
           "LOWER(p.place) LIKE LOWER(CONCAT('%', :query, '%'))")
    List<UserProfile> searchUsers(@Param("query") String query, Pageable pageable);

    @Query("SELECT p FROM UserProfile p WHERE p.id != :currentUserId ORDER BY p.rating DESC")
    List<UserProfile> findSuggestedUsers(@Param("currentUserId") String currentUserId, Pageable pageable);

    List<UserProfile> findByIdIn(List<String> ids);
}
