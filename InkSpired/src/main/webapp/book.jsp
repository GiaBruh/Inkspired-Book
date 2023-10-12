<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Book</title>
        <link rel="stylesheet" href="css/dropdown.css">
        <link rel="stylesheet" href="css/background.css">
    </head>
    <%@include file="interface.jsp" %>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">Inkspired Books</a>
                <div class="col-lg-6 col-6 offset-md-1 text-left">
                    <form action="">
                        <div class="input-group">
                            <div id="navbarExample1">
                                <ul class="navbar-nav me-auto ps-lg-0" style="padding-left: 0.15rem">
                                    <li class="nav-item dropdown position-static">
                                        <button
                                                class="btn btn-outline-dark dropdown-toggle"
                                                type="button"
                                                id="navbarDropdown"
                                                data-mdb-toggle="dropdown"
                                                aria-expanded="false"
                                        >
                                            <i class="fa fa-book"></i>
                                        </button>
                                        <div class="dropdown-menu w-100 mt-0" aria-labelledby="navbarDropdown"
                                             style="border-top-left-radius: 0;border-top-right-radius: 0;">
                                            <div class="container">
                                                <div class="row my-4">
                                                    <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">
                                                        <div class="list-group list-group-flush">
                                                            <a href="" class="list-group-item list-group-item-action">Lorem
                                                                ipsum</a>
                                                            <a href="" class="list-group-item list-group-item-action">Dolor
                                                                sit</a>
                                                            <a href="" class="list-group-item list-group-item-action">Amet
                                                                consectetur</a>
                                                            <a href="" class="list-group-item list-group-item-action">Cras justo
                                                                odio</a>
                                                            <a href="" class="list-group-item list-group-item-action">Adipisicing
                                                                elit</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">
                                                        <div class="list-group list-group-flush">
                                                            <a href="" class="list-group-item list-group-item-action">Explicabo
                                                                voluptas</a>
                                                            <a href="" class="list-group-item list-group-item-action">Perspiciatis
                                                                quo</a>
                                                            <a href="" class="list-group-item list-group-item-action">Cras justo
                                                                odio</a>
                                                            <a href="" class="list-group-item list-group-item-action">Laudantium
                                                                maiores</a>
                                                            <a href="" class="list-group-item list-group-item-action">Provident
                                                                dolor</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-3 mb-3 mb-md-0">
                                                        <div class="list-group list-group-flush">
                                                            <a href="" class="list-group-item list-group-item-action">Iste
                                                                quaerato</a>
                                                            <a href="" class="list-group-item list-group-item-action">Cras justo
                                                                odio</a>
                                                            <a href="" class="list-group-item list-group-item-action">Est
                                                                iure</a>
                                                            <a href="" class="list-group-item list-group-item-action">Praesentium</a>
                                                            <a href=""
                                                               class="list-group-item list-group-item-action">Laboriosam</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-3">
                                                        <div class="list-group list-group-flush">
                                                            <a href="" class="list-group-item list-group-item-action">Cras justo
                                                                odio</a>
                                                            <a href="" class="list-group-item list-group-item-action">Saepe</a>
                                                            <a href="" class="list-group-item list-group-item-action">Vel
                                                                alias</a>
                                                            <a href="" class="list-group-item list-group-item-action">Sunt
                                                                doloribus</a>
                                                            <a href="" class="list-group-item list-group-item-action">Cum
                                                                dolores</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <input type="text" class="form-control border-black" placeholder="Search for products">
                            <div class="input-group-append">
                                <button class="btn btn-dark btn-small">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <button
                        class="navbar-toggler"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                >
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div
                        class="collapse navbar-collapse justify-content-end"
                        id="navbarSupportedContent"
                >
                    <form class="d-flex pe-lg-3">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>

                    <c:choose>
                        <c:when test="${sessionScope.userCookie == null}">
                            <form
                                    class="d-flex"
                                    method="POST"
                                    action="<%= request.getServletContext().getContextPath()%>/login"
                            >
                                <button
                                        class="btn btn-outline-dark"
                                        type="submit"
                                        name="btnLogin"
                                        value="Login"
                                >
                                    <i class="bi-person-fill"></i>
                                    Login
                                </button>
                            </form>
                        </c:when>

                        <c:otherwise>
                            <div class="dropdown">
                                <button
                                        class="btn btn-outline-dark dropdown-toggle"
                                        type="button"
                                        id="dropdownMenuButton"
                                        data-mdb-toggle="dropdown"
                                        aria-expanded="false"
                                >
                                    Account
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li>
                                        <a class="item-dropdown" href="account.jsp"
                                        >User Information</a
                                        >
                                    </li>
                                    <li><a class="item-dropdown" href="#">Order History</a></li>
                                    <li><a class="item-dropdown" href="#">Review History</a></li>
                                    <li>
                                        <div class="dropdown-divider"></div>
                                    </li>
                                    <li>
                                        <a
                                                class="item-dropdown"
                                                href="<%= request.getServletContext().getContextPath()%>/logout"
                                        >Logout</a
                                        >
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
                                src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg"
                                alt="..."
                        />
                    </div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder">How to stay thick like me.</h1>
                        <h3>
                            Author:
                            <a href="author.jsp" class="fw-bold text-decoration-none"
                            >Do Duc Dat</a
                            >
                        </h3>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through">$420.00</span>
                            <span>$69.00</span>
                        </div>
                        <p class="lead">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit.
                            Praesentium at dolorem quidem modi. Nam sequi consequatur
                            obcaecati excepturi alias magni, accusamus eius blanditiis
                            delectus ipsam minima ea iste laborum vero?
                        </p>
                        <div class="d-flex">
                            <label for="inputQuantity"></label
                            ><input
                                class="form-control text-center me-3"
                                id="inputQuantity"
                                type="number"
                                value="1"
                                style="max-width: 6rem"
                        />
                            <form>
                                <div class="form-group">
                                    <label for="formControlRange">Slider for fun</label>
                                    <input
                                            type="range"
                                            class="form-control-range"
                                            id="formControlRange"
                                    />
                                </div>
                            </form>
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button>
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
        <!-- Back to Top -->
        <a href="#" class="btn btn-light back-to-top"><i class="fa fa-angle-double-up"></i></a>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">
                    Copyright INKSPIRED BOOKS 2023, always reserved.
                </p>
            </div>
        </footer>
    </body>
</html>
