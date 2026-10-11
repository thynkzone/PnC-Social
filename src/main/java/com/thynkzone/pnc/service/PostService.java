package com.thynkzone.pnc.service;

import com.thynkzone.pnc.dto.CommentDto;
import com.thynkzone.pnc.dto.CreatePostRequest;
import com.thynkzone.pnc.dto.PostResponseDto;
import com.thynkzone.pnc.dto.UpdatePostRequest;
import org.springframework.data.domain.Page;

import java.util.List;

public interface PostService {

    PostResponseDto createPost(String authorId, CreatePostRequest request);

    PostResponseDto updatePost(String postId, String authorId, UpdatePostRequest request);

    void deletePost(String postId, String authorId);

    Page<PostResponseDto> getFeed(String currentUserId, int page, int size);

    Page<PostResponseDto> getUserPosts(String targetUserId, String currentUserId, int page, int size);

    PostResponseDto getPostById(String postId, String currentUserId);

    void reactToPost(String postId, String actorId, int reactionType);

    CommentDto addComment(String postId, String actorId, String commentText);

    CommentDto updateComment(Long commentId, String actorId, String commentText);

    void deleteComment(Long commentId, String actorId);

    void hidePost(String postId, String actorId);

    void hideAuthor(String authorId, String actorId);

    void unhideAll(String actorId);

    List<CommentDto> getPostComments(String postId, String currentUserId);
}
