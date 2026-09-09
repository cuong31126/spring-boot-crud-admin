package vn.iotstar.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.iotstar.entity.Category;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

    // Tìm kiếm theo tên không phân biệt hoa thường
    List<Category> findByCategorynameContainingIgnoreCase(String categoryname);

    // Tìm kiếm phân trang theo tên
    Page<Category> findByCategorynameContainingIgnoreCase(String categoryname, Pageable pageable);
}
