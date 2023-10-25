<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>Homepage</title>
    <link rel="stylesheet" href="css/dropdown.css">
    <link rel="stylesheet" href="css/background.css">
</head>
<%@include file="interface.jsp" %>

    <body>
    <%@include file="header-yes.jsp"%>
<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Something</h1>
            <p class="lead fw-normal text-white-50 mb-0">Something something</p>
        </div>
    </div>
</header>
<!-- Section-->
<section class="py-5 gradient-custom">
    <div id="carouselExample" class="carousel slide">
        <div class="carousel-inner">
            <%-- First, shuffle the BOOKLIST randomly --%>
            <%@ page import="java.util.Collections" %>
            <%@ page import="com.example.inkspired.model.Book" %>
            <%@ page import="java.util.List" %>

            <%
                List<Book> bookList = (List<Book>) request.getAttribute("BOOKLIST");
                Collections.shuffle(bookList);
            %>

            <c:forEach var="book" items="${requestScope.BOOKLIST}" varStatus="loop">
            <c:choose>
            <c:when test="${loop.index == 0}">
            <div class="carousel-item active">
                </c:when>
                <c:otherwise>
                <div class="carousel-item">
                    </c:otherwise>
                    </c:choose>

                    <div class="carousel-caption d-none d-md-block">
                        <h5>${book.getTitle()}</h5>
<%--                        <p>${book.getPrice()}&#x20AB</p>--%>
                    </div>
                    <img src="https://dummyimage.com/600x400/000/fff" class="d-block m-auto" alt="...">
                </div>
                </c:forEach>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                <c:forEach var="book" items="${requestScope.BOOKLIST}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img height="350px" width="100%" class="card-img-top"
                                 src="${book.getBook_image()}" alt="${book.getTitle()}"/>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">
                                            ${book.getTitle()}
                                        <br/>
                                    </h5>
                                    <!-- Product price-->
                                        ${book.getPrice()}&#x20AB
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto"
                                       href="<%= request.getServletContext().getContextPath()%>/book?bookid=${book.getBook_id()}">View
                                        Book</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
</section>
<!-- Back to Top -->
<a href="#" class="btn btn-light back-to-top"><i class="fa fa-angle-double-up"></i></a>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">
            Copyright INKSPIRED BOOKS 2023, always reserved.
        </p>
    </div>
</footer>
</body>

</html>