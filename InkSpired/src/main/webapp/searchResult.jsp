<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Book</title>--%>
<%--    <link rel="stylesheet" href="css/dropdown.css">--%>
<%--    <link rel="stylesheet" href="css/background.css">--%>
<%--</head>--%>
<%--<%@include file="interface.jsp" %>--%>
<%--<body>--%>
<%--<%@include file="header-yes.jsp" %>--%>
<%--<!-- Header-->--%>
<%--<header class="bg-dark py-5">--%>
<%--    <div class="container px-4 px-lg-5 my-5">--%>
<%--        <div class="text-center text-white">--%>
<%--            <h1 class="display-4 fw-bolder">Something</h1>--%>
<%--            <p class="lead fw-normal text-white-50 mb-0">Something something</p>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</header>--%>
<%--<!-- Product section-->--%>
<%--<section class="py-5 bg-white">--%>
<%--    <div class="container-fluid px-5 px-lg-5 my-5">--%>
<%--        <div class="row gx-4 gx-lg-5">--%>
<%--            <div class="col-md-4">--%>
<%--                <div class="card">--%>
<%--                    <div class="card-header bg-white text-center align-items-center">--%>
<%--                        <h4 class="fw-bold">--%>
<%--                            <i class="fa-solid fa-filter"></i>--%>
<%--                            Filter</h4>--%>
<%--                    </div>--%>
<%--                    <div class="card-body row">--%>
<%--                        <div class="px-5">--%>
<%--                            <h5 class="fw-bold"> Filter By Category:</h5>--%>
<%--                        </div>--%>
<%--                        <div class="text-center">--%>
<%--                            <table class="table table-borderless">--%>
<%--                                <thead>--%>
<%--                                <tr>--%>
<%--                                    <th>Select</th>--%>
<%--                                    <th>Category</th>--%>
<%--                                </tr>--%>
<%--                                </thead>--%>
<%--                                <tbody>--%>
<%--                                <c:forEach items="${sessionScope.categoryList}" var="category">--%>
<%--                                    <tr>--%>
<%--                                        <td>--%>
<%--                                            <div class="form-check d-flex justify-content-center">--%>
<%--                                                <input class="form-check-input" type="checkbox" value="category1"--%>
<%--                                                       id="checkbox1">--%>
<%--                                                <label class="form-check-label" for="checkbox1"></label>--%>
<%--                                            </div>--%>
<%--                                        </td>--%>
<%--                                        <td>${category.category_name}</td>--%>
<%--                                    </tr>--%>
<%--                                </c:forEach>--%>
<%--                                </tbody>--%>
<%--                            </table>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-md-8">--%>
<%--                <c:choose>--%>
<%--                    <c:when test="${sessionScope.searchResultByCategory == null}">--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${sessionScope.searchResultByKeyword.isEmpty()}">--%>
<%--                                <h1 class="d-flex justify-content-center">There is no result for--%>
<%--                                    "${sessionScope.keyword}"</h1>--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">--%>
<%--                                    <c:forEach var="book" items="${sessionScope.searchResultByKeyword}"--%>
<%--                                               varStatus="loop">--%>
<%--                                        <div class="col mb-5">--%>
<%--                                            <div class="card h-100">--%>
<%--                                                <!-- Product image-->--%>
<%--                                                <img--%>
<%--                                                        class="card-img-top"--%>
<%--                                                        src="${book.getBook_image()}" alt="${book.getTitle()}"/>--%>
<%--                                                <!-- Product details-->--%>
<%--                                                <div class="card-body p-4">--%>
<%--                                                    <div class="text-center">--%>
<%--                                                        <!-- Product name-->--%>
<%--                                                        <h5 class="fw-bolder">${book.getTitle()}</h5>--%>
<%--                                                        <!-- Product price-->--%>
<%--                                                        $40.00 - $80.00--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                                <!-- Product actions-->--%>
<%--                                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                                                    <div class="text-center">--%>
<%--                                                        <a class="btn btn-outline-dark mt-auto"--%>
<%--                                                           href="<%= request.getServletContext().getContextPath()%>/book?bookid=${book.getBook_id()}">--%>
<%--                                                            View options</a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </c:forEach>--%>
<%--                                </div>--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>
<%--                    </c:when>--%>
<%--                    <c:otherwise>--%>
<%--                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">--%>
<%--                            <c:forEach var="book" items="${sessionScope.searchResultByCategory}"--%>
<%--                                       varStatus="loop">--%>
<%--                                <div class="col mb-5">--%>
<%--                                    <div class="card h-100">--%>
<%--                                        <!-- Product image-->--%>
<%--                                        <img--%>
<%--                                                class="card-img-top"--%>
<%--                                                src="${book.getBook_image()}" alt="${book.getTitle()}"/>--%>
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
<%--                    </c:otherwise>--%>
<%--                </c:choose>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<%--<!-- Related items section-->--%>
<%--<section class="py-5 bg-light">--%>
<%--    <div class="container px-4 px-lg-5 mt-5">--%>
<%--        <h2 class="fw-bolder mb-4">Related products</h2>--%>
<%--        <div--%>
<%--                class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center"--%>
<%--        >--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Product image-->--%>
<%--                    <img--%>
<%--                            class="card-img-top"--%>
<%--                            src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"--%>
<%--                            alt="..."--%>
<%--                    />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">Fancy Product</h5>--%>
<%--                            <!-- Product price-->--%>
<%--                            $40.00 - $80.00--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center">--%>
<%--                            <a class="btn btn-outline-dark mt-auto" href="#"--%>
<%--                            >View options</a--%>
<%--                            >--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Sale badge-->--%>
<%--                    <div--%>
<%--                            class="badge bg-dark text-white position-absolute"--%>
<%--                            style="top: 0.5rem; right: 0.5rem"--%>
<%--                    >--%>
<%--                        Sale--%>
<%--                    </div>--%>
<%--                    <!-- Product image-->--%>
<%--                    <img--%>
<%--                            class="card-img-top"--%>
<%--                            src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"--%>
<%--                            alt="..."--%>
<%--                    />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">Special Item</h5>--%>
<%--                            <!-- Product reviews-->--%>
<%--                            <div--%>
<%--                                    class="d-flex justify-content-center small text-warning mb-2"--%>
<%--                            >--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                            </div>--%>
<%--                            <!-- Product price-->--%>
<%--                            <span class="text-muted text-decoration-line-through"--%>
<%--                            >$20.00</span--%>
<%--                            >--%>
<%--                            $18.00--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center">--%>
<%--                            <a class="btn btn-outline-dark mt-auto" href="#"--%>
<%--                            >Add to cart</a--%>
<%--                            >--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Sale badge-->--%>
<%--                    <div--%>
<%--                            class="badge bg-dark text-white position-absolute"--%>
<%--                            style="top: 0.5rem; right: 0.5rem"--%>
<%--                    >--%>
<%--                        Sale--%>
<%--                    </div>--%>
<%--                    <!-- Product image-->--%>
<%--                    <img--%>
<%--                            class="card-img-top"--%>
<%--                            src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"--%>
<%--                            alt="..."--%>
<%--                    />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">Sale Item</h5>--%>
<%--                            <!-- Product price-->--%>
<%--                            <span class="text-muted text-decoration-line-through"--%>
<%--                            >$50.00</span--%>
<%--                            >--%>
<%--                            $25.00--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center">--%>
<%--                            <a class="btn btn-outline-dark mt-auto" href="#"--%>
<%--                            >Add to cart</a--%>
<%--                            >--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Product image-->--%>
<%--                    <img--%>
<%--                            class="card-img-top"--%>
<%--                            src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"--%>
<%--                            alt="..."--%>
<%--                    />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">Popular Item</h5>--%>
<%--                            <!-- Product reviews-->--%>
<%--                            <div--%>
<%--                                    class="d-flex justify-content-center small text-warning mb-2"--%>
<%--                            >--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                            </div>--%>
<%--                            <!-- Product price-->--%>
<%--                            $40.00--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center">--%>
<%--                            <a class="btn btn-outline-dark mt-auto" href="#"--%>
<%--                            >Add to cart</a--%>
<%--                            >--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<%--<!-- Back to Top -->--%>
<%--<a href="#" class="btn btn-light back-to-top"><i class="fa fa-angle-double-up"></i></a>--%>
<%--<!-- Footer-->--%>
<%--<%@include file="footer.jsp" %>--%>
<%--<script src="js/checkbox.js">--%>
<%--</script>--%>
<%--</body>--%>
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
<!-- Topbar Start -->
<%@include file="header-no.jsp" %>
<!-- Topbar End -->

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="<%= request.getServletContext().getContextPath()%>/">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Shop</p>
        </div>
    </div>
