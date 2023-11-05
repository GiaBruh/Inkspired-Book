<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" %>
<%@page import="java.text.SimpleDateFormat" %>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--    <head>--%>
<%--        <title>Book</title>--%>
<%--        <link rel="stylesheet" href="css/dropdown.css">--%>
<%--        <link rel="stylesheet" href="css/background.css">--%>
<%--    </head>--%>
<%--    <%@include file="interface.jsp" %>--%>
<%--    <body>--%>
<%--        <%@include file="header-yes.jsp" %>--%>
<%--        <!-- Header-->--%>
<%--        <header class="bg-dark py-5">--%>
<%--            <div class="container px-4 px-lg-5 my-5">--%>
<%--                <div class="text-center text-white">--%>
<%--                    <h1 class="display-4 fw-bolder">Something</h1>--%>
<%--                    <p class="lead fw-normal text-white-50 mb-0">Something something</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </header>--%>
<%--        <!-- Product section-->--%>
<%--        <section class="py-5 gradient-custom ">--%>
<%--            <div class="container px-4 px-lg-5 my-5">--%>
<%--                <div class="row gx-4 gx-lg-5 align-items-center">--%>
<%--                    <div class="col-md-6">--%>
<%--                        <img--%>
<%--                                class="card-img-top mb-5 mb-md-0"--%>
<%--                                src="${sessionScope.BOOKINFO.get().getBook_image()}"--%>
<%--                                alt="${sessionScope.BOOKINFO.get().getTitle()}"--%>
<%--                        />--%>
<%--                    </div>--%>
<%--                    <div class="col-md-6">--%>
<%--                        <h1 class="display-5 fw-bolder">${sessionScope.BOOKINFO.get().getTitle()}</h1>--%>
<%--                        <h3>--%>
<%--                            Author:--%>
<%--                            <c:set var="count" value="0"></c:set>--%>
<%--                            <c:forEach var="author" items="${requestScope.AUTHORLIST}">--%>
<%--                                <a href="<%= request.getServletContext().getContextPath()%>/author?authorid=${author.getAuthor_id()}"--%>
<%--                                   class="fw-bold text-decoration-none text-white"--%>
<%--                                >${author.getAuthor_fullname()}</a>--%>
<%--                                <c:set var="count" value="${count + 1}"/>--%>
<%--                                <c:if test="${count < requestScope.AUTHORLIST.size()}">--%>
<%--                                    ,--%>
<%--                                </c:if>--%>
<%--                            </c:forEach>--%>
<%--                        </h3>--%>
<%--                        <h3>Publication date: ${sessionScope.BOOKINFO.get().getPublication_date()}--%>
<%--                        </h3>--%>
<%--                        <h3>Publisher: ${requestScope.PUBLISHERINFO.getPublisher_name()}</h3>--%>
<%--                        <div class="fs-5 mb-5">--%>
<%--                            &lt;%&ndash;                            <span class="text-decoration-line-through">$420.00</span>&ndash;%&gt;--%>
<%--                            <span><fmt:formatNumber value="${sessionScope.BOOKINFO.get().getPrice()}" minFractionDigits="0" maxFractionDigits="0"/>&#x20AB</span>--%>
<%--                        </div>--%>
<%--                        <p class="lead">--%>
<%--                            ${sessionScope.BOOKINFO.get().getBook_description()}--%>
<%--                        </p>--%>
<%--                        <div class="d-flex">--%>
<%--                            <label for="inputQuantity"></label>--%>
<%--                            <input--%>
<%--                                    class="form-control text-center me-3"--%>
<%--                                    id="inputQuantity"--%>
<%--                                    type="text"--%>
<%--                                    value="Available: ${sessionScope.BOOKINFO.get().getQuantity()}"--%>
<%--                                    style="max-width: 10rem"--%>
<%--                                    readonly--%>
<%--                            />--%>

<%--                            <c:choose>--%>

<%--                                <c:when test="${sessionScope.userCookie == null}">--%>
<%--                                    <button class="btn btn-outline-dark flex-shrink-0" type="button"--%>
<%--                                            name="btnaddtocart"--%>
<%--                                            value="${sessionScope.BOOKINFO.get().getBook_id()}"--%>
<%--                                    >--%>
<%--                                        <i class="bi-cart-fill me-1"></i>--%>
<%--                                        Add to cart--%>
<%--                                    </button>--%>
<%--                                </c:when>--%>

