package vn.edu.ntu.fit.miniquiz.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vn.edu.ntu.fit.miniquiz.entity.User;
import vn.edu.ntu.fit.miniquiz.repository.UserRepository;

@Controller
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session, Model model) {
        User user = userRepository.findByUsername(username);
        
        if (user != null && user.getPassword().equals(password)) {
            session.setAttribute("loggedInUser", user);
            return "redirect:/";
        }
        
        model.addAttribute("error", "Sai tên đăng nhập hoặc mật khẩu!");
        return "login";
    }

    @GetMapping("/register")
    public String showRegisterForm() {
        return "register";
    }

    @PostMapping("/register")
    public String processRegister(@RequestParam("username") String username, @RequestParam("password") String password, Model model) {
        if (userRepository.findByUsername(username) != null) {
            model.addAttribute("error", "Tên đăng nhập đã tồn tại!");
            return "register";
        }
        
        User newUser = new User(username, password, "ROLE_USER");
        userRepository.save(newUser);
        
        model.addAttribute("success", "Đăng ký thành công! Vui lòng đăng nhập.");
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}