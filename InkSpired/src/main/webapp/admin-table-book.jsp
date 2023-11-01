<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>List of book</title>

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
                    <span>Admin</span> / <span class="menu-text">List of book</span>
                </h3>
            </div>
            <!-- App Hero header ends -->

            <!-- App body starts -->
            <div class="app-body">
                <!-- table name Order -->
                <div class="row">

                    <div class="col-xxl-12">
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h4 class="section-title fw-light">List of book</h4>
                                        <a href="<%= request.getContextPath() %>/admin/add-book" class="btn btn-primary mb-2">Add New Book</a>
                                    </div>

                                    <table id="book-table" class="table table-bordered m-0">
                                        <thead>
                                        <tr>
                                            <th>Book ID</th>
                                            <th>Title</th>
                                            <th>Publication Date</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                            <th>Publisher</th>

                                            <th>Image</th>
                                            <th>Availability</th>
                                            <th>Authors</th>
                                            <th>Categories</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="book" items="${requestScope.books}">
                                        <tr>
                                            <td>${book.book_id}</td>
                                            <td><a href="<%= request.getContextPath() %>/admin/book-info?book_id=${book.book_id}" class="book-title">${book.title}</a></td>
                                            <td>${book.publication_date}</td>
                                            <td>${book.quantity}</td>
                                            <td><fmt:formatNumber  value="${book.getPrice()}" minFractionDigits="0" maxFractionDigits="0"/>&#x20AB</td>
                                            <td>${book.publisher_name}</td>
                                            <td><img src="<%= request.getContextPath() %>/${book.book_image}" alt="${book.title}" width="100px"></td>
                                            <td>
                                                <span class="badge ${book.is_available ? 'badge-success' : 'badge-failed'}">
                                                        ${book.is_available ? 'Yes' : 'No'}
                                                </span>
                                            </td>

                                            <td>${book.author_fullname}</td>
                                            <td>${book.category_name}</td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>


                            </div>
                        </div>
                    </div>








                <!-- Your table goes here -->

                </div>
                <!-- Row end -->
                </div>

            </div>
            <!-- App body ends -->

            <!-- App footer start -->
            <div class="app-footer">
                <span>© Bootstrap Gallery 2023</span>
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