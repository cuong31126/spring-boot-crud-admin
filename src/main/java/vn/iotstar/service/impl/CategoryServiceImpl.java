package vn.iotstar.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import vn.iotstar.entity.Category;
import vn.iotstar.repository.CategoryRepository;
import vn.iotstar.service.ICategoryService;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImpl implements ICategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    @Override
    public Page<Category> findAll(Pageable pageable) {
        return categoryRepository.findAll(pageable);
    }

    @Override
    public Optional<Category> findById(Integer id) {
        return categoryRepository.findById(id);
    }

    @Override
    public <S extends Category> S save(S entity) {
        return categoryRepository.save(entity);
    }

    @Override
    public void deleteById(Integer id) {
        categoryRepository.deleteById(id);
    }

    @Override
    public long count() {
        return categoryRepository.count();
    }

    @Override
    public List<Category> searchByCategoryname(String keyword) {
        if (keyword != null && !keyword.trim().isEmpty()) {
            return categoryRepository.findByCategorynameContainingIgnoreCase(keyword.trim());
        }
        return categoryRepository.findAll();
    }

    @Override
    public Page<Category> searchByCategoryname(String keyword, Pageable pageable) {
        if (keyword != null && !keyword.trim().isEmpty()) {
            return categoryRepository.findByCategorynameContainingIgnoreCase(keyword.trim(), pageable);
        }
        return categoryRepository.findAll(pageable);
    }
}
