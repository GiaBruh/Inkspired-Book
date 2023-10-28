<!-- Sidebar wrapper start -->
<nav id="sidebar" class="sidebar-wrapper">

    <!-- App brand starts -->
    <div class="app-brand px-3 py-3 d-flex align-items-center">
        <a href="index.html">
            <img src="${pageContext.request.contextPath}/assets/images/logo.svg" class="logo" alt="Bootstrap Gallery" />
        </a>
    </div>

    <!-- Sidebar menu starts -->
    <!-- Sidebar menu needed
     - dashboard
        + overview
        + simple number sales
        + simple number expenses
        + simple number income
        + just number of customer, books, ordered
     - table,show info, edit, delete
        + customer, address with lock status
        + book with lock status, can delete
        + order with order detail
        + combined order (billed per customer)
        + author, category, publisher (cant delete, or delete with 2 step)

     - chart, statitics (not do it yet)
        + bar chart: number of books per category
        + line chat: sale, expenses, income
        + line chart: number of user signed in per day

     - input
        + form add admin, edit admin (reset too)
        + form add book, edit book
        + form add author, edit author
        + form add category, edit category
        + form add publisher, edit publisher

     - misc
        + profile
        + setting
        + login, logout
        + forgot password
        + 404 page
        + maintenance page
        + print page or import to excel or word
     -->


    <!--My Sidebar menu start -->

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
                        <a href="<%= request.getContextPath() %>/admin/table-user">Customer</a>
                    </li>
                </ul>
            </li>
            <li class="treeview">
                <a href="">
                    <i class="bi bi-pie-chart"></i>
                    <span class="menu-text">Statics</span>
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
