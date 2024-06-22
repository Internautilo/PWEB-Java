<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Login</title>
</head>
<body class="d-flex justify-content-center align-items-center">
    <div class="login-container">
        <h1>Login</h1>
        <form action="user/login" method="post">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="senha">Senha:</label>
                <input type="password" class="form-control" id="senha" name="senha" required>
            </div>
            <div class="form-group text-center">
                <input type="submit" class="btn btn-primary" value="Entrar">
            </div>
        </form>
    </div>
</body>
</html>
