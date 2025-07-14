package com.example.blogging_platform.Repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.example.blogging_platform.Model.Answer;

public interface AnswerRepository extends JpaRepository<Answer, Integer> {
    List<Answer> findByQuestionId(int questionId);  // ✅ Fetch all answers for a question
}
