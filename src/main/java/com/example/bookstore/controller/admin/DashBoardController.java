package com.example.bookstore.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.bookstore.service.UserService;

@Controller
public class DashBoardController {

    private final UserService userService;

    public DashBoardController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String getDashBoardPage(Model model) {
        model.addAttribute("countUsers", this.userService.countUsers());
        model.addAttribute("countBooks", this.userService.countBooks());
        return "admin/dashboard/show";
    }

}
