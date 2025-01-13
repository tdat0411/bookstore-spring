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
                        <h3 class="mb-4">Books</h3>
                        <!-- Phần tìm kiếm -->
                        <div class="col-12 col-md-4">
                            <div class="col-12" id="categoryFilter">
                                <div class="mb-2"><b>Category</b></div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="Sách IT" id="category-1">
                                    <label class="form-check-label" for="category-1">
                                        Sách IT
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="Sách ngoại ngữ"
                                        id="category-2">
                                    <label class="form-check-label" for="category-2">
                                        Sách ngoại ngữ
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="Sách luyện thi"
                                        id="category-3">
                                    <label class="form-check-label" for="category-3">
                                        Sách luyện thi
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="Sách tiếng Hàn"
                                        id="category-4">
                                    <label class="form-check-label" for="category-4">
                                        Sách tiếng Hàn
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="Sách tiếng Nhật"
                                        id="category-5">
                                    <label class="form-check-label" for="category-5">
                                        Sách tiếng Nhật
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="Sách tiếng Trung"
                                        id="category-6">
                                    <label class="form-check-label" for="category-6">
                                        Sách tiếng Trung
                                    </label>
                                </div>
                            </div>

                            <div class="col-12" id="priceFilter">
                                <div class="mb-2"><b>Price</b></div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="duoi-100k" id="price-1">
                                    <label class="form-check-label" for="price-1">
                                        Dưới 100K
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="100-300k" id="price-2">
                                    <label class="form-check-label" for="price-2">
                                        Từ 100K - 300K
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="300-600k" id="price-3">
                                    <label class="form-check-label" for="price-3">
                                        Từ 300K - 600K
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="600-900k" id="price-4">
                                    <label class="form-check-label" for="price-4">
                                        Từ 600K - 900K
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="tren-900k" id="price-5">
                                    <label class="form-check-label" for="price-5">
                                        Trên 900K
                                    </label>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="mb-2"><b>Sắp xếp</b></div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="gia-tang-dan" id="sort-1"
                                        name="radio-sort">
                                    <label class="form-check-label" for="price-1">
                                        Giá tăng dần
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="gia-giam-dan" id="sort-2"
                                        name="radio-sort">
                                    <label class="form-check-label" for="price-1">
                                        Giá giảm dần
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="khong-sap-xep" id="sort-3"
                                        checked name="radio-sort">
                                    <label class="form-check-label" for="price-1">
                                        Không sắp xếp
                                    </label>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary mt-3" id="btnFilter">Search</button>
                        </div>

                        <!-- Phần hiển thị sản phẩm -->
                        <div class="col-12 col-md-8 text-center">
                            <div class="row g-4" id="bookList">
                                <c:if test="${totalPages == 0}">
                                    <div>Không tìm thấy sản phẩm</div>
                                </c:if>
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

                            <!-- Pagination -->
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center mt-5">
                                    <li class="page-item">
                                        <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                            href="/product?page=${currentPage - 1}${querryString}"
                                            aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <c:if test="${totalPages > 0}">
                                        <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                            <li class="page-item"><a
                                                    class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                                    href="/product?page=${loop.index + 1}${querryString}">${loop.index +
                                                    1}</a>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                    <li class="page-item">
                                        <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                            href="/product?page=${currentPage + 1}${querryString}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>

                <!-- footer -->
                <jsp:include page="../layout/footer.jsp" />

                <script src="/client/js/main.js"></script>
            </body>

            </html>