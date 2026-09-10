package vn.iotstar.controller.admin;

import org.springframework.data.domain.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.springframework.util.StringUtils;
import vn.iotstar.entity.Category;
import vn.iotstar.service.ICategoryService;
import java.util.stream.IntStream;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin/categories")
public class CategoryController {

    @Autowired
    private ICategoryService categoryService;

    @GetMapping({ "", "/" })
    public String index() {
        return "redirect:/admin/categories/searchpaginated";
    }

    // 2. Chức năng Danh sách + Tìm kiếm + Phân trang (Search & Paginated)
    @GetMapping("/searchpaginated")
    public String search(ModelMap model,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size) {
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(5); // Mặc định 5 dòng / trang
        // Sắp xếp tăng dần theo categoryname
        Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by("categoryId").ascending());
        Page<Category> resultPage;
        if (StringUtils.hasText(name)) {
            resultPage = categoryService.searchByCategoryname(name.trim(), pageable);
            model.addAttribute("name", name.trim());
        } else {
            resultPage = categoryService.findAll(pageable);
        }
        // Tính toán danh sách số trang [1, 2, 3...] để hiển thị thanh điều hướng
        int totalPages = resultPage.getTotalPages();
        if (totalPages > 0) {
            int start = Math.max(1, currentPage - 2);
            int end = Math.min(currentPage + 2, totalPages);
            if (totalPages > 5) {
                if (end <= 4)
                    end = 5;
                else if (currentPage >= totalPages - 2)
                    start = totalPages - 4;
            }
            List<Integer> pageNumbers = IntStream.rangeClosed(start, end)
                    .boxed()
                    .collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }
        model.addAttribute("categoryPage", resultPage);
        return "admin/categories/searchpaginated";
    }

    // 2. Mở form Thêm mới Category
    @GetMapping("/add")
    public String add(ModelMap model) {
        Category category = new Category();
        category.setStatus(1); // Mặc định hoạt động
        model.addAttribute("category", category);
        model.addAttribute("isEdit", false);
        return "admin/categories/addOrEdit";
    }

    // 3. Mở form Chỉnh sửa Category
    @GetMapping("/edit/{id}")
    public String edit(ModelMap model, @PathVariable("id") Integer id, RedirectAttributes redirect) {
        Optional<Category> opt = categoryService.findById(id);
        if (opt.isPresent()) {
            model.addAttribute("category", opt.get());
            model.addAttribute("isEdit", true);
            return "admin/categories/addOrEdit";
        }
        redirect.addFlashAttribute("errorMessage", "Không tìm thấy danh mục có ID: " + id);
        return "redirect:/admin/categories/searchpaginated";
    }

    // 4. Lưu dữ liệu Thêm mới / Cập nhật
    @PostMapping("/saveOrUpdate")
    public String saveOrUpdate(@ModelAttribute("category") Category category,
            RedirectAttributes redirect) {
        boolean isNew = (category.getCategoryId() == null);
        categoryService.save(category);
        if (isNew) {
            redirect.addFlashAttribute("successMessage", "Thêm mới danh mục thành công!");
        } else {
            redirect.addFlashAttribute("successMessage", "Cập nhật danh mục thành công!");
        }
        return "redirect:/admin/categories/searchpaginated";
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
        return "redirect:/admin/categories/searchpaginated";
    }
}
