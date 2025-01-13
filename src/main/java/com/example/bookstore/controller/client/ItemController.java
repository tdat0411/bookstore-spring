package com.example.bookstore.controller.client;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.bookstore.domain.Book;
import com.example.bookstore.domain.Book_;
import com.example.bookstore.domain.Cart;
import com.example.bookstore.domain.CartDetail;
import com.example.bookstore.domain.User;
import com.example.bookstore.domain.dto.BookCriteriaDTO;
import com.example.bookstore.service.BookService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;

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
    public String getProductPage(Model model, BookCriteriaDTO bookCriteriaDTO, HttpServletRequest request) {
        int page = 1;
        try {
            if (bookCriteriaDTO.getPage().isPresent()) {
                // Chuyển từ String sang int
                page = Integer.parseInt(bookCriteriaDTO.getPage().get());
            } else {
                // page = 1
            }
        } catch (Exception e) {
            // TODO: handle exception
        }

        // check sort
        Pageable pageable = PageRequest.of(page - 1, 10);
        if (bookCriteriaDTO.getSort() != null && bookCriteriaDTO.getSort().isPresent()) {
            String sort = bookCriteriaDTO.getSort().get();
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Book_.PRICE).ascending());
            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Book_.PRICE).descending());
            }
        }

        Page<Book> listBooks = this.bookService.getAllBooksWithSpec(pageable, bookCriteriaDTO);
        List<Book> books = listBooks.getContent().size() > 0 ? listBooks.getContent() : new ArrayList<Book>();

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            // remove page
            qs = qs.replace("page=" + page, "");
        }

        model.addAttribute("books", books);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", listBooks.getTotalPages());
        model.addAttribute("querryString", qs);
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

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartProduct(Model model, @PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.bookService.handleRemoveCartDetail(cartDetailId, session);
        return "redirect:/cart";
    }

}
