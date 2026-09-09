<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<head>
    <title>${isEdit ? 'Chỉnh Sửa Người Dùng' : 'Thêm Mới Người Dùng'}</title>
</head>
<body>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-2 pb-3 mb-3 border-bottom">
        <h2 class="h3 fw-bold text-dark">
            <i class="fa-solid fa-users text-warning me-2"></i>${isEdit ? 'Chỉnh Sửa Người Dùng' : 'Thêm Mới Người Dùng'}
        </h2>
        <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-outline-secondary">
            <i class="fa-solid fa-arrow-left me-1"></i>Quay lại danh sách
        </a>
    </div>

    <!-- Thông báo lỗi nếu có -->
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger alert-dismissible fade show shadow-sm" role="alert">
            <i class="fa-solid fa-triangle-exclamation me-2"></i>${errorMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-dark text-white py-3">
                    <h5 class="card-title mb-0 fw-bold">
                        <i class="fa-solid fa-id-card me-2 text-warning"></i>Thông Tin Tài Khoản Người Dùng
                    </h5>
                </div>
                <div class="card-body p-4">
                    <form action="${pageContext.request.contextPath}/admin/users/save" method="post">
                        <!-- ID ẩn nếu đang sửa -->
                        <c:if test="${isEdit}">
                            <input type="hidden" name="id" value="${user.id}"/>
                        </c:if>

                        <div class="row g-3">
                            <!-- Username -->
                            <div class="col-md-6">
                                <label for="username" class="form-label fw-semibold">
                                    Tên Đăng Nhập (Username) <span class="text-danger">*</span>
                                </label>
                                <input type="text" class="form-control" id="username" name="username" 
                                       value="${user.username}" required ${isEdit ? 'readonly' : ''} 
                                       placeholder="Ví dụ: cuong31126, nguyenvana...">
                                <c:if test="${isEdit}">
                                    <div class="form-text">Tên đăng nhập không được phép thay đổi.</div>
                                </c:if>
                            </div>

                            <!-- Password -->
                            <div class="col-md-6">
                                <label for="password" class="form-label fw-semibold">
                                    Mật Khẩu <span class="text-danger">${isEdit ? '' : '*'}</span>
                                </label>
                                <input type="password" class="form-control" id="password" name="password" 
                                       placeholder="${isEdit ? 'Để trống nếu không đổi mật khẩu' : 'Nhập mật khẩu...'}">
                            </div>

                            <!-- Fullname -->
                            <div class="col-md-6">
                                <label for="fullname" class="form-label fw-semibold">Họ và Tên</label>
                                <input type="text" class="form-control" id="fullname" name="fullname" 
                                       value="${user.fullname}" placeholder="Ví dụ: Lê Quốc Cường">
                            </div>

                            <!-- Email -->
                            <div class="col-md-6">
                                <label for="email" class="form-label fw-semibold">Địa chỉ Email</label>
                                <input type="email" class="form-control" id="email" name="email" 
                                       value="${user.email}" placeholder="example@domain.com">
                            </div>

                            <!-- Phone -->
                            <div class="col-md-6">
                                <label for="phone" class="form-label fw-semibold">Số Điện Thoại</label>
                                <input type="text" class="form-control" id="phone" name="phone" 
                                       value="${user.phone}" placeholder="0901234567">
                            </div>

                            <!-- Role -->
                            <div class="col-md-6">
                                <label for="roleid" class="form-label fw-semibold">Vai Trò (Role)</label>
                                <select class="form-select" id="roleid" name="roleid">
                                    <option value="1" ${user.roleid == 1 ? 'selected' : ''}>Quản trị viên (Admin - Role 1)</option>
                                    <option value="2" ${user.roleid == 2 ? 'selected' : ''}>Người dùng (User - Role 2)</option>
                                </select>
                            </div>

                            <!-- Avatar / Image -->
                            <div class="col-12">
                                <label for="images" class="form-label fw-semibold">Đường dẫn Avatar / Hình ảnh</label>
                                <input type="text" class="form-control" id="images" name="images" 
                                       value="${user.images}" placeholder="Ví dụ: avatar_1.jpg hoặc link URL ảnh...">
                            </div>
                        </div>

                        <!-- Nút bấm hành động -->
                        <div class="d-flex justify-content-end gap-2 pt-4 mt-4 border-top">
                            <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-light border px-4">Hủy bỏ</a>
                            <button type="submit" class="btn btn-warning text-dark px-4 fw-semibold">
                                <i class="fa-solid fa-floppy-disk me-1"></i>${isEdit ? 'Cập Nhật' : 'Lưu Người Dùng'}
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
