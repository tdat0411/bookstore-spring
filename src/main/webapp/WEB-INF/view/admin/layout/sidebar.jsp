<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 280px; height: 100vh;">
            <a href="/admin" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                <i class="bi bi-speedometer2 me-2" style="font-size: 1.5rem;"></i>
                <span class="fs-4">Dashboard</span>
            </a>
            <hr>
            <ul class="nav nav-pills flex-column mb-auto">
                <li>
                    <a href="/admin/order" class="nav-link text-white">
                        <i class="bi bi-table me-2"></i>
                        Orders
                    </a>
                </li>
                <li>
                    <a href="/admin/book" class="nav-link text-white">
                        <i class="bi bi-grid me-2"></i>
                        Books
                    </a>
                </li>
                <li>
                    <a href="/admin/user" class="nav-link text-white">
                        <i class="bi bi-person-circle me-2"></i>
                        Users
                    </a>
                </li>
            </ul>
            <hr>
            <a class="dropdown-item" href="#"><i class="bi bi-box-arrow-right me-2"></i>Sign out</a>
        </div>