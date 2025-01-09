package com.example.bookstore.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.bookstore.domain.Book;
import com.example.bookstore.domain.Cart;
import com.example.bookstore.domain.CartDetail;
import com.example.bookstore.domain.User;
import com.example.bookstore.service.BookService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ItemController {
    private final BookService bookService;

    public ItemController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User user = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        user.setId(id);

        Cart cart = this.bookService.fetchByUser(user);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/show";
    }

    @GetMapping("/product")
    public String getProductPage(Model model) {
        List<Book> listBooks = this.bookService.getAllBooks();
        model.addAttribute("books", listBooks);
        return "client/book/show";
    }

    @PostMapping("/add-book-to-cart/{id}")
    public String addBookToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        long bookId = id;
        String email = (String) session.getAttribute("email");

        this.bookService.handleAddBookToCart(email, bookId);

        return "redirect:/";
    }

}
