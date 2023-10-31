<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="java.util.Optional" %>
<%@ page import="com.example.inkspired.model.Review" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" %>
<%@page import="java.text.SimpleDateFormat" %>
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
                    <a href="<%= request.getServletContext().getContextPath()%>/author?authorid="
                       class="fw-bold text-decoration-none"
                    >Do Duc Dat</a
                    >
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
<section class="py-5 gradient-custom">
    <div class="container py-4 h-100" style="background: white;">
        <h3 class="ms-3">Reviews</h3>
        <hr>
        <div>
            <c:choose>
                <c:when test="${sessionScope.userCookie == null}">
                    <div class="text-center">
                        You'll need to log in to make a review
                        <br/>
                    </div>
                </c:when>
                <c:when test="${!sessionScope.isbought}">
                    <div class="text-center">
                        You'll need to buy this book to make a review
                        <br/>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${sessionScope.isCom}">
                            <div class="text-center">
                                You've made a review already
                                <br/>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <h4 class="text-center">Rate this book</h4>
                            <h6 class="text-center" style="opacity: 50%">Tell others what you think</h6>
                            <form method="POST" action="<%= request.getServletContext().getContextPath()%>/review">
                                <input type="number" value="${sessionScope.BOOKINFO.get().getBook_id()}"
                                       id="ordered_book_id" name="ordered_book_id" hidden/>
                                <input type="number" id="rating" name="rating" min="1" max="5" value="5" hidden/>
                                <input type="number" value="${sessionScope.userCookie.getValue()}" id="user_id" name="user_id"
                                       hidden/>
                                <input type="text" id="review_date" name="review_date" hidden/>
                                <div class="d-flex justify-content-center text-warning mb-2">
                                    <h2 class="bi-star-fill" id="r1" onmouseover="Testing(1)" onmouseleave="UnTesting()"
                                        onclick="AnTesting(1)"></h2>
                                    <h2 class="bi-star-fill" id="r2" onmouseover="Testing(2)" onmouseleave="UnTesting()"
                                        onclick="AnTesting(2)"></h2>
                                    <h2 class="bi-star-fill" id="r3" onmouseover="Testing(3)" onmouseleave="UnTesting()"
                                        onclick="AnTesting(3)"></h2>
                                    <h2 class="bi-star-fill" id="r4" onmouseover="Testing(4)" onmouseleave="UnTesting()"
                                        onclick="AnTesting(4)"></h2>
                                    <h2 class="bi-star-fill" id="r5" onmouseover="Testing(5)" onmouseleave="UnTesting()"
                                        onclick="AnTesting(5)"></h2>
                                </div>
                                <div class="d-flex justify-content-center pb-3">
                        <textarea class="center" id="comment" name="comment" rows="4" cols="50" maxlength="200"
                                  placeholder="Describe your experience (optional)" hidden></textarea>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <button class="btn btn-outline-dark btn-lg" id="btnComment" type="submit" name="btnComment"
                                            value="com" hidden>Review
                                    </button>
                                </div>
                            </form>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </div>
        <hr>
        <div>
            <c:forEach var="review" items="${requestScope.reviews}">
                <div class="row">
                    <div class="col-1">
                        <img src="https://dummyimage.com/60x60/000/fff" alt="img">
                    </div>
                    <div class="col-10">
                        <p class="mb-0">
                                ${review.getUsername()}
                        </p>
                        <div class="d-flex text-warning">
                            <c:forEach begin="1" end="${review.getRating()}">
                                <div class="bi-star-fill"></div>
                            </c:forEach>
                            <c:forEach begin="${review.getRating()}" end="4">
                                <div class="bi-star"></div>
                            </c:forEach>
                        </div>
                        <p class="mb-4" style="opacity: 50%;">${review.getReview_date()}</p>
                        <p>
                                ${review.getComment()}
                        </p>
                        <hr>
                    </div>
                    <div class="col-1">
                        <c:choose>
                            <c:when test="${sessionScope.userCookie.getValue() == review.getUser_id()}">
                                <form method="POST" action="<%= request.getServletContext().getContextPath()%>/review">
                                    <button onclick="return confirm('Confirm removing this review?')"
                                            class="btn-close btn-close-dark"
                                            aria-label="Close"
                                            name="btnDeleteReview"
                                            id = "review_${review.getReview_id()}"
                                            value="${review.getReview_id()}"
                                    ><input type="number" value="${sessionScope.BOOKINFO.get().getBook_id()}"
                                            name="ordered_book_id" hidden/>
                                    </button>
                                </form>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<script>
    function uwu() {
        document.getElementById("r1").classList.remove("bi-star");
        document.getElementById("r2").classList.remove("bi-star");
        document.getElementById("r3").classList.remove("bi-star");
        document.getElementById("r4").classList.remove("bi-star");
        document.getElementById("r5").classList.remove("bi-star");
    }

    function Testing(id) {
        uwu();
        for (let i = id + 1; i < 6; i++) {
            var rid = "r" + i;
            document.getElementById(rid).classList.add("bi-star");
        }
    }

    function UnTesting() {
        uwu();
        var rate = parseInt(document.getElementById("rating").value) + 1;
        for (let i = rate; i < 6; i++) {
            var rid = "r" + i;
            document.getElementById(rid).classList.add("bi-star");
        }
    }

    function AnTesting(id) {
        uwu();
        document.getElementById("rating").value = id;
        document.getElementById("comment").removeAttribute("hidden");
        document.getElementById("btnComment").removeAttribute("hidden");
        for (let i = id + 1; i < 6; i++) {
            var rid = "r" + i;
            document.getElementById(rid).classList.add("bi-star");
        }
    }

    const d = new Date();
    document.getElementById("review_date").value = d.toISOString().slice(0, 10);
</script>
<!-- Back to Top -->
<a href="#" class="btn btn-light back-to-top"><i class="fa fa-angle-double-up"></i></a>
<!-- Footer-->
<%@include file="footer.jsp" %>
</body>
</html>
