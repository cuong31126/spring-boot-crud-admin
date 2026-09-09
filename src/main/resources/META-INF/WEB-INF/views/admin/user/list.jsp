<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<head>
    <title>Quản Lý Người Dùng</title>
</head>
<body>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-2 pb-3 mb-3 border-bottom">
        <h2 class="h3 fw-bold text-dark">
            <i class="fa-solid fa-users text-warning me-2"></i>Quản Lý Người Dùng (User)
        </h2>
        <a href="${pageContext.request.contextPath}/admin/users/add" class="btn btn-warning text-dark fw-semibold shadow-sm">
            <i class="fa-solid fa-user-plus me-1"></i>Thêm Mới Người Dùng
        </a>
    </div>

    <!-- Thông báo kết quả -->
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success alert-dismissible fade show shadow-sm" role="alert">
            <i class="fa-solid fa-circle-check me-2"></i>${successMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger alert-dismissible fade show shadow-sm" role="alert">
            <i class="fa-solid fa-triangle-exclamation me-2"></i>${errorMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <!-- Thanh Tìm Kiếm -->
    <div class="card shadow-sm border-0 mb-4">
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/admin/users" method="get" class="row g-2 align-items-center">
                <div class="col-md-9 col-sm-8">
                    <div class="input-group">
                        <span class="input-group-text bg-white border-end-0"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                        <input type="text" name="keyword" value="${keyword}" class="form-control border-start-0 ps-0" placeholder="Nhập tên đăng nhập (username) hoặc họ tên cần tìm...">
                    </div>
                </div>
                <div class="col-md-3 col-sm-4 d-flex gap-2">
                    <button type="submit" class="btn btn-warning text-dark fw-semibold flex-grow-1">
                        <i class="fa-solid fa-search me-1"></i>Tìm kiếm
                    </button>
                    <c:if test="${not empty keyword}">
                        <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-outline-secondary">
                            <i class="fa-solid fa-rotate-left"></i>
                        </a>
                    </c:if>
                </div>
            </form>
        </div>
    </div>

    <!-- Bảng Dữ Liệu Người Dùng -->
    <div class="card shadow-sm border-0">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-dark">
                        <tr>
                            <th class="text-center" style="width: 70px;">ID</th>
                            <th class="text-center" style="width: 80px;">Avatar</th>
                            <th>Tài Khoản</th>
                            <th>Họ và Tên</th>
                            <th>Email</th>
                            <th>Điện Thoại</th>
                            <th class="text-center" style="width: 130px;">Vai Trò</th>
                            <th class="text-center" style="width: 120px;">Ngày Tạo</th>
                            <th class="text-center" style="width: 150px;">Thao Tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty users}">
                                <c:forEach items="${users}" var="u">
                                    <tr>
                                        <td class="text-center fw-bold text-muted">${u.id}</td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${not empty u.images}">
                                                    <img src="${u.images}" alt="${u.username}" class="rounded-circle shadow-sm border" style="width: 40px; height: 40px; object-fit: cover;" onerror="this.src='https://ui-avatars.com/api/?name=${u.username}&background=random';">
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="rounded-circle bg-secondary text-white d-inline-flex align-items-center justify-content-center fw-bold" style="width: 40px; height: 40px;">
                                                        ${u.username.substring(0, 1).toUpperCase()}
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="fw-bold text-primary">${u.username}</td>
                                        <td class="fw-semibold">${u.fullname}</td>
                                        <td>${u.email}</td>
                                        <td>${u.phone}</td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${u.roleid == 1}">
                                                    <span class="badge bg-danger-subtle text-danger border border-danger-subtle px-2 py-1 rounded-pill">
                                                        <i class="fa-solid fa-shield-halved me-1"></i>Admin
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-info-subtle text-info border border-info-subtle px-2 py-1 rounded-pill">
                                                        <i class="fa-solid fa-user me-1"></i>User
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center text-muted small">
                                            <fmt:formatDate value="${u.createdDate}" pattern="dd/MM/yyyy"/>
                                        </td>
                                        <td class="text-center">
                                            <div class="btn-group btn-group-sm" role="group">
                                                <a href="${pageContext.request.contextPath}/admin/users/edit/${u.id}" class="btn btn-outline-primary" title="Chỉnh sửa">
                                                    <i class="fa-solid fa-user-pen"></i> Sửa
                                                </a>
                                                <a href="${pageContext.request.contextPath}/admin/users/delete/${u.id}" class="btn btn-outline-danger" title="Xóa" onclick="return confirm('Bạn có chắc chắn muốn xóa tài khoản [${u.username}] không?');">
                                                    <i class="fa-solid fa-trash"></i> Xóa
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="9" class="text-center py-5 text-muted">
                                        <i class="fa-solid fa-users-slash fa-3x mb-3 text-secondary opacity-50"></i>
                                        <p class="mb-0">Không tìm thấy người dùng nào phù hợp.</p>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
