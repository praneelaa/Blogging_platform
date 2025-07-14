package com.example.blogging_platform.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.blogging_platform.Model.Answer;
import com.example.blogging_platform.Model.Blog;
import com.example.blogging_platform.Model.Comment;
import com.example.blogging_platform.Model.Question;
import com.example.blogging_platform.Model.User;
import com.example.blogging_platform.Repository.AnswerRepository;
import com.example.blogging_platform.Repository.BlogRepository;
import com.example.blogging_platform.Repository.CommentRepository;
import com.example.blogging_platform.Repository.QuestionRepository;
import com.example.blogging_platform.Repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

    @Autowired private UserRepository userRepo;
    @Autowired private BlogRepository blogRepo;
    @Autowired private CommentRepository commentRepo;
    @Autowired private QuestionRepository questionRepo;
    @Autowired private AnswerRepository answerRepo;

    // === Default route ===
    @GetMapping("/")
    public String rootRedirect() {
        return "redirect:/login";
    }

    // === Login ===
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {

        User user = userRepo.findByUsernameAndPassword(username, password);
        if (user != null) {
            session.setAttribute("loggedInUser", user);
            model.addAttribute("user", user);

            if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                return "adminHome";
            } else {
                return "userHome";
            }
        }

        model.addAttribute("error", "Invalid username or password");
        return "login";
    }

    // === Register ===
    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@RequestParam String username,
                               @RequestParam String password,
                               Model model) {

        if (userRepo.findByUsername(username) != null) {
            model.addAttribute("error", "⚠️ Username already exists.");
            return "register";
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole("USER");

        userRepo.save(user);
        return "redirect:/login";
    }

    // === Admin Home ===
    @GetMapping("/adminHome")
    public String adminHome(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null && "ADMIN".equalsIgnoreCase(user.getRole())) {
            model.addAttribute("user", user);
            return "adminHome";
        }
        return "redirect:/login";
    }

    // === User Home ===
    @GetMapping("/userHome")
    public String userHome(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null && "USER".equalsIgnoreCase(user.getRole())) {
            model.addAttribute("user", user);
            return "userHome";
        }
        return "redirect:/login";
    }

    // === Add Blog ===
    @PostMapping("/addBlog")
    public String addBlog(@RequestParam String title,
                          @RequestParam String content,
                          HttpSession session) {

        User user = (User) session.getAttribute("loggedInUser");
        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setContent(content);

        if (user != null) {
            blog.setCreatedBy(user.getUsername());
            blog.setAuthor(user.getUsername());
        }

        blogRepo.save(blog);
        return "redirect:/blogs";
    }

    // === View Blogs ===
    @GetMapping("/blogs")
    public String viewBlogs(Model model) {
        List<Blog> blogs = blogRepo.findAll();
        model.addAttribute("blogs", blogs);

        Map<Integer, List<Comment>> commentMap = new HashMap<>();
        for (Blog blog : blogs) {
            commentMap.put(blog.getId(), commentRepo.findByBlogId(blog.getId()));
        }
        model.addAttribute("commentMap", commentMap);

        return "blogList";
    }

    // === Add Comment ===
    @PostMapping("/addComment")
    public String addComment(@RequestParam int blogId,
                             @RequestParam String commenter,
                             @RequestParam String comment) {
        Comment c = new Comment();
        c.setBlogId(blogId);
        c.setCommenter(commenter);
        c.setComment(comment);
        commentRepo.save(c);

        return "redirect:/blogs";
    }

    // === Ask Question (Admin Only) ===
    @PostMapping("/addQuestion")
    public String addQuestion(@RequestParam String question,
                              @RequestParam String createdBy,
                              HttpSession session) {

        Question q = new Question();
        q.setQuestion(question);
        q.setCreatedBy(createdBy);

        questionRepo.save(q);
        return "redirect:/questions";
    }

    // === View Questions ===
    @GetMapping("/questions")
    public String viewQuestions(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
        	return "redirect:/login";
        }

        List<Question> questions = questionRepo.findAll();
        model.addAttribute("questions", questions);

        Map<Integer, List<Answer>> answersMap = new HashMap<>();
        for (Question q : questions) {
            answersMap.put(q.getId(), answerRepo.findByQuestionId(q.getId()));
        }
        model.addAttribute("answersMap", answersMap);
        model.addAttribute("user", user);
        if ("ADMIN".equalsIgnoreCase(user.getRole())) {
            return "questionList";
        } else {
            model.addAttribute("user", user);
            return "answerForm";
        }
    }

    // === Submit Answer ===
    @PostMapping("/submitAnswer")
    public String submitAnswer(@RequestParam int questionId,
                               @RequestParam String answeredBy,
                               @RequestParam String answer,
                               HttpSession session) {

        User user = (User) session.getAttribute("loggedInUser");
        if (user == null || "ADMIN".equalsIgnoreCase(user.getRole())) {
            return "redirect:/login";
        }

        Answer ans = new Answer();
        ans.setQuestionId(questionId);
        ans.setAnsweredBy(answeredBy);
        ans.setAnswer(answer);
        answerRepo.save(ans);

        return "redirect:/questions";
    }

    // === Blog Form (Admin Only) ===
    @GetMapping("/blogForm")
    public String blogForm(HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        return (user != null && "ADMIN".equalsIgnoreCase(user.getRole())) ? "blogForm" : "redirect:/login";
    }

    // === Question Form (Anyone Logged In) ===
    @GetMapping("/questionForm")
    public String questionForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) {
            model.addAttribute("user", user);
            return "questionForm";
        }
        return "redirect:/login";
    }

    // === View Comments ===
    @GetMapping("/comments")
    public String commentPage(@RequestParam int blogId, Model model) {
        model.addAttribute("comments", commentRepo.findByBlogId(blogId));
        model.addAttribute("blogId", blogId);
        return "comments";
    }

    // === Logout ===
    @GetMapping("/logout")
    public String logout(HttpSession session, Model model) {
        session.invalidate();
        model.addAttribute("message", "You have been logged out successfully.");
        return "logout";
    }
}
