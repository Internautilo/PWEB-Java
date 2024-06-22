<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>

    <!-- Navbar sem estar logado -->
    <nav class="navbar navbar-expand-lg navbar-custom">
        <a class="navbar-brand" href="index.jsp">
            <img src="img/logonova.png" alt="logo">
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
                    <a class="nav-link" href="/login.jsp">Login</a>
                </li>
                <li class="nav-item" id="register-nav">
                    <a class="nav-link" href="/registrar.jsp">Cadastrar</a>
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

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        // Simulando estado de login do usuário
        var isLoggedIn = false; // Altere para true se o usuário estiver logado

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

</html>
