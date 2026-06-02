-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 02, 2026 lúc 07:46 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `miniquiz_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `questions`
--

CREATE TABLE `questions` (
  `correct_answer` varchar(1) NOT NULL,
  `id` bigint(20) NOT NULL,
  `quiz_id` bigint(20) NOT NULL,
  `content` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `questions`
--

INSERT INTO `questions` (`correct_answer`, `id`, `quiz_id`, `content`, `option_a`, `option_b`, `option_c`, `option_d`) VALUES
('B', 1, 1, 'Which word means \"a period of temporary economic decline\"?', 'Inflation', 'Recession', 'Surplus', 'Deficit'),
('A', 2, 1, 'What is the meaning of \"Lucrative\"?', 'Producing a great deal of profit', 'Causing financial ruin', 'Relating to taxes', 'Having no intrinsic value'),
('A', 3, 1, 'What is a \"Tariff\"?', 'A tax on imports or exports', 'A type of currency', 'A bank loan', 'A stock market crash'),
('C', 4, 1, 'Which word is a synonym for \"Flourish\" in an economic context?', 'Decline', 'Stagnate', 'Prosper', 'Depreciate'),
('B', 5, 1, 'What does \"Monopoly\" mean?', 'Shared market', 'Exclusive control of a market', 'Free trade', 'Economic equality'),
('B', 6, 2, 'Which word is a synonym for \"Ecstatic\"?', 'Miserable', 'Overwhelmingly joyful', 'Apathetic', 'Nostalgic'),
('C', 7, 2, 'What does \"Empathy\" mean?', 'Lack of understanding', 'Feeling pity', 'The ability to understand others', 'Strong hostility'),
('B', 8, 2, 'What does \"Melancholy\" describe?', 'Extreme happiness', 'A feeling of pensive sadness', 'Sudden anger', 'Complete confusion'),
('C', 9, 2, 'Which of the following is a synonym for \"Furious\"?', 'Calm', 'Annoyed', 'Livid', 'Indifferent'),
('C', 10, 2, 'What is the meaning of \"Apprehensive\"?', 'Excited', 'Confident', 'Anxious or fearful', 'Bored'),
('A', 11, 3, 'What does \"Itinerary\" refer to?', 'A planned route or journey', 'A type of luggage', 'A travel insurance policy', 'A tour guide'),
('B', 12, 3, 'What does \"Excursion\" refer to?', 'A long, difficult journey', 'A short, leisure trip', 'A permanent relocation', 'A business meeting'),
('C', 13, 3, 'What is a \"Souvenir\"?', 'A travel document', 'A local dish', 'An item kept as a reminder of a place', 'A type of transportation'),
('A', 14, 3, 'Which word best describes a place that is \"Picturesque\"?', 'Visually attractive', 'Extremely crowded', 'Heavily polluted', 'Very expensive'),
('A', 15, 4, 'What does WBS stand for in project management?', 'Work Breakdown Structure', 'Work Base System', 'Wide Band System', 'Work Breakdown Schedule'),
('C', 16, 4, 'In an Activity-on-Arrow (AOA) diagram, what do the arrows represent?', 'Events', 'Nodes', 'Activities', 'Time constraints'),
('B', 17, 4, 'Which diagram maps how data processes move through a system?', 'Entity Relationship Diagram', 'Data Flow Diagram', 'Use Case Diagram', 'Class Diagram'),
('B', 18, 4, 'What is the primary focus of Feature-Driven Development (FDD)?', 'Writing extensive documentation', 'Delivering tangible, working software repeatedly', 'Designing database schemas', 'Client hardware setup'),
('C', 19, 5, 'Which annotation is used to mark a class as a JPA entity?', '@Table', '@Column', '@Entity', '@Id'),
('B', 20, 5, 'What is Thymeleaf primarily used for in a Spring Boot application?', 'Database mapping', 'Server-side HTML rendering', 'Security authentication', 'REST API creation'),
('A', 21, 5, 'Which syntax is used to evaluate an expression in Thymeleaf?', '${...}', '#{...}', '@{...}', '*{...}'),
('A', 22, 5, 'Which interface provides standard CRUD operations in Spring Data JPA?', 'JpaRepository', 'CrudManager', 'DataService', 'EntityManager'),
('B', 23, 6, 'Which word is a synonym for \"Ubiquitous\"?', 'Rare', 'Omnipresent', 'Isolated', 'Temporary'),
('A', 24, 6, 'What does the term \"Ephemeral\" describe?', 'Lasting for a very short time', 'Having endless possibilities', 'Extremely heavy', 'Highly controversial'),
('B', 25, 6, 'In the context of problem-solving, what does \"Pragmatic\" mean?', 'Idealistic and visionary', 'Dealing with things sensibly and realistically', 'Overly emotional', 'Lacking any logical basis'),
('C', 26, 6, 'Which word is the best fit for: The government hopes to ___ the impact of the economic crisis?', 'Aggravate', 'Exacerbate', 'Mitigate', 'Instigate'),
('B', 27, 7, 'What is the primary function of a Support Vector Machine (SVM)?', 'Database management', 'Classification and regression analysis', 'Compiling code', 'Rendering web pages'),
('A', 28, 7, 'Which of the following is an algorithm used for texture feature extraction in images?', 'GLCM (Gray-Level Co-occurrence Matrix)', 'HTTP (Hypertext Transfer Protocol)', 'SQL (Structured Query Language)', 'CSS (Cascading Style Sheets)'),
('A', 29, 7, 'What does LBP stand for in the context of computer vision?', 'Local Binary Pattern', 'Linear Base Processing', 'Logical Byte Protocol', 'Lightweight Background Process'),
('B', 30, 7, 'In machine learning, what is the purpose of training data?', 'To test the final model', 'To fit the parameters of the model', 'To deploy the application', 'To design the user interface'),
('B', 31, 1, 'What is the term for a general increase in prices and fall in the purchasing value of money?', 'Deflation', 'Inflation', 'Stagflation', 'Depreciation'),
('C', 32, 1, 'Which term describes a company\'s legal financial debts or obligations?', 'Assets', 'Equities', 'Liabilities', 'Dividends'),
('B', 33, 2, 'What does it mean to feel \"Ambivalent\"?', 'Feeling extreme anger', 'Having mixed feelings or contradictory ideas', 'Feeling completely numb', 'Experiencing sudden joy'),
('C', 34, 2, 'Which word is the best synonym for \"Devastated\" in an emotional context?', 'Annoyed', 'Indifferent', 'Overwhelmed with shock and grief', 'Slightly disappointed'),
('B', 35, 3, 'Which word describes a lifestyle of moving from one place to another rather than living in one place all the time?', 'Sedentary', 'Nomadic', 'Urban', 'Provincial'),
('B', 36, 3, 'What does the term \"Indigenous\" mean when referring to a travel destination?', 'Foreign and exotic', 'Originating or occurring naturally in a particular place', 'Extremely modernized', 'Heavily populated by tourists'),
('C', 37, 4, 'In a Data Flow Diagram (DFD), which symbol is typically used to represent an external entity?', 'Circle', 'Open-ended rectangle', 'Square or Rectangle', 'Diamond'),
('B', 38, 4, 'Which metric is primarily used to estimate the time required for a project in an Activity-on-Arrow (AOA) diagram?', 'Story points', 'Critical path', 'Lines of code', 'Function points'),
('C', 39, 5, 'Which Spring Boot annotation is used to map HTTP GET requests onto specific handler methods?', '@PostMapping', '@RequestMapping', '@GetMapping', '@PutMapping'),
('C', 40, 5, 'In Spring MVC, which interface is commonly used to pass data from the Controller to the Thymeleaf view?', 'HttpServletRequest', 'Session', 'Model', 'ViewResolver'),
('B', 41, 6, 'Which word is a synonym for \"Articulate\" when describing speaking skills?', 'Incomprehensible', 'Eloquent', 'Hesitant', 'Mumbled'),
('B', 42, 6, 'What does the term \"Prolific\" mean in the context of creating work?', 'Lacking originality', 'Producing a large number of works', 'Taking a very long time to finish', 'Highly criticized'),
('C', 43, 7, 'Why is the Support Vector Machine (SVM) algorithm highly effective in image classification tasks?', 'It requires very little memory', 'It automatically extracts features from raw images', 'It is effective in high dimensional spaces', 'It only works with binary pixel values'),
('B', 44, 7, 'What specific information does a Gray-Level Co-occurrence Matrix (GLCM) capture from an image?', 'Color histogram distribution', 'Spatial relationship of pixels to analyze texture', 'Outline of distinct shapes', 'Speed of moving objects'),
('A', 45, 1, 'What does the term \"Amortization\" refer to?', 'Paying off a debt over time in equal installments', 'A sudden drop in stock prices', 'The process of printing more money', 'Freezing bank accounts'),
('B', 46, 1, 'Which word describes money transferred or sent back home by a foreign worker?', 'Dividend', 'Remittance', 'Subsidy', 'Tariff'),
('C', 47, 2, 'Which word describes a feeling of bitter indignation at having been treated unfairly?', 'Jubilation', 'Apathy', 'Resentment', 'Compassion'),
('B', 48, 2, 'What does it mean to feel \"Exhilarated\"?', 'Deeply exhausted', 'Very happy, animated, or elated', 'Confused and disoriented', 'Nervous and tense'),
('C', 49, 3, 'What does the idiom \"Off the beaten track\" mean?', 'A popular tourist hotspot', 'Traveling by train only', 'An isolated place rarely visited by people', 'A well-paved highway'),
('B', 50, 3, 'Which word is synonymous with the friendly and generous reception of guests or strangers?', 'Hostility', 'Hospitality', 'Anonymity', 'Isolation'),
('A', 51, 4, 'In Data Flow Diagrams (DFD), what is a Level 0 diagram also known as?', 'Context Diagram', 'Detailed Diagram', 'Entity-Relationship Diagram', 'Class Diagram'),
('B', 52, 4, 'What is the first phase in Feature-Driven Development (FDD)?', 'Build a Feature List', 'Develop an Overall Model', 'Plan by Feature', 'Design by Feature'),
('A', 53, 5, 'What is the main difference between @Controller and @RestController in Spring Boot?', '@RestController automatically serializes return objects into HttpResponse (e.g., JSON)', '@Controller is faster', '@RestController is used for Thymeleaf views', 'There is no difference'),
('D', 54, 5, 'Which interface in Spring Data JPA is used for pagination and sorting?', 'CrudRepository', 'PagingAndSortingRepository', 'JpaRepository', 'Both B and C'),
('B', 55, 6, 'What is a \"Conundrum\"?', 'A simple task', 'A confusing and difficult problem or question', 'A musical instrument', 'A formal agreement'),
('C', 56, 6, 'Which word describes the occurrence and development of events by chance in a happy or beneficial way?', 'Catastrophe', 'Inevitable', 'Serendipity', 'Misfortune'),
('B', 57, 7, 'In the Local Binary Pattern (LBP) algorithm, how is the binary pattern generated for a pixel?', 'By calculating the color histogram of the entire image', 'By thresholding the neighborhood pixels against the central pixel value', 'By transforming the image into the frequency domain', 'By applying a Gaussian blur'),
('B', 58, 7, 'What is the objective of the hyperplane in a Support Vector Machine (SVM)?', 'To compress the image size', 'To maximize the margin between different classes of data points', 'To randomly scatter data points', 'To convert text to speech');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quizzes`
--

