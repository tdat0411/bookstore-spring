package com.example.bookstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.bookstore.domain.Book;
import com.example.bookstore.domain.Cart;
import com.example.bookstore.domain.CartDetail;
import java.util.List;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    // kiểm tra xem book đã từng thêm vào cart chưa
    boolean existsByCartAndBook(Cart cart, Book book);

    CartDetail findByCartAndBook(Cart cart, Book book);
}
