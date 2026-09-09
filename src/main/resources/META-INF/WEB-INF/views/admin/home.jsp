<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <head>
        <title>Bảng Điều Khiển</title>
    </head>

    <body>
        <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-2 pb-3 mb-4 border-bottom">
            <h2 class="h3 fw-bold text-dark">Bảng Điều Khiển Quản Trị (Admin Dashboard)</h2>
        </div>

        <div class="row g-4">
            <div class="col-md-6">
                <div class="card border-0 shadow-sm rounded-3 p-3 bg-primary text-white">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div>
                            <h4 class="card-title fw-bold">Quản Lý Category</h4>
                            <p class="card-text mb-3">Xem danh sách, thêm mới, sửa, xóa và tìm kiếm danh mục.</p>
                            <a href="${pageContext.request.contextPath}/admin/categories"
                                class="btn btn-light text-primary fw-semibold">Truy cập ngay &rarr;</a>
                        </div>
                        <i class="fa-solid fa-folder-tree fa-4x opacity-50"></i>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card border-0 shadow-sm rounded-3 p-3 bg-success text-white">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div>
                            <h4 class="card-title fw-bold">Quản Lý User</h4>
                            <p class="card-text mb-3">Xem danh sách người dùng, phân quyền, tìm kiếm tài khoản.</p>
                            <a href="${pageContext.request.contextPath}/admin/users"
                                class="btn btn-light text-success fw-semibold">Truy cập ngay &rarr;</a>
                        </div>
                        <i class="fa-solid fa-users fa-4x opacity-50"></i>
                    </div>
                </div>
            </div>
        </div>
    </body>