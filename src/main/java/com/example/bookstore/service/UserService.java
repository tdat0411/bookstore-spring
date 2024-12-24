package com.example.bookstore.service;

import org.springframework.stereotype.Service;

import com.example.bookstore.domain.User;
import com.example.bookstore.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }
}
