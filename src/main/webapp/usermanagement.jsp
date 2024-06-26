<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.Usuario" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Gerenciamento de Usuário</title>
</head>
<%@ include file="navbar.jsp" %>
<body>
<%
    Usuario usuario;
    if (session.getAttribute("user") == null) {
        usuario = null;
    } else {
        usuario = (Usuario) session.getAttribute("user");
    }
    if (usuario == null) {
        response.sendRedirect("index.jsp");
    }
%>
    <!-- Gerenciamento de Usuário -->
    <div class="container user-management-container rounded rounded-4">
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
            <input type="hidden" value="<%=usuario.id%>" name="id">
            <div class="form-group text-center">
                <button type="submit" class="btn btn-danger btn-delete">Excluir Conta</button>
            </div>
        </form>
    </div>
</body>
</html>
