package com.example.blogging_platform.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.blogging_platform.Model.Blog;

import java.util.List;

public interface BlogRepository extends JpaRepository<Blog, Integer> {

    // ✅ Custom method to find blogs by author (admin username)
    List<Blog> findByAuthor(String author);
}
