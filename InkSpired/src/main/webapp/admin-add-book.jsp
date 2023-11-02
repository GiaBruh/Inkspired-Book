<!DOCTYPE html>
<html lang="en">
<%@ page import="com.example.inkspired.model.Author" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.inkspired.model.Category" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    <span>Admin</span> / <span class="menu-text">Insert New Book</span>
                </h3>
            </div>
            <!-- App Hero header ends -->

            <!-- App body starts -->
            <div class="app-body">

                <!-- table name Order -->
                <div class="col-xxl-12">
                    <div class="card shadow mb-4" id="addForm">
                        <div class="card-header">
                            <h5 class="card-title">Insert New Book</h5>
                        </div>

                            <form action="<%=request.getContextPath()%>/admin/add-book" method="post" enctype="multipart/form-data">
                                <div class="card-body">
                                    <c:if test="${not empty sessionScope.errorMessage}">
                                        <div class="alert border border-danger alert-dismissible fade show text-danger"
                                             role="alert">
                                            <b>Error!</b> ${sessionScope.errorMessage}
                                        </div>
                                        <% session.removeAttribute("errorMessage"); %>
                                    </c:if>
                                    <!-- Row start -->
                                    <div class="row">

                                        <div class="col-lg-3 col-sm-4 col-12">
                                            <div class="mb-3">
                                                <label class="form-label">Book Title</label>
                                                <input class="form-control" type="text" id="title" name="title" required>
                                                <span id="errorTitle" class="text-danger"></span>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-sm-4 col-12">
                                            <div class="mb-3">
                                                <label class="form-label">Date Publish</label>
                                                <fmt:formatDate var="formattedDate" value="${book.publication_date}" pattern="yyyy-MM-dd"/>
                                                <input class="form-control" type="date" id="date" name="date" required max="2023-10-30">
                                                <span id="errorDate" class="text-danger"></span>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-sm-4 col-12">
                                            <div class="mb-3">
                                                <label class="form-label">Quantity</label>
                                                <input class="form-control" type="number" id="quantity" name="quantity" min="0" required>
                                                <span id="errorQuantity" class="text-danger"></span>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-sm-4 col-12">
                                            <div class="mb-3">
                                                <label class="form-label">Price</label>
                                                <div class="input-group">

                                                    <input class="form-control" type="number" id="price" name="price" value="${book.price}" min="0" required>
                                                    <span class="input-group-text">VND</span>
                                                </div>
                                                <span id="errorPrice" class="text-danger"></span>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- Row end -->

                                    <!-- Row start -->
                                    <div class="row">

                                        <div class="col-lg-3 col-sm-4 col-12">
                                            <div class="mb-3">
                                                <label class="form-label">Publisher</label>
                                                <select class="form-select" name="publisherId">
                                                        <%--                                                <option value="">Select a Publisher</option>--%>
                                                    <c:forEach var="publisher" items="${publishers}">
                                                        <option value="${publisher.publisher_id}"
                                                            ${publisher.publisher_id == book.publisher_id ? "selected" : ""}>
                                                                ${publisher.publisher_name}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-sm-4 col-12">
                                            <div class="mb-3">
                                                <label class="form-label">Image</label>
                                                <input class="form-control" type="file" id="upload" name="upload" onchange="loadFile(event)" required>
                                                <span id="errorImage" class="text-danger"></span>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-sm-4 col-12">
                                            <div class="dropdown">
                                                <div class="mb-3">
                                                    <label class="form-label">Image Preview</label>
                                                <button class="form-control btn btn-outline-primary" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                                    Review
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <img id="output" src="${book.book_image}" style="width: 200px; height: auto;" />
                                                </div>
                                                </div>
                                            </div>

                                        </div>




                                        <div class="col-lg-3 col-sm-4 col-12">
                                            <div class="mb-3">
                                                <label class="form-label" >Is Available?</label>
                                                <div class="mt-2">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input"  type="radio"  name="available" value="true" checked>
                                                        <label class="form-check-label" >Yes</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input"  type="radio"  name="available" value="false">
                                                        <label class="form-check-label" >No</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-12">
                                            <div class="mb-3">
                                                <label class="form-label">Description</label>
                                                <textarea type="text" class="form-control" id="description" name="description" placeholder="Please add some description" rows="5" required><c:out value="${book.book_description}"/></textarea>
                                                <span id="errorDescription" class="text-danger"></span>
                                            </div>
                                        </div>


                                    </div>
                                    <!-- Row end -->
                                    <div class="row">
                                        <div class="col-xxl-12">
                                            <div class="bg-light bg-opacity-50 p-3 mb-3 fw-bold">
                                                Category & Author
                                            </div>
                                        </div>

                                        <div class="col-lg-3 col-sm-4 col-12">
                                            <div class="mb-3">
                                                <label class="form-label">Author</label>
                                                <input class="form-control" type="text" id="authorSearch" placeholder="Search Authors" onkeyup="filterAuthors()">
                                                <!-- Loop over all authors -->

                                                <div class="checkbox-container mt-1" style="width: 270px; height: 100px; overflow-y: scroll;">

                                                    <% for (Author author : (List<Author>)request.getAttribute("authors")) { %>
                                                    <label>
                                                        <input type="checkbox" name="authorIds" value="<%= author.getAuthor_id() %>">
                                                        <%= author.getAuthor_fullname() %>
                                                    </label><br>
                                                    <% } %>
                                                </div>
                                                <span id="errorAuthor" class="text-danger"></span>
                                            </div>



                                        </div>
                                        <div class="col-lg-3 col-sm-4 col-12">
                                            <div class="mb-3">
                                                <label class="form-label">Category</label>
                                                <input class="form-control" type="text" id="categorySearch" placeholder="Search Categories" onkeyup="filterCategories()">

                                                <!-- Category checkboxes container -->
                                                <div class="checkbox-container-cate mt-1" style="width: 270px; height: 100px; overflow-y: scroll;">
                                                    <!-- Loop over all categories -->
                                                    <% for (Category category : (List<Category>)request.getAttribute("categories")) { %>
                                                    <label>
                                                        <input type="checkbox" name="categoryIds" value="<%= category.getCategory_id() %>">
                                                        <%= category.getCategory_name() %>
                                                    </label><br>
                                                    <% } %>
                                                </div>
                                                <span id="errorCategory" class="text-danger"></span>
                                            </div>
                                        </div>
                                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                                        <script>
                                            $(document).ready(function() {
                                                $("#submitButton").click(function(event) {
                                                    var checkedCategories = $('input[type="checkbox"][name="categoryIds"]:checked').length > 0;
                                                    var checkedAuthors = $('input[type="checkbox"][name="authorIds"]:checked').length > 0;

                                                    if (!checkedCategories || !checkedAuthors) {
                                                        alert("Please select at least one category or one author.");
                                                        event.preventDefault(); // Prevent the default form submission behavior
                                                    }
                                                });
                                            });
                                        </script>


                                    </div>



                                </div>
                                <div class="card-footer">
                                    <div class="d-flex gap-2 justify-content-end">
                                        <button type="submit" class="btn btn-primary" name="addBookSubmit" id="submitButton" disabled>Submit</button>
                                        <button type="reset" name="addBookReset" class="btn btn-danger">Reset</button>
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

