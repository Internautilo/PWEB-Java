<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrar Filmes</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<%@ include file="navbar.jsp" %>
<body>
<div class="container mt-5">
    <div class="user-management-container">
        <h1 class="text-center mb-4">Administrar Filmes</h1>

        <!-- Lista de filmes (pode ser dinâmica vinda de um banco de dados) -->
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="movie-list">
                    <!-- Exemplo estático -->
                    <div class="card mb-3">
                        <div class="card-body">
                            <h2 class="card-title">Nome do Filme</h2>
                            <p class="card-text">Descrição do Filme.</p>
                            <p class="card-text">Gênero: Ação</p>
                            <p class="card-text">Diretor: Diretor do Filme</p>
                            <img src="caminho/para/imagem.jpg" class="card-img-top" alt="Imagem do Filme">
                            <div class="text-center mt-3">
                                <a href="edit_movie.html" class="btn btn-edit">Editar</a>
                                <a href="delete_movie.html" class="btn btn-delete">Remover</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Botão para adicionar novo filme -->
        <div class="text-center mt-4">
            <a href="add_movie.html" class="btn btn-add">Adicionar Filme</a>
        </div>
    </div>
</div>

<!-- Scripts do Bootstrap (jQuery e Popper.js necessários para o Bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
