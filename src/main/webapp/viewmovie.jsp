<%@ page import="com.model.Filme" %>
<% Filme filme = (Filme) request.getAttribute("filme");
    if (filme == null) {
        filme = new Filme(0, "titulo", "descricao", "diretor", "genero", "imagem", 4);
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nome do Sistema</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f7f2;
        }
        .navbar-custom {
            background-color: #EE0002;
            color: white;
            padding: 10px 0;
        }
        .navbar-custom .navbar-brand,
        .navbar-custom .nav-link {
            color: #ffffff !important;
            padding: 5px 15px;
            margin: 0 5px;
            border-radius: 20px;
            transition: background-color 0.3s, color 0.3s;
        }
        .navbar-custom .navbar-brand {
            display: flex;
            align-items: center;
        }
        .navbar-custom .navbar-brand img {
            height: 30px;
            margin-right: 10px;
        }
        .navbar-custom .nav-link:hover {
            background-color: white;
            color: #EE0002 !important;
        }
        .container {
            margin-top: 30px;
        }
        .movie-details {
            padding: 30px;
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .movie-image img {
            width: 100%;
            border-radius: 20px;
        }
        .movie-info h2 {
            color: #EE0002;
        }
        .rating-section h3 {
            color: #EE0002;
        }
        .rating-section input[type="number"] {
            width: 80px;
            padding: 10px;
            margin-right: 10px;
            border: 2px solid #EE0002;
            border-radius: 10px;
            text-align: center;
        }
        .rating-section button {
            padding: 10px 20px;
            background-color: #EE0002;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .rating-section button:hover {
            background-color: #bb0001;
        }
    </style>
</head>
<body>
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
                    <a class="nav-link" href="#">Lista de Filmes</a>
                </li>
                <li class="nav-item" id="login-nav">
                    <a class="nav-link" href="#">Login</a>
                </li>
                <li class="nav-item" id="register-nav">
                    <a class="nav-link" href="#">Cadastro</a>
                </li>
                <li class="nav-item dropdown" id="user-nav" style="display: none;">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Usuário
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Gerenciar Conta</a>
                        <a class="dropdown-item" href="#">Sair</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

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
                            <div class="rating-form">
                                <input type="number" min="0" max="10" step="0.1" placeholder="Nota">
                                <button>Avaliar Filme</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
