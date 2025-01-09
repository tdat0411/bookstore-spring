<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Cart Books</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body class="d-flex flex-column min-vh-100">
                <!-- header -->
                <jsp:include page="../layout/header.jsp" />

                <!-- Main content -->
                <div class="container my-5 flex-grow-1">
                    <h3>Your Cart</h3>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Book Title</th>
                                <th scope="col">Price</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="3" class="text-center">No items in cart</td>
                            </tr>
                        </tbody>
                    </table>
                    <a href="/" class="btn btn-primary">Back to Shop</a>
                </div>

                <!-- footer -->
                <footer class="bg-light text-center py-3 mt-auto">
                    <jsp:include page="../layout/footer.jsp" />
                </footer>
            </body>


            </html>