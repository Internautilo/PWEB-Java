<%@ page import="com.model.Filme" %>
<%@ page import="com.dao.FilmeDAO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    List<Filme> filmes = FilmeDAO.listar();
    Filme heroi = filmes.get(0);
    Filme gente = filmes.get(1);
    Filme kung = filmes.get(2);
%>

<!DOCTYPE html>
<html data-bs-theme="light">
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="bootstrap_5.3/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
    <script defer src="bootstrap_5.3/bootstrap.min.js"></script>
    <%@include file="navbar.jsp"%>
</head>
<body>
    <div id="myCarousel" class="carousel slide mb-8 mt-0" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class="active" aria-current="true"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item">
                <div class="container">
                    <img src="upload/<%=heroi.imagem%>" class="img-fluid rounded rounded-1">
                </div>
            </div>
            <div class="carousel-item active">
                <div class="container">
                    <img src="upload/<%=gente.imagem%>" class="img-fluid rounded rounded-1">
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                        <img src="upload/<%=kung.imagem%>" class="img-fluid rounded rounded-1">
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
            <div class="col-12 col-sm-6 col-md-4 mb-4 rounded rounded-1">
                <div class="card h-100 card-custom">
                    <img src="upload/<%=heroi.imagem%>" class="card-img-top" style="cursor: pointer" alt="Imagem do Cartão 1" onclick="window.location.href = 'filme?id=<%=heroi.id%>'">
                    <div class="card-body">
                        <h3 class="card-title" style="color: #76ac5f">Super Herói - O Filme</h3>
                        <p class="card-text">O jovem estudante Rick Riker tem sua vida mudada quando, numa excursão a um laboratório de pesquisa animal, é picado por uma libélula geneticamente alterada. No dia seguinte, ele acorda com superpoderes.</p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-4 mb-4 rounded rounded-1">
                <div class="card h-100 card-custom">
                    <img src="upload/<%=gente.imagem%>" class="card-img-top" style="cursor: pointer" alt="Imagem do Cartão 2" onclick="window.location.href = 'filme?id=<%=gente.id%>'">
                    <div class="card-body">
                        <h3 class="card-title" style="color: #76ac5f">Gente Grande</h3>
                        <p class="card-text">A morte do treinador de basquete de infância de velhos amigos reúne a turma no mesmo lugar que celebraram um campeonato anos atrás. Os amigos, acompanhados de suas esposas e filhos, descobrem que idade não significa o mesmo que maturidade.</p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-4 mb-4 rounded rounded-1">
                <div class="card h-100 card-custom">
                    <img src="upload/<%=kung.imagem%>" class="card-img-top" style="cursor: pointer" alt="Imagem do Cartão 3" onclick="window.location.href = 'filme?id=<%=kung.id%>'">
                    <div class="card-body">
                        <h3 class="card-title" style="color: #76ac5f">Kung-Fusão</h3>
                        <p class="card-text">Ao tentarem enganar os residentes de Pig Sty Alley, fingindo ser de uma gangue, o estranho Sing e seu amigo idiota Bones são surpreendidos pelos verdadeiros bandidos. Ameaçados, são defendidos por um grande mestre em artes marciais.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>