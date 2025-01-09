package com.example.bookstore.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.bookstore.domain.Book;
import com.example.bookstore.domain.Cart;
import com.example.bookstore.domain.CartDetail;
import com.example.bookstore.domain.User;
import com.example.bookstore.repository.BookRepository;
import com.example.bookstore.repository.CartDetailRepository;
import com.example.bookstore.repository.CartRepository;

@Service
public class BookService {
    private final BookRepository bookRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;

    public BookService(BookRepository bookRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService) {
        this.bookRepository = bookRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
    }

    public List<Book> getAllBooks() {
        return this.bookRepository.findAll();
    }

    public Optional<Book> getBookById(Long id) {
        return this.bookRepository.findById(id);
    }

    public Book createBook(Book book) {
        return this.bookRepository.save(book);
    }

    public void deleteBook(long id) {
        this.bookRepository.deleteById(id);
    }

    public void handleAddBookToCart(String email, long bookId) {

        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            // check user da co gio hang chua, neu chua thi tao moi
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                // tao cart moi
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);

                cart = this.cartRepository.save(otherCart);
            }

            // luu cartDetail
            // tim book
            Optional<Book> bookOptional = this.bookRepository.findById(bookId);
            if (bookOptional.isPresent()) {
                Book book = bookOptional.get();

                // check sản phẩm đã từng được thêm vào giỏ hàng chưa
                CartDetail oldDetail = this.cartDetailRepository.findByCartAndBook(cart, book);

                //
                if (oldDetail == null) {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setBook(book);
                    cartDetail.setQuantity(1);
                    cartDetail.setPrice(book.getPrice());

                    this.cartDetailRepository.save(cartDetail);

                    // update cart(sum)
                    cart.setSum(cart.getSum() + 1);
                    this.cartRepository.save(cart);
                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + 1);
                    this.cartDetailRepository.save(oldDetail);
                }

            }

        }

    }
}
