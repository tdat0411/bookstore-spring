package com.example.bookstore.domain.dto;

import java.util.List;
import java.util.Optional;

public class BookCriteriaDTO {
    private Optional<String> page;
    private Optional<List<String>> category;
    private Optional<List<String>> price;
    private Optional<String> sort;

    public Optional<String> getPage() {
        return page;
    }

    public void setPage(Optional<String> page) {
        this.page = page;
    }

    public Optional<List<String>> getCategory() {
        return category;
    }

    public void setCategory(Optional<List<String>> category) {
        this.category = category;
    }

    public Optional<List<String>> getPrice() {
        return price;
    }

    public void setPrice(Optional<List<String>> price) {
        this.price = price;
    }

    public Optional<String> getSort() {
        return sort;
    }

    public void setSort(Optional<String> sort) {
        this.sort = sort;
    }

}