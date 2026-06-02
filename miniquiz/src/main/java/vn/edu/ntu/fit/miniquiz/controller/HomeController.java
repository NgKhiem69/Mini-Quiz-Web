package vn.edu.ntu.fit.miniquiz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import vn.edu.ntu.fit.miniquiz.entity.Quiz;
import vn.edu.ntu.fit.miniquiz.repository.QuizRepository;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private QuizRepository quizRepository;

    @GetMapping("/")
    public String showHomePage(Model model) {
        // Lấy toàn bộ danh sách đề thi từ Database
        List<Quiz> quizzes = quizRepository.findAll();
        
        // Gửi danh sách này sang giao diện HTML
        model.addAttribute("quizzes", quizzes);
        return "index";
    }
    @Autowired
    private vn.edu.ntu.fit.miniquiz.repository.ResultRepository resultRepository;

    @GetMapping("/history")
    public String showHistory(jakarta.servlet.http.HttpSession session, Model model) {
        vn.edu.ntu.fit.miniquiz.entity.User loggedInUser = (vn.edu.ntu.fit.miniquiz.entity.User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        
        // Lấy danh sách kết quả của riêng user đang đăng nhập
        model.addAttribute("results", resultRepository.findByUserId(loggedInUser.getId()));
        return "history";
    }
}