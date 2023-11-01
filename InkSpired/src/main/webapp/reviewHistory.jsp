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
            <h1 class="display-4 fw-bolder">Review History</h1>
        </div>
    </div>
</header>
<section class="py-5 gradient-custom">
    <div class="container px-4 px-lg-5 my-5">
        <div class="card">
            <div class="card-body">
                <table id="example" class="table table-striped" style="width:100%">
                    <thead>
                    <tr>
                        <th>Book Image</th>
                        <th>Book name</th>
                        <th>Comment</th>
                        <th>Rating</th>
                        <th>Date</th>
                        <th>Del</th>
                    </tr>
                    </thead>
                    <tbody class="align-middle">
                    <c:forEach var="review" items="${requestScope.reviews}">
                    <tr>
                        <td>
                            <img src="${review.getBook_image()}" alt="${review.getBook_image()}"
                                 style="height: 170px;">
                        </td>
                        <td>
                            <a href="<%= request.getServletContext().getContextPath()%>/book?bookid=${review.getOrdered_book_id()}">${review.getBook_name()}</a>
                        </td>
                        <td>${review.getComment()}</td>
                        <td>
                            <div class="d-flex text-warning">
                                <c:forEach begin="1" end="${review.getRating()}">
                                    <div class="bi-star-fill"></div>
                                </c:forEach>
                                <c:forEach begin="${review.getRating()}" end="4">
                                    <div class="bi-star"></div>
                                </c:forEach>
                            </div>
                        </td>
                        <td>${review.getReview_date()}</td>
                        <td>
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
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<script>
    new DataTable('#example');
</script>
<%@include file="footer.jsp"%>
</body>

</html>