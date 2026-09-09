<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property='title'/> - Quản Trị Hệ Thống</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body { min-height: 100vh; background-color: #f8f9fa; }
        .sidebar { min-height: calc(100vh - 56px); }
        .sidebar .nav-link { color: #cfd8dc; font-weight: 500; padding: 12px 20px; border-radius: 8px; margin: 4px 8px; }
        .sidebar .nav-link:hover, .sidebar .nav-link.active { background-color: #37474f; color: #ffffff; }
    </style>
    <sitemesh:write property='head'/>
</head>
<body>
    <!-- Admin Navbar -->
    <nav class="navbar navbar-dark bg-dark sticky-top shadow-sm px-3">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/admin/home">
            <i class="fa-solid fa-shield-halved text-warning me-2"></i>ADMIN DASHBOARD
        </a>
        <div class="d-flex align-items-center">
            <a href="${pageContext.request.contextPath}/" class="btn btn-outline-light btn-sm me-3">
                <i class="fa-solid fa-globe me-1"></i>Xem Website
            </a>
            <span class="text-white small me-2"><i class="fa-solid fa-user-circle me-1"></i>Quản trị viên</span>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 d-md-block bg-dark sidebar collapse p-0">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/home">
                                <i class="fa-solid fa-chart-line me-2"></i>Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/categories">
                                <i class="fa-solid fa-folder-tree me-2 text-info"></i>Quản lý Category
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/users">
                                <i class="fa-solid fa-users me-2 text-warning"></i>Quản lý User
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!-- Main Admin Content Area -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
                <sitemesh:write property='body'/>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
