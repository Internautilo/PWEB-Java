<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Adicionar Filme</title>
</head>
<%@ include file="navbar.jsp" %>
<body>
<div class="user-management-container rounded rounded-4">
    <h1 class="text-center mb-4">Adicionar Filme</h1>

    <form enctype="multipart/form-data" action="filme/insert" method="POST">
        <div class="form-group">
            <label for="titulo" class="form-label">Nome do Filme:</label>
            <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Digite o nome do filme" required>
        </div>
        <div class="form-group">
            <label for="descricao">Descrição:</label>
            <textarea class="form-control" id="descricao" name="descricao" rows="5" placeholder="Digite a descrição do filme" required></textarea>
        </div>
        <div class="form-group">
            <label for="genero">Gênero:</label>
            <input type="text" class="form-control" id="genero" name="genero" placeholder="Digite o gênero do filme" required>
        </div>
        <div class="form-group">
            <label for="diretor">Diretor:</label>
            <input type="text" class="form-control" id="diretor" name="diretor" placeholder="Digite o(s) nome(s) do(s) diretor(es) do filme" required>
        </div>
        <div class="form-group">
            <label for="imagem">Cartaz do Filme:</label>
            <input type="file" class="form-control" id="imagem" name="imagem" accept="image/*" required>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-submit mt-2 py-2 px-5">Salvar</button>
        </div>
    </form>
</div>
</body>
</html>
