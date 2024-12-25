package com.example.bookstore.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.bookstore.domain.Book;
import com.example.bookstore.service.BookService;

@Controller
public class BookController {
    private final BookService bookService;

    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/admin/book")
    public String getShowBookPage(Model model) {
        List<Book> books = this.bookService.getAllBooks();
        model.addAttribute("books", books);
        return "admin/book/show";
    }

}
