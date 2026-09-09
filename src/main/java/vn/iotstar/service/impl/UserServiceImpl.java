package vn.iotstar.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import vn.iotstar.entity.User;
import vn.iotstar.repository.UserRepository;
import vn.iotstar.service.IUserService;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public Page<User> findAll(Pageable pageable) {
        return userRepository.findAll(pageable);
    }

    @Override
    public Optional<User> findById(Integer id) {
        return userRepository.findById(id);
    }

    @Override
    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public boolean existsByUsername(String username) {
        return userRepository.existsByUsername(username);
    }

    @Override
    public <S extends User> S save(S entity) {
        return userRepository.save(entity);
    }

    @Override
    public void deleteById(Integer id) {
        userRepository.deleteById(id);
    }

    @Override
    public long count() {
        return userRepository.count();
    }

    @Override
    public List<User> search(String keyword) {
        if (keyword != null && !keyword.trim().isEmpty()) {
            String kw = keyword.trim();
            return userRepository.findByUsernameContainingIgnoreCaseOrFullnameContainingIgnoreCase(kw, kw);
        }
        return userRepository.findAll();
    }

    @Override
    public Page<User> search(String keyword, Pageable pageable) {
        if (keyword != null && !keyword.trim().isEmpty()) {
            String kw = keyword.trim();
            return userRepository.findByUsernameContainingIgnoreCaseOrFullnameContainingIgnoreCase(kw, kw, pageable);
        }
        return userRepository.findAll(pageable);
    }
}
