package vn.iotstar.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import vn.iotstar.entity.Category;

import java.util.List;
import java.util.Optional;

public interface ICategoryService {

    List<Category> findAll();

    Page<Category> findAll(Pageable pageable);

    Optional<Category> findById(Integer id);

    <S extends Category> S save(S entity);

    void deleteById(Integer id);

    long count();

    List<Category> searchByCategoryname(String keyword);

    Page<Category> searchByCategoryname(String keyword, Pageable pageable);
}
