package com.servlet;

import com.dao.FilmeDAO;
import com.model.Filme;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.*;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/filme/insert", "/filme/update", "/filme/delete", "/filme"})
@MultipartConfig(fileSizeThreshold = 1024*1024*50, maxFileSize = 1024*1024*50, maxRequestSize = 1024*1024*100)
public class FilmeServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "WEB-INF" + File.separator + "upload";

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        switch (path) {
            case "/filme":
                list_movie(request, response);
                break;
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        PrintWriter writer = response.getWriter();
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

    private void insert_filme(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String titulo = request.getParameter("titulo");
        String descricao = request.getParameter("descricao");
        String diretor = request.getParameter("diretor");
        String genero = request.getParameter("genero");

        // INSERÇÃO DE IMAGEM
        Part filePart = request.getPart("imagem");
        String fileName = filePart.getSubmittedFileName();
        String currentPath = request.getServletContext().getRealPath(UPLOAD_DIR);
        File uploadDir = new File(currentPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        for (Part part : request.getParts()) {
            part.write(currentPath + File.separator + fileName);
        }

        Filme filme = new Filme(titulo, descricao, diretor, genero, fileName);
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

    private void list_movie(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            Filme filme = FilmeDAO.get_filme_by_id(id);
            request.setAttribute("filme", filme);
            request.getRequestDispatcher("/viewmovie.jsp").forward(request, response);
        } catch (SQLException | ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
