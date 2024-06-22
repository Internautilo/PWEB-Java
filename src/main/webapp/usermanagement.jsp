<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.Usuario" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Usuário</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<%@ include file="navbar.jsp" %>
<body>
<% Usuario usuario = (Usuario) session.getAttribute("user");%>
    <!-- Gerenciamento de Usuário -->
    <div class="container user-management-container">
        <h1>Gerenciamento de Usuário</h1>
        <form action="user/update" method="post">
            <input type="hidden" value="<%= usuario.id %>" name="id">
            <input type="hidden" value="<%= usuario.email %>" name="email">
            <input type="hidden" value="<%= usuario.senha %>" name="senha">
             <div class="form-group">
                <label for="nome">Mudar Nome:</label>
                <input type="text" class="form-control" id="nome" name="nome" value="<%= usuario.nome %>" required>
            </div>
            <div class="form-group text-center">
                <input type="submit" class="btn btn-primary" value="Atualizar Nome">
            </div>
        </form>
        <form action="user/update" method="post" class="mt-4">
            <input type="hidden" value="<%= usuario.id %>" name="id">
            <input type="hidden" value="<%= usuario.email %>" name="email">
            <input type="hidden" value="<%= usuario.nome %>" name="nome">
            <div class="form-group">
                <label for="senha">Nova Senha:</label>
                <input type="password" class="form-control" id="senha" name="senha" required>
            </div>
            <div class="form-group">
                <label for="senha">Confirmar Nova:</label>
                <input type="password" class="form-control" id="confirmar-senha" name="confirmar-senha" required>
            </div>
            <div class="form-group text-center">
                <input type="submit" class="btn btn-primary" value="Atualizar Senha">
            </div>
        </form>
        <form action="user/delete" method="post" class="mt-4">
            <div class="form-group text-center">
                <button type="submit" class="btn btn-danger btn-delete">Excluir Conta</button>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        // Simulando estado de login do usuário
        var isLoggedIn = true; // Altere para true se o usuário estiver logado

        // Mostrar ou ocultar botões de login/cadastro e usuário com base no estado de login
        if (isLoggedIn) {
            document.getElementById('login-nav').style.display = 'none';
            document.getElementById('register-nav').style.display = 'none';
            document.getElementById('user-nav').style.display = 'block';
        } else {
            document.getElementById('login-nav').style.display = 'block';
            document.getElementById('register-nav').style.display = 'block';
            document.getElementById('user-nav').style.display = 'none';
        }
    </script>
</body>
</html>
