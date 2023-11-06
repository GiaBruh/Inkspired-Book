<%@ page import="com.example.inkspired.model.Order" %>
<%
    String adminUsername = (String) session.getAttribute("adminUsername");
    String adminFullname = (String) session.getAttribute("adminFullname");
    String adminEmail = (String) session.getAttribute("adminEmail");
%>
<!-- App header starts -->
<div class="app-header d-flex align-items-center">

    <!-- Toggle buttons start -->
    <div class="d-flex">
        <button class="btn btn-primary me-2 toggle-sidebar" id="toggle-sidebar">
            <i class="bi bi-chevron-left fs-5"></i>
        </button>
        <button class="btn btn-primary me-2 pin-sidebar" id="pin-sidebar">
            <i class="bi bi-chevron-left fs-5"></i>
        </button>
    </div>
    <!-- Toggle buttons end -->

    <!-- App brand sm start -->
    <div class="app-brand-sm d-md-none d-sm-block">
        <a href="index.html">
            <img src="${pageContext.request.contextPath}/assets/images/logo-sm.svg" class="logo" alt="Bootstrap Gallery">
        </a>
    </div>
    <!-- App brand sm end -->

    <!-- App header actions start -->
    <div class="header-actions">
        <div class="d-lg-block d-none me-2">

<%--            <!-- Search container start -->--%>
<%--            <div class="input-group">--%>
<%--                <input type="text" class="form-control" placeholder="Search" />--%>
<%--                <button class="btn btn-outline-primary" type="button">--%>
<%--                    <i class="bi bi-search fs-5"></i>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <!-- Search container end -->--%>

        </div>
<%--        <div class="dropdown ms-3">--%>
<%--            <a class="dropdown-toggle d-flex p-2 py-3" href="#!" role="button" data-bs-toggle="dropdown"--%>
<%--               aria-expanded="false">--%>
<%--                <i class="bi bi-grid fs-2 lh-1"></i>--%>
<%--            </a>--%>
<%--            <div class="dropdown-menu dropdown-menu-end shadow">--%>
<%--                <!-- Row start -->--%>
<%--                <div class="d-flex gap-2 m-2">--%>
<%--                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">--%>
<%--                        <img src="${pageContext.request.contextPath}/assets/images/brand-behance.svg" class="img-3x" alt="Admin Themes" />--%>
<%--                    </a>--%>
<%--                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">--%>
<%--                        <img src="${pageContext.request.contextPath}/assets/images/brand-gatsby.svg" class="img-3x" alt="Admin Themes" />--%>
<%--                    </a>--%>
<%--                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">--%>
<%--                        <img src="${pageContext.request.contextPath}/assets/images/brand-google.svg" class="img-3x" alt="Admin Themes" />--%>
<%--                    </a>--%>
<%--                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">--%>
<%--                        <img src="${pageContext.request.contextPath}/assets/images/brand-bitcoin.svg" class="img-3x" alt="Admin Themes" />--%>
<%--                    </a>--%>
<%--                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">--%>
<%--                        <img src="${pageContext.request.contextPath}/assets/images/brand-dribbble.svg" class="img-3x" alt="Admin Themes" />--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--                <!-- Row end -->--%>
<%--            </div>--%>
<%--        </div>--%>
        <div class="dropdown ms-3">
            <a class="dropdown-toggle d-flex p-2 py-3" href="#!" role="button" data-bs-toggle="dropdown"
               aria-expanded="false">
                <div class="notification">
                    <c:set var="count" value="0" />
                    <c:forEach var="order" items="${orders}">
                        <c:if test="${order.order_status == 0 || order.order_status == 6}">
                            <c:set var="count" value="${count + 1}" />
                        </c:if>
                    </c:forEach>
                    <i class="bi bi-bell fs-2 lh-1"></i>
                    <span class="badge" id="notificationCount">${count}</span>

                </div>
            </a>
            <div class="dropdown-menu dropdown-menu-end shadow">
                <c:forEach var="orders" items="${orders}">
                    <c:if test="${orders.order_status == 0}">
                        <div class="dropdown-item">
                            <div class="d-flex py-2 border-bottom">
<%--                                <img src="${pageContext.request.contextPath}/user-image.jpg" class="img-4x me-3 rounded-3" alt="user name" />--%>
                                <div class="m-0">
                                    <h6 class="mb-1 fw-semibold">
                                            <a href="<%= request.getContextPath() %>/admin/order-info?order_id=${orders.order_id}">${orders.full_name}</a>
                                    </h6>
                                    <p class="mb-1">had order in <span class="text-primary">${orders.order_date}</span></p>

                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${orders.order_status == 6}">
                        <div class="dropdown-item">
                            <div class="d-flex py-2 border-bottom">
                                    <%--                                <img src="${pageContext.request.contextPath}/user-image.jpg" class="img-4x me-3 rounded-3" alt="user name" />--%>
                                <div class="m-0">
                                    <h6 class="mb-1 fw-semibold">
                                        <a href="<%= request.getContextPath() %>/admin/order-info?order_id=${orders.order_id}">${orders.full_name}</a>
                                    </h6>
                                    <p class="mb-1 text-danger">had cancel order in <span class="text-primary">${orders.order_date}</span></p>

                                </div>
                            </div>
                        </div>
                    </c:if>

                </c:forEach>
                <div style="display: none" id="noOrderMessage">No new order here</div>


                <div class="border-top py-2 px-3 text-end">
                    <a href="${pageContext.request.contextPath}/admin/table-order">View all order</a>
                </div>
            </div>
        </div>

        <%--            <% String encodedFullName = (String) request.getAttribute("fullName");--%>
        <%--                String fullName = java.net.URLDecoder.decode(encodedFullName, StandardCharsets.UTF_8); %>--%>
        <div class="dropdown ms-3">
            <a id="userSettings" class="dropdown-toggle d-flex py-2 align-items-center text-decoration-none"
               href="#!" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <span class="d-none d-md-block me-2">
                    <!-- username here -->
                    <%= adminFullname %>
                </span>
                <img src="${pageContext.request.contextPath}/assets/images/admin.png" class="rounded-circle img-3x" alt="Admin" />
            </a>
            <div class="dropdown-menu dropdown-menu-end shadow">
                <a class="dropdown-item d-flex align-items-center" href="<%= request.getContextPath()%>/admin/profile"><i
                        class="bi bi-person fs-4 me-2"></i>Profile</a>
                <a class="dropdown-item d-flex align-items-center" href="<%= request.getContextPath() %>/admin/logout"><i
                        class="bi bi-escape fs-4 me-2"></i>Logout</a>
            </div>
        </div>
    </div>
    <!-- App header actions end -->
<script>
    window.onload = function() {
        var count = document.getElementById('notificationCount').innerText;
        if (count == '0') {
            document.getElementById('notificationCount').style.display = 'none';
            document.getElementById('noOrderMessage').style.display = 'block';
        }
    };

</script>
</div>
<!-- App header ends -->