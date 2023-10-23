<%@ page import="com.example.inkspired.model.Author" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.inkspired.model.Category" %>
<%@ page import="com.example.inkspired.model.Publisher" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Book</title>
    <!-- Add your CSS and other necessary includes here -->
</head>
<body>

<h1>Update Book</h1>

<c:if test="${not empty book}"><jsp:useBean id="book" scope="request" type="com.example.inkspired.model.Book"/>

    <form action="admin/update-book" method="post">
        <input type="text" name="book_id" value="${book.book_id}" readonly>

        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="${book.title}" required><br>

        <label for="date">Date:</label>
        <fmt:formatDate var="formattedDate" value="${book.publication_date}" pattern="yyyy-MM-dd" />
        <input type="date" id="date" name="date" value="${formattedDate}" required><br>

        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" value="${book.quantity}" required><br>

        <label for="price">Price:</label>
        <input type="number" id="price" name="price" value="${book.price}" required><br>

        <% for (Publisher publisher : (List<Publisher>)request.getAttribute("publishers")) { %>
        <input type="radio" name="publisherId" value="<%= publisher.getPublisher_id() %>"
                <%= publisher.getPublisher_name().equals(book.getPublisher_name()) ? "checked" : "" %>>
        <label><%= publisher.getPublisher_name() %></label><br>
        <% } %>

        <label for="description">Description:</label>
        <textarea id="description" name="description" value="${book.book_description}" required>${book.book_description}</textarea><br>

        <label for="image">Image:</label>
        <input type="file" id="image" name="image" value="${book.book_image}" required><br>

        <label for="available">Available:</label>
        <input type="radio" id="available" name="available" value="true" <%= book.isAvailable() ? "checked" : "" %>>
        <input type="radio" id="available" name="available" value="false" <%= !book.isAvailable() ? "checked" : "" %>>


        <!-- Loop over all authors -->
        <%
            String[] bookAuthors = book.getAuthor_fullname().split(", ");
            Set<String> bookAuthorSet = new HashSet<>(Arrays.asList(bookAuthors));
        %>
        <% for (Author author : (List<Author>)request.getAttribute("authors")) { %>
        <input type="checkbox" name="authorIds" value="<%= author.getAuthor_id() %>"
                <%= bookAuthorSet.contains(author.getAuthor_fullname()) ? "checked" : "" %>>
        <label><%= author.getAuthor_fullname() %></label><br>
        <% } %>

        <!-- Loop over all categories -->
        <%
                String[] bookCategories = book.getCategory_name().split(", ");
                Set<String> bookCategorySet = new HashSet<>(Arrays.asList(bookCategories));
        %>
        <% for (Category category : (List<Category>)request.getAttribute("categories")) { %>
        <input type="checkbox" name="categoryIds" value="<%= category.getCategory_id() %>"
        <%= bookCategorySet.contains(category.getCategory_name()) ? "checked" : "" %>
        >
        <label><%= category.getCategory_name() %></label><br>
        <% } %>


        <input type="submit" value="Update Book">
    </form>
</c:if>

</body>
</html>
