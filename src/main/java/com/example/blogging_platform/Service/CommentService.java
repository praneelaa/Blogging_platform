package com.example.blogging_platform.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.blogging_platform.Model.Comment;
import com.example.blogging_platform.Repository.CommentRepository;

@Service

public class CommentService {
	@Autowired
    private CommentRepository commentRepository;

    public void saveComment(Comment comment) {
        commentRepository.save(comment);
    }

    public List<Comment> getCommentsByBlogId(int blogId) {
        return commentRepository.findByBlogId(blogId);
    }

    public List<Comment> getAllComments() {
        return commentRepository.findAll();
    }

}
