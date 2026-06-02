# 🎓 Mini Quiz Web - Hệ thống Ôn luyện & Trắc nghiệm Trực tuyến

[![Java](https://img.shields.io/badge/Java-17-orange.svg)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.x-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![Thymeleaf](https://img.shields.io/badge/Template%20Engine-Thymeleaf-blue.svg)](https://www.thymeleaf.org/)
[![MySQL](https://img.shields.io/badge/Database-MySQL-blue.svg)](https://www.mysql.com/)
[![Bootstrap](https://img.shields.io/badge/Frontend-Bootstrap%205-purple.svg)](https://getbootstrap.com/)

**Mini Quiz Web** là ứng dụng nền tảng Web được xây dựng nhằm cung cấp giải pháp tự học, ôn luyện và làm bài kiểm tra trắc nghiệm trực tuyến. Hệ thống được thiết kế tối ưu với giao diện thân thiện, giúp học viên ôn luyện từ vựng tiếng Anh học thuật và củng cố kiến thức chuyên ngành Công nghệ thông tin một cách hiệu quả.

---

## 📌 Tính Năng Nổi Bật (Key Features)

### 👨‍🎓 1. Phân hệ Học viên (User)
* **Xác thực & Bảo mật:** Đăng ký và đăng nhập hệ thống để quản lý và định danh lịch sử thi của từng cá nhân.
* **Thi trắc nghiệm động:** * Tự động xáo trộn ngẫu nhiên thứ tự câu hỏi trong mỗi lượt thi để đảm bảo tính khách quan.
* **Chấm điểm thời gian thực:** Tự động đối chiếu đáp án và hiển thị điểm số tức thì ngay sau khi nộp bài.
* **Lưu vết và Đánh giá chi tiết:** * Lưu trữ vĩnh viễn lịch sử các bài đã thi cùng điểm số đạt được.
  * Cung cấp giao diện xem lại chi tiết bài làm được bôi màu trực quan (Màu xanh: Đáp án đúng của hệ thống, Màu đỏ: Đáp án sai học viên đã chọn) giúp dễ dàng rút kinh nghiệm.

### 👨‍💻 2. Phân hệ Quản trị viên (Admin)
* **Bảo mật phân quyền:** Kiểm soát luồng truy cập chặt chẽ thông qua phân quyền Admin, chặn hoàn toàn các truy cập trái phép vào không gian quản trị.
* **Quản lý Đề thi:** Cung cấp bảng điều khiển (Dashboard) trực quan để thêm mới, xem danh sách, chỉnh sửa hoặc xóa bỏ các bộ đề thi trong hệ thống.

---

## 🛠 Công nghệ Sử dụng (Tech Stack)

* **Kiến trúc phần mềm:** Mô hình MVC (Model - View - Controller).
* **Backend:** Java 17, Spring Boot 3.2.x, Spring Web.
* **Database & ORM:** MySQL Server, Spring Data JPA, Hibernate ORM.
* **Frontend:** HTML5, CSS3, Bootstrap 5 (thiết kế Responsive) và Thymeleaf Template Engine (Server-Side Rendering).
* **Công cụ phát triển:** Eclipse IDE / IntelliJ IDEA, Maven.

---

## 📊 Kiến trúc Cơ sở Dữ liệu (ERD)

Hệ thống cơ sở dữ liệu được thiết kế chuẩn hóa để lưu vết chi tiết từng thao tác chọn đáp án của người dùng:

```mermaid
erDiagram
    USERS {
        BIGINT id PK 
        VARCHAR username 
        VARCHAR password 
        VARCHAR role 
    }
    QUIZZES {
        BIGINT id PK 
        VARCHAR title 
        TEXT description 
        INT time_limit_minutes 
    }
    QUESTIONS {
        BIGINT id PK 
        BIGINT quiz_id FK 
        TEXT content 
        VARCHAR option_a 
        VARCHAR option_b 
        VARCHAR option_c 
        VARCHAR option_d 
        VARCHAR correct_answer 
    }
    RESULTS {
        BIGINT id PK 
        BIGINT user_id FK 
        BIGINT quiz_id FK 
        INT score 
        DATETIME date_taken 
    }
    USER_ANSWERS {
        BIGINT id PK 
        BIGINT result_id FK 
        BIGINT question_id FK 
        VARCHAR selected_answer 
    }

    QUIZZES ||--o{ QUESTIONS : "bao gồm"
    USERS ||--o{ RESULTS : "thực hiện"
    QUIZZES ||--o{ RESULTS : "được ghi nhận trong"
    RESULTS ||--o{ USER_ANSWERS : "chứa chi tiết"
    QUESTIONS ||--o{ USER_ANSWERS : "được trả lời tại"


## 📸 Hình ảnh Giao diện Thực tế

<p align="center">
  <img src="miniquiz/Screenshot 2026-06-03 002211.png" width="400" alt="Trang chủ" />
  <img src="miniquiz/Screenshot 2026-06-03 002518.png" width="400" alt="Đăng ký tài khoản" />
<img src="miniquiz/Screenshot 2026-06-03 002453.png" width="400" alt="Đăng nhập" />
</p>

<p align="center">
  <img src="miniquiz/Screenshot 2026-06-03 002635.png" width="400" alt="Làm bài thi" />
  <img src="miniquiz/Screenshot 2026-06-03 002755.png" width="400" alt="Lịch sử ôn tập" />
</p>

<p align="center">
  <img src="miniquiz/Screenshot 2026-06-03 002820.png" width="400" alt="Kết quả chi tiết" />
  <img src="miniquiz/Screenshot 2026-06-03 002955.png" width="400" alt="Quản lý đề thi Admin" />
</p>

<p align="center">
  <img src="miniquiz/Screenshot 2026-06-03 003104.png" width="600" alt="Thêm đề thi mới" />
</p>
👨‍💻 Thông tin Tác giả
Sinh viên thực hiện: Nguyễn Gia Khiêm
MSSV: 65131478
lớp: 65CNTT_CLC

Trường đào tạo: Khoa Công nghệ thông tin - Trường Đại học Nha Trang (FIT.NTU)

Khóa đồ án: Năm học 2025 - 2026