<script>
    let title = '';
    let date = '';
    let quantity = '';
    let price = '';
    let image = '';
    let description = '';
    let author = 0;
    let category = 0;

    let validTitle = false;
    let validDate = false;
    let validQuantity = false;
    let validPrice = false;
    let validImage = false;
    let validDescription = false;
    let validAuthor = false;
    let validCategory = false;

    $(document).ready(function () {
        <!--DATE CONSTRAINT-->
        $(function(){
            var dtToday = new Date();

            var month = dtToday.getMonth() + 1;
            var day = dtToday.getDate();
            var year = dtToday.getFullYear();

            if(month < 10)
                month = '0' + month.toString();
            if(day < 10)
                day = '0' + day.toString();

            var maxDate = year + '-' + month + '-' + day;
            $("input[name='date']").attr('max', maxDate);
        });
        $("input[name='title']").on({
            'keyup change': function () {
                title = $("input[name='title']").val();
                if (title.length < 1 || title.length > 100) {
                    validTitle = false;
                    $("#errorTitle").html("Book title can only be from 1 to 100 characters.");
                } else {
                    validTitle = true;
                    $("#errorTitle").html("");
                }
                valid();
            }
        });
        $("input[name='date']").on( {
            'keyup change': function () {
                date = $("input[name='date']").val();
                if (!date){
                    validDate = false;
                    $("#errorDate").html("Publish date cannot be left empty.");
                } else {
                    validDate = true;
                    $("#errorDate").html("");
                }
                valid();
            }
        })
        $("input[name='quantity']").on( {
            'keyup change': function () {
                quantity = $("input[name='quantity']").val();
                if (!quantity){
                    validQuantity= false;
                    $("#errorQuantity").html("Quantity cannot be left empty.");
                } else {
                    validQuantity = true;
                    $("#errorQuantity").html("");
                }
                valid();
            }
        });
        $("input[name='price']").on( {
            'keyup change': function () {
                price = $("input[name='price']").val();
                if (!price){
                    validPrice= false;
                    $("#errorPrice").html("Quantity cannot be left empty.");
                } else {
                    validPrice = true;
                    $("#errorPrice").html("");
                }
                valid();
            }
        });
        $("input[name='upload']").on( {
            'keyup change': function () {
                image = $("input[name='upload']").val();
                if (!image){
                    validImage= false;
                    $("#errorImage").html("Image cannot be left empty.");
                } else {
                    validImage = true;
                    $("#errorImage").html("");
                }
                valid();
            }
        });
        $("textarea[name='description']").on( {
            'keyup change': function () {
                description = $("textarea[name='description']").val();
                if (!description){
                    validDescription = false;
                    $("#errorDescription").html("Description cannot be left empty.");
                } else {
                    validDescription = true;
                    $("#errorDescription").html("");
                }
                valid();
            }
        });
        $("input[name='authorIds']").on( {
            change: function() {
                author = $("input[name='authorIds']:checked").length
                if (!(author > 0)){
                    validAuthor = false;
                    $("#errorAuthor").html("At least one author needed to be selected");
                } else {
                    validAuthor = true;
                    $("#errorAuthor").html("");
                }
                valid();
            }
        });
        $("input[name='categoryIds']").on( {
            change: function() {
                category = $("input[name='categoryIds']:checked").length
                if (!(category > 0)){
                    validCategory = false;
                    $("#errorCategory").html("At least one category needed to be selected");
                } else {
                    validCategory = true;
                    $("#errorCategory").html("");
                }
                valid();
            }
        });
        function valid() {
            console.log(validTitle, validDate, validQuantity, validPrice, validImage, validDescription, validAuthor, validCategory);
            if(
                validTitle === true &&
                validDate === true &&
                validQuantity === true &&
                validPrice === true &&
                validImage === true &&
                validDescription === true &&
                validAuthor === true &&
                validCategory === true
            ) {
                $("button[name='addBookSubmit']").removeAttr('disabled');

            } else {
                $("button[name='addBookSubmit']").attr('disabled', '');
            }
        }
        $("button[name='addBookReset']").on( {
            click: function (){
                validTitle = false;
                validDate = false;
                validQuantity = false;
                validPrice = false;
                validImage = false;
                validDescription = false;
                validAuthor = false;
                validCategory = false;
                valid();
                $("#errorTitle").html("");
                $("#errorDate").html("");
                $("#errorQuantity").html("");
                $("#errorImage").html("");
                $("#errorPrice").html("");
                $("#errorDescription").html("");
                $("#errorAuthor").html("");
                $("#errorCategory").html("");
            }
        });
    });
</script>
<!-- *************
    ************ JavaScript Files *************
************* -->
<%@include file="jsp-contribute/admin-script.jsp" %>

</body>
</html>