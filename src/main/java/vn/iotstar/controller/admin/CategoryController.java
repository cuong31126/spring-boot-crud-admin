package vn.iotstar.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.iotstar.entity.Category;
import vn.iotstar.service.ICategoryService;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/categories")
public class CategoryController {

    @Autowired
    private ICategoryService categoryService;

    // 1. Hiển thị danh sách và Tìm kiếm Category
    @GetMapping({"", "/"})
    public String list(ModelMap model,
                       @RequestParam(name = "keyword", required = false) String keyword) {
        List<Category> list;
        if (keyword != null && !keyword.trim().isEmpty()) {
            list = categoryService.searchByCategoryname(keyword.trim());
            model.addAttribute("keyword", keyword.trim());
        } else {
            list = categoryService.findAll();
        }
        model.addAttribute("categories", list);
        return "admin/category/list";
    }

    // 2. Mở form Thêm mới Category
    @GetMapping("/add")
    public String add(ModelMap model) {
        Category category = new Category();
        category.setStatus(1); // Mặc định hoạt động
        model.addAttribute("category", category);
        model.addAttribute("isEdit", false);
        return "admin/category/form";
    }

    // 3. Mở form Chỉnh sửa Category
    @GetMapping("/edit/{id}")
    public String edit(ModelMap model, @PathVariable("id") Integer id, RedirectAttributes redirect) {
        Optional<Category> opt = categoryService.findById(id);
        if (opt.isPresent()) {
            model.addAttribute("category", opt.get());
            model.addAttribute("isEdit", true);
            return "admin/category/form";
        }
        redirect.addFlashAttribute("errorMessage", "Không tìm thấy danh mục có ID: " + id);
        return "redirect:/admin/categories";
    }

    // 4. Lưu dữ liệu Thêm mới / Cập nhật
    @PostMapping("/save")
    public String saveOrUpdate(@ModelAttribute("category") Category category,
                               RedirectAttributes redirect) {
        boolean isNew = (category.getCategoryId() == null);
        categoryService.save(category);
        if (isNew) {
            redirect.addFlashAttribute("successMessage", "Thêm mới danh mục thành công!");
        } else {
            redirect.addFlashAttribute("successMessage", "Cập nhật danh mục thành công!");
        }
        return "redirect:/admin/categories";
    }

    // 5. Xóa Category
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id, RedirectAttributes redirect) {
        try {
            categoryService.deleteById(id);
            redirect.addFlashAttribute("successMessage", "Xóa danh mục thành công!");
        } catch (Exception e) {
            redirect.addFlashAttribute("errorMessage", "Không thể xóa danh mục này (có thể do ràng buộc dữ liệu)!");
        }
        return "redirect:/admin/categories";
    }
}
