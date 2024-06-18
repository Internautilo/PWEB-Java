package com.model;

public class Usuario {
    public int id;
    public String email;
    public String senha;
    public String nome;
    protected boolean isAdmin = false;

    public Usuario(int id, String email, String senha, String nome) {
        this.id = id;
        this.email = email;
        this.senha = senha;
        this.nome = nome;
    }
    public Usuario(String email, String senha, String nome) {
        this.email = email;
        this.senha = senha;
        this.nome = nome;
    }
}
