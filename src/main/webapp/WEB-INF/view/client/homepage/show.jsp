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
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
                            <a href="cart.html" class="btn btn-warning">Go to Cart</a>
                        </div>
                    </div>
                </nav>

                <div class="container my-5">
                    <div class="row">
                        <div class="col-md-8">
                            <h3 class="mb-4">Books</h3>
                            <div class="row" id="bookList">
                                <!-- Placeholder books for display -->
                                <div class="col-md-4">
                                    <div class="card">
                                        <img src="https://via.placeholder.com/150" class="card-img-top" alt="Book 1">
                                        <div class="card-body">
                                            <h5 class="card-title">Book 1</h5>
                                            <p class="card-text">$10</p>
                                            <button class="btn btn-primary">Add to Cart</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card">
                                        <img src="https://via.placeholder.com/150" class="card-img-top" alt="Book 2">
                                        <div class="card-body">
                                            <h5 class="card-title">Book 2</h5>
                                            <p class="card-text">$15</p>
                                            <button class="btn btn-primary">Add to Cart</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card">
                                        <img src="https://via.placeholder.com/150" class="card-img-top" alt="Book 3">
                                        <div class="card-body">
                                            <h5 class="card-title">Book 3</h5>
                                            <p class="card-text">$20</p>
                                            <button class="btn btn-primary">Add to Cart</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script
                    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

            </body>

            </html>