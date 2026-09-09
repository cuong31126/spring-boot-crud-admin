# HƯỚNG DẪN DỰ ÁN SPRING BOOT 3 + JSP/JSTL + SITEMESH 3 + SQL SERVER

Dự án này được thiết kế và chuẩn hóa để hoạt động hoàn hảo trên cả **Spring Tool Suite (STS)** và **Antigravity IDE**, thực hiện chức năng CRUD Role Admin cho 2 bảng **Category** và **User** kèm tìm kiếm.

---

## 1. Cấu trúc thư mục dự án
```
spring1/
├── pom.xml
├── prompt.txt                       <-- Quy trình Chain Prompt 2 bước phát triển từng module
├── README.md                        <-- Tài liệu hướng dẫn chi tiết
├── .gitignore
├── src/main/java/vn/iotstar/
│   ├── Spring1Application.java      <-- Class chính cấu hình Filter & khởi động
│   ├── configs/
│   │   ├── JSPStaticResourceConfigurer.java  <-- Hỗ trợ nạp JSP từ thư mục META-INF
│   │   ├── TomcatJSPConfiguration.java       <-- Nạp WebServerFactoryCustomizer
│   │   └── CustomSiteMeshFilter.java         <-- Cấu hình layout SiteMesh 3
│   ├── entity/
│   │   ├── Category.java            <-- Ánh xạ bảng categories
│   │   └── User.java                <-- Ánh xạ bảng users
│   ├── repository/
│   │   ├── CategoryRepository.java  <-- Truy vấn Category & Tìm kiếm theo tên
│   │   └── UserRepository.java      <-- Truy vấn User & Tìm kiếm theo username/fullname
│   ├── service/
│   │   ├── ICategoryService.java & impl/CategoryServiceImpl.java
│   │   └── IUserService.java & impl/UserServiceImpl.java
│   └── controller/
│       ├── HomeController.java      <-- Điều hướng trang chủ Web ("/")
│       └── admin/
│           ├── AdminHomeController.java <-- Dashboard Admin ("/admin/home")
│           ├── CategoryController.java  <-- CRUD Category & Search ("/admin/categories")
│           └── UserController.java      <-- CRUD User & Search ("/admin/users")
└── src/main/resources/
    ├── application.properties       <-- Cấu hình Port, ViewResolver, SQL Server
    └── META-INF/
        ├── commons/                 <-- Thư mục chứa các thành phần dùng chung
        └── WEB-INF/
            ├── decorators/
            │   ├── admin.jsp        <-- Layout Admin (Header, Sidebar, Content, Footer)
            │   ├── login.jsp        <-- Layout Login
            │   └── web.jsp          <-- Layout Web người dùng
            └── views/
                ├── admin/
                │   ├── home.jsp     <-- Trang Dashboard
                │   ├── category/
                │   │   ├── list.jsp <-- Danh sách Category + Tìm kiếm
                │   │   └── form.jsp <-- Form thêm mới/cập nhật Category
                │   └── user/
                │       ├── list.jsp <-- Danh sách User + Tìm kiếm
                │       └── form.jsp <-- Form thêm mới/cập nhật User
                └── web/
                    └── home.jsp     <-- Trang chủ Web
```

---

## 2. Hướng dẫn cấu hình từng bước

### Bước 1: Kiểm tra CSDL SQL Server
- Cơ sở dữ liệu sử dụng: `LTWEB3`
- Tài khoản đăng nhập: `sa` / Mật khẩu: `123`
- Host: `localhost:1433` (hoặc `localhost\SQLEXPRESS`)
- Hai bảng đã có sẵn cấu trúc: `categories` và `users`.

### Bước 2: Cấu hình `application.properties`
Đảm bảo các thuộc tính sau đã được cấu hình trong `src/main/resources/application.properties`:
```properties
server.port=8090
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
spring.mvc.static-path-pattern=/static/**

server.servlet.encoding.charset=UTF-8
server.servlet.encoding.force=true
server.servlet.encoding.enabled=true

spring.datasource.url=jdbc:sqlserver://localhost:1433;databaseName=LTWEB3;encrypt=true;trustServerCertificate=true
spring.datasource.username=sa
spring.datasource.password=123
spring.datasource.driver-class-name=com.microsoft.sqlserver.jdbc.SQLServerDriver

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
```

### Bước 3: Cách chạy dự án trên STS (Spring Tool Suite)
1. Mở STS -> Chọn Menu **File** -> **Import...**
2. Chọn **Maven** -> **Existing Maven Projects** -> Nhấn **Next**.
3. Tại mục **Root Directory**, nhấn Browse đến thư mục:
   `D:\CauHinh_Java\workspace_sts\luyentap\spring1`
4. Nhấn **Finish** và đợi STS tải thư viện Maven.
5. Click chuột phải vào Project `spring1` -> **Run As** -> **Spring Boot App**.

### Bước 4: Cách chạy dự án trên Antigravity / Terminal
1. Mở Terminal tại thư mục `spring1`.
2. Chạy lệnh:
   ```bash
   mvn spring-boot:run
   ```
3. Truy cập trình duyệt:
   - Trang chủ người dùng: `http://localhost:8090/`
   - Quản trị danh mục: `http://localhost:8090/admin/categories`
   - Quản trị người dùng: `http://localhost:8090/admin/users`

---

## 3. Quy trình Commit & Đẩy lên GitHub

```bash
git init
git add .
git commit -m "feat: hoàn thiện ứng dụng Spring Boot 3 CRUD Category và User với JSP SiteMesh 3"
git branch -M main
# Tạo repo mới trên GitHub: https://github.com/new đặt tên ví dụ: spring-boot-crud-admin
git remote add origin https://github.com/cuong31126/spring-boot-crud-admin.git
git push -u origin main
```

## 4. Nộp bài lên UtexLMS
1. Đăng nhập vào trang: [https://utex.hcmute.edu.vn](https://utex.hcmute.edu.vn) (hoặc `lms.hcmute.edu.vn`).
2. Vào môn học Java Web / Công nghệ Java -> Chọn bài tập tương ứng.
3. Dán link GitHub: `https://github.com/cuong31126/spring-boot-crud-admin` vào ô nộp bài trực tuyến (Online text / Website URL) và nhấn **Save changes / Submit**.
