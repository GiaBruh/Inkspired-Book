

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.min.css" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/bootstrap/bootstrap-icons.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/overlay-scroll/OverlayScrollbars.min.css" />

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<style>
    .badge-success {
        background-color: green; /* Adjust the color as needed */
        border: none; /* Remove the border */
    }
    .badge-failed {
        background-color: red; /* Adjust the color as needed */
        border: none; /* Remove the border */
    }
    .badge-default {
        background-color: rgb(128, 128, 128); /* Adjust the color as needed */
        border: none; /* Remove the border */
    }
    .dropdown-menu {
        min-width: 250px; /* Adjust this value to your needs */
        padding-left: 10px ;
    }

     .hidden-column {
         display: none;
     }

/*     for book image*/
    .custom-file-input {
        position: relative;
    }

    .custom-file-input input[type='file'] {
        display: none;
    }

    .custom-file-input::before {
        content: 'Choose file';
        display: block;
        background: -webkit-linear-gradient(top, #f9f9f9, #e3e3e3);
        border: 1px solid #999;
        border-radius: 3px;
        padding: 5px 8px;
        outline: none;
        white-space: nowrap;
        cursor: pointer;
    }

    .custom-file-input:hover::before {
        border-color: black;
    }

    #custom-file-name {
        margin-left: 10px;
    }
    .notification {
        position: relative;
        display: inline-block;
    }

    .notification .badge {
        position: absolute;
        top: -10px;
        right: -10px;
        padding: 5px 10px;
        border-radius: 50%;
        background-color: red;
        color: white;
    }

</style>