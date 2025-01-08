<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="container">
            <header
                class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
                <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                    <h3>BookStore</h3>
                </a>

                <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="/" class="nav-link px-2 link-secondary">Home</a></li>
                    <li><a href="/product" class="nav-link px-2 link-dark">Product</a></li>
                    <li><a href="/cart" class="nav-link px-2 link-dark">Cart</a></li>
                </ul>

                <!-- người dùng chưa đăng nhập -->
                <c:if test="${empty pageContext.request.userPrincipal}">
                    <div class="col-md-3 text-end">
                        <a href="/login" class="btn btn-primary btn-lg" role="button" aria-disabled="true">Login</a>
                        <a href="/register" class="btn btn-primary btn-lg" role="button" aria-disabled="true">Sign
                            up</a>
                    </div>
                </c:if>

                <!-- người dùng đã đăng nhập -->
                <c:if test="${not empty pageContext.request.userPrincipal}">
                    <div class="col-md-3 text-end">
                        <form method="post" action="/logout">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button class="btn btn-primary btn-lg">Logout</button>
                        </form>
                    </div>
                </c:if>
            </header>
        </div>