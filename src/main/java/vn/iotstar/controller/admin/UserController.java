package vn.iotstar.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.iotstar.entity.User;
import vn.iotstar.service.IUserService;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/users")
public class UserController {

    @Autowired
    private IUserService userService;

    // 1. Hiển thị danh sách và Tìm kiếm User
    @GetMapping({"", "/"})
    public String list(ModelMap model,
                       @RequestParam(name = "keyword", required = false) String keyword) {
        List<User> list;
        if (keyword != null && !keyword.trim().isEmpty()) {
            list = userService.search(keyword.trim());
            model.addAttribute("keyword", keyword.trim());
        } else {
            list = userService.findAll();
        }
        model.addAttribute("users", list);
        return "admin/user/list";
    }

    // 2. Mở form Thêm mới User
    @GetMapping("/add")
    public String add(ModelMap model) {
        User user = new User();
        user.setRoleid(2); // Mặc định là User thường (roleid = 2)
        model.addAttribute("user", user);
        model.addAttribute("isEdit", false);
        return "admin/user/form";
    }

    // 3. Mở form Chỉnh sửa User
    @GetMapping("/edit/{id}")
    public String edit(ModelMap model, @PathVariable("id") Integer id, RedirectAttributes redirect) {
        Optional<User> opt = userService.findById(id);
        if (opt.isPresent()) {
            model.addAttribute("user", opt.get());
            model.addAttribute("isEdit", true);
            return "admin/user/form";
        }
        redirect.addFlashAttribute("errorMessage", "Không tìm thấy người dùng có ID: " + id);
        return "redirect:/admin/users";
    }

    // 4. Lưu dữ liệu Thêm mới / Cập nhật
    @PostMapping("/save")
    public String saveOrUpdate(@ModelAttribute("user") User user,
                               RedirectAttributes redirect) {
        boolean isNew = (user.getId() == null);
        if (isNew) {
            // Kiểm tra trùng username
            if (userService.existsByUsername(user.getUsername())) {
                redirect.addFlashAttribute("errorMessage", "Tên đăng nhập [" + user.getUsername() + "] đã tồn tại!");
                return "redirect:/admin/users/add";
            }
            user.setCreatedDate(new Date());
            userService.save(user);
            redirect.addFlashAttribute("successMessage", "Thêm mới người dùng thành công!");
        } else {
            // Trường hợp cập nhật
            Optional<User> existing = userService.findById(user.getId());
            if (existing.isPresent()) {
                User oldUser = existing.get();
                // Giữ lại ngày tạo ban đầu nếu không đổi
                if (user.getCreatedDate() == null) {
                    user.setCreatedDate(oldUser.getCreatedDate());
                }
                // Nếu người dùng không nhập mật khẩu mới thì giữ lại mật khẩu cũ
                if (user.getPassword() == null || user.getPassword().trim().isEmpty()) {
                    user.setPassword(oldUser.getPassword());
                }
                userService.save(user);
                redirect.addFlashAttribute("successMessage", "Cập nhật người dùng thành công!");
            } else {
                redirect.addFlashAttribute("errorMessage", "Không tìm thấy người dùng để cập nhật!");
            }
        }
        return "redirect:/admin/users";
    }

    // 5. Xóa User
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id, RedirectAttributes redirect) {
        try {
            userService.deleteById(id);
            redirect.addFlashAttribute("successMessage", "Xóa người dùng thành công!");
        } catch (Exception e) {
            redirect.addFlashAttribute("errorMessage", "Không thể xóa người dùng này (có thể do ràng buộc dữ liệu)!");
        }
        return "redirect:/admin/users";
    }
}
