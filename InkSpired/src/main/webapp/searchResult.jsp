<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book</title>
    <link rel="stylesheet" href="css/dropdown.css">
    <link rel="stylesheet" href="css/background.css">
</head>
<%@include file="interface.jsp" %>
<body>
<%@include file="header-yes.jsp" %>
<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Something</h1>
            <p class="lead fw-normal text-white-50 mb-0">Something something</p>
        </div>
    </div>
</header>
<!-- Product section-->
<section class="py-5 bg-white">
    <div class="container-fluid px-5 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header bg-white text-center align-items-center">
                        <h4 class="fw-bold">
                            <i class="fa-solid fa-filter"></i>
                            Filter</h4>
                    </div>
                    <div class="card-body row">
                        <div class="px-5">
                            <h5 class="fw-bold"> Filter By Category:</h5>
                        </div>
                        <div class="text-center">
                            <table class="table table-borderless">
                                <thead>
                                <tr>
                                    <th>Select</th>
                                    <th>Category</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="menuItems"
                                       value="${['Lorem ipsum', 'Dolor sit', 'Amet consectetur', 'Cras justo odio', 'Adipisicing elit']}"/>
                                <c:forEach items="${menuItems}" var="menuItem">
                                    <tr>
                                        <td>
                                            <div class="form-check d-flex justify-content-center">
                                                <input class="form-check-input" type="checkbox" value="category1"
                                                       id="checkbox1">
                                                <label class="form-check-label" for="checkbox1"></label>
                                            </div>
                                        </td>
                                        <td>${menuItem}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <c:choose>
                    <c:when test="${sessionScope.searchResultByKeyword.isEmpty()}">
                        <h1 class="d-flex justify-content-center">There is no result for "${sessionScope.keyword}"</h1>
                    </c:when>
                    <c:otherwise>
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                            <c:forEach var="book" items="${sessionScope.searchResultByKeyword}" varStatus="loop">
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Product image-->
                                        <img
                                                class="card-img-top"
                                                src="${book.getBook_image()}" alt="${book.getTitle()}"/>
                                        />
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${book.getTitle()}</h5>
                                                <!-- Product price-->
                                                $40.00 - $80.00
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center">
                                                <a class="btn btn-outline-dark mt-auto"
                                                   href="<%= request.getServletContext().getContextPath()%>/book?bookid=${book.getBook_id()}">
                                                    View options</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
<%--                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">--%>
<%--                            <c:forEach var="book" items="${sessionScope.searchResultByAuthor}" varStatus="loop">--%>
<%--                                <div class="col mb-5">--%>
<%--                                    <div class="card h-100">--%>
<%--                                        <!-- Product image-->--%>
<%--                                        <img--%>
<%--                                                class="card-img-top"--%>
<%--                                                src="${book.getBook_image()}" alt="${book.getTitle()}"/>--%>
<%--                                        />--%>
<%--                                        <!-- Product details-->--%>
<%--                                        <div class="card-body p-4">--%>
<%--                                            <div class="text-center">--%>
<%--                                                <!-- Product name-->--%>
<%--                                                <h5 class="fw-bolder">${book.getTitle()}</h5>--%>
<%--                                                <!-- Product price-->--%>
<%--                                                $40.00 - $80.00--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <!-- Product actions-->--%>
<%--                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                                            <div class="text-center">--%>
<%--                                                <a class="btn btn-outline-dark mt-auto"--%>
<%--                                                   href="<%= request.getServletContext().getContextPath()%>/book?bookid=${book.getBook_id()}">--%>
<%--                                                    View options</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </c:forEach>--%>
<%--                        </div>--%>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</section>
<!-- Related items section-->
<section class="py-5 bg-light">
    <div class="container px-4 px-lg-5 mt-5">
        <h2 class="fw-bolder mb-4">Related products</h2>
        <div
                class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center"
        >
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <img
                            class="card-img-top"
                            src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                            alt="..."
                    />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">Fancy Product</h5>
                            <!-- Product price-->
                            $40.00 - $80.00
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                            <a class="btn btn-outline-dark mt-auto" href="#"
                            >View options</a
                            >
                        </div>
                    </div>
                </div>
            </div>
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Sale badge-->
                    <div
                            class="badge bg-dark text-white position-absolute"
                            style="top: 0.5rem; right: 0.5rem"
                    >
                        Sale
                    </div>
                    <!-- Product image-->
                    <img
                            class="card-img-top"
                            src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                            alt="..."
                    />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">Special Item</h5>
                            <!-- Product reviews-->
                            <div
                                    class="d-flex justify-content-center small text-warning mb-2"
                            >
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                            </div>
                            <!-- Product price-->
                            <span class="text-muted text-decoration-line-through"
                            >$20.00</span
                            >
                            $18.00
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                            <a class="btn btn-outline-dark mt-auto" href="#"
                            >Add to cart</a
                            >
                        </div>
                    </div>
                </div>
            </div>
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Sale badge-->
                    <div
                            class="badge bg-dark text-white position-absolute"
                            style="top: 0.5rem; right: 0.5rem"
                    >
                        Sale
                    </div>
                    <!-- Product image-->
                    <img
                            class="card-img-top"
                            src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                            alt="..."
                    />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">Sale Item</h5>
                            <!-- Product price-->
                            <span class="text-muted text-decoration-line-through"
                            >$50.00</span
                            >
                            $25.00
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                            <a class="btn btn-outline-dark mt-auto" href="#"
                            >Add to cart</a
                            >
                        </div>
                    </div>
                </div>
            </div>
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <img
                            class="card-img-top"
                            src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                            alt="..."
                    />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">Popular Item</h5>
                            <!-- Product reviews-->
                            <div
                                    class="d-flex justify-content-center small text-warning mb-2"
                            >
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                            </div>
                            <!-- Product price-->
                            $40.00
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                            <a class="btn btn-outline-dark mt-auto" href="#"
                            >Add to cart</a
                            >
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Back to Top -->
<a href="#" class="btn btn-light back-to-top"><i class="fa fa-angle-double-up"></i></a>
<!-- Footer-->
<%@include file="footer.jsp" %>
</body>
</html>
