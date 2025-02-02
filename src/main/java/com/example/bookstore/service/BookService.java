package com.example.bookstore.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.example.bookstore.domain.Book;
import com.example.bookstore.domain.Book_;
import com.example.bookstore.domain.Cart;
import com.example.bookstore.domain.CartDetail;
import com.example.bookstore.domain.Order;
import com.example.bookstore.domain.OrderDetail;
import com.example.bookstore.domain.User;
import com.example.bookstore.domain.dto.BookCriteriaDTO;
import com.example.bookstore.repository.BookRepository;
import com.example.bookstore.repository.CartDetailRepository;
import com.example.bookstore.repository.CartRepository;
import com.example.bookstore.repository.OrderDetailRepository;
import com.example.bookstore.repository.OrderRepository;
import com.example.bookstore.service.specification.BookSpecs;

import jakarta.servlet.http.HttpSession;

@Service
public class BookService {
    private final BookRepository bookRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public BookService(BookRepository bookRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService, OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.bookRepository = bookRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Page<Book> getAllBooks(Pageable page) {
        return this.bookRepository.findAll(page);
    }

    public Page<Book> getAllBooksWithSpec(Pageable page, BookCriteriaDTO bookCriteriaDTO) {
        if (bookCriteriaDTO.getCategory() == null
                && bookCriteriaDTO.getPrice() == null) {
            return this.bookRepository.findAll(page);
        }
        Specification<Book> combinedSpec = Specification.where(null);
        if (bookCriteriaDTO.getCategory() != null && bookCriteriaDTO.getCategory().isPresent()) {
            Specification<Book> currentSpecs = BookSpecs.matchListCategory(bookCriteriaDTO.getCategory().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (bookCriteriaDTO.getPrice() != null && bookCriteriaDTO.getPrice().isPresent()) {
            Specification<Book> currentSpecs = this.buildPriceSpecification(bookCriteriaDTO.getPrice().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }

        return this.bookRepository.findAll(combinedSpec, page);
    }

    public Specification<Book> buildPriceSpecification(List<String> price) {
        Specification<Book> combinedSpec = Specification.where(null);

        for (String p : price) {
            double min = 0;
            double max = 0;

            switch (p) {
                case "duoi-100k":
                    min = 1;
                    max = 100000;
                    break;
                case "100-300k":
                    min = 100000;
                    max = 300000;
                    break;
                case "300-600k":
                    min = 300000;
                    max = 600000;
                    break;
                case "600-900k":
                    min = 600000;
                    max = 900000;
                    break;
                case "tren-900k":
                    min = 900000;
                    max = 9000000;
                    break;
            }

            if (min != 0 && max != 0) {
                Specification<Book> rangeSpec = BookSpecs.matchMultiplePrice(min, max);
                combinedSpec = combinedSpec.or(rangeSpec);
            }
        }

        return combinedSpec;
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

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();
            Cart currentCart = cartDetail.getCart();
            // delete cart-detail
            this.cartDetailRepository.deleteById(cartDetailId);

            // update cart
            if (currentCart.getSum() > 1) {
                int s = (int) (currentCart.getSum() - 1);
                currentCart.setSum(s);
                this.cartRepository.save(currentCart);
            } else {
                this.cartRepository.deleteById(currentCart.getId());
            }

        }
    }

}
