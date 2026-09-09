<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<head>
    <title>${isEdit ? 'Chỉnh Sửa Danh Mục' : 'Thêm Mới Danh Mục'}</title>
</head>
<body>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-2 pb-3 mb-3 border-bottom">
        <h2 class="h3 fw-bold text-dark">
            <i class="fa-solid fa-folder-tree text-primary me-2"></i>${isEdit ? 'Chỉnh Sửa Danh Mục' : 'Thêm Mới Danh Mục'}
        </h2>
        <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-outline-secondary">
            <i class="fa-solid fa-arrow-left me-1"></i>Quay lại danh sách
        </a>
    </div>

    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-primary text-white py-3">
                    <h5 class="card-title mb-0 fw-bold">
                        <i class="fa-solid fa-pen-nib me-2"></i>Thông Tin Chi Tiết Danh Mục
                    </h5>
                </div>
                <div class="card-body p-4">
                    <form action="${pageContext.request.contextPath}/admin/categories/save" method="post">
                        <!-- ID ẩn nếu đang ở chế độ chỉnh sửa -->
                        <c:if test="${isEdit}">
                            <input type="hidden" name="categoryId" value="${category.categoryId}"/>
                        </c:if>

                        <!-- Tên danh mục -->
                        <div class="mb-3">
                            <label for="categoryname" class="form-label fw-semibold">
                                Tên Danh Mục <span class="text-danger">*</span>
                            </label>
                            <input type="text" class="form-control" id="categoryname" name="categoryname" 
                                   value="${category.categoryname}" required placeholder="Ví dụ: Lập trình Java, SQL Server...">
                        </div>

                        <!-- Đường dẫn hình ảnh -->
                        <div class="mb-3">
                            <label for="images" class="form-label fw-semibold">Đường dẫn Hình Ảnh / Icon (URL)</label>
                            <input type="text" class="form-control" id="images" name="images" 
                                   value="${category.images}" placeholder="Ví dụ: https://picsum.photos/300/200 hoặc tên file ảnh">
                            <div class="form-text">Có thể dán liên kết ảnh trực tuyến hoặc tên tệp hình ảnh.</div>
                        </div>

                        <!-- Trạng thái -->
                        <div class="mb-4">
                            <label class="form-label fw-semibold d-block">Trạng Thái Hoạt Động</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="status" id="statusActive" value="1" 
                                       ${category.status == 1 ? 'checked' : ''}>
                                <label class="form-check-label text-success fw-semibold" for="statusActive">
                                    <i class="fa-solid fa-circle-check me-1"></i>Hoạt động
                                </label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="status" id="statusInactive" value="0" 
                                       ${category.status == 0 ? 'checked' : ''}>
                                <label class="form-check-label text-secondary fw-semibold" for="statusInactive">
                                    <i class="fa-solid fa-circle-xmark me-1"></i>Khóa / Ngừng
                                </label>
                            </div>
                        </div>

                        <!-- Nút bấm hành động -->
                        <div class="d-flex justify-content-end gap-2 pt-3 border-top">
                            <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-light border px-4">Hủy bỏ</a>
                            <button type="submit" class="btn btn-primary px-4 fw-semibold">
                                <i class="fa-solid fa-floppy-disk me-1"></i>${isEdit ? 'Cập Nhật' : 'Lưu Danh Mục'}
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
