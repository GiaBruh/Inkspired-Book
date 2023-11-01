<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Author</title>
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
        <section class="py-5 gradient-custom">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                        <c:choose>
                            <c:when test="${empty requestScope.AUTHORINFO.get().getAuthor_image()}">
                                <img class="card-img-top mb-5 mb-md-0"
                                     src="https://dummyimage.com/125x150/dee2e6/DoDucDat.png&text=DoDucDat"
                                     alt="..."/>
                            </c:when>
                            <c:otherwise>
                                <img class="card-img-top mb-5 mb-md-0"
                                     src="${requestScope.AUTHORINFO.get().getAuthor_image()}"
                                     alt="..."/>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder">${requestScope.AUTHORINFO.get().getAuthor_fullname()}</h1>
                        <p class="lead text-white">${requestScope.AUTHORINFO.get().getAuthor_description()}</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">${requestScope.AUTHORINFO.get().getAuthor_fullname()}'s books</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach var="book" items="${requestScope.BOOKSBYAUTHOR}">
<%--                        <div class="col mb-5">--%>
<%--                            <div class="card h-100">--%>
<%--                                <!-- Product image-->--%>
<%--                                <img class="card-img-top" src="${book.getBook_image()}"--%>
<%--                                     alt="..."/>--%>
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
<%--                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<%=request.getServletContext().getContextPath()%>/book?bookid=${book.getBook_id()}">View--%>
<%--                                    </a></div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
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
                                        <fmt:formatNumber value="${book.getPrice()}" minFractionDigits="0" maxFractionDigits="0"/>&#x20AB
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
                    <%--                    <div class="col mb-5">--%>
                    <%--                        <div class="card h-100">--%>
                    <%--                            <!-- Sale badge-->--%>
                    <%--                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">--%>
                    <%--                                Sale--%>
                    <%--                            </div>--%>
                    <%--                            <!-- Product image-->--%>
                    <%--                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..."/>--%>
                    <%--                            <!-- Product details-->--%>
                    <%--                            <div class="card-body p-4">--%>
                    <%--                                <div class="text-center">--%>
                    <%--                                    <!-- Product name-->--%>
                    <%--                                    <h5 class="fw-bolder">Special Item</h5>--%>
                    <%--                                    <!-- Product reviews-->--%>
                    <%--                                    <div class="d-flex justify-content-center small text-warning mb-2">--%>
                    <%--                                        <div class="bi-star-fill"></div>--%>
                    <%--                                        <div class="bi-star-fill"></div>--%>
                    <%--                                        <div class="bi-star-fill"></div>--%>
                    <%--                                        <div class="bi-star-fill"></div>--%>
                    <%--                                        <div class="bi-star-fill"></div>--%>
                    <%--                                    </div>--%>
                    <%--                                    <!-- Product price-->--%>
                    <%--                                    <span class="text-muted text-decoration-line-through">$20.00</span>--%>
                    <%--                                    $18.00--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                            <!-- Product actions-->--%>
                    <%--                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
                    <%--                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to--%>
                    <%--                                    cart</a></div>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="col mb-5">--%>
                    <%--                        <div class="card h-100">--%>
                    <%--                            <!-- Sale badge-->--%>
                    <%--                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">--%>
                    <%--                                Sale--%>
                    <%--                            </div>--%>
                    <%--                            <!-- Product image-->--%>
                    <%--                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..."/>--%>
                    <%--                            <!-- Product details-->--%>
                    <%--                            <div class="card-body p-4">--%>
                    <%--                                <div class="text-center">--%>
                    <%--                                    <!-- Product name-->--%>
                    <%--                                    <h5 class="fw-bolder">Sale Item</h5>--%>
                    <%--                                    <!-- Product price-->--%>
                    <%--                                    <span class="text-muted text-decoration-line-through">$50.00</span>--%>
                    <%--                                    $25.00--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                            <!-- Product actions-->--%>
                    <%--                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
                    <%--                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to--%>
                    <%--                                    cart</a></div>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="col mb-5">--%>
                    <%--                        <div class="card h-100">--%>
                    <%--                            <!-- Product image-->--%>
                    <%--                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..."/>--%>
                    <%--                            <!-- Product details-->--%>
                    <%--                            <div class="card-body p-4">--%>
                    <%--                                <div class="text-center">--%>
                    <%--                                    <!-- Product name-->--%>
                    <%--                                    <h5 class="fw-bolder">Popular Item</h5>--%>
                    <%--                                    <!-- Product reviews-->--%>
                    <%--                                    <div class="d-flex justify-content-center small text-warning mb-2">--%>
                    <%--                                        <div class="bi-star-fill"></div>--%>
                    <%--                                        <div class="bi-star-fill"></div>--%>
                    <%--                                        <div class="bi-star-fill"></div>--%>
                    <%--                                        <div class="bi-star-fill"></div>--%>
                    <%--                                        <div class="bi-star-fill"></div>--%>
                    <%--                                    </div>--%>
                    <%--                                    <!-- Product price-->--%>
                    <%--                                    $40.00--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                            <!-- Product actions-->--%>
                    <%--                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
                    <%--                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to--%>
                    <%--                                    cart</a></div>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                </div>
            </div>
        </section>
        <!-- Back to Top -->
        <a href="#" class="btn btn-light back-to-top"><i class="fa fa-angle-double-up"></i></a>
        <!-- Footer-->
        <%@include file="footer.jsp" %>
    </body>
</html>