<%--                                <c:when test="${!sessionScope.ISINCART}">--%>
<%--                                    <form method="POST"--%>
<%--                                          action="<%= request.getServletContext().getContextPath()%>/cart">--%>
<%--                                        <button class="btn btn-outline-dark flex-shrink-0" type="submit"--%>
<%--                                                name="btnaddtocart"--%>
<%--                                                value="${sessionScope.BOOKINFO.get().getBook_id()}"--%>
<%--                                        >--%>
<%--                                            <i class="bi-cart-fill me-1"></i>--%>
<%--                                            Add to cart--%>
<%--                                        </button>--%>
<%--                                    </form>--%>
<%--                                </c:when>--%>

<%--                                <c:otherwise>--%>
<%--                                    <form action="<%= request.getServletContext().getContextPath()%>/cart">--%>
<%--                                        <button class="btn btn-outline-dark flex-shrink-0" type="submit"--%>
<%--                                                name="cartid"--%>
<%--                                                value="${sessionScope.userCookie.getValue()}"--%>
<%--                                        >--%>
<%--                                            <i class="bi-cart-fill me-1"></i>--%>
<%--                                            View Cart--%>
<%--                                        </button>--%>
<%--                                    </form>--%>
<%--                                </c:otherwise>--%>

<%--                            </c:choose>--%>

