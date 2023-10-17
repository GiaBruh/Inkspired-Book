<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Shopping cart</title>
        <link rel="stylesheet" href="css/dropdown.css">
        <link rel="stylesheet" href="css/background.css">
    </head>
    <%@include file="interface.jsp" %>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="<%= request.getServletContext().getContextPath()%>/">Inkspired Books</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation"><span
                        class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                    <c:choose>

                        <c:when test="${sessionScope.userCookie == null}">

                            <form class="d-flex pe-lg-3">
                                <button class="btn btn-outline-dark" type="submit">
                                    <i class="bi-cart-fill me-1"></i>
                                    <a href="#">Cart</a>
                                    <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                                </button>
                            </form>

                            <form class="d-flex" method="POST"
                                  action="<%= request.getServletContext().getContextPath()%>/login">
                                <button class="btn btn-outline-dark" type="submit" name="btnLogin"
                                        value="Login">
                                    <i class="bi-person-fill"></i>
                                    Login
                                </button>
                            </form>
                        </c:when>

                        <c:otherwise>

                            <form class="d-flex pe-lg-3">
                                <button class="btn btn-outline-dark" type="submit">
                                    <i class="bi-cart-fill me-1"></i>
                                    <a href="<%= request.getServletContext().getContextPath()%>/cart?cartid=${sessionScope.userCookie.getValue()}">Cart</a>
                                    <span class="badge bg-dark text-white ms-1 rounded-pill">
                                                <%
                                                    ShoppingCartDAO scDao = new ShoppingCartDAO();
                                                    int cartid = Integer.parseInt(((Cookie) session.getAttribute("userCookie")).getValue());
                                                    Optional<ShoppingCart> cart = scDao.get(cartid);
                                                    String quantity = String.valueOf(cart.get().getQuantity());
                                                    out.print(quantity);
                                                %>
                                            </span>
                                </button>
                            </form>

                            <div class="dropdown">
                                <button class="btn btn-outline-dark dropdown-toggle" type="button"
                                        id="dropdownMenuButton" data-mdb-toggle="dropdown" aria-expanded="false">
                                    Account
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li><a class="item-dropdown" href="account.jsp">User Information</a></li>
                                    <li><a class="item-dropdown" href="#">Order History</a></li>
                                    <li><a class="item-dropdown" href="#">Review History</a></li>
                                    <li>
                                        <div class="dropdown-divider"></div>
                                    </li>
                                    <li><a class="item-dropdown"
                                           href="<%= request.getServletContext().getContextPath()%>/logout">Logout</a>
                                    </li>
                                </ul>
                            </div>
                        </c:otherwise>

                    </c:choose>

                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Shopping Cart</h1>
                </div>
            </div>
        </header>
        <!-- Product section-->
        <section class="py-5 gradient-custom">
            <div class="container-fluid pt-5">
                <div class="row px-xl-5">
                    <div class="col-lg-8 table-responsive mb-5">
                        <table class="table table-bordered text-center mb-0">
                            <thead class="bg-secondary text-dark">
                                <tr>
                                    <th>Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Remove</th>
                                </tr>
                            </thead>
                            <tbody class="align-middle">
                                <tr>
                                    <td class="align-middle"><img src="" alt="" style="width: 50px;"> Do Duc Dat</td>
                                    <td class="align-middle">$150</td>
                                    <td class="align-middle">
                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-dark btn-minus">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <input type="text" class="form-control form-control-sm bg-white text-center"
                                                   value="1">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-dark btn-plus">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">$150</td>
                                    <td class="align-middle">
                                        <button class="btn btn-sm btn-dark"><i class="fa fa-times"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="align-middle"><img src="" alt="" style="width: 50px;"> Do Duc Dat</td>
                                    <td class="align-middle">$150</td>
                                    <td class="align-middle">
                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-dark btn-minus">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <input type="text" class="form-control form-control-sm bg-white text-center"
                                                   value="1">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-dark btn-plus">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">$150</td>
                                    <td class="align-middle">
                                        <button class="btn btn-sm btn-dark"><i class="fa fa-times"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="align-middle"><img src="" alt="" style="width: 50px;"> Do Duc Dat</td>
                                    <td class="align-middle">$150</td>
                                    <td class="align-middle">
                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-dark btn-minus">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <input type="text" class="form-control form-control-sm bg-white text-center"
                                                   value="1">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-dark btn-plus">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">$150</td>
                                    <td class="align-middle">
                                        <button class="btn btn-sm btn-dark"><i class="fa fa-times"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="align-middle"><img src="" alt="" style="width: 50px;"> Do Duc Dat</td>
                                    <td class="align-middle">$150</td>
                                    <td class="align-middle">
                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-dark btn-minus">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <input type="text" class="form-control form-control-sm bg-white text-center"
                                                   value="1">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-dark btn-plus">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">$150</td>
                                    <td class="align-middle">
                                        <button class="btn btn-sm btn-dark"><i class="fa fa-times"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="align-middle"><img src="" alt="" style="width: 50px;"> Do Duc Dat</td>
                                    <td class="align-middle">$150</td>
                                    <td class="align-middle">
                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-dark btn-minus">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <input type="text" class="form-control form-control-sm bg-white text-center"
                                                   value="1">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-dark btn-plus">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">$150</td>
                                    <td class="align-middle">
                                        <button class="btn btn-sm btn-dark"><i class="fa fa-times"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="align-middle"><img src="" alt="" style="width: 50px;"> Do Duc Dat</td>
                                    <td class="align-middle">$150</td>
                                    <td class="align-middle">
                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-dark btn-minus">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <input type="text" class="form-control form-control-sm bg-white text-center"
                                                   value="1">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-dark btn-plus">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">$150</td>
                                    <td class="align-middle">
                                        <button class="btn btn-sm btn-dark"><i class="fa fa-times"></i></button>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="col-lg-4">
                        <form class="mb-5" action="">
                            <div class="card border-secondary mb-5">
                                <div class="card-header bg-white border-0">
                                    <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex justify-content-between mb-3 pt-1">
                                        <h6 class="font-weight-medium">Subtotal</h6>
                                        <h6 class="font-weight-medium">$150</h6>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <h6 class="font-weight-medium">Shipping</h6>
                                        <h6 class="font-weight-medium">$10</h6>
                                    </div>
                                </div>
                                <div class="card-footer border-secondary bg-transparent">
                                    <div class="d-flex justify-content-between mt-2">
                                        <h5 class="font-weight-bold">Total</h5>
                                        <h5 class="font-weight-bold">$160</h5>
                                    </div>
                                    <button class="btn btn-block btn-outline-dark my-3 py-3">
                                        <a href="checkout.jsp" class="text-decoration-none">
                                            Proceed To Checkout
                                        </a>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <script src="js/quantity.js"></script>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright INKSPIRED BOOKS 2023, always
                reserved.</p></div>
        </footer>
    </body>
</html>