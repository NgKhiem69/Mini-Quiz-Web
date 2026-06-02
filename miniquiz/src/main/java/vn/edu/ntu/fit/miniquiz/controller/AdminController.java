package vn.edu.ntu.fit.miniquiz.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.edu.ntu.fit.miniquiz.entity.Quiz;
import vn.edu.ntu.fit.miniquiz.entity.User;
import vn.edu.ntu.fit.miniquiz.repository.QuizRepository;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private QuizRepository quizRepository;

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
}