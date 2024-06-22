<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.Filme" %>
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
<%@ include file="navbar.jsp" %>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 movie-details">
                <div class="row">
                    <div class="col-md-4 movie-image">
                        <img src="url-da-imagem-do-filme" alt="Imagem do Filme">
                    </div>
                    <div class="col-md-8 movie-info">
                        <input type="hidden" value="<%= filme.id%>" name="id">
                        <h2><%= filme.titulo %></h2>
                        <p><strong>Descrição:</strong><%= filme.descricao%></p>
                        <p><strong>Gênero:</strong><%=filme.genero%>></p>
                        <p><strong>Diretor:</strong><%= filme.diretor%>></p>
                        <p><strong>Avaliação Média:</strong><%= filme.nota%>></p>
                        <div class="rating-section">
                            <h3>Avalie este filme</h3>
                            <p class="login-warning">Você precisa estar logado para avaliar.</p>
                            <form method="post" action="avaliar" class="rating-form">
                                <input type="number" min="0" max="10" step="0.1" placeholder="Nota" name="nota">
                                <button type="submit">Avaliar Filme</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