<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </section>--%>
<%--        <!-- Related items section-->--%>
<%--        <section class="py-5 bg-light">--%>
<%--            <div class="container px-4 px-lg-5 mt-5">--%>
<%--                <h2 class="fw-bolder mb-4">Related products</h2>--%>
<%--                <div--%>
<%--                        class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center"--%>
<%--                >--%>
<%--                    <c:forEach var="book" items="${requestScope.BOOKSBYPUBLISHER}">--%>
<%--                        <div class="col mb-5">--%>
<%--                            <div class="card h-100">--%>
<%--                                <!-- Product image-->--%>
<%--                                <img--%>
<%--                                        class="card-img-top"--%>
<%--                                        src="${book.getBook_image()}"--%>
<%--                                        alt="..."--%>
<%--                                />--%>
<%--                                <!-- Product details-->--%>
<%--                                <div class="card-body p-4">--%>
<%--                                    <div class="text-center">--%>
<%--                                        <!-- Product name-->--%>
<%--                                        <h5 class="fw-bolder">${book.getTitle()}</h5>--%>
<%--                                        <!-- Product price-->--%>
<%--                                            ${book.getPrice()}&#x20AB--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <!-- Product actions-->--%>
<%--                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                                    <div class="text-center">--%>
<%--                                        <a class="btn btn-outline-dark mt-auto"--%>
<%--                                           href="<%=request.getServletContext().getContextPath()%>/book?bookid=${book.getBook_id()}"--%>
<%--                                        >View</a--%>
<%--                                        >--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </c:forEach>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </section>--%>
<%--        <section class="py-5 gradient-custom">--%>
<%--            <div class="container py-4 h-100" style="background: white;">--%>
<%--                <h3 class="ms-3">Reviews</h3>--%>
<%--                <hr>--%>
<%--                <div>--%>
<%--                    <c:choose>--%>
<%--                        <c:when test="${sessionScope.userCookie == null}">--%>
<%--                            <div class="text-center">--%>
<%--                                You'll need to log in to make a review--%>
<%--                                <br/>--%>
<%--                            </div>--%>
<%--                        </c:when>--%>
<%--                        <c:when test="${!sessionScope.isbought}">--%>
<%--                            <div class="text-center">--%>
<%--                                You'll need to buy this book to make a review--%>
<%--                                <br/>--%>
<%--                            </div>--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
<%--                            <c:choose>--%>
<%--                                <c:when test="${sessionScope.isCom}">--%>
<%--                                    <div class="text-center">--%>
<%--                                        You've made a review already--%>
<%--                                        <br/>--%>
<%--                                    </div>--%>
<%--                                </c:when>--%>
<%--                                <c:otherwise>--%>
<%--                                    <h4 class="text-center">Rate this book</h4>--%>
<%--                                    <h6 class="text-center" style="opacity: 50%">Tell others what you think</h6>--%>
<%--                                    <form method="POST" action="<%= request.getServletContext().getContextPath()%>/review">--%>
<%--                                        <input type="number" value="${sessionScope.BOOKINFO.get().getBook_id()}"--%>
<%--                                               id="ordered_book_id" name="ordered_book_id" hidden/>--%>
<%--                                        <input type="number" id="rating" name="rating" min="1" max="5" value="5" hidden/>--%>
<%--                                        <input type="number" value="${sessionScope.userCookie.getValue()}" id="user_id" name="user_id"--%>
<%--                                               hidden/>--%>
<%--                                        <input type="text" id="review_date" name="review_date" hidden/>--%>
<%--                                        <div class="d-flex justify-content-center text-warning mb-2">--%>
<%--                                            <h2 class="bi-star-fill" id="r1" onmouseover="Testing(1)" onmouseleave="UnTesting()"--%>
<%--                                                onclick="AnTesting(1)"></h2>--%>
<%--                                            <h2 class="bi-star-fill" id="r2" onmouseover="Testing(2)" onmouseleave="UnTesting()"--%>
<%--                                                onclick="AnTesting(2)"></h2>--%>
<%--                                            <h2 class="bi-star-fill" id="r3" onmouseover="Testing(3)" onmouseleave="UnTesting()"--%>
<%--                                                onclick="AnTesting(3)"></h2>--%>
<%--                                            <h2 class="bi-star-fill" id="r4" onmouseover="Testing(4)" onmouseleave="UnTesting()"--%>
<%--                                                onclick="AnTesting(4)"></h2>--%>
<%--                                            <h2 class="bi-star-fill" id="r5" onmouseover="Testing(5)" onmouseleave="UnTesting()"--%>
<%--                                                onclick="AnTesting(5)"></h2>--%>
<%--                                        </div>--%>
<%--                                        <div class="d-flex justify-content-center pb-3">--%>
<%--                        <textarea class="center" id="comment" name="comment" rows="4" cols="50" maxlength="200"--%>
<%--                                  placeholder="Describe your experience (optional)" hidden></textarea>--%>
<%--                                        </div>--%>
<%--                                        <div class="d-flex justify-content-center">--%>
<%--                                            <button class="btn btn-outline-dark btn-lg" type="submit" id="btnComment" name="btnComment"--%>
<%--                                                    value="com" hidden>Review--%>
<%--                                            </button>--%>
<%--                                        </div>--%>
<%--                                    </form>--%>
<%--                                </c:otherwise>--%>
<%--                            </c:choose>--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>
<%--                </div>--%>
<%--                <hr>--%>
<%--                <div>--%>
<%--                    <c:forEach var="review" items="${requestScope.reviews}">--%>
<%--                        <div class="row">--%>
<%--                            <div class="col-1">--%>
<%--                                <img id="profileImage" width="60" height="60" class="rounded-circle"--%>
<%--                                     style="object-fit: cover"--%>
<%--                                    &lt;%&ndash;                                                 src="https://dummyimage.com/100x100/000/fff" alt="profileImage">&ndash;%&gt;--%>
<%--                                     src="${review.getUser_image()}"--%>
<%--                                     alt="${review.getUsername()} photo">--%>
<%--                            </div>--%>
<%--                            <div class="col-10">--%>
<%--                                <p class="mb-0">--%>
<%--                                        ${review.getUsername()}--%>
<%--                                </p>--%>
<%--                                <div class="d-flex text-warning">--%>
<%--                                    <c:forEach begin="1" end="${review.getRating()}">--%>
<%--                                        <div class="bi-star-fill"></div>--%>
<%--                                    </c:forEach>--%>
<%--                                    <c:forEach begin="${review.getRating()}" end="4">--%>
<%--                                        <div class="bi-star"></div>--%>
<%--                                    </c:forEach>--%>
<%--                                </div>--%>
<%--                                <p class="mb-4" style="opacity: 50%;">${review.getReview_date()}</p>--%>
<%--                                <p>--%>
<%--                                        ${review.getComment()}--%>
<%--                                </p>--%>
<%--                                <hr>--%>
<%--                            </div>--%>
<%--                            <div class="col-1">--%>
<%--                                <c:choose>--%>
<%--                                    <c:when test="${sessionScope.userCookie.getValue() == review.getUser_id()}">--%>
<%--                                        <form method="POST" action="<%= request.getServletContext().getContextPath()%>/review">--%>
<%--                                            <button onclick="return confirm('Confirm removing this review?')"--%>
<%--                                                    class="btn-close btn-close-dark"--%>
<%--                                                    aria-label="Close"--%>
<%--                                                    name="btnDeleteReview"--%>
<%--                                                    id = "review_${review.getReview_id()}"--%>
<%--                                                    value="${review.getReview_id()}"--%>
<%--                                            ><input type="number" value="${sessionScope.BOOKINFO.get().getBook_id()}"--%>
<%--                                                    name="ordered_book_id" hidden/>--%>
<%--                                            </button>--%>
<%--                                        </form>--%>
<%--                                    </c:when>--%>
<%--                                </c:choose>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </c:forEach>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </section>--%>
<%--        <!-- Back to Top -->--%>
<%--        <a href="#" class="btn btn-light back-to-top"><i class="fa fa-angle-double-up"></i></a>--%>
<%--        <!-- Footer-->--%>
<%--        <%@include file="footer.jsp" %>--%>
<%--    </body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>EShopper - Bootstrap Shop Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <!-- Favicon -->
    <%--    <link href="img/favicon.ico" rel="icon">--%>

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
<%@include file="header-no.jsp" %>


