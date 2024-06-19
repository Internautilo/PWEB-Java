package com.dao;

import com.database.DBQuery;
import com.model.Filme;
import com.model.Usuario;

import java.sql.ResultSet;

public class FilmeDAO implements DAOInterface{
    private DBQuery dbQuery;

    public FilmeDAO() {
        this.dbQuery = new DBQuery();
    }

    @Override
    public int inserir(Object object) throws Exception {
        if (!(object instanceof Filme)) {
            throw new Exception("Objeto nao e uma instancia de Usuario: ");
        }
        Filme filme = (Filme) object;
        String[] valores = {filme.titulo, filme.diretor, filme.genero};
        return this.dbQuery.insert_query("filmes", "titulo, diretor, genero", valores);
    }

    @Override
    public ResultSet listar_por_id(int[] ids) {
        StringBuilder idList = new StringBuilder();
        for (int i = 0; i < ids.length; i++) {
            idList.append(ids[i]);
            if (i < ids.length - 1) {
                idList.append(",");
            }
        }
        String extraQuery = "WHERE idFilme IN (" + idList.toString() + ") AND removido != 1";
        return this.dbQuery.select_query("filmes", extraQuery);
    }

    @Override
    public ResultSet listar_por_id() {
        return this.dbQuery.select_query("filmes", "WHERE removido != 1 ORDER BY idFilme");
    }

    @Override
    public int alterar(int id, Object object) throws Exception {
        if (!(object instanceof Filme)) {
            throw new Exception("Objeto nao e uma instancia de usuario");
        }
        Filme filme = (Filme) object;
        String campos = "titulo = '" + filme.titulo + "', diretor =  '" + filme.diretor + "', genero =  '" + filme.genero + "'";
        String where = "WHERE idFilme = " + id;
        return this.dbQuery.update_query("filmes", campos, where);
    }

    @Override
    public int remover(int id) {
        return this.dbQuery.delete_query("users", id);
    }
}
