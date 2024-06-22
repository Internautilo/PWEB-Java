package com.dao;

import com.database.DBQuery;
import com.model.Usuario;
import com.service.Hash;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {
    private DBQuery dbQuery;

    public UsuarioDAO() {
        this.dbQuery = new DBQuery();
    }

    public static int create_user(Usuario usuario) {
        String senhaHash = Hash.hash_string(usuario.senha);
        if (senhaHash == null) {
            throw new RuntimeException("Erro ao hashear senha");
        }
        String[] valores = {usuario.nome, usuario.email, senhaHash};
        return DBQuery.insert_query("users", "nome, email, senha", valores);
    }

    public static Usuario get_user_by_id(int id) throws SQLException {
        ResultSet rs = DBQuery.select_query("users", "WHERE idUsuario = " + id + " AND removido != 1 LIMIT 1");
        Usuario usuario = null;
        if (rs.next()) {
            usuario = new Usuario(
                    rs.getInt("idUsuario"),
                    rs.getString("nome"),
                    rs.getString("email"),
                    rs.getString("senha")
            );
        }
        return usuario;
    }

    public static Usuario get_user_by_email(String email) throws SQLException {
        ResultSet rs = DBQuery.select_query("users", "WHERE email = '" + email + "' AND removido != 1 LIMIT 1");
        Usuario usuario = null;
        if (rs.next()) {
            usuario = new Usuario(
                    rs.getInt("idUsuario"),
                    rs.getString("nome"),
                    rs.getString("email"),
                    rs.getString("senha")
            );
        }
        return usuario;
    }

    public static List<Usuario> list_users() throws SQLException {
        ResultSet rs =  DBQuery.select_query("users", "WHERE removido != 1 ORDER BY idUsuario");
        List<Usuario> usuarios = new ArrayList<>();
        while (rs.next()) {
            usuarios.add(new Usuario(rs.getInt("idUsuario"),
                    rs.getString("nome"),
                    rs.getString("email"),
                    rs.getString("senha"))
            );
        }
        return usuarios;
    }

    public static int update_user(int id, Usuario usuario) throws Exception {
        String campos = "nome = '" + usuario.nome+ "', email = '" + usuario.email + "', senha = '" + usuario.senha + "'";
        String where = "WHERE idUsuario = " + id;
        return DBQuery.update_query("users", campos, where);
    }

    public static int delete_user(int id) {
        return DBQuery.delete_query("users", "idUsuario" , id);
    }

    public static boolean is_user_admin(int userId) throws SQLException {
        ResultSet rs = DBQuery.select_query("admin", "WHERE idUsuario = " + userId + " LIMIT 1");
        return rs.next();
    }
}

