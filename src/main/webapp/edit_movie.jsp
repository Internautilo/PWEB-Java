<%@ page import="com.model.Filme" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.FilmeDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Editar Filme</title>
</head>
<%@ include file="navbar.jsp" %>
<%
    String idParam = request.getParameter("id");
    Filme filme = null;

    if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);
            filme = FilmeDAO.get_filme_by_id(id);
    };
%>
<body>
<div class="user-management-container rounded rounded-4">
    <h1 class="text-center mb-4">Editar Filme</h1>

    <form action="filme/update" method="POST">
        <input type="hidden" value="<%=filme.id%>" name="id">
        <input type="hidden" value="<%=filme.nota%>" name="nota">
        <div class="form-group">
            <label for="nome">Nome do Filme: </label>
            <input type="text" class="form-control" id="titulo" name="titulo" placeholder="<%= filme.titulo%>">
        </div>
        <div class="form-group">
            <label for="descricao">Descrição: </label>
            <textarea class="form-control" id="descricao" name="descricao" rows="5" placeholder="<%= filme.descricao%>"></textarea>
        </div>
        <div class="form-group">
            <label for="genero">Gênero: </label>
            <input type="text" class="form-control" id="genero" name="genero" placeholder="<%= filme.genero%>">
        </div>
        <div class="form-group">
            <label for="diretor">Diretor: </label>
            <input type="text" class="form-control" id="diretor" name="diretor" placeholder="<%= filme.diretor%>">
        </div>
        <div class="form-group">
            <label for="imagem">Cartaz do Filme: </label>
            <input type="file" class="form-control" id="imagem" name="imagem" accept="image/*">
            <small id="cartazHelp" class="form-text text-muted">Deixe em branco para manter o cartaz atual.</small>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-submit mt-2 py-2 px-5">Salvar</button>
        </div>
    </form>
</div>
</body>
</html>
