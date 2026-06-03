package vn.edu.ntu.fit.miniquiz.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import vn.edu.ntu.fit.miniquiz.entity.Question;
import vn.edu.ntu.fit.miniquiz.entity.Quiz;
import vn.edu.ntu.fit.miniquiz.entity.User;
import vn.edu.ntu.fit.miniquiz.repository.QuestionRepository;
import vn.edu.ntu.fit.miniquiz.repository.QuizRepository;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private QuizRepository quizRepository;

    @Autowired
    private QuestionRepository questionRepository;

    @GetMapping("/quizzes")
    public String manageQuizzes(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !loggedInUser.getRole().equals("ROLE_ADMIN")) {
            return "redirect:/login";
        }
        model.addAttribute("quizzes", quizRepository.findAll());
        return "admin-quizzes";
    }

    @GetMapping("/quiz/add")
    public String showAddForm(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !loggedInUser.getRole().equals("ROLE_ADMIN")) {
            return "redirect:/login";
        }
        return "quiz-add";
    }

    @PostMapping("/quiz/add")
    public String processAdd(@RequestParam("title") String title, @RequestParam("description") String description, @RequestParam("timeLimitMinutes") Integer timeLimitMinutes, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !loggedInUser.getRole().equals("ROLE_ADMIN")) {
            return "redirect:/login";
        }
        Quiz quiz = new Quiz(title, description, timeLimitMinutes);
        quizRepository.save(quiz);
        return "redirect:/admin/quizzes";
    }

    @GetMapping("/quiz/delete/{id}")
    public String deleteQuiz(@PathVariable("id") Long id, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !loggedInUser.getRole().equals("ROLE_ADMIN")) {
            return "redirect:/login";
        }
        quizRepository.deleteById(id);
        return "redirect:/admin/quizzes";
    }

    
    @GetMapping("/quiz/{quizId}/questions")
    public String manageQuestions(@PathVariable("quizId") Long quizId, HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null || !"ROLE_ADMIN".equals(user.getRole())) {
            return "redirect:/login";
        }
        Quiz quiz = quizRepository.findById(quizId).orElseThrow();
        List<Question> questions = questionRepository.findByQuizId(quizId);
        model.addAttribute("quiz", quiz);
        model.addAttribute("questions", questions);
        return "admin-questions";
    }

    @GetMapping("/quiz/{quizId}/question/add")
    public String showAddQuestionForm(@PathVariable("quizId") Long quizId, HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null || !"ROLE_ADMIN".equals(user.getRole())) {
            return "redirect:/login";
        }
        model.addAttribute("quizId", quizId);
        model.addAttribute("question", new Question());
        return "question-form";
    }

    @PostMapping("/quiz/{quizId}/question/save")
    public String saveQuestion(@PathVariable("quizId") Long quizId, @ModelAttribute Question question, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null || !"ROLE_ADMIN".equals(user.getRole())) {
            return "redirect:/login";
        }
        Quiz quiz = quizRepository.findById(quizId).orElseThrow();
        question.setQuiz(quiz);
        questionRepository.save(question);
        return "redirect:/admin/quiz/" + quizId + "/questions";
    }

    @GetMapping("/question/{id}/edit")
    public String showEditQuestionForm(@PathVariable("id") Long id, HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null || !"ROLE_ADMIN".equals(user.getRole())) {
            return "redirect:/login";
        }
        Question question = questionRepository.findById(id).orElseThrow();
        model.addAttribute("quizId", question.getQuiz().getId());
        model.addAttribute("question", question);
        return "question-form";
    }
}