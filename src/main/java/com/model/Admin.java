package com.model;

public class Admin extends Usuario {

    public Admin(int id, String email, String senha, String nome) {
        super(id, email, senha, nome);
        this.isAdmin = true;
    }

    public Admin(String email, String senha, String nome) {
        super(email, senha, nome);
        this.isAdmin = true;
    }
}
