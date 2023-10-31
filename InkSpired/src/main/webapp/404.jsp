<%@include file="interface.jsp" %>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <title>404</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Dosis:400,300,500,800'>
    <link rel="stylesheet" href="css/404.css">

</head>
<body>
<!-- partial:index.partial.html -->
<div class="content">
    <canvas class="snow" id="snow"></canvas>
    <div class="main-text">
        <h1>Aw jeez.<br/>The page you are looking for<br/>can't be found.</h1>
        <a class="home-link" href="<%= request.getServletContext().getContextPath()%>/">Hitch a ride back home.</a>
    </div>
    <div class="ground">
        <div class="mound">
            <div class="mound_text">404</div>
            <div class="mound_spade"></div>
        </div>
    </div>
</div>
<!-- partial -->
<script  src="js/404.js"></script>
</body>
</html>
