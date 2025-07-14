package com.example.blogging_platform.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.blogging_platform.Model.Question;
import com.example.blogging_platform.Repository.QuestionRepository;

@Service

public class QuestionService {
	 @Autowired
	    private QuestionRepository questionRepository;

	    public void saveQuestion(Question question) {
	        questionRepository.save(question);
	    }

	    public List<Question> getAllQuestions() {
	        return questionRepository.findAll();
	    }

	    public Question getQuestionById(int id) {
	        return questionRepository.findById(id).orElse(null);
	    }

	    public void deleteQuestion(int id) {
	        questionRepository.deleteById(id);
	    }
	

}
