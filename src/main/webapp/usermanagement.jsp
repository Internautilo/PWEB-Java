<%@ page import="com.model.Usuario" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Usuário</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f7f2;
            font-family: Arial, sans-serif;
        }
        .navbar-custom {
            background-color: #EE0002;
        }
        .navbar-custom .navbar-brand,
        .navbar-custom .nav-link {
            color: #f7f7f2;
        }
        .navbar-custom .nav-link:hover {
            color: #ffffff;
        }
        .navbar-toggler {
            border-color: #f7f7f2;
        }
        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba%28255, 255, 255, 0.5%29' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
        }
        .navbar-brand img {
            height: 30px;
            margin-right: 10px;
        }
        .dropdown-menu a {
            color: #EE0002;
        }
        .dropdown-menu a:hover {
            color: #c70000;
        }
        .user-management-container {
            padding: 30px;
            background-color: #ffffff;
            margin: 20px auto;
            max-width: 800px;
        }
        .user-management-container h1 {
            color: #EE0002;
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }
        .form-group input[type="submit"] {
            background-color: #EE0002;
            color: #ffffff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .form-group input[type="submit"]:hover {
            background-color: #c70000;
        }
        .btn-delete {
            background-color: #EE0002;
            color: #ffffff;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }
        .btn-delete:hover {
            background-color: #c70000;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-custom">
        <a class="navbar-brand" href="#">
            <img src="logo.png" alt="Logo"> Nome do Sistema
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/lista-de-filmes">Lista de Filmes</a>
                </li>
                <li class="nav-item" id="login-nav">
                    <a class="nav-link" href="/login">Login</a>
                </li>
                <li class="nav-item" id="register-nav">
                    <a class="nav-link" href="/register">Cadastrar</a>
                </li>
                <li class="nav-item dropdown" id="user-nav" style="display: none;">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Usuário
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/gerenciar-conta">Gerenciar Conta</a>
                        <a class="dropdown-item" href="/logout">Sair</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
<% Usuario usuario = (Usuario) session.getAttribute("user");%>
    <!-- Gerenciamento de Usuário -->
    <%= usuario.nome %>
    <%= usuario.email %>
    <div class="container user-management-container">
        <h1>Gerenciamento de Usuário</h1>
        <form action="user/update" method="post">
            <input type="hidden" value="">
             <div class="form-group">
                <label for="nome">Mudar Nome:</label>
                <input type="text" class="form-control" id="nome" name="nome" value="<%= usuario.nome %>" required>
            </div>
            <div class="form-group text-center">
                <input type="submit" class="btn btn-primary" value="Atualizar Nome">
            </div>
        </form>
        <form action="user/update" method="post" class="mt-4">
            <input type="hidden" value="">
            <div class="form-group">
                <label for="senha-antiga">Senha Antiga:</label>
                <input type="password" class="form-control" id="senha-antiga" name="senha-antiga" required>
            </div>
            <div class="form-group">
                <label for="senha-nova">Senha Nova:</label>
                <input type="password" class="form-control" id="senha-nova" name="senha-nova" required>
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
