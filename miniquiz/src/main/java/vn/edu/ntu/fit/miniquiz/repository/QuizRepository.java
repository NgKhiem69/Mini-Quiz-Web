package vn.edu.ntu.fit.miniquiz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.edu.ntu.fit.miniquiz.entity.Quiz;

@Repository
public interface QuizRepository extends JpaRepository<Quiz, Long> {
}