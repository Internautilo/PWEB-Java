<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Editar Filme</title>
</head>
<%@ include file="navbar.jsp" %>
<body>
<div class="user-management-container rounded rounded-4">
    <h1 class="text-center mb-4">Editar Filme</h1>

    <form action="process_edit_movie.php" method="POST">
        <div class="form-group">
            <label for="nome">Nome do Filme: </label>
            <input type="text" class="form-control" id="nome" name="nome" placeholder="Digite o nome do filme">
        </div>
        <div class="form-group">
            <label for="descricao">Descrição: </label>
            <textarea class="form-control" id="descricao" name="descricao" rows="5" placeholder="Digite a descição do filme"></textarea>
        </div>
        <div class="form-group">
            <label for="genero">Gênero: </label>
            <input type="text" class="form-control" id="genero" name="genero" placeholder="Digite o gênero do filme">
        </div>
        <div class="form-group">
            <label for="diretor">Diretor: </label>
            <input type="text" class="form-control" id="diretor" name="diretor" placeholder="Digite o(s) nome(s) do(s) diretor(es) do filme">
        </div>
        <div class="form-group">
            <label for="cartaz">Cartaz do Filme: </label>
            <input type="file" class="form-control" id="cartaz" name="cartaz" accept="image/*">
            <small id="cartazHelp" class="form-text text-muted">Deixe em branco para manter o cartaz atual.</small>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-submit mt-2 py-2 px-5">Salvar</button>
        </div>
    </form>
</div>
</body>
</html>