</div>
<!-- Page Header End -->


<!-- Shop Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <!-- Shop Sidebar Start -->
        <div class="col-lg-2 col-md-12">
            <%--            <!-- Price Start -->--%>
            <%--            <div class="border-bottom mb-4 pb-4">--%>
            <%--                <h5 class="font-weight-semi-bold mb-4">Filter by price</h5>--%>
            <%--                <form>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
            <%--                        <input type="checkbox" class="custom-control-input" checked id="price-all">--%>
            <%--                        <label class="custom-control-label" for="price-all">All Price</label>--%>
            <%--                        <span class="badge border font-weight-normal">1000</span>--%>
            <%--                    </div>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
            <%--                        <input type="checkbox" class="custom-control-input" id="price-1">--%>
            <%--                        <label class="custom-control-label" for="price-1">$0 - $100</label>--%>
            <%--                        <span class="badge border font-weight-normal">150</span>--%>
            <%--                    </div>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
            <%--                        <input type="checkbox" class="custom-control-input" id="price-2">--%>
            <%--                        <label class="custom-control-label" for="price-2">$100 - $200</label>--%>
            <%--                        <span class="badge border font-weight-normal">295</span>--%>
            <%--                    </div>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
            <%--                        <input type="checkbox" class="custom-control-input" id="price-3">--%>
            <%--                        <label class="custom-control-label" for="price-3">$200 - $300</label>--%>
            <%--                        <span class="badge border font-weight-normal">246</span>--%>
            <%--                    </div>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
            <%--                        <input type="checkbox" class="custom-control-input" id="price-4">--%>
            <%--                        <label class="custom-control-label" for="price-4">$300 - $400</label>--%>
            <%--                        <span class="badge border font-weight-normal">145</span>--%>
            <%--                    </div>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">--%>
            <%--                        <input type="checkbox" class="custom-control-input" id="price-5">--%>
            <%--                        <label class="custom-control-label" for="price-5">$400 - $500</label>--%>
            <%--                        <span class="badge border font-weight-normal">168</span>--%>
            <%--                    </div>--%>
            <%--                </form>--%>
            <%--            </div>--%>
            <%--            <!-- Price End -->--%>

            <%--            <!-- Color Start -->--%>
            <%--            <div class="border-bottom mb-4 pb-4">--%>
            <%--                <h5 class="font-weight-semi-bold mb-4">Filter by color</h5>--%>
            <%--                <form>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
            <%--                        <input type="checkbox" class="custom-control-input" checked id="color-all">--%>
            <%--                        <label class="custom-control-label" for="price-all">All Color</label>--%>
            <%--                        <span class="badge border font-weight-normal">1000</span>--%>
            <%--                    </div>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
            <%--                        <input type="checkbox" class="custom-control-input" id="color-1">--%>
            <%--                        <label class="custom-control-label" for="color-1">Black</label>--%>
            <%--                        <span class="badge border font-weight-normal">150</span>--%>
            <%--                    </div>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
            <%--                        <input type="checkbox" class="custom-control-input" id="color-2">--%>
            <%--                        <label class="custom-control-label" for="color-2">White</label>--%>
            <%--                        <span class="badge border font-weight-normal">295</span>--%>
            <%--                    </div>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
            <%--                        <input type="checkbox" class="custom-control-input" id="color-3">--%>
            <%--                        <label class="custom-control-label" for="color-3">Red</label>--%>
            <%--                        <span class="badge border font-weight-normal">246</span>--%>
            <%--                    </div>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
            <%--                        <input type="checkbox" class="custom-control-input" id="color-4">--%>
            <%--                        <label class="custom-control-label" for="color-4">Blue</label>--%>
            <%--                        <span class="badge border font-weight-normal">145</span>--%>
            <%--                    </div>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">--%>
            <%--                        <input type="checkbox" class="custom-control-input" id="color-5">--%>
            <%--                        <label class="custom-control-label" for="color-5">Green</label>--%>
            <%--                        <span class="badge border font-weight-normal">168</span>--%>
            <%--                    </div>--%>
            <%--                </form>--%>
            <%--            </div>--%>
            <%--            <!-- Color End -->--%>

            <%--            <!-- Size Start -->--%>
            <%--            <div class="mb-5">--%>
            <%--                <h5 class="font-weight-semi-bold mb-4">Filter by size</h5>--%>
            <%--                <form>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
            <%--                        <input type="checkbox" class="custom-control-input" checked id="size-all">--%>
            <%--                        <label class="custom-control-label" for="size-all">All Size</label>--%>
            <%--                        <span class="badge border font-weight-normal">1000</span>--%>
            <%--                    </div>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
            <%--                        <input type="checkbox" class="custom-control-input" id="size-1">--%>
            <%--                        <label class="custom-control-label" for="size-1">XS</label>--%>
            <%--                        <span class="badge border font-weight-normal">150</span>--%>
            <%--                    </div>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
            <%--                        <input type="checkbox" class="custom-control-input" id="size-2">--%>
            <%--                        <label class="custom-control-label" for="size-2">S</label>--%>
            <%--                        <span class="badge border font-weight-normal">295</span>--%>
            <%--                    </div>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
            <%--                        <input type="checkbox" class="custom-control-input" id="size-3">--%>
            <%--                        <label class="custom-control-label" for="size-3">M</label>--%>
            <%--                        <span class="badge border font-weight-normal">246</span>--%>
            <%--                    </div>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
            <%--                        <input type="checkbox" class="custom-control-input" id="size-4">--%>
            <%--                        <label class="custom-control-label" for="size-4">L</label>--%>
            <%--                        <span class="badge border font-weight-normal">145</span>--%>
            <%--                    </div>--%>
            <%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">--%>
            <%--                        <input type="checkbox" class="custom-control-input" id="size-5">--%>
            <%--                        <label class="custom-control-label" for="size-5">XL</label>--%>
            <%--                        <span class="badge border font-weight-normal">168</span>--%>
            <%--                    </div>--%>
            <%--                </form>--%>
            <%--            </div>--%>
            <%--            <!-- Size End -->--%>
        </div>
        <%--        <!-- Shop Sidebar End -->--%>


        <!-- Shop Product Start -->
        <div class="col-lg-8 col-md-12">
            <div class="row pb-3">
                <%--                <div class="col-12 pb-1">--%>
                <%--                    <div class="d-flex align-items-center justify-content-between mb-4">--%>
                <%--                        <form action="">--%>
                <%--                            <div class="input-group">--%>
                <%--                                <input type="text" class="form-control" placeholder="Search by name">--%>
                <%--                                <div class="input-group-append">--%>
                <%--                                        <span class="input-group-text bg-transparent text-primary">--%>
                <%--                                            <i class="fa fa-search"></i>--%>
                <%--                                        </span>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                        </form>--%>
                <%--                        <div class="dropdown ml-4">--%>
                <%--                            <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"--%>
                <%--                                    aria-expanded="false">--%>
                <%--                                Sort by--%>
                <%--                            </button>--%>
                <%--                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">--%>
                <%--                                <a class="dropdown-item" href="#">Latest</a>--%>
                <%--                                <a class="dropdown-item" href="#">Popularity</a>--%>
                <%--                                <a class="dropdown-item" href="#">Best Rating</a>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
                <c:choose>
                    <c:when test="${sessionScope.searchResultByCategory == null}">
                        <c:choose>
                            <c:when test="${sessionScope.searchResultByKeyword.isEmpty()}">
                                <h1 class="d-flex justify-content-center">There is no result for
                                    "${sessionScope.keyword}"</h1>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="book" items="${sessionScope.searchResultByKeyword}" varStatus="loop">
                                    <div class="col-lg-3 col-md-4 col-md-12 pb-3 justify-content-center d-flex">
                                        <div class="card product-item border-0 mb-4">
                                            <div class="">
                                                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                                    <img class="img-fluid w-100" src="${book.getBook_image()}"
                                                         alt="${book.getTitle()}"/>
                                                </div>
                                            </div>
                                            <div class="card-body border-left border-right text-center p-1 pt-4 pb-3">
                                                <h6 class="text-truncate mb-3">${book.getTitle()}</h6>
                                                <div class="d-flex justify-content-center">
                                                    <h6>50000</h6>
                                                    <h6 class="text-muted ml-2">
                                                        <del>100000</del>
                                                    </h6>
                                                </div>
                                            </div>
                                            <div class="card-footer d-flex justify-content-center bg-light border">
                                                <a href="<%= request.getServletContext().getContextPath()%>/book?bookid=${book.getBook_id()}"
                                                   class="btn btn-sm text-dark p-1 justify-content-center d-flex font-weight-bold text-dark" style="font-size: large">View
                                                    Detail</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="book" items="${sessionScope.searchResultByCategory}" varStatus="loop">
                            <div class="col-lg-3 col-md-4 col-md-12 pb-3 justify-content-center d-flex">
                                <div class="card product-item border-0 mb-4">
                                    <div class="">
                                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                            <img class="img-fluid w-100" src="${book.getBook_image()}"
                                                 alt="${book.getTitle()}"/>
                                        </div>
                                    </div>
                                    <div class="card-body border-left border-right text-center p-1 pt-4 pb-3">
                                        <h6 class="text-truncate mb-3">${book.getTitle()}</h6>
                                        <div class="d-flex justify-content-center">
                                            <h6>50000</h6>
                                            <h6 class="text-muted ml-2">
                                                <del>100000</del>
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between bg-light border">
                                        <a href="<%= request.getServletContext().getContextPath()%>/book?bookid=${book.getBook_id()}"
                                           class="btn btn-sm text-dark p-1 justify-content-center d-flex font-weight-bold text-dark" style="font-size: large">View Detail</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                <%--                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">--%>
                <%--                    <div class="card product-item border-0 mb-4">--%>
                <%--                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">--%>
                <%--                            <img class="img-fluid w-100" src="img/product-3.jpg" alt="">--%>
                <%--                        </div>--%>
                <%--                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">--%>
                <%--                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>--%>
                <%--                            <div class="d-flex justify-content-center">--%>
                <%--                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="card-footer d-flex justify-content-between bg-light border">--%>
                <%--                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>--%>
                <%--                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">--%>
                <%--                    <div class="card product-item border-0 mb-4">--%>
                <%--                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">--%>
                <%--                            <img class="img-fluid w-100" src="img/product-4.jpg" alt="">--%>
                <%--                        </div>--%>
                <%--                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">--%>
                <%--                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>--%>
                <%--                            <div class="d-flex justify-content-center">--%>
                <%--                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="card-footer d-flex justify-content-between bg-light border">--%>
                <%--                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>--%>
                <%--                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">--%>
                <%--                    <div class="card product-item border-0 mb-4">--%>
                <%--                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">--%>
                <%--                            <img class="img-fluid w-100" src="img/product-5.jpg" alt="">--%>
                <%--                        </div>--%>
                <%--                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">--%>
                <%--                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>--%>
                <%--                            <div class="d-flex justify-content-center">--%>
                <%--                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="card-footer d-flex justify-content-between bg-light border">--%>
                <%--                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>--%>
                <%--                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">--%>
                <%--                    <div class="card product-item border-0 mb-4">--%>
                <%--                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">--%>
                <%--                            <img class="img-fluid w-100" src="img/product-6.jpg" alt="">--%>
                <%--                        </div>--%>
                <%--                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">--%>
                <%--                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>--%>
                <%--                            <div class="d-flex justify-content-center">--%>
                <%--                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="card-footer d-flex justify-content-between bg-light border">--%>
                <%--                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>--%>
                <%--                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">--%>
                <%--                    <div class="card product-item border-0 mb-4">--%>
                <%--                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">--%>
                <%--                            <img class="img-fluid w-100" src="img/product-7.jpg" alt="">--%>
                <%--                        </div>--%>
                <%--                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">--%>
                <%--                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>--%>
                <%--                            <div class="d-flex justify-content-center">--%>
                <%--                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="card-footer d-flex justify-content-between bg-light border">--%>
                <%--                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>--%>
                <%--                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">--%>
                <%--                    <div class="card product-item border-0 mb-4">--%>
                <%--                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">--%>
                <%--                            <img class="img-fluid w-100" src="img/product-8.jpg" alt="">--%>
                <%--                        </div>--%>
                <%--                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">--%>
                <%--                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>--%>
                <%--                            <div class="d-flex justify-content-center">--%>
                <%--                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="card-footer d-flex justify-content-between bg-light border">--%>
                <%--                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>--%>
                <%--                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">--%>
                <%--                    <div class="card product-item border-0 mb-4">--%>
                <%--                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">--%>
                <%--                            <img class="img-fluid w-100" src="img/product-1.jpg" alt="">--%>
                <%--                        </div>--%>
                <%--                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">--%>
                <%--                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>--%>
                <%--                            <div class="d-flex justify-content-center">--%>
                <%--                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="card-footer d-flex justify-content-between bg-light border">--%>
                <%--                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>--%>
                <%--                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <div class="col-12 pb-1">--%>
                <%--                    <nav aria-label="Page navigation">--%>
                <%--                        <ul class="pagination justify-content-center mb-3">--%>
                <%--                            <li class="page-item disabled">--%>
                <%--                                <a class="page-link" href="#" aria-label="Previous">--%>
                <%--                                    <span aria-hidden="true">&laquo;</span>--%>
                <%--                                    <span class="sr-only">Previous</span>--%>
                <%--                                </a>--%>
                <%--                            </li>--%>
                <%--                            <li class="page-item active"><a class="page-link" href="#">1</a></li>--%>
                <%--                            <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
                <%--                            <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
                <%--                            <li class="page-item">--%>
                <%--                                <a class="page-link" href="#" aria-label="Next">--%>
                <%--                                    <span aria-hidden="true">&raquo;</span>--%>
                <%--                                    <span class="sr-only">Next</span>--%>
                <%--                                </a>--%>
                <%--                            </li>--%>
                <%--                        </ul>--%>
                <%--                    </nav>--%>
                <%--                </div>--%>
            </div>
        </div>
        <div class="col-lg-2 col-md-12"></div>
        <!-- Shop Product End -->
    </div>
</div>
<!-- Shop End -->


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
</body>

</html>
