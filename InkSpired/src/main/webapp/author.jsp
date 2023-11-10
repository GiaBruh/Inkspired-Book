<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Author Info</title>
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
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Author</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="<%= request.getServletContext().getContextPath()%>/">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Author</p>
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
                             src="${requestScope.AUTHORINFO.get().getAuthor_image()}"
                             alt="${requestScope.AUTHORINFO.get().getAuthor_fullname()}">
                    </div>
                </div>

                <div class="col-lg-7 pb-4">
                    <div class="pb-3 pt-3">
                        <h3 class="font-weight-semi-bold pb-4"
                            style="font-size: xx-large">${requestScope.AUTHORINFO.get().getAuthor_fullname()}</h3>
                    </div>
                    <p class="mb-4 pb-3"
                       style="font-size: large">${requestScope.AUTHORINFO.get().getAuthor_description()}</p>
                </div>
            </div>
        </div>
        <div class="col-lg-1 col-md-12"></div>
    </div>
</div>
<!-- Shop Detail End -->


<!-- Products Start -->
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">Books by ${requestScope.AUTHORINFO.get().getAuthor_fullname()}</span></h2>
    </div>
    <div class="row px-xl-5 pb-3">
        <div class="col-lg-2 col-md-12"></div>
        <div class="col-lg-8 col-md-12">
            <div class="row pb-3 d-flex justify-content-center">
                <c:forEach var="book" items="${requestScope.BOOKSBYAUTHOR}">
<%--                    <div class="col-lg-3 col-md-4 col-md-12 pb-3 justify-content-center d-flex">--%>
<%--                        <div class="card product-item border-0 mb-4"--%>
<%--                             style="box-shadow: 5px 5px 10px 2px rgba(40, 97, 255, 0.3)">--%>
<%--                            <div class="">--%>
<%--                                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">--%>
<%--                                    <img class="img-fluid w-100" src="${book.getBook_image()}"--%>
<%--                                         alt="${book.getTitle()}"/>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="card-body border-left border-right text-center p-1 pt-4 pb-3">--%>
<%--                                <h6 class="text-truncate mb-3">${book.getTitle()}</h6>--%>
<%--                                <div class="d-flex justify-content-center">--%>
<%--                                    <h6><fmt:formatNumber value="${book.getPrice()}" minFractionDigits="0"--%>
<%--                                                          maxFractionDigits="0"/>&#x20AB</h6>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="card-footer d-flex justify-content-center bg-light border">--%>
<%--                                <a href="<%= request.getServletContext().getContextPath()%>/book?bookid=${book.getBook_id()}"--%>
<%--                                   class="btn btn-sm text-dark p-0 font-weight-bold text-dark"><i--%>
<%--                                        class="fas fa-eye text-primary mr-1"></i>View--%>
<%--                                    Detail</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="col-xxl-3 col-xl-3 col-lg-6 col-md-12 pb-3 justify-content-center d-flex">
                        <div class="card product-item border-0 mb-4" style="box-shadow: 5px 5px 10px 2px rgba(40, 97, 255, 0.3); width: 400px; height: 625px;">
                            <div class="">
                                <div style="height: 450px;" class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                    <img class="w-100 " style="
                                    object-fit: contain; height: 450px" src="${book.getBook_image()}"
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
                                   class="btn btn-sm text-dark p-0 font-weight-bold text-dark"><i class="fas fa-eye text-primary mr-1"></i>View
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
<!-- Products End -->


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