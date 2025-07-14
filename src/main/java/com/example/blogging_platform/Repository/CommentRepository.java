package com.example.blogging_platform.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.blogging_platform.Model.Comment;

public interface CommentRepository extends JpaRepository<Comment, Integer> {
    List<Comment> findByBlogId(int blogId);
}