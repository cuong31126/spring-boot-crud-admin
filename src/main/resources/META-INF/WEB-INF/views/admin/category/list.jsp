<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<head>
    <title>Quản Lý Category</title>
</head>
<body>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-2 pb-3 mb-3 border-bottom">
        <h2 class="h3 fw-bold text-dark">
            <i class="fa-solid fa-folder-tree text-primary me-2"></i>Quản Lý Danh Mục (Category)
        </h2>
        <a href="${pageContext.request.contextPath}/admin/categories/add" class="btn btn-primary shadow-sm">
            <i class="fa-solid fa-circle-plus me-1"></i>Thêm Mới Danh Mục
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
            <form action="${pageContext.request.contextPath}/admin/categories" method="get" class="row g-2 align-items-center">
                <div class="col-md-9 col-sm-8">
                    <div class="input-group">
                        <span class="input-group-text bg-white border-end-0"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                        <input type="text" name="keyword" value="${keyword}" class="form-control border-start-0 ps-0" placeholder="Nhập tên danh mục cần tìm kiếm...">
                    </div>
                </div>
                <div class="col-md-3 col-sm-4 d-flex gap-2">
                    <button type="submit" class="btn btn-primary flex-grow-1">
                        <i class="fa-solid fa-search me-1"></i>Tìm kiếm
                    </button>
                    <c:if test="${not empty keyword}">
                        <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-outline-secondary">
                            <i class="fa-solid fa-rotate-left"></i>
                        </a>
                    </c:if>
                </div>
            </form>
        </div>
    </div>

    <!-- Bảng Dữ Liệu Danh Mục -->
    <div class="card shadow-sm border-0">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-dark">
                        <tr>
                            <th class="text-center" style="width: 80px;">ID</th>
                            <th>Tên Danh Mục</th>
                            <th class="text-center" style="width: 150px;">Hình Ảnh</th>
                            <th class="text-center" style="width: 140px;">Trạng Thái</th>
                            <th class="text-center" style="width: 160px;">Thao Tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty categories}">
                                <c:forEach items="${categories}" var="item">
                                    <tr>
                                        <td class="text-center fw-bold text-muted">${item.categoryId}</td>
                                        <td class="fw-semibold text-dark">${item.categoryname}</td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${not empty item.images}">
                                                    <img src="${item.images}" alt="${item.categoryname}" class="rounded shadow-sm border" style="width: 60px; height: 40px; object-fit: cover;" onerror="this.src='https://via.placeholder.com/60x40?text=No+Image';">
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-light text-secondary border">Chưa có ảnh</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${item.status == 1}">
                                                    <span class="badge bg-success-subtle text-success border border-success-subtle px-2 py-1 rounded-pill">
                                                        <i class="fa-solid fa-circle-dot me-1"></i>Hoạt động
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-secondary-subtle text-secondary border border-secondary-subtle px-2 py-1 rounded-pill">
                                                        <i class="fa-solid fa-lock me-1"></i>Khóa
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center">
                                            <div class="btn-group btn-group-sm" role="group">
                                                <a href="${pageContext.request.contextPath}/admin/categories/edit/${item.categoryId}" class="btn btn-outline-primary" title="Chỉnh sửa">
                                                    <i class="fa-solid fa-pen-to-square"></i> Sửa
                                                </a>
                                                <a href="${pageContext.request.contextPath}/admin/categories/delete/${item.categoryId}" class="btn btn-outline-danger" title="Xóa" onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục [${item.categoryname}] không?');">
                                                    <i class="fa-solid fa-trash"></i> Xóa
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="5" class="text-center py-5 text-muted">
                                        <i class="fa-solid fa-inbox fa-3x mb-3 text-secondary opacity-50"></i>
                                        <p class="mb-0">Không tìm thấy danh mục nào phù hợp.</p>
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
