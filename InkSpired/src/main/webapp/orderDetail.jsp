<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--    <head>--%>
<%--        <title>Homepage</title>--%>
<%--        <link rel="stylesheet" href="css/dropdown.css">--%>
<%--        <link rel="stylesheet" href="css/background.css">--%>
<%--        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">--%>
<%--        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>--%>
<%--        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>--%>

<%--    </head>--%>
<%--    <%@include file="interface.jsp" %>--%>
<%--    <body>--%>
<%--        <%@include file="header-yes.jsp" %>--%>
<%--        <header class="bg-dark py-5">--%>
<%--            <div class="container px-4 px-lg-5 my-5">--%>
<%--                <div class="text-center text-white">--%>
<%--                    <h1 class="display-4 fw-bolder">Order Detail</h1>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </header>--%>
<%--        <section class="py-5 gradient-custom">--%>
<%--            <div class="container px-4 px-lg-5 my-5">--%>
<%--                <table class="table table-bordered text-center mb-0">--%>
<%--                    <thead class="bg-secondary text-dark">--%>
<%--                        <tr>--%>
<%--                            <th colspan="2">Products</th>--%>
<%--                            <th>Price</th>--%>
<%--                            <th>Quantity</th>--%>
<%--                        </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody class="align-middle">--%>
<%--                        <c:forEach var="orderdetail" items="${sessionScope.ORDERDETAIL}">--%>
<%--                            <tr>--%>
<%--                                <td class="align-left">--%>
<%--                                    <img src="${orderdetail.getBook_image()}"--%>
<%--                                         alt="${orderdetail.getTitle()}"--%>
<%--                                         style="height: 170px;">--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <a href="<%= request.getServletContext().getContextPath()%>/book?bookid=${orderdetail.getBook_id()}">${orderdetail.getTitle()}</a>--%>
<%--                                </td>--%>
<%--                                <td class="align-middle">--%>
<%--                                                        <span class="price"><fmt:formatNumber--%>
<%--                                                                value="${orderdetail.getPrice()}" minFractionDigits="0"--%>
<%--                                                                maxFractionDigits="0"/></span>&#x20AB--%>
<%--                                </td>--%>
<%--                                <td class="align-middle">--%>
<%--                                    <div id="quantity${orderdetail.getBook_id()}">--%>
<%--                                        <span>${orderdetail.getQuantity()}</span>--%>
<%--                                    </div>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </section>--%>
<%--        <%@include file="footer.jsp"%>--%>
<%--    </body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Order Detail</title>
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

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-0">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">ORDER DETAIL</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="<%= request.getServletContext().getContextPath()%>/">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Order Detail</p>
        </div>
    </div>
</div>

<section class="py-5 gradient-custom">
    <div class="container px-4 px-lg-5 my-5">
        <table class="table table-bordered text-center mb-0" style="box-shadow: 5px 5px 10px 2px rgba(40, 97, 255, 0.3)">
            <thead class="bg-secondary text-dark">
            <tr>
                <th colspan="2">Products</th>
                <th>Price</th>
                <th>Quantity</th>
            </tr>
            </thead>
            <tbody class="align-middle">
            <c:forEach var="orderdetail" items="${sessionScope.ORDERDETAIL}">
                <tr>
                    <td class="align-left">
                        <img src="${orderdetail.getBook_image()}"
                             alt="${orderdetail.getTitle()}"
                             style="height: 170px;">
                    </td>
                    <td class="align-middle">
                        <a href="<%= request.getServletContext().getContextPath()%>/book?bookid=${orderdetail.getBook_id()}">${orderdetail.getTitle()}</a>
                    </td>
                    <td class="align-middle"><span class="price"><fmt:formatNumber
                            value="${orderdetail.getPrice()}"
                            minFractionDigits="0"
                            maxFractionDigits="0"/></span>&#x20AB
                    </td>
                    <td class="align-middle">
                        <div id="quantity${orderdetail.getBook_id()}">
                            <span>${orderdetail.getQuantity()}</span>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</section>

<%@include file="footer.jsp" %>

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