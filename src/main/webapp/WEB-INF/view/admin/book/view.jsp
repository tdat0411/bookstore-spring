<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>View Book</title>
            <!-- Latest compiled and minified CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        </head>

        <body>
            <div class="container-fluid px-4">
                <h1 class="mt-4">View Book</h1>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <div class="d-flex justify-content-between">
                                <h3>Book detail with id = ${id}</h3>
                            </div>
                            <hr>
                            <div class="card" style="width: 40%">
                                <img class="card-img-top" src="/images/book/${book.image}" alt="Card image cap">
                                <div class="card-header">
                                    Book information
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">ID: ${book.id}</li>
                                    <li class="list-group-item">Name: ${book.name}</li>
                                    <li class="list-group-item">Price: ${book.price}</li>
                                    <li class="list-group-item">Category: ${book.category}</li>
                                </ul>
                            </div>
                            <a href="/admin/book" class="btn btn-success mt-3">Back</a>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>