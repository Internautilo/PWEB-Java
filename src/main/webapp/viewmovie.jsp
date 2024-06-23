<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.Filme" %>
<%@ page import="com.model.Usuario" %>
<% Filme filme = (Filme) request.getAttribute("filme");
    if (filme == null) {
        filme = new Filme(0, "titulo", "descricao", "diretor", "genero", "imagem", 4);
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Nome do Sistema</title>
</head>
<body>
<% Usuario usuario = (Usuario) session.getAttribute("user");%>
<%@ include file="navbar.jsp" %>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10 movie-details">
                <div class="row mb-4">
                    <div class="col-4">
                        <img src="upload/<%=filme.imagem%>" class="card-img w-100 h-100 mt-3 object-fit-cover rounded rounded-3" style="min-height: 350px" alt="Imagem do Filme">
                    </div>
                    <div class="col-md-8 mt-sm-3">
                        <input type="hidden" value="<%= filme.id%>" name="id">
                        <h2><%= filme.titulo %></h2>
                        <p><strong>Descrição: </strong><%= filme.descricao%></p>
                        <p><strong>Gênero: </strong><%=filme.genero%></p>
                        <p><strong>Diretor: </strong><%= filme.diretor%></p>
                        <p><strong>Avaliação Média: </strong><%= filme.nota%></p>
                        <div class="rating-section">
                            <h3>Avalie este filme</h3>
                            <% if (usuario != null) { %>
                            <form method="post" action="avaliar" class="rating-form">
                                <input type="hidden" value="<%=filme.id%>" name="idFilme">
                                <input type="hidden" value="<%=usuario.id%>" name="idUsuario">
                                <input type="number" min="0" max="10" step="0.5" placeholder="Nota" name="nota">
                                <button type="submit">Avaliar Filme</button>
                            </form>
                            <% } else { %>
                            <p>Você precisa <a href="login.jsp" class="link-success">fazer login</a> para avaliar.</p>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
