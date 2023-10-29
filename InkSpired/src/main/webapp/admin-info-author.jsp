<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



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
                    <span>Admin</span> / <span class="menu-text">List of author</span> / <span class="menu-text">Author id ${author.author_id}</span>
                </h3>
            </div>
            <!-- App Hero header ends -->

            <!-- App body starts -->
            <div class="app-body">

                <!-- table name Order -->
                <div class="col-xxl-12">
                    <div class="card shadow mb-4" id="authorInfoForm" >
                        <div class="card-header">
                            <h5 class="card-title">Author Info</h5>
                        </div>
                        <div class="p-5">
                            <div class="row flex-lg-row-reverse align-items-center">
                                <div class="col-10 col-sm-8 col-lg-6">
                                    <div class="mt-4">
                                        <table id="author-table" class="table table-striped table-bordered" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>Book ID</th>
                                                <th>Book Name</th>
                                                <th>Is Available</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${books}" var="book">
                                                <tr>
                                                    <td>${book.book_id}</td>
                                                    <td><a href="<%= request.getContextPath() %>/admin/book-info?book_id=${book.book_id}">${book.title}</a></td>
                                                    <td>${book.is_available}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <p class="fs-4">Author ID: ${author.author_id}</p>
                                    <p class="fs-4">Author Name: ${author.author_fullname}</p>
                                    <p class="fs-4">Author Image: <img src="<%= request.getContextPath() %>/${author.author_image}" alt="" width="200px"></p>
                                    <p class="fs-4"  style="color: ${author.author_status ? "green" : "red"}"
                                    >Author Status: ${author.author_status ? "Active" : "Inactive"}

                                    </p>
                                    <p class="fs-4">Number of books: ${fn:length(books)}</p>
                                    <p class="fs-4">Author Description:</p>
                                    <p class="mb-4">
                                        ${author.author_description}
                                    </p>


                                </div>
                            </div>
                        </div>

                        <div class="card-footer">
                            <div class="d-flex gap-2 justify-content-end">
                                <a class="btn btn-outline-primary" href="<%= request.getContextPath() %>/admin/table-author">Go Back</a>
                                <button class="btn btn-primary" onclick="editAuthor()">Edit</button>
                                <c:if test="${fn:length(books) == 0}">

                                    <a href="<%=request.getContextPath()%>/admin/delete-author?author_id=${author.author_id}" class="btn btn-danger">Delete</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="card shadow mb-4" id="updateForm" style="display: none">
                        <div class="card-header">
                            <h5 class="card-title">Update Author</h5>
                        </div>

                        <form action="<%=request.getContextPath()%>/admin/author-info" method="post" enctype="multipart/form-data">
                            <div class="card-body">

                                <!-- Row start -->
                                <div class="row">
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label">Author ID</label>
                                            <input class="form-control" type="text" name="author_id" value="${author.author_id}"  readonly>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label">Author full Name</label>
                                            <input class="form-control" type="text"  name="author_fullname" value="${author.author_fullname}" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label">Author Image</label>
                                            <input class="form-control" type="file" name="upload" onchange="loadFile(event)" value="${author.author_image}" required>
                                        </div>

                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label">Author Status</label>
                                            <select class="form-select" name="author_status" required>
                                                <option value="true" ${author.author_status ? "selected" : ""}>Active</option>
                                                <option value="false" ${author.author_status ? "" : "selected"}>Inactive</option>
                                            </select>
                                        </div>

                                    </div>

                                    <div class="col-sm-6 col-12">
                                        <div class="mb-3">
                                            <label class="form-label">Author Description</label>
                                            <textarea class="form-control" name="author_description" id="" cols="30" rows="10" required>${author.author_description}</textarea>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label">Image Preview</label>
                                            <button class="form-control btn btn-outline-primary" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                                Review
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <img id="output" src="<%= request.getContextPath() %>/${author.author_image}" style="width: 200px; height: auto;" />
                                            </div>
                                        </div>
                                    </div>



                                </div>
                                <!-- Row end -->

                            </div>
                            <div class="card-footer">
                                <div class="d-flex gap-2 justify-content-end">

                                    <a onclick="cancelEditAuthor()" class="btn btn-outline-secondary">Cancel</a>
                                    <button type="submit" class="btn btn-primary" name="updateAuthorSubmit">Update</button>
                                    <c:if test="${fn:length(books) == 0}">

                                        <a href="<%=request.getContextPath()%>/admin/delete-author?author_id=${author.author_id}" class="btn btn-danger">Delete</a>
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