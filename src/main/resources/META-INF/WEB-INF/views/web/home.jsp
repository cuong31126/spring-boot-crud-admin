<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <title>Trang Chủ</title>
</head>
<body>
    <div class="p-5 mb-4 bg-white rounded-3 shadow-sm text-center border">
        <h1 class="display-5 fw-bold text-primary">Chào Mừng Đến Với Ứng Dụng Web Spring Boot 3</h1>
        <p class="lead text-muted mt-3">Hệ thống hỗ trợ quản lý danh mục (Category) và người dùng (User) với đầy đủ chức năng CRUD và Tìm kiếm.</p>
        <div class="mt-4">
            <a href="${pageContext.request.contextPath}/admin/home" class="btn btn-primary btn-lg px-4 me-2">
                <i class="fa-solid fa-lock me-1"></i>Trang Quản Trị Admin
            </a>
            <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-outline-secondary btn-lg px-4">
                <i class="fa-solid fa-list me-1"></i>Xem Danh Mục
            </a>
        </div>
    </div>
</body>
