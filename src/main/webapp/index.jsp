<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%--<% if (session.getAttribute("user") == null) {--%>
<%--    response.sendRedirect("login.jsp");--%>
<%--} %>--%>

<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="bootstrap_5.3/bootstrap.min.css">
    <script defer src="bootstrap_5.3/bootstrap.min.js"></script>
</head>
    <%@include file="navbar.jsp"%>
<body>

    <div id="myCarousel" class="carousel slide mb-8" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class="active" aria-current="true"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item">
                <div class="container-flex">
                    <img src="img/homem%20libelula.jpg" class="image">
                </div>
            </div>
            <div class="carousel-item active">
                <div class="container-flex">
                    <img src="img/kung%20fusao.jpg" class="image">
                </div>
            </div>
            <div class="carousel-item">
                <div class="container-flex">
                        <img src="img/gente%20grande.jpg" class="image">
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    
    <div class="card">
        <img src="https://via.placeholder.com/250x150" alt="Imagem do Cartão 2">
        <div class="card-content">
            <h3>Título do Cartão 2</h3>
            <p>Este é o conteúdo do cartão 2. Ele possui um efeito de hover suave.</p>
        </div>
    </div>
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>