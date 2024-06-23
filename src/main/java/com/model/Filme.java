package com.model;

public class Filme {
    public int id;
    public String titulo;
    public String descricao;
    public String diretor;
    public String genero;
    public String imagem;
    public double nota;

    public Filme(int id, String titulo, String descricao, String diretor, String genero, String imagem, double nota) {
        this.id = id;
        this.titulo = titulo;
        this.descricao = descricao;
        this.diretor = diretor;
        this.genero = genero;
        this.imagem = imagem;
        this.nota = nota;
    }

    public Filme(String titulo, String descricao, String diretor, String genero, String imagem) {
        this.id = id;
        this.titulo = titulo;
        this.descricao = descricao;
        this.diretor = diretor;
        this.genero = genero;
        this.imagem = imagem;
    }

    public Filme(String titulo, String diretor, String genero, String imagem, double nota) {
        this.titulo = titulo;
        this.diretor = diretor;
        this.genero = genero;
        this.imagem = imagem;
        this.nota = nota;
    }

    public Filme(String titulo, String diretor, String genero) {
        this.titulo = titulo;
        this.diretor = diretor;
        this.genero = genero;
    }

    public Filme(String titulo, String descricao, String diretor, String genero) {
        this.titulo = titulo;
        this.descricao = descricao;
        this.diretor = diretor;
        this.genero = genero;
    }
}

