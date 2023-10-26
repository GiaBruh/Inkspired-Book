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
        <section class="py-5 gradient-custom">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                        <img
                                class="card-img-top mb-5 mb-md-0"
                                src="${sessionScope.BOOKINFO.get().getBook_image()}"
                                alt="${sessionScope.BOOKINFO.get().getTitle()}"
                        />
                    </div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder">${sessionScope.BOOKINFO.get().getTitle()}</h1>
                        <h3>
                            Author:
                            <c:set var="count" value="0"></c:set>
                            <c:forEach var="author" items="${requestScope.AUTHORLIST}">
                                <a href="<%= request.getServletContext().getContextPath()%>/author?authorid=${author.getAuthor_id()}"
                                   class="fw-bold text-decoration-none"
                                >${author.getAuthor_fullname()}</a>
                                <c:set var="count" value="${count + 1}"/>
                                <c:if test="${count < requestScope.AUTHORLIST.size()}">
                                    ,
                                </c:if>
                            </c:forEach>
                        </h3>
                        <div class="fs-5 mb-5">
                            <%--                            <span class="text-decoration-line-through">$420.00</span>--%>
                            <span>${sessionScope.BOOKINFO.get().getPrice()}&#x20AB</span>
                        </div>
                        <p class="lead">
                            ${sessionScope.BOOKINFO.get().getBook_description()}
                        </p>
                        <div class="d-flex">
                            <label for="inputQuantity"></label>
                            <input
                                    class="form-control text-center me-3"
                                    id="inputQuantity"
                                    type="number"
                                    value="1"
                                    style="max-width: 6rem"
                            />

                            <c:choose>

                                <c:when test="${sessionScope.userCookie == null}">
                                    <button class="btn btn-outline-dark flex-shrink-0" type="button"
                                            name="btnaddtocart"
                                            value="${sessionScope.BOOKINFO.get().getBook_id()}"
                                    >
                                        <i class="bi-cart-fill me-1"></i>
                                        Add to cart
                                    </button>
                                </c:when>

                                <c:when test="${!sessionScope.ISINCART}">
                                    <form method="POST"
                                          action="<%= request.getServletContext().getContextPath()%>/cart">
                                        <button class="btn btn-outline-dark flex-shrink-0" type="submit"
                                                name="btnaddtocart"
                                                value="${sessionScope.BOOKINFO.get().getBook_id()}"
                                        >
                                            <i class="bi-cart-fill me-1"></i>
                                            Add to cart
                                        </button>
                                    </form>
                                </c:when>

                                <c:otherwise>
                                    <form action="<%= request.getServletContext().getContextPath()%>/cart">
                                        <button class="btn btn-outline-dark flex-shrink-0" type="submit"
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
