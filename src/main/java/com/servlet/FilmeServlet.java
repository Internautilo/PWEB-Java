package com.servlet;

import com.dao.FilmeDAO;
import com.model.Filme;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = {"/filme/insert", "/filme/update", "/filme/delete"})
public class FilmeServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        switch (path) {
            case "/filme/insert":
                insert_filme(request, response);
                break;
            case "/filme/update":
                update_filme(request, response);
                break;
            case "/filme/delete":
                delete_filme(request, response);
                break;
        }
    }

    private void insert_filme(HttpServletRequest request, HttpServletResponse response) {
        String titulo = request.getParameter("titulo");
        String descricao = request.getParameter("descricao");
        String diretor = request.getParameter("diretor");
        String genero = request.getParameter("genero");
        String imagem = request.getParameter("imagem");
        Filme filme = new Filme(titulo, descricao, diretor, genero, imagem);

        FilmeDAO.insert_filme(filme);
    }

    private void update_filme(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String titulo = request.getParameter("titulo");
        String descricao = request.getParameter("descricao");
        String diretor = request.getParameter("diretor");
        String genero = request.getParameter("genero");
        String imagem = request.getParameter("imagem");
        double nota = Double.parseDouble(request.getParameter("nota"));
        Filme filme = new Filme(id, titulo, descricao, diretor, genero, imagem, nota);

        FilmeDAO.update_filme(id, filme);
    }

    private void delete_filme(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        FilmeDAO.delete_filme(id);
    }
}
