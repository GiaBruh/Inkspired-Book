<!-- Sidebar wrapper start -->
<nav id="sidebar" class="sidebar-wrapper">

    <!-- App brand starts -->
    <div class="app-brand px-3 py-3 d-flex align-items-center logo" >
        <a href="<%= request.getContextPath() %>/admin/dashboard">
            <img src="${pageContext.request.contextPath}/assets/images/inspired_admin_flat.jpg" style="width: 220px; height: 70px;border-radius: 8px;"  />
        </a>
    </div>



        <ul class="sidebar-menu">
            <%-- Class: current-page --%>
            <li class="">
                <!-- fix the class active when i choose specific menu options -->
                <a href="<%= request.getContextPath() %>/admin/dashboard">
                    <i class="bi bi-house"></i>
                    <span class="menu-text">Dashboard</span>
                </a>
            </li>
            <li class="treeview">
                <a href="">
                    <i class="bi bi-border-all"></i>
                    <span class="menu-text">Show list of</span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a href="<%= request.getContextPath() %>/admin/table-order">Order, Order Detail</a>
                    </li>
<%--                    <li>--%>
<%--                        <a href="<%= request.getContextPath() %>/admin/table-bill">Bills</a>--%>
<%--                    </li>--%>
                    <li>
                        <a href="<%= request.getContextPath() %>/admin/table-book">Books</a>
                    </li>
                    <li>
                        <a href="<%= request.getContextPath() %>/admin/table-author">Author</a>
                    </li>
                    <li>
                        <a href="<%= request.getContextPath() %>/admin/table-publisher">Publisher</a>
                    </li>
                    <li>
                        <a href="<%= request.getContextPath() %>/admin/table-category">Category</a>
                    </li>
                    <li>
                        <a href="<%= request.getContextPath() %>/admin/table-user">User</a>
                    </li>
                </ul>
            </li>
            <li class="treeview">
                <a href="">
                    <i class="bi bi-pie-chart"></i>
                    <span class="menu-text">Show statistic of</span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a href="accordions.html">Number of books</a>
                    </li>
                    <li>
                        <a href="alerts.html">Sale, expenses, income</a>
                    </li>
                    <li>
                        <a href="buttons.html">Number of user signed</a>
                    </li>

                </ul>
            </li>
            <li class="treeview">
                <a href="">
                    <i class="bi bi-plus-circle"></i>
                    <span class="menu-text">Insert New</span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a href="<%= request.getContextPath() %>/admin/add-book">Books</a>
                    </li>
                    <li>
                        <a href="<%= request.getContextPath() %>/admin/add-author">Author</a>
                    </li>
                    <li>
                        <a href="<%= request.getContextPath() %>/admin/add-publisher">Publisher</a>
                    </li>
                    <li>
                        <a href="<%= request.getContextPath() %>/admin/add-category">Category</a>
                    </li>

                </ul>
            </li>
        </ul>

    <!-- Sidebar menu ends -->

</nav>
<!-- Sidebar wrapper end -->
