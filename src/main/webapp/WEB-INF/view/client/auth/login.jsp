<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Login</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body class="bg-primary">
                <div id="layoutAuthentication">
                    <div id="layoutAuthentication_content">
                        <main>
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-lg-5">
                                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                                            <div class="card-header">
                                                <h3 class="text-center font-weight-light my-4">Login</h3>
                                            </div>
                                            <div class="card-body">
                                                <form method="post" action="/login">
                                                    <!-- url có error -->
                                                    <c:if test="${param.error != null}">
                                                        <div class="my-2" style="color: red;">Invalid email or
                                                            password.</div>
                                                    </c:if>
                                                    <!-- logout thành công -->
                                                    <c:if test="${param.logout != null}">
                                                        <div class="my-2" style="color: green;">Logout success.
                                                        </div>
                                                    </c:if>
                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" id="inputEmail" type="email"
                                                            placeholder="name@example.com" name="username" />
                                                        <label for="inputEmail">Email address</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" id="inputPassword" type="password"
                                                            placeholder="Password" name="password" />
                                                        <label for="inputPassword">Password</label>
                                                    </div>
                                                    <div>
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                    </div>
                                                    <div class="mt-4 mb-0">
                                                        <div class="d-grid">
                                                            <button class="btn btn-primary btn-block">
                                                                Đăng nhập
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="card-footer text-center py-3">
                                                <div class="small"><a href="/register">Need an account? Sign
                                                        up!</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
            </body>

            </html>