<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Book Detail</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="<%= request.getServletContext().getContextPath()%>/">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Book Detail</p>
        </div>
    </div>
</div>
<!-- Page Header End -->


<!-- Shop Detail Start -->
<div class="container-fluid py-5">
    <div class="row px-xl-5">
        <div class="col-lg-1 col-md-12"></div>
        <div class="col-lg-10 col-md-12">
            <div class="row">
                <div class="col-lg-5 pb-4">
                    <div class="card-img border">
                        <img class="card-img-top mb-5 mb-md-0"
                             src="${sessionScope.BOOKINFO.get().getBook_image()}"
                             alt="${sessionScope.BOOKINFO.get().getTitle()}">
                    </div>
                </div>

                <div class="col-lg-7 pb-4">
                    <div class="pb-3 pt-3">
                        <h3 class="font-weight-semi-bold pb-4"
                            style="font-size: xx-large">${sessionScope.BOOKINFO.get().getTitle()}</h3>
                        <div>
                            <div class="col-12 col-md-12">
                                <a>
                                    Author:
                                    <c:set var="count" value="0"></c:set>
                                    <c:forEach var="author" items="${requestScope.AUTHORLIST}">
                                        <a href="<%= request.getServletContext().getContextPath()%>/author?authorid=${author.getAuthor_id()}"
                                           class="fw-bold text-decoration-none text-dark" style="font-size: large"
                                        >${author.getAuthor_fullname()}</a>
                                        <c:set var="count" value="${count + 1}"/>
                                        <c:if test="${count < requestScope.AUTHORLIST.size()}">
                                            ,
                                        </c:if>
                                    </c:forEach>
                                </a>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-12 d-flex">
                                    <div class="col-12 col-md-6">
                                        <a>Publication date: ${sessionScope.BOOKINFO.get().getPublication_date()}
                                        </a>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <a>Publisher: ${requestScope.PUBLISHERINFO.getPublisher_name()}</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="fs-5 mb-3">
                        <h3 class="font-weight-semi-bold mb-4 mt-3 pt-0"><span><fmt:formatNumber
                                value="${sessionScope.BOOKINFO.get().getPrice()}" minFractionDigits="0"
                                maxFractionDigits="0"/>&#x20AB</span></h3>
                    </div>
                    <p class="mb-4 pb-3"
                       style="font-size: large">${sessionScope.BOOKINFO.get().getBook_description()}</p>
                    <div class="d-flex align-items-center mb-4 pt-2">
                        <div class="input-group quantity mr-3" style="width: 130px;">
