package vn.iotstar.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import vn.iotstar.entity.User;

import java.util.List;
import java.util.Optional;

public interface IUserService {

    List<User> findAll();

    Page<User> findAll(Pageable pageable);

    Optional<User> findById(Integer id);

    Optional<User> findByUsername(String username);

    boolean existsByUsername(String username);

    <S extends User> S save(S entity);

    void deleteById(Integer id);

    long count();

    List<User> search(String keyword);

    Page<User> search(String keyword, Pageable pageable);
}
