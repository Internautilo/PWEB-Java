<%@ page import="java.util.List" %>
<%@ page import="com.model.Filme" %>
<%@ page import="com.dao.FilmeDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.File" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% List<Filme> filmes;
    try {
        filmes = FilmeDAO.listar();
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    final String UPLOAD_DIR = "WEB-INF/upload/";
%>
<html>
<head>
    <title>Title</title>
</head>
<%@include file="navbar.jsp"%>
<body>
    <div class="text-center mt-5">
        <h1 class="title" style="color: #76ac5f">Lista de Filmes</h1>
    </div>
    <div class="d-flex justify-content-center rounded rounded-4 mt-3">
        <div class="row align-self-center bg-light w-50 rounded rounded-2">
            <div class="input-group my-3">
                <input id="search-input" type="text" class="form-control" placeholder="Digite o título, gênero ou nome do(s) diretor(es) do filme" aria-label="Recipient's username" aria-describedby="basic-addon2">
                <div class="input-group-append">
                    <button id="search-button" class="btn btn-outline-secondary" type="button"><i class="bi bi-search"></i></button>
                </div>
            </div>
            <div class="col-4">
                <div class="input-group mb-3">
                    <input id="nota_input" type="text" class="form-control" placeholder="Nota" aria-label="Recipient's username" aria-describedby="basic-addon2">
                </div>
            </div>
        </div>
    </div>
    <div class="d-flex justify-content-center">
        <div class="row gap-sm-3 mx-sm-3 mx-0 justify-content-center align-items-center my-5 w-75" style="max-width: 1700px" id="movies_div">
            <% for (Filme filme : filmes) {
                    if (filme != null) { %>
                        <div class="card mx-1 col-12 text-center col-sm-6 col-md-3 col-xxl-2" style="min-width: 200px" >
                            <p class="card-title mt-3"><%=filme.titulo%></p>
                            <img class="card-img w-100 mt-3 object-fit-cover" onclick="window.location.href = 'filme?id=<%=filme.id%>'" style="height: 250px; cursor: pointer" src="<%="upload/" + filme.imagem%>" onerror="this.src = 'https://ferramentas-web.aplicativocode.com.br/placeholder/500x735/d5d5d5/584959/Sem_imagem'">
                            <div class="card-body">
                                <input type="hidden" class="titulo" value="<%=filme.titulo%>">
                                <input type="hidden" class="genero" value="<%=filme.genero%>">
                                <input type="hidden" class="diretor" value="<%=filme.diretor%>">
                                <input type="hidden" class="nota" value="<%=filme.nota%>">
                                <div class=" text-nowrap">
                                    <div class="overflow-hidden">
                                        Gênero: <%=filme.genero%><br>
                                    </div>
                                    <div class="overflow-hidden">
                                        Diretor: <%=filme.diretor%>
                                    </div>
                                </div>
                                <p class="card-text"><i class="bi bi-star-fill"></i> <%=filme.nota%></p>
                            </div>
                        </div>
            <%      }
                } %>
        </div>
    </div>
</body>
</html>
<script>
    function pesquisar() {
        var searchText = $('#search-input').val().toLowerCase();
        var valor = $('#nota_input').val().toin
        $('#movies_div').find('.card').each(function() {
            var titulo = $(this).find(".titulo").prop("value").toLowerCase();
            var genero = $(this).find(".genero").prop("value").toLowerCase();
            var diretor = $(this).find(".diretor").prop("value").toLowerCase();

            if (titulo.includes(searchText) || genero.includes(searchText) || diretor.includes(searchText)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    }
    $('#search-input').on('input', pesquisar);
    $('#search-button').on('click', pesquisar);
</script>