<%--                            <div class="input-group-btn">--%>
<%--                                <button class="btn btn-primary btn-minus">--%>
<%--                                    <i class="fa fa-minus"></i>--%>
<%--                                </button>--%>
<%--                            </div>--%>
                            <input type="text" class="form-control bg-secondary text-center" value="Books sold: ${requestScope.TOTALSOLD}" readonly>
<%--                            <div class="input-group-btn">--%>
<%--                                <button class="btn btn-primary btn-plus">--%>
<%--                                    <i class="fa fa-plus"></i>--%>
<%--                                </button>--%>
<%--                            </div>--%>
                        </div>
                        <%--                        <button class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i> Add To Cart--%>
                        <%--                        </button>--%>
                        <c:choose>
                            <c:when test="${sessionScope.userCookie == null}">
                                <button class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1" type="button"
                                                                        name="btnaddtocart"
                                                                        value="${sessionScope.BOOKINFO.get().getBook_id()}"></i>
                                    <i class="bi-cart-fill me-1"></i>
                                    Add to cart
                                </button>
                            </c:when>

                            <c:when test="${!sessionScope.ISINCART}">
                                <form method="POST"
                                      action="<%= request.getServletContext().getContextPath()%>/cart">
                                    <button class="btn btn-primary px-3" type="submit"
                                            name="btnaddtocart"
                                            value="${sessionScope.BOOKINFO.get().getBook_id()}"
                                    >
                                        <i class="fa fa-shopping-cart mr-1"></i> Add To Cart
                                    </button>
                                </form>
                            </c:when>

                            <c:otherwise>
                                <form action="<%= request.getServletContext().getContextPath()%>/cart">
                                    <button class="btn btn-primary px-3" type="submit"
                                            name="cartid"
                                            value="${sessionScope.userCookie.getValue()}"
                                    >
                                        <i class="bi-cart-fill me-1"></i>
                                        View Cart
                                    </button>
                                </form>
                            </c:otherwise>

                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-1 col-md-12"></div>
        <!----------------------------------------------------------------------------------------------------------->
    </div>
    <div class="row px-xl-5 mt-5 pt-5">
        <div class="col">
            <div class="row">
                <div class="col-md-6">
                    <h4 class="mb-4">Check out what others think</h4>
                    <div class="media mb-4">
                        <c:choose>
                            <c:when test="${requestScope.noReviews == true}">
                                <h2>Seems like you're the first one here!</h2>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="review" items="${requestScope.reviews}">
                                    <img src="${review.getUser_image()}" alt="${review.getUsername()} photo"
                                         class="img-fluid mr-3 mt-1 rounded-circle" style="width: 45px;">
                                    <div class="media-body">
                                        <h6>${review.getUsername()} <small> - <i>${review.getReview_date()}</i></small>
                                        </h6>
                                        <div class="text-primary mb-2">
                                            <c:forEach begin="1" end="${review.getRating()}">
                                                <i class="fas fa-star"></i>
                                            </c:forEach>
                                            <c:forEach begin="${review.getRating()}" end="4">
                                                <i class="far fa-star"></i>
                                            </c:forEach>
                                        </div>
                                        <p>${review.getComment()}</p>
                                    </div>
                                    <div>
                                        <c:choose>
                                            <c:when test="${sessionScope.userCookie.getValue() == review.getUser_id()}">
                                                <form method="POST" action="<%= request.getServletContext().getContextPath()%>/review">
                                                    <button
                                                            onclick="return confirm('Confirm removing this review?')"
                                                            class="btn btn-primary px-3"
                                                            id = "review_${review.getReview_id()}"
                                                            name="btnDeleteReview"
                                                            value="${review.getReview_id()}">
                                                        X
                                                        <input type="number" value="${sessionScope.BOOKINFO.get().getBook_id()}"
                                                        name="ordered_book_id" hidden/>
                                                    </button>
                                                </form>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${sessionScope.userCookie == null}">
                        <div class="col-md-6 text-center">
                            You'll need to log in to make a review
                            <br/>
                        </div>
                    </c:when>
                    <c:when test="${!sessionScope.isbought}">
                        <div class="col-md-6 text-center">
                            You'll need to buy this book to make a review
                            <br/>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${sessionScope.isCom}">
                                <div class=" col-md-6 text-center">
                                    You've made a review already
                                    <br/>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-md-6">
                                    <h4 class="mb-4">Leave a review</h4>
                                    <small>Your email address will not be published. Required fields are marked
                                        *</small>
                                    <div class="d-flex my-3" onmouseleave="rating_Stable()">
                                        <p class="mb-0 mr-2">Your Rating * :</p>
                                        <div class="text-primary">
                                            <i class="far fa-star" id="r1" onmouseover="rating_Point(1)"
                                               onclick="rating_Click(1)"></i>
                                            <i class="far fa-star" id="r2" onmouseover="rating_Point(2)"
                                               onclick="rating_Click(2)"></i>
                                            <i class="far fa-star" id="r3" onmouseover="rating_Point(3)"
                                               onclick="rating_Click(3)"></i>
                                            <i class="far fa-star" id="r4" onmouseover="rating_Point(4)"
                                               onclick="rating_Click(4)"></i>
                                            <i class="far fa-star" id="r5" onmouseover="rating_Point(5)"
                                               onclick="rating_Click(5)"></i>
                                        </div>
                                    </div>
                                    <form method="POST"
                                          action="<%= request.getServletContext().getContextPath()%>/review">
                                        <input type="number" value="${sessionScope.BOOKINFO.get().getBook_id()}"
                                               id="ordered_book_id" name="ordered_book_id" hidden/>
                                        <input type="number" id="rating" name="rating" min="1" max="5" value="0"
                                               hidden/>
                                        <input type="number" value="${sessionScope.userCookie.getValue()}" id="user_id"
                                               name="user_id"
                                               hidden/>
                                        <input type="text" id="review_date" name="review_date" hidden/>
                                        <div class="form-group">
                                            <label for="comment">Your Review *</label>
                                            <textarea id="comment" name="comment" cols="30" rows="5"
                                                      class="form-control"></textarea>
                                        </div>
                                        <div class="form-group mb-0">
                                            <button type="submit" class="btn btn-primary px-3" id="btnComment"
                                                    name="btnComment" value="com">Leave Your Review
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
                <!-------------------------------------------->

            </div>
        </div>
    </div>
