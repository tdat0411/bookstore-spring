package com.example.bookstore.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.bookstore.domain.Book;
import com.example.bookstore.domain.User;
import com.example.bookstore.service.BookService;
import com.example.bookstore.service.UploadService;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class BookController {
    private final UploadService uploadService;
    private final BookService bookService;

    public BookController(BookService bookService, UploadService uploadService) {
        this.bookService = bookService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/book")
    public String getShowBookPage(Model model) {
        List<Book> books = this.bookService.getAllBooks();
        model.addAttribute("books", books);
        return "admin/book/show";
    }

    @GetMapping("/admin/book/create")
    public String getCreateBookPage(Model model) {
        model.addAttribute("newBook", new Book());
        return "admin/book/create";
    }

    @PostMapping("/admin/book/create")
    public String postCreateBookPage(Model model, @RequestParam("datFile") MultipartFile file,
            @ModelAttribute("newBook") Book book) {
        // upload image
        String image = this.uploadService.handleSaveUploadFile(file, "book");
        book.setImage(image);

        this.bookService.createBook(book);

        return "redirect:/admin/book";
    }

    @GetMapping("/admin/book/{id}")
    public String getViewBookPage(Model model, @PathVariable Long id) {
        Book book = this.bookService.getBookById(id).get();
        model.addAttribute("book", book);
        model.addAttribute("id", id);
        return "/admin/book/view";
    }

    @GetMapping("/admin/book/delete/{id}")
    public String getDeleteBookPage(Model model, @PathVariable Long id) {
        model.addAttribute("newBook", new Book());
        model.addAttribute("id", id);
        return "admin/book/delete";
    }

    @PostMapping("/admin/book/delete")
    public String postDeleteBookPage(Model model, @ModelAttribute("newBook") Book book) {
        this.bookService.deleteBook(book.getId());
        return "redirect:/admin/book";
    }

    @GetMapping("/admin/book/update/{id}")
    public String getUpdateBookPage(Model model, @PathVariable Long id) {
        Optional<Book> book = this.bookService.getBookById(id);
        model.addAttribute("newBook", book);
        return "admin/book/update";
    }

    @PostMapping("/admin/book/update")
    public String postUpdateBookPage(Model model, @ModelAttribute("newBook") Book book) {
        Book currentBook = this.bookService.getBookById(book.getId()).get();
        if (currentBook != null) {
            currentBook.setPrice(book.getPrice());
            currentBook.setQuantity(book.getQuantity());
            this.bookService.createBook(currentBook);
        }
        return "redirect:/admin/book";
    }

}
