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


                    <div class="col-xxl-12">
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h4 class="section-title fw-light">List of book</h4>
                                    </div>

                                    <table id="book-table" class="table table-bordered m-0">
                                        <thead>
                                        <tr>
                                            <th scope="col" data-toggle="true">Book ID</th>
                                            <th scope="col" data-toggle="true">Title</th>
                                            <th scope="col" data-toggle="true">Publication Date</th>
                                            <th scope="col" data-toggle="true">Quantity</th>
                                            <th scope="col" data-toggle="true">Price</th>
                                            <th scope="col" data-toggle="true">Publisher</th>
                                            <th scope="col" data-toggle="true" class="d-none">Description</th>
                                            <th scope="col" data-toggle="true">Image</th>
                                            <th scope="col" data-toggle="true">Availability</th>
                                            <th scope="col" data-toggle="true">Authors</th>
                                            <th scope="col" data-toggle="true">Categories</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="book" items="${books}">
                                        <tr>
                                            <td>${book.book_id}</td>
                                            <td><a href="<%= request.getContextPath() %>/admin/update-book?book_id=${book.book_id}" class="book-title">${book.title}</a></td>
                                            <td>${book.publication_date}</td>
                                            <td>${book.quantity}</td>
                                            <td>${book.price} VND</td>
                                            <td>${book.publisher_name}</td>
                                            <td class="d-none">${book.book_description}</td>
                                            <td><img src="${book.book_image}"></td>
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