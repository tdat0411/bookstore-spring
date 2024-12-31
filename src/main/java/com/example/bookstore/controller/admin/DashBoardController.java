package com.example.bookstore.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashBoardController {

    @GetMapping("/admin")
    public String getDashBoardPage(Model model) {

        return "admin/dashboard/show";
    }

}
