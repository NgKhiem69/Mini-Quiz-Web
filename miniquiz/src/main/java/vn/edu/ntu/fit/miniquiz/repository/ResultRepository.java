package vn.edu.ntu.fit.miniquiz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.edu.ntu.fit.miniquiz.entity.Result;
import java.util.List;

@Repository
public interface ResultRepository extends JpaRepository<Result, Long> {
    
    List<Result> findByUserId(Long userId);
}