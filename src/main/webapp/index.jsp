<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
} %>

<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="bootstrap_5.3/bootstrap.min.css">
    <script defer src="bootstrap_5.3/bootstrap.min.js"></script>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
</body>
</html>