CREATE TABLE `quizzes` (
  `time_limit_minutes` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `description` text DEFAULT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `quizzes`
--

INSERT INTO `quizzes` (`time_limit_minutes`, `id`, `description`, `title`) VALUES
(15, 1, 'Advanced economic and financial terms.', 'IELTS Vocabulary: Economy'),
(10, 2, 'Vocabulary for expressing complex feelings.', 'IELTS Vocabulary: Emotions'),
(20, 3, 'Tourism, destinations, and cultural exchanges.', 'IELTS Vocabulary: Travel'),
(15, 4, 'System analysis, project management, and modeling diagrams.', 'Software Engineering Methodologies'),
(15, 5, 'Core concepts of Spring Framework, Thymeleaf, and ORM.', 'Java Spring Boot & MVC'),
(15, 6, 'High-level vocabulary for fluency and coherence.', 'IELTS Speaking & Advanced Vocabulary (Band 8.0+)'),
(20, 7, 'Concepts of feature extraction and classification models.', 'Artificial Intelligence & Machine Learning');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `results`
--

CREATE TABLE `results` (
  `score` int(11) NOT NULL,
  `date_taken` datetime(6) NOT NULL,
  `id` bigint(20) NOT NULL,
  `quiz_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `results`
--

INSERT INTO `results` (`score`, `date_taken`, `id`, `quiz_id`, `user_id`) VALUES
(1, '2026-06-02 16:11:34.000000', 1, 1, 2),
(2, '2026-06-02 16:12:10.000000', 2, 3, 2),
(5, '2026-06-02 17:27:47.000000', 3, 1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `password`, `role`, `username`) VALUES
(1, 'admin123', 'ROLE_ADMIN', 'admin'),
(2, '123', 'ROLE_USER', 'gk699488@gmail.com'),
(3, '123', 'ROLE_USER', 'nhtuong59@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_answers`
--

CREATE TABLE `user_answers` (
  `id` bigint(20) NOT NULL,
  `selected_answer` varchar(1) DEFAULT NULL,
  `question_id` bigint(20) NOT NULL,
  `result_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_answers`
--

INSERT INTO `user_answers` (`id`, `selected_answer`, `question_id`, `result_id`) VALUES
(1, 'D', 1, 1),
(2, 'A', 2, 1),
(3, 'C', 3, 1),
(4, 'A', 4, 1),
(5, 'C', 5, 1),
(6, 'A', 31, 1),
(7, 'B', 32, 1),
(8, 'A', 11, 2),
(9, 'A', 12, 2),
(10, 'C', 13, 2),
(11, 'D', 14, 2),
(12, 'A', 35, 2),
(13, 'A', 36, 2),
(14, 'A', 1, 3),
(15, 'A', 2, 3),
(16, 'A', 3, 3),
(17, 'C', 4, 3),
(18, 'A', 5, 3),
(19, 'A', 31, 3),
(20, 'A', 32, 3),
(21, 'A', 45, 3),
(22, 'B', 46, 3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKn3gvco4b0kewxc0bywf1igfms` (`quiz_id`);

--
-- Chỉ mục cho bảng `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKt6q4hhocvhex1y4e6xpcb4b9y` (`quiz_id`),
  ADD KEY `FKxtl9ahma532if6r68yvgo7ck` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`);

--
-- Chỉ mục cho bảng `user_answers`
--
ALTER TABLE `user_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6b46l4bb7a6wfxvmn6l7ig8vo` (`question_id`),
  ADD KEY `FKbgm1ddv53lxjq8qp3648g7diy` (`result_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `results`
--
ALTER TABLE `results`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `FKn3gvco4b0kewxc0bywf1igfms` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`);

--
-- Các ràng buộc cho bảng `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `FKt6q4hhocvhex1y4e6xpcb4b9y` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `FKxtl9ahma532if6r68yvgo7ck` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `user_answers`
--
ALTER TABLE `user_answers`
  ADD CONSTRAINT `FK6b46l4bb7a6wfxvmn6l7ig8vo` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  ADD CONSTRAINT `FKbgm1ddv53lxjq8qp3648g7diy` FOREIGN KEY (`result_id`) REFERENCES `results` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
