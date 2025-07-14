package com.example.blogging_platform.Service;

import com.example.blogging_platform.Model.Blog;
import com.example.blogging_platform.Repository.BlogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogService {

    @Autowired
    private BlogRepository blogRepository;

    // 🔹 Save or Update a blog
    public void saveBlog(Blog blog) {
        blogRepository.save(blog);
    }

    // 🔹 Get all blogs
    public List<Blog> getAllBlogs() {
        return blogRepository.findAll();
    }

    // 🔹 Get blog by ID
    public Blog getBlogById(int id) {
        return blogRepository.findById(id).orElse(null);
    }

    // 🔹 Delete a blog by ID
    public void deleteBlog(int id) {
        blogRepository.deleteById(id);
    }

    // 🔹 Get blogs by admin username (optional filtering)
    public List<Blog> getBlogsByAuthor(String username) {
        return blogRepository.findByAuthor(username);
    }
}
