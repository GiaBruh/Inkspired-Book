<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Homepage</title>
        <link rel="stylesheet" href="css/dropdown.css">
        <link rel="stylesheet" href="css/background.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

    </head>
    <%@include file="interface.jsp" %>
    <body>
        <%@include file="header-yes.jsp" %>
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Order Detail</h1>
                </div>
            </div>
        </header>
        <section class="py-5 gradient-custom">
            <div class="container px-4 px-lg-5 my-5">
                <table class="table table-bordered text-center mb-0">
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
                                <td>
                                    <a href="<%= request.getServletContext().getContextPath()%>/book?bookid=${orderdetail.getBook_id()}">${orderdetail.getTitle()}</a>
                                </td>
                                <td class="align-middle">
                                                        <span class="price"><fmt:formatNumber
                                                                value="${orderdetail.getPrice()}" minFractionDigits="0"
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
        <%@include file="footer.jsp"%>
    </body>
</html>
