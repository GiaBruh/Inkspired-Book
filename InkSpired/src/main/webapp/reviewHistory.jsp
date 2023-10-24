<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                        <th>Commenter</th>
                        <th>Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <img class="img-fluid" style="max-width: 30%;"
                                 src="https://dummyimage.com/350x400/dee2e6/6c757d.jpg" alt="..."/>
                        </td>
                        <td>I don't read books</td>
                        <td>Destroyer</td>
                        <td>DDD</td>
                        <td>2023/10/31</td>
                    </tr>
                    <tr>
                        <td>
                            <img class="img-fluid" style="max-width: 30%;"
                                 src="https://dummyimage.com/350x400/dee2e6/6c757d.jpg" alt="..."/>
                        </td>
                        <td>I don't read books</td>
                        <td>Destroyer</td>
                        <td>DDD</td>
                        <td>2023/10/31</td>
                    <tr>
                        <td>
                            <img class="img-fluid" style="max-width: 30%;"
                                 src="https://dummyimage.com/350x400/dee2e6/6c757d.jpg" alt="..."/>
                        </td>
                        <td>I don't read books</td>
                        <td>Destroyer</td>
                        <td>DDD</td>
                        <td>2023/10/31</td>
                    </tr>
                    <tr>
                        <td>
                            <img class="img-fluid" style="max-width: 30%;"
                                 src="https://dummyimage.com/350x400/dee2e6/6c757d.jpg" alt="..."/>
                        </td>
                        <td>I don't read books</td>
                        <td>Destroyer</td>
                        <td>DDD</td>
                        <td>2023/10/31</td>
                    </tr>
                    <tr>
                        <td>
                            <img class="img-fluid" style="max-width: 30%;"
                                 src="https://dummyimage.com/350x400/dee2e6/6c757d.jpg" alt="..."/>
                        </td>
                        <td>I don't read books</td>
                        <td>Destroyer</td>
                        <td>DDD</td>
                        <td>2023/10/31</td>
                    </tr>
                    </tbody>
                    <tfoot>
                    <tr>
                        <th>Book Image</th>
                        <th>Book name</th>
                        <th>Comment</th>
                        <th>Commenter</th>
                        <th>Date</th>
                    </tr>
                    </tfoot>
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