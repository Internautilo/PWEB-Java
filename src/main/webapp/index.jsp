<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%--<% if (session.getAttribute("user") == null) {--%>
<%--    response.sendRedirect("login.jsp");--%>
<%--} %>--%>

<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="bootstrap_5.3/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
    <script defer src="bootstrap_5.3/bootstrap.min.js"></script>
    <%@include file="navbar.jsp"%>
</head>
<body>
    <div id="myCarousel" class="carousel slide mb-8" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class="active" aria-current="true"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item">
                <div class="container">
                    <img src="img/homem%20libelula.jpg" class="img-fluid">
                </div>
            </div>
            <div class="carousel-item active">
                <div class="container">
                    <img src="img/kung%20fusao.jpg" class="img-fluid">
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                        <img src="img/gente%20grande.jpg" class="img-fluid">
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

    <div class="container">
        <div class="row g-4">
            <div class="col-12 col-sm-6 col-md-4 mb-4">
                <div class="card h-100 card-custom">
                    <img src="img/homem%20libelula.jpg" class="card-img-top" alt="Imagem do Cartão 1">
                    <div class="card-body">
                        <h3 class="card-title" style="color: #76ac5f">Super Herói - O Filme</h3>
                        <p class="card-text">O jovem estudante Rick Riker tem sua vida mudada quando, numa excursão a um laboratório de pesquisa animal, é picado por uma libélula geneticamente alterada. No dia seguinte, ele acorda com superpoderes.</p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-4 mb-4">
                <div class="card h-100 card-custom">
                    <img src="img/gente%20grande.jpg" class="card-img-top" alt="Imagem do Cartão 2">
                    <div class="card-body">
                        <h3 class="card-title" style="color: #76ac5f">Gente Grande</h3>
                        <p class="card-text">A morte do treinador de basquete de infância de velhos amigos reúne a turma no mesmo lugar que celebraram um campeonato anos atrás. Os amigos, acompanhados de suas esposas e filhos, descobrem que idade não significa o mesmo que maturidade.</p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-4 mb-4">
                <div class="card h-100 card-custom">
                    <img src="img/kung%20fusao.jpg" class="card-img-top" alt="Imagem do Cartão 2">
                    <div class="card-body">
                        <h3 class="card-title" style="color: #76ac5f">Kung-Fusão</h3>
                        <p class="card-text">Ao tentarem enganar os residentes de Pig Sty Alley, fingindo ser de uma gangue, o estranho Sing e seu amigo idiota Bones são surpreendidos pelos verdadeiros bandidos. Ameaçados, são defendidos por um grande mestre em artes marciais.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>