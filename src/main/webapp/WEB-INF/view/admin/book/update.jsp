<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Update Book</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body>
                <div class=" mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h3>Update a product</h3>
                            <hr />
                            <form:form method="post" action="/admin/book/update" class="row"
                                enctype="multipart/form-data" modelAttribute="newBook">


                                <div class="mb-3" style="display: none;">
                                    <label class="form-label">Id:</label>
                                    <form:input type="text" class="form-control" path="id" />
                                </div>

                                <div class="mb-3 col-12">
                                    <label class="form-label">Name:</label>
                                    <form:input type="text" class="form-control" path="name" disabled="true" />
                                </div>
                                <div class="mb-3 col-12">
                                    <label class="form-label">Price:</label>
                                    <form:input type="number" class="form-control" path="price" />
                                </div>

                                <div class="mb-3 col-12">
                                    <label class="form-label">Quantity:</label>
                                    <form:input type="number" class="form-control" path="quantity" />
                                </div>

                                <div class="mb-3 col-12 ">
                                    <label class="form-label">Category:</label>
                                    <form:select class="form-select" path="category">
                                        <form:option value="Sách ngoại ngữ">Sách ngoại ngữ</form:option>
                                        <form:option value="Sách IT">Sách IT</form:option>
                                        <form:option value="Sách luyện thi">Sách luyện thi</form:option>
                                        <form:option value="Sách tiếng Hàn">Sách tiếng Hàn</form:option>
                                        <form:option value="Sách tiếng Trung">Sách tiếng Trung</form:option>
                                        <form:option value="Sách tiếng Nhật">Sách tiếng Nhật</form:option>
                                    </form:select>
                                </div>

                                <div class="col-12 mb-5">
                                    <button type="submit" class="btn btn-warning">Update</button>
                                </div>
                            </form:form>

                        </div>

                    </div>

                </div>
            </body>

            </html>