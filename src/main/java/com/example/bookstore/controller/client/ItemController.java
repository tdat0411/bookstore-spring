package com.example.bookstore.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.bookstore.domain.Book;
import com.example.bookstore.service.BookService;

@Controller
public class ItemController {
    private final BookService bookService;

    public ItemController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/cart")
    public String getCartPage(Model model) {
        return "client/cart/show";
    }

    @GetMapping("/product")
    public String getProductPage(Model model) {
        List<Book> listBooks = this.bookService.getAllBooks();
        model.addAttribute("books", listBooks);
        return "client/book/show";
    }

}
