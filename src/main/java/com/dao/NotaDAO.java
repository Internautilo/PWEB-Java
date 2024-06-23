package com.dao;

import com.database.DBQuery;

import java.sql.ResultSet;
import java.sql.SQLException;

public class NotaDAO{
    private DBQuery dbQuery;

    public NotaDAO() {
        dbQuery = new DBQuery();
    }

    public static int insert_rating(int idFilme, int idUsuario, double nota) {
        String[] valores = {String.valueOf(idFilme), String.valueOf(idUsuario), String.valueOf(nota)};
        return DBQuery.insert_query("notas", "idFilme, idUsuario, nota", valores);
    }

    public static int update_rating(int idFilme, int idUsuario, int nota) {
        return DBQuery.update_query("notas", "nota", "WHERE idFilme = " + idFilme + " AND idUsuario = " + idUsuario);
    }

    public static boolean filme_ja_avaliado(int idFilme, int idUsuario) throws SQLException {
        String[] valores = {String.valueOf(idFilme), String.valueOf(idUsuario)};
        ResultSet rs = DBQuery.select_query("notas", "WHERE idFilme = " + idFilme + " AND idUsuario = " + idUsuario);
        if (rs.next()) {
            return true;
        } else {
            return false;
        }
    }
}
