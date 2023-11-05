<%@ page import="java.nio.charset.StandardCharsets" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Dashboard</title>

    <!-- Meta -->
    <meta name="description" content="Marketplace for Bootstrap Admin Dashboards" />
    <meta name="Vinh" content="DashBoard" />
    <link rel="canonical" href="https://www.bootstrap.gallery/">
    <meta property="og:url" content="https://www.bootstrap.gallery">
    <meta property="og:description" content="Marketplace for Bootstrap Admin Dashboards">
    <meta property="og:type" content="Website">




    <!-- *************
        ************ CSS Files *************
    ************* -->
    <%@include file="jsp-contribute/admin-interface.jsp" %>



</head>

<body>

<!-- Page wrapper start -->
<div class="page-wrapper">

    <!-- Main container start -->
    <div class="main-container">

        <%@include file="jsp-contribute/admin-menuscroll.jsp"%>

        <!-- App container starts -->
        <div class="app-container">

            <%@include file="jsp-contribute/admin-appheader.jsp"%>

            <!-- App hero header starts -->
            <div class="app-hero-header">
                <h3 class="fw-light mb-5">
                    <span>Admin</span> / <span class="menu-text">Dashboard</span>
                </h3>
            </div>
            <!-- App Hero header ends -->

            <!-- App body starts -->
            <div class="app-body">

                <!-- Row start -->
                <div class="row">
                    <div class="col-lg-4 col-sm-6 col-12">
                        <div class="card shadow mb-4 p-3 rounded-2 justify-content-between flex-row">
                            <div class="mt-3">
                                <h5 class="text-secondary fw-light">Sales</h5>
                                <h1 class="text-primary">3700</h1>
                                <span class="badge border border-primary text-primary me-3">Today</span>
                            </div>
                            <div id="sparkline1"></div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 col-12">
                        <div class="card shadow mb-4 p-3 rounded-2 justify-content-between flex-row">
                            <div class="mt-3">
                                <h5 class="text-secondary fw-light">Expenses</h5>
                                <h1 class="text-primary">2500</h1>
                                <span class="badge border border-primary text-primary me-3">Last week</span>
                            </div>
                            <div id="sparkline2"></div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12 col-12">
                        <div class="card shadow mb-4 p-3 rounded-2 justify-content-between flex-row">
                            <div class="mt-3">
                                <h5 class="text-secondary fw-light">Income</h5>
                                <h1 class="text-primary">250K</h1>
                                <span class="badge border border-primary text-primary me-3">Year 2022</span>
                            </div>
                            <div id="sparkline3"></div>
                        </div>
                    </div>
                </div>
                <!-- Row end -->



                <!-- Row starts -->
                <div class="row">
                    <div class="col-xxl-4 col-sm-6 col-12">
                        <div class="card shadow mb-4">
                            <div class="card-header">
                                <h5 class="card-title">Weekly Sales</h5>
                            </div>
                            <div class="card-body">
                                <div id="weekly-sales"></div>
                                <div class="text-center my-4">
                                    <h2>
                                        6400
                                        <i class="bi bi-arrow-up-right-circle-fill text-primary"></i>
                                    </h2>
                                    <p class="text-truncate m-0">
                                        15% higher than last month
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row ends -->

            </div>
            <!-- App body ends -->

            <!-- App footer start -->
            <div class="app-footer">
                <span> Copyright INKSPIRED BOOKS 2023, always reserved. </span>
            </div>
            <!-- App footer end -->

        </div>
        <!-- App container ends -->

    </div>
    <!-- Main container end -->

</div>
<!-- Page wrapper end -->

<!-- Page script -->
<%@include file="jsp-contribute/admin-script.jsp" %>

</body>

</html>