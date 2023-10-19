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
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="index.jsp">Inkspired Books</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
            <form class="d-flex pe-lg-3">
                <button class="btn btn-outline-dark" type="submit">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                </button>
            </form>
            <form class="d-flex">
                <button class="btn btn-outline-dark" type="submit">
                    <i class="bi-person-fill"></i>
                    Login
                </button>
            </form>
            <div class="dropdown">
                <button class="btn btn-outline-dark dropdown-toggle" type="button" id="dropdownMenuButton"
                        data-mdb-toggle="dropdown" aria-expanded="false">
                    Account
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <li><a class="item-dropdown" href="#">User Information</a></li>
                    <li><a class="item-dropdown" href="#">Order History</a></li>
                    <li><a class="item-dropdown" href="#">Review History</a></li>
                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li><a class="item-dropdown" href="#">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>
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
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">
            Copyright INKSPIRED BOOKS 2023, always reserved.
        </p>
    </div>
</footer>
</body>

</html>