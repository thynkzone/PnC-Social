package com.thynkzone.pnc.repository;

import com.thynkzone.pnc.entity.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostRepository extends JpaRepository<Post, String> {

    Page<Post> findByAuthorIdOrderByCreatedAtDesc(String authorId, Pageable pageable);

    long countByAuthorId(String authorId);

    /**
     * Finds feed posts:
     * - All public posts (privacy = 4)
     * - User's own posts
     * - Posts by coworkers (privacy in 2, 3, 4)
     * - Posts by followed users (privacy in 3, 4)
     * - Excludes explicitly hidden posts or hidden author posts
     */
    @Query("SELECT p FROM Post p WHERE " +
           "(p.id NOT IN :hiddenPostIds) AND " +
           "(p.authorId NOT IN :hiddenAuthorIds) AND (" +
           "  p.privacy = 4 OR " +
           "  p.authorId = :userId OR " +
           "  (p.authorId IN :coworkerIds AND p.privacy IN (2, 3, 4)) OR " +
           "  (p.authorId IN :followingIds AND p.privacy IN (3, 4))" +
           ") ORDER BY p.createdAt DESC")
    Page<Post> findFeedPosts(
        @Param("userId") String userId,
        @Param("coworkerIds") List<String> coworkerIds,
        @Param("followingIds") List<String> followingIds,
        @Param("hiddenPostIds") List<String> hiddenPostIds,
        @Param("hiddenAuthorIds") List<String> hiddenAuthorIds,
        Pageable pageable
    );

    @Query("SELECT p FROM Post p WHERE p.privacy = 4 AND p.id NOT IN :hiddenPostIds ORDER BY p.createdAt DESC")
    Page<Post> findPublicPosts(@Param("hiddenPostIds") List<String> hiddenPostIds, Pageable pageable);
}
