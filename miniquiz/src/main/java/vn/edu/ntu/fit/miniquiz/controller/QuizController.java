package vn.edu.ntu.fit.miniquiz.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.edu.ntu.fit.miniquiz.entity.Question;
import vn.edu.ntu.fit.miniquiz.entity.Quiz;
import vn.edu.ntu.fit.miniquiz.entity.Result;
import vn.edu.ntu.fit.miniquiz.entity.User;
import vn.edu.ntu.fit.miniquiz.entity.UserAnswer;
import vn.edu.ntu.fit.miniquiz.repository.QuestionRepository;
import vn.edu.ntu.fit.miniquiz.repository.QuizRepository;
import vn.edu.ntu.fit.miniquiz.repository.ResultRepository;
import vn.edu.ntu.fit.miniquiz.repository.UserAnswerRepository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/quiz")
public class QuizController {

    @Autowired
    private QuizRepository quizRepository;

    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private ResultRepository resultRepository;

    @Autowired
    private UserAnswerRepository userAnswerRepository;

    @GetMapping("/{id}")
    public String showQuiz(@PathVariable("id") Long id, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }

        Optional<Quiz> quizOpt = quizRepository.findById(id);
        if (quizOpt.isPresent()) {
            List<Question> questions = questionRepository.findByQuizId(id);
            Collections.shuffle(questions);
            model.addAttribute("quiz", quizOpt.get());
            model.addAttribute("questions", questions);
            return "quiz-detail";
        }
        return "redirect:/";
    }

    @PostMapping("/{id}/submit")
    public String submitQuiz(@PathVariable("id") Long id, @RequestParam Map<String, String> allParams, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }

        List<Question> questions = questionRepository.findByQuizId(id);
        int score = 0;

        Quiz quiz = quizRepository.findById(id).get();
        Result result = new Result();
        result.setUser(loggedInUser);
        result.setQuiz(quiz);
        result.setScore(0);
        resultRepository.save(result);

        List<UserAnswer> userAnswers = new ArrayList<>();

        for (Question q : questions) {
            String submittedAnswer = allParams.get("question_" + q.getId());
            if (submittedAnswer != null && submittedAnswer.equals(q.getCorrectAnswer())) {
                score++;
            }
            UserAnswer ua = new UserAnswer(result, q, submittedAnswer);
            userAnswers.add(ua);
        }

        result.setScore(score);
        resultRepository.save(result);
        userAnswerRepository.saveAll(userAnswers);

        model.addAttribute("score", score);
        model.addAttribute("totalQuestions", questions.size());
        model.addAttribute("quizTitle", quiz.getTitle());

        return "result";
    }

    @GetMapping("/review/{resultId}")
    public String reviewQuiz(@PathVariable("resultId") Long resultId, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }

        Optional<Result> resultOpt = resultRepository.findById(resultId);
        if (resultOpt.isPresent()) {
            Result result = resultOpt.get();
            if (result.getUser().getId().equals(loggedInUser.getId())) {
                model.addAttribute("result", result);
                return "quiz-review";
            }
        }
        return "redirect:/history";
    }
}