</div>
<!-- Shop Detail End -->

<!-- Products Start -->
<div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-2 col-md-12"></div>
            <div class="col-lg-8 col-md-12">
                <div class="row pb-3 d-flex justify-content-center">
                    <c:forEach var="book" items="${requestScope.BOOKSBYPUBLISHER}">
                        <div class="col-lg-3 col-md-4 col-md-12 pb-3 justify-content-center d-flex">
                            <div class="card product-item border-0 mb-4"
                                 style="box-shadow: 5px 5px 10px 2px rgba(40, 97, 255, 0.3)">
                                <div class="">
                                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                        <img class="img-fluid w-100" src="${book.getBook_image()}"
                                             alt="${book.getTitle()}"/>
                                    </div>
                                </div>
                                <div class="card-body border-left border-right text-center p-1 pt-4 pb-3">
                                    <h6 class="text-truncate mb-3">${book.getTitle()}</h6>
                                    <div class="d-flex justify-content-center">
                                        <h6><fmt:formatNumber value="${book.getPrice()}" minFractionDigits="0"
                                                              maxFractionDigits="0"/>&#x20AB</h6>
                                    </div>
                                </div>
                                <div class="card-footer d-flex justify-content-center bg-light border">
                                    <a href="<%= request.getServletContext().getContextPath()%>/book?bookid=${book.getBook_id()}"
                                       class="btn btn-sm text-dark p-0 font-weight-bold text-dark"><i
                                            class="fas fa-eye text-primary mr-1"></i>View
                                        Detail</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>>
                </div>
            </div>
            <div class="col-lg-2 col-md-12"></div>
        </div>
    </div>

<!-- Footer Start -->
<%@include file="footer.jsp" %>
<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="mail/jqBootstrapValidation.min.js"></script>
<script src="mail/contact.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>

<!-- Review JS -->
<script src="js/review.js"></script>
</body>

</html>