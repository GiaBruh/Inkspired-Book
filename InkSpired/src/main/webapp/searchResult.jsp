<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Search</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="<%= request.getServletContext().getContextPath()%>/">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Search</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Shop Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5">
                <!-- Shop Sidebar Start -->
                <div class="col-lg-2 col-md-12"></div>
                <%--        <!-- Shop Sidebar End -->--%>


                <!-- Shop Product Start -->
                <div class="col-lg-8 col-md-12">
                    <div class="row pb-3">
                        <c:choose>
                            <c:when test="${sessionScope.searchResultByCategory == null}">
                                <c:choose>
                                    <c:when test="${sessionScope.searchResultByKeyword.isEmpty()}">
                                        <div id="main">
                                            <div class="fof">
                                                <h2>Sorry, there is no result for "${sessionScope.keyword}".</h2><br>
                                                <h4>Please try again.</h4>
                                            </div>
                                        </div>
                                        <style>
                                            * {
                                                transition: all 0.6s;
                                            }

                                            html {
                                                height: 100%;
                                            }

                                            body {
                                                font-family: 'Lato', sans-serif;
                                                color: #888;
                                                margin: 0;
                                            }

                                            #main {
                                                display: table;
                                                width: 100%;
                                                height: 20px;
                                                text-align: center;
                                            }

                                            .fof {
                                                display: table-cell;
                                                vertical-align: middle;
                                            }

                                            .fof h1 {
                                                font-size: 100px;
                                                display: inline-block;
                                                padding-right: 12px;
                                                animation: type .5s alternate infinite;
                                            }

                                            @keyframes type {
                                                from {
                                                    box-shadow: inset -3px 0px 0px #888;
                                                }
                                                to {
                                                    box-shadow: inset -3px 0px 0px transparent;
                                                }
                                            }
                                        </style>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="book" items="${sessionScope.searchResultByKeyword}"
                                                   varStatus="loop">
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
                                                            <h6><fmt:formatNumber value="${book.getPrice()}"
                                                                                  minFractionDigits="0"
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
                                        </c:forEach>
                                        <c:forEach var="book" items="${requestScope.BOOKLIST}">
                                            <div class="col-lg-3 col-md-4 col-md-12 pb-3 justify-content-center d-flex">
                                                <div class="card product-item border-0 mb-4"
                                                     style="box-shadow: 5px 5px 10px 2px rgba(40, 97, 255, 0.3)">
                                                    <div class="">
                                                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                                            <img class="w-100"
                                                                 style="object-fit: contain; height: 500px"
                                                                 src="${book.getBook_image()}"
                                                                 alt="${book.getTitle()}"/>
                                                        </div>
                                                    </div>
                                                    <div class="card-body border-left border-right text-center p-1 pt-4 pb-3">
                                                        <h6 class="text-truncate mb-3">${book.getTitle()}</h6>
                                                        <div class="d-flex justify-content-center">
                                                            <h6><fmt:formatNumber value="${book.getPrice()}"
                                                                                  minFractionDigits="0"
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
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <%--                        <c:forEach var="book" items="${sessionScope.searchResultByCategory}" varStatus="loop">--%>
                                <%--                            <div class="col-xxl-3 col-xl-3 col-lg-6 col-md-12 pb-3 justify-content-center d-flex">--%>
                                <%--                                <div class="card product-item border-0 mb-4"--%>
                                <%--                                     style="box-shadow: 5px 5px 10px 2px rgba(40, 97, 255, 0.3)">--%>
                                <%--                                    <div class="">--%>
                                <%--                                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">--%>
                                <%--                                            <img class="w-100" style="object-fit: contain; height: 500px"  src="${book.getBook_image()}"--%>
                                <%--                                                 alt="${book.getTitle()}"/>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="card-body border-left border-right text-center p-1 pt-4 pb-3">--%>
                                <%--                                        <h6 class="text-truncate mb-3">${book.getTitle()}</h6>--%>
                                <%--                                        <div class="d-flex justify-content-center">--%>
                                <%--                                            <h6><fmt:formatNumber value="${book.getPrice()}" minFractionDigits="0"--%>
                                <%--                                                                  maxFractionDigits="0"/>&#x20AB</h6>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="card-footer d-flex justify-content-center bg-light border">--%>
                                <%--                                        <a href="<%= request.getServletContext().getContextPath()%>/book?bookid=${book.getBook_id()}"--%>
                                <%--                                           class="btn btn-sm text-dark p-0 font-weight-bold text-dark"><i--%>
                                <%--                                                class="fas fa-eye text-primary mr-1"></i>View--%>
                                <%--                                            Detail</a>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>
                                <%--                            </div>--%>
                                <%--                        </c:forEach>--%>
                                <c:choose>
                                    <c:when test="${sessionScope.searchResultByCategory.isEmpty()}">
                                        <div id="main">
                                            <div class="fof">
                                                <h2>Sorry, there is no result for this category,</h2><br>
                                                <h4>Please try again.</h4>
                                            </div>
                                        </div>
                                        <style>
                                            * {
                                                transition: all 0.6s;
                                            }

                                            html {
                                                height: 100%;
                                            }

                                            body {
                                                font-family: 'Lato', sans-serif;
                                                color: #888;
                                                margin: 0;
                                            }

                                            #main {
                                                display: table;
                                                width: 100%;
                                                height: 20px;
                                                text-align: center;
                                            }

                                            .fof {
                                                display: table-cell;
                                                vertical-align: middle;
                                            }

                                            .fof h1 {
                                                font-size: 100px;
                                                display: inline-block;
                                                padding-right: 12px;
                                                animation: type .5s alternate infinite;
                                            }

                                            @keyframes type {
                                                from {
                                                    box-shadow: inset -3px 0px 0px #888;
                                                }
                                                to {
                                                    box-shadow: inset -3px 0px 0px transparent;
                                                }
                                            }
                                        </style>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="book" items="${sessionScope.searchResultByCategory}"
                                                   varStatus="loop">
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
                                                            <h6><fmt:formatNumber value="${book.getPrice()}"
                                                                                  minFractionDigits="0"
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
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
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
