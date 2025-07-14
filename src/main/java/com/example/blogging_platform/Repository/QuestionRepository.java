package com.example.blogging_platform.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.blogging_platform.Model.Question;

public interface QuestionRepository extends JpaRepository<Question, Integer> {
    // Add custom queries if needed
}