<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Filme</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<%@ include file="navbar.jsp" %>
<body>
<div class="container mt-5">
    <div class="user-management-container">
        <h1 class="text-center mb-4">Adicionar Filme</h1>

        <form action="process_add_movie.php" method="POST">
            <div class="form-group">
                <label for="nome">Nome do Filme:</label>
                <input type="text" class="form-control" id="nome" name="nome" required>
            </div>
            <div class="form-group">
                <label for="descricao">Descrição:</label>
                <textarea class="form-control" id="descricao" name="descricao" rows="5" required></textarea>
            </div>
            <div class="form-group">
                <label for="genero">Gênero:</label>
                <input type="text" class="form-control" id="genero" name="genero" required>
            </div>
            <div class="form-group">
                <label for="diretor">Diretor:</label>
                <input type="text" class="form-control" id="diretor" name="diretor" required>
            </div>
            <div class="form-group">
                <label for="cartaz">Cartaz do Filme:</label>
                <input type="file" class="form-control-file" id="cartaz" name="cartaz" accept="image/*" required>
            </div>
            <button type="submit" class="btn btn-submit">Salvar</button>
        </form>
    </div>
</div>

<!-- Scripts do Bootstrap (jQuery e Popper.js necessários para o Bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
