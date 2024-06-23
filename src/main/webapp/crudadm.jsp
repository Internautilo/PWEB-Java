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
<div class="user-management-container mt-5 rounded rounded-4">
    <div class="row justify-content-center align-items-center column-gap-2 row-gap-2">
        <% List<Filme> listaDeFilmes = FilmeDAO.listar();
            for (Filme filme : listaDeFilmes) {
        %>
        <div class="card col-md-5">
            <div class="card-body">
                <h2 class="card-title"><%= filme.titulo %></h2>
                <p class="card-text">Gênero: <%= filme.genero %></p>
                <p class="card-text">Diretor: <%= filme.diretor %></p>
                <div class="text-center mt-3">
                    <a href="edit_movie.jsp?id=<%=filme.id%>" class="btn btn-outline-success">Editar</a>
                    <form action="filme/delete" method="post" class="mt-2">
                        <input type="hidden" value="<%=filme.id%>" name="id">
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-danger">Remover</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
    <div class="text-center mt-4">
        <a href="add_movie.jsp" class="btn btn-outline-success">Adicionar Filme</a>
    </div>
</div>
</body>
</html>
