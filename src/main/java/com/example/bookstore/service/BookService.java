package com.example.bookstore.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.bookstore.domain.Book;
import com.example.bookstore.repository.BookRepository;

@Service
public class BookService {
    private final BookRepository bookRepository;

    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public List<Book> getAllBooks() {
        return this.bookRepository.findAll();
    }

    public Optional<Book> getBookById(Long id) {
        return this.bookRepository.findById(id);
    }
}
