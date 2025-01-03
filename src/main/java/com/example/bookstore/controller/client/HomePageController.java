package com.example.bookstore.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.bookstore.domain.Book;
import com.example.bookstore.service.BookService;

@Controller
public class HomePageController {
    private final BookService bookService;

    public HomePageController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Book> listBooks = this.bookService.getAllBooks();
        model.addAttribute("books", listBooks);
        return "client/homepage/show";
    }

}
