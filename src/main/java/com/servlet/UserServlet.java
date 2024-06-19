package com.servlet;

import com.dao.UsuarioDAO;
import com.model.Usuario;
import com.service.Hash;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet responsável pelo CRUD, login e logout dos usuários
 *
 * @POST
 * @url /user/insert    - @params String nome, String email, String senha
 * @url /user/update    - @params String id, String nome, String email, String senha
 * @url /user/delete    - @params String id
 * @url /user/login     - @params String email, String senha
 * @url /user/logout    - @params null
 */
@WebServlet(urlPatterns = {"/user/insert", "/user/update", "/user/delete", "/user/login", "/user/logout"})
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String path = req.getPathInfo();

        // TODO: Validar parametros recebidos
        switch (path) {
            case "/user/insert":
                try {
                    insert_user(req, resp);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            case "/user/update":
                try {
                    update_user(req, resp);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            case "/user/delete":
                try {
                    delete_user(req, resp);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            case "/user/login":
                try {
                    login(req, resp);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            case "/user/logout":
                try {
                    logout(req, resp);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;

        }

    }
    // TODO: Adicionar validação de que a query funcionou em todas as funções

    private void insert_user(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Usuario user = new Usuario(name, email, password);
        UsuarioDAO.create_user(user);
    }

    private void update_user(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        Usuario user = new Usuario(name, email, password);
        int result = UsuarioDAO.update_user(id, user);
    }

    private void delete_user(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int id = Integer.parseInt(req.getParameter("id"));
        int result = UsuarioDAO.delete_user(id);
    }

    private void login(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String email = req.getParameter("email");
        String senha = req.getParameter("password");

        Usuario usuario_cadastrado = UsuarioDAO.get_user_by_email(email);

        // TODO: ADICIONAR VERIFICAÇÃO SE O USUARIO É ADMIN E ADICIONAR UM PARAMETRO NA SESSION
        if (usuario_cadastrado != null) {
            if (Hash.validate(senha, usuario_cadastrado.senha)) {
                HttpSession session = req.getSession();
                session.setAttribute("user", usuario_cadastrado);
                resp.sendRedirect("/");
            } else {
                req.getSession().invalidate();
            }
        } else {
            resp.sendRedirect("/login?error=true");
        }
    }

    private void logout(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        HttpSession session = req.getSession();
        session.invalidate();
        resp.sendRedirect("/");
    }
}
