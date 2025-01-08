<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Product</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body>
                <!-- header -->
                <jsp:include page="../layout/header.jsp" />

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

                <!-- footer -->
                <jsp:include page="../layout/footer.jsp" />
            </body>

            </html>