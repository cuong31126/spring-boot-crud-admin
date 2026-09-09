package vn.iotstar.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.iotstar.entity.User;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    // Tìm kiếm User theo Username hoặc Fullname
    List<User> findByUsernameContainingIgnoreCaseOrFullnameContainingIgnoreCase(String username, String fullname);

    // Tìm kiếm phân trang
    Page<User> findByUsernameContainingIgnoreCaseOrFullnameContainingIgnoreCase(String username, String fullname, Pageable pageable);

    // Tìm kiếm theo username chính xác
    Optional<User> findByUsername(String username);

    // Kiểm tra username đã tồn tại chưa
    boolean existsByUsername(String username);
}
