package com.model;

public class Filme {
    public int id;
    public String titulo;
    public String diretor;
    public String genero;
    public float nota;

    public Filme(int id, String titulo, String diretor, String genero, float nota) {
        this.id = id;
        this.titulo = titulo;
        this.diretor = diretor;
        this.genero = genero;
        this.nota = nota;
    }

    public Filme(String titulo, String diretor, String genero, float nota) {
        this.titulo = titulo;
        this.diretor = diretor;
        this.genero = genero;
        this.nota = nota;
    }
}
