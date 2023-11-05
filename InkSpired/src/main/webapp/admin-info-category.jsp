<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Category information</title>

    <!-- Meta -->
    <meta name="author" content="Vinh" />
    <link rel="canonical" href="https://www.bootstrap.gallery/">
    <meta property="og:url" content="https://www.bootstrap.gallery">
    <link rel="shortcut icon" href="assets/images/favicon.svg" />

    <!-- *************
        ************ CSS Files *************
    ************* -->
    <%@include file="jsp-contribute/admin-interface.jsp" %>

    <!-- *************
        ************ Vendor Css Files *************
    ************ -->

    <!-- Scrollbar CSS -->

</head>

<body>
<!-- Page wrapper start -->
<div class="page-wrapper">

    <!-- Main container start -->
    <div class="main-container">

        <%@include file="jsp-contribute/admin-menuscroll.jsp"%>

        <!-- App container starts -->
        <div class="app-container">

            <%@include file="jsp-contribute/admin-appheader.jsp"%>

            <!-- App hero header starts -->
            <div class="app-hero-header">
                <h3 class="fw-light mb-5">
                    <span>Admin</span> / <span class="menu-text">List of category</span> / <span class="menu-text">category id ${category.category_id}</span>
                </h3>
            </div>
            <!-- App Hero header ends -->

            <!-- App body starts -->
            <div class="app-body">

                <!-- table name Order -->
                <div class="col-xxl-12">
                    <div class="card shadow mb-4" id="categoryInfoForm" >
                        <div class="card-header">
                            <h5 class="card-title">Category Info</h5>
                        </div>
                        <div class="p-5">
                            <div class="row flex-lg-row-reverse align-items-center">
                                <div class="col-10 col-sm-8 col-lg-6">
                                    <div class="mt-4">
                                        <table id="category-table" class="table table-striped table-bordered" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>Book ID</th>
                                                <th>Book Name</th>

                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${books}" var="book">
                                                <tr>
                                                    <td>${book.book_id}</td>
                                                    <td><a href="<%= request.getContextPath() %>/admin/book-info?book_id=${book.book_id}">${book.title}</a></td>

                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <p class="fs-4">Category ID: ${category.category_id}</p>
                                    <p class="fs-4">Category Name: ${category.category_name}</p>
                                    <p class="fs-4">Number of category used: ${fn:length(books)}</p>



                                </div>
                            </div>
                        </div>

                        <div class="card-footer">
                            <div class="d-flex gap-2 justify-content-end">
                                <a class="btn btn-outline-primary" href="<%= request.getContextPath() %>/admin/table-category">Go Back</a>
                                <button class="btn btn-primary" onclick="editCategory()">Edit</button>
                                <c:if test="${fn:length(books) == 0}">

                                    <a href="<%=request.getContextPath()%>/admin/delete-category?category_id=${category.category_id}" class="btn btn-danger">Delete</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="card shadow mb-4" id="updateForm" style="display: none">
                        <div class="card-header">
                            <h5 class="card-title">Update Category</h5>
                        </div>

                        <form action="<%=request.getContextPath()%>/admin/category-info" method="post">
                            <div class="card-body">

                                <!-- Row start -->
                                <div class="row">
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label">Category ID</label>
                                            <input class="form-control" type="text" name="category_id" value="${category.category_id}"  readonly>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label">Category Name</label>
                                            <input class="form-control" type="text" id="title" name="category_name" value="${category.category_name}" required>
                                        </div>
                                    </div>


                                </div>
                                <!-- Row end -->

                            </div>
                            <div class="card-footer">
                                <div class="d-flex gap-2 justify-content-end">

                                    <a onclick="cancelEditCategory()" class="btn btn-outline-secondary">Cancel</a>
                                    <button type="submit" class="btn btn-primary" name="updateCategorySubmit">Update</button>
                                    <c:if test="${fn:length(books) == 0}">

                                        <a href="<%=request.getContextPath()%>/admin/delete-category?category_id=${category.category_id}" class="btn btn-danger">Delete</a>
                                    </c:if>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>


            </div>
            <!-- App body ends -->

            <!-- App footer start -->
            <div class="app-footer">
                <span>Copyright INKSPIRED BOOKS 2023, always reserved.</span>
            </div>
            <!-- App footer end -->

        </div>
        <!-- App container ends -->

    </div>
    <!-- Main container end -->

</div>
<!-- Page wrapper end -->

<!-- *************
    ************ JavaScript Files *************
************* -->
<%@include file="jsp-contribute/admin-script.jsp" %>

</body>

</html>