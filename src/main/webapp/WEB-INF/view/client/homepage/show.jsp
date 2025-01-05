<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>BookStore</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="styles.css">
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body>
                <!-- <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">Book Store</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarNav">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav me-auto">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#">Home</a>
                                </li>
                            </ul>
                            <form class="d-flex align-items-center me-3">
                                <select class="form-select me-2" id="categorySelect">
                                    <option value="all" selected>All Categories</option>
                                    <option value="fiction">Fiction</option>
                                    <option value="non-fiction">Non-Fiction</option>
                                    <option value="children">Children's Books</option>
                                    <option value="science">Science</option>
                                </select>
                                <input class="form-control me-2" type="search" placeholder="Search books"
                                    aria-label="Search">
                                <button class="btn btn-outline-success" type="submit">Search</button>
                            </form>
                            <a href="" class="btn btn-warning">Go to Cart</a>
                        </div>
                    </div>
                </nav> -->
                <div class="container">
                    <header
                        class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
                        <a href="/"
                            class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                            <h3>BookStore</h3>
                        </a>

                        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                            <li><a href="/" class="nav-link px-2 link-secondary">Home</a></li>
                            <li><a href="#" class="nav-link px-2 link-dark">Features</a></li>
                            <li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
                            <li><a href="/cart" class="nav-link px-2 link-dark">Cart</a></li>
                            <li><a href="#" class="nav-link px-2 link-dark">About</a></li>
                        </ul>

                        <div class="col-md-3 text-end">
                            <a href="/login" class="btn btn-primary btn-lg" role="button" aria-disabled="true">Login</a>
                            <a href="/register" class="btn btn-primary btn-lg" role="button" aria-disabled="true">Sign
                                up</a>
                        </div>
                    </header>
                </div>

                <div class="container my-5">
                    <div class="row">
                        <div class="col-md-8">
                            <h3 class="mb-4">Books</h3>
                            <div class="row g-4" id="bookList">
                                <!-- Sử dụng forEach để hiển thị các sách -->
                                <c:forEach var="book" items="${books}">
                                    <div class="col-md-4">
                                        <div class="card h-100 shadow-sm" style="
                                            border-radius: 10px;
                                            transition: transform 0.3s, box-shadow 0.3s;">
                                            <img src="/images/book/${book.image}" class="card-img-top"
                                                alt="${book.name}" style="
                                                height: 200px;
                                                object-fit: cover;">
                                            <div class="card-body d-flex flex-column">
                                                <h5 class="card-title text-center" style="
                                                    font-size: 1.2rem;
                                                    margin-bottom: 10px;">
                                                    ${book.name}
                                                </h5>
                                                <p class="card-text text-center fw-bold text-success" style="
                                                    font-size: 1.1rem;">
                                                    <fmt:formatNumber type="number" value="${book.price}" /> đ
                                                </p>
                                                <button class="btn btn-primary mt-auto" style="
                                                    margin-top: auto;">
                                                    Add to Cart
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>

                <footer class="bg-dark text-light py-4">
                    <div class="container">
                        <div class="row">
                            <!-- Logo và mô tả -->
                            <div class="col-md-4 mb-3">
                                <h4 class="text-uppercase">BookStore</h4>
                                <p class="small">Your one-stop shop for all your favorite books. Discover, learn, and
                                    enjoy!</p>
                            </div>

                            <!-- Các liên kết -->
                            <div class="col-md-4 mb-3">
                                <h5 class="text-uppercase">Quick Links</h5>
                                <ul class="list-unstyled">
                                    <li><a href="#" class="text-light text-decoration-none">Home</a></li>
                                    <li><a href="#" class="text-light text-decoration-none">Shop</a></li>
                                    <li><a href="#" class="text-light text-decoration-none">About Us</a></li>
                                    <li><a href="#" class="text-light text-decoration-none">Contact</a></li>
                                </ul>
                            </div>

                            <!-- Thông tin liên hệ -->
                            <div class="col-md-4">
                                <h5 class="text-uppercase">Contact Us</h5>
                                <ul class="list-unstyled small">
                                    <li><i class="bi bi-geo-alt"></i> 123 Book Street, City, Country</li>
                                    <li><i class="bi bi-envelope"></i> dattrantien654@gmail.com</li>
                                    <li><i class="bi bi-telephone"></i> 0988148010</li>
                                </ul>
                            </div>
                        </div>
                        <div class="text-center mt-4">
                            <p class="small mb-0">&copy; 2025 BookStore. All rights reserved.</p>
                        </div>
                    </div>
                </footer>


                <script
                    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

            </body>

            </html>