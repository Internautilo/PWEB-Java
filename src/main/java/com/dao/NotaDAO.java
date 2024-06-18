package com.dao;

import com.database.DBQuery;

import java.sql.ResultSet;

public class NotaDAO{
    private DBQuery dbQuery;

    public NotaDAO() {
        dbQuery = new DBQuery();
    }

    public int inserir(int idFilme, int idUsuario, double nota) {
        String[] valores = {String.valueOf(idFilme), String.valueOf(idUsuario), String.valueOf(nota)};
        return this.dbQuery.insert_query("notas", "idFilme, idUsuario, nota", valores);
    }

    public int alterar(int idFilme, int idUsuario, int nota) {
        return this.dbQuery.update_query("notas", "nota", "WHERE idFilme = " + idFilme + " AND idUsuario = " + idUsuario);
    }
}
