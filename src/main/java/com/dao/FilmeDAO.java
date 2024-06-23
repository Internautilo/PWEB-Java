package com.dao;

import com.database.DBQuery;
import com.model.Filme;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FilmeDAO {
    private DBQuery dbQuery;

    public FilmeDAO() {
        this.dbQuery = new DBQuery();
    }

    public static int insert_filme(Filme filme) {
        String[] valores = {filme.titulo, filme.descricao, filme.diretor, filme.genero, filme.imagem};
        return DBQuery.insert_query("filmes", "titulo, descricao, diretor, genero, imagem", valores);
    }

    public static Filme get_filme_by_id(int id) throws SQLException {
        String extraQuery = "WHERE idFilme = " + id + " AND removido != 1 LIMIT 1";
        ResultSet rs =  DBQuery.select_query("filmes", extraQuery);
        Filme filme = null;
        if (rs.next()){
            filme = new Filme(rs.getInt("idFilme"),
                    rs.getString("titulo"),
                    rs.getString("descricao"),
                    rs.getString("diretor"),
                    rs.getString("genero"),
                    rs.getString("imagem"),
                    rs.getDouble("nota")
            );
        }
        return filme;
    }

    public static List<Filme> listar() throws SQLException {
        ResultSet rs = DBQuery.select_query("filmes", "WHERE removido != 1 ORDER BY idFilme");
        List<Filme> filmes = new ArrayList<>();
        while (rs.next()) {
            filmes.add(new Filme(rs.getInt("idFilme"),
                    rs.getString("titulo"),
                    rs.getString("descricao"),
                    rs.getString("diretor"),
                    rs.getString("genero"),
                    rs.getString("imagem"),
                    rs.getDouble("nota")
                )
            );
        }
        return filmes;
    }

    public static int update_filme(int id, Filme filme) {
        boolean semImagem = (filme.imagem == null);
        String campoImagem = (semImagem) ? ",imagem = " + filme.imagem : "";
        String campos = "titulo = '" + filme.titulo + "', " +
                        "descricao = '" + filme.descricao + "', " +
                        "diretor = '" + filme.diretor + "', " +
                        "genero = '" + filme.genero + "' " +
                        campoImagem;
        String where = "WHERE idFilme = " + id;
        return DBQuery.update_query("filmes", campos, where);
    }

    public static int delete_filme(int id) {
        return DBQuery.delete_query("filmes", "idFilme", id);
    }
}
