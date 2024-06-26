package com.servlet;

import com.dao.FilmeDAO;
import com.dao.NotaDAO;
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

@WebServlet(urlPatterns = {"/filme/insert", "/filme/update", "/filme/delete", "/filme", "/avaliar"})
@MultipartConfig(fileSizeThreshold = 1024*1024*50, maxFileSize = 1024*1024*50, maxRequestSize = 1024*1024*100)
public class FilmeServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "upload";

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        switch (path) {
            case "/filme":
                list_movie(request, response);
                break;
            case "/filme/update":
                update_filme(request, response);
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
            case "/avaliar":
                insert_rating(request, response);
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
        String caminho = request.getServletContext().getRealPath("");
        String uploadPath = caminho + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        filePart.write(uploadPath + File.separator + fileName);
        Filme filme = new Filme(titulo, descricao, diretor, genero, fileName);
        FilmeDAO.insert_filme(filme);
        response.sendRedirect(request.getContextPath()+ File.separator + "add_movie.jsp?sucess=true");
    }

    private void update_filme(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String titulo = request.getParameter("titulo");
        String descricao = request.getParameter("descricao");
        String diretor = request.getParameter("diretor");
        String genero = request.getParameter("genero");
        Part filePart = request.getPart("imagem");
        String imagem = "";
        Filme filme = null;
        if (filePart != null) {
            imagem = filePart.getSubmittedFileName();
            filme = new Filme(titulo, descricao, diretor, genero, imagem);
        } else {
            filme = new Filme(titulo, descricao, diretor, genero);
        }

        FilmeDAO.update_filme(id, filme);
        response.sendRedirect(request.getContextPath() + "/edit_movie.jsp?id=" + id);
    }

    private void delete_filme(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        FilmeDAO.delete_filme(id);
        response.sendRedirect(request.getContextPath()+ "/crudadm.jsp");
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

    private void insert_rating(HttpServletRequest request, HttpServletResponse response) {
        int idFilme = Integer.parseInt(request.getParameter("idFilme"));
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        double nota = Double.parseDouble(request.getParameter("nota"));

        try {
            boolean jaAvaliado = NotaDAO.filme_ja_avaliado(idFilme, idUsuario);
            if (jaAvaliado) {
                response.sendRedirect(request.getHeader("referer"));
            } else {
                NotaDAO.insert_rating(idFilme, idUsuario, nota);
                response.sendRedirect(request.getHeader("referer"));
            }
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
