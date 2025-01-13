package com.example.bookstore.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.example.bookstore.domain.Book;
import com.example.bookstore.domain.Book_;

public class BookSpecs {

    public static Specification<Book> matchListCategory(List<String> category) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Book_.CATEGORY)).value(category);
    }

    public static Specification<Book> matchMultiplePrice(double min, double max) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.between(
                root.get(Book_.PRICE), min, max);
    }
}
