<%@page pageEncoding="UTF-8" language="java" contentType="text/html; ISO-8859-1" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nome do Sistema</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
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
                        <h2>Gato de Botas 2 ççççç</h2>
                        <p><strong>Descrição:</strong> Em Gato de Botas 2: O Último Pedido, O Gato de Botas descobre que sua paixão pela aventura cobrou seu preço: por conta de seu gosto pelo perigo e pelo desrespeito à segurança pessoal, ele queimou oito de suas nove vidas. Com apenas uma vida restante, o Gato precisa pedir ajuda para uma antiga parceira - que atualmente é sua rival e inimiga mortal, Kitty Pata Mansa - para continuar vivo. Então, o destemido bichano parte em uma jornada épica pela Floresta Negra para encontrar a mítica Estrela dos Desejos, capaz de proporcionar o legendário Último Desejo e restaurar suas nove vidas.</p>
                        <p><strong>Gênero:</strong> Animação</p>
                        <p><strong>Diretor:</strong>  Joel Crawford</p>
                        <p><strong>Avaliação Média:</strong> 4.5/5</p>
                        
                        <div class="rating-section">
                            <h3>Avalie este filme</h3>
                            <p class="login-warning">Você precisa estar logado para avaliar.</p>
                            <div class="rating-form">
                                <input type="number" min="0" max="5" step="0.1" placeholder="Nota">
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
