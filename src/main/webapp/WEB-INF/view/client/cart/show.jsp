<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Cart Books</title>
                    <!-- Latest compiled and minified CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
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
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total Price</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${empty cartDetails}">
                                    <tr>
                                        <td colspan="6">
                                            Không có sản phẩm trong giỏ hàng
                                        </td>
                                    </tr>
                                </c:if>
                                <c:forEach var="cartDetail" items="${cartDetails}">

                                    <tr>
                                        <th scope="row">
                                            <div class="d-flex align-items-center">
                                                <img src="/images/book/${cartDetail.book.image}"
                                                    class="img-fluid me-5 rounded-circle"
                                                    style="width: 80px; height: 80px;" alt="">
                                            </div>
                                        </th>
                                        <td>
                                            <p class="mb-0 mt-4">
                                                <a href="#" target="_blank">
                                                    ${cartDetail.book.name}
                                                </a>
                                            </p>
                                        </td>
                                        <td>
                                            <p class="mb-0 mt-4">
                                                <fmt:formatNumber type="number" value="${cartDetail.price}" /> đ
                                            </p>
                                        </td>
                                        <td>
                                            <div class="input-group quantity mt-4" style="width: 100px;">
                                                <input type="text"
                                                    class="form-control form-control-sm text-center border-0"
                                                    value="${cartDetail.quantity}"
                                                    data-cart-detail-id="${cartDetail.id}">
                                            </div>
                                        </td>
                                        <td>
                                            <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                <fmt:formatNumber type="number"
                                                    value="${cartDetail.price * cartDetail.quantity}" /> đ
                                            </p>
                                        </td>
                                        <td>
                                            <form method="post" action="/delete-cart-product/${cartDetail.id}">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <button class="btn btn-md rounded-circle bg-light border mt-4">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
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