package com.dao;

import com.database.DBQuery;
import com.model.Usuario;

import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

public class UsuarioDAO implements DAOInterface {
    private DBQuery dbQuery;

    public UsuarioDAO() {
        this.dbQuery = new DBQuery();
    }


    @Override
    public int inserir(Object object) throws Exception {
        if (!(object instanceof Usuario)) {
            throw new Exception("Objeto nao e uma instancia de Usuario: ");
        }
        Usuario usuario = (Usuario) object;
        String[] valores = {usuario.nome, usuario.email, usuario.senha};
        return this.dbQuery.insert_query("users", "nome, email, senha", valores);
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
        String extraQuery = "WHERE idUsuario IN (" + idList.toString() + ") AND removido != 1";
        return this.dbQuery.select_query("users", extraQuery);
    }

    @Override
    public ResultSet listar_por_id() {
        return this.dbQuery.select_query("users", "WHERE removido != 1 ORDER BY idUsuario");
    }

    @Override
    public int alterar(int id, Object object) throws Exception {
        if (!(object instanceof Usuario)) {
            throw new Exception("Objeto nao e uma instancia de usuario");
        }
        Usuario usuario = (Usuario) object;
        String campos = "nome = '" + usuario.nome+ "', email = '" + usuario.email + "', senha = '" + usuario.senha + "'";
        String where = "WHERE idUsuario = " + id;
        return this.dbQuery.update_query("users", campos, where);
    }

    @Override
    public int remover(int id) {
        return this.dbQuery.delete_query("users", id);
    }

}
