<%@ page import="com.model.Filme" %>
<%@ page import="com.dao.FilmeDAO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Administrar Filmes</title>
</head>
<%@ include file="navbar.jsp" %>
<body>
<div class="container mt-5">
    <div class="user-management-container">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="movie-list">

                    <!-- Exemplo estático -->
                    <div class="card mb-3">
                        <div class="card-body">
                            <% List<Filme> listaDeFilmes = FilmeDAO.listar();
                                for (Filme filme : listaDeFilmes) {
                            %>
                            <h2 class="card-title"><%= filme.titulo %></h2>
                            <p class="card-text"> <%= filme.descricao %></p>
                            <p class="card-text">Gênero: <%= filme.genero %></p>
                            <p class="card-text">Diretor: <%= filme.diretor %></p>
                            <img src="caminho/para/imagem.jpg" class="card-img-top" alt="Imagem do Filme">
                            <div class="text-center mt-3">
                                <a href="edit_movie.jsp" class="btn btn-edit">Editar</a>
                                <form action="filme/delete" method="post" class="mt-4">
                                    <div class="form-group text-center">
                                        <button type="submit" class="btn btn-danger btn-delete">deletar</button>
                                    </div>
                                </form>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center mt-4">
            <a href="add_movie.jsp" class="btn btn-add">Adicionar Filme</a>
        </div>
    </div>
</div>
</body>
</html>
