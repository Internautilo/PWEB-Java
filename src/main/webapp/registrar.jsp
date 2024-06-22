<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Registro</title>
</head>
<%@include file="navbar.jsp"%>
<body class="d-flex justify-content-center align-items-center">
    <div class="register-container">
        <h1>Cadastro</h1>
        <form action="user/insert" method="post">
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input type="text" class="form-control" id="nome" name="nome" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="senha">Senha:</label>
                <input type="password" class="form-control" id="senha" name="senha" required>
            </div>
            <div class="form-group">
                <label for="confirmar-senha">Confirmar Senha:</label>
                <input type="password" class="form-control" id="confirmar-senha" name="confirmar-senha">
            </div>
            <div class="form-group text-center">
                <input type="submit" class="btn btn-primary" value="Cadastrar">
            </div>
        </form>
    </div>

</body>
</html>
