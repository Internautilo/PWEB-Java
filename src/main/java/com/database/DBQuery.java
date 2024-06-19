package com.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBQuery {

    public static ResultSet select_query(String table, String campos, String extra) {
        String camposExtras = "";
        String camposSelect = "*";
        if (extra != null) {
            camposExtras = extra;
        }
        if (campos != null) {
            camposSelect = campos;
        }
        String query = "SELECT " + camposSelect + " FROM " + table + " " + camposExtras;
        System.out.println(query);
        try {
            Connection conn = DBConnection.getConnection();
            Statement stmt = conn.createStatement();
            return stmt.executeQuery(query);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public static ResultSet select_query(String table, String extra) {
        return select_query(table, null, extra);
    }
    public static ResultSet select_query(String table) {
        return select_query(table, null);
    }

    public static int insert_query(String table, String campos, String[] values) {
        StringBuilder formatted = new StringBuilder();
        for (int i = 0; i < values.length; i++) {
            formatted.append("'").append(values[i]).append("'");
            if (i != values.length - 1) {
                formatted.append(", ");
            }
            if (i < values.length - 1) {
                formatted.append(" ");
            }
        }
        String query = "INSERT INTO " + table + " (" + campos + ") VALUES (" + formatted + ")";
        System.out.println(query);
        try {
            Connection conn = DBConnection.getConnection();
            Statement stmt = conn.createStatement();
            return stmt.executeUpdate(query);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static int update_query(String table, String campos, String extra) {
        String query = "UPDATE " + table + " SET " + campos + " " + extra;
        System.out.println(query);
        try {
            Connection conn = DBConnection.getConnection();
            Statement stmt = conn.createStatement();
            return stmt.executeUpdate(query);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static int delete_query(String table, int id) {
        String query = "UPDATE " + table + " SET removido = 1 WHERE idUsuario = " + id;
        System.out.println(query);
        try {
            Connection conn = DBConnection.getConnection();
            Statement stmt = conn.createStatement();
            return stmt.executeUpdate(query);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void query(String query) {
        try {
            Connection conn = DBConnection.getConnection();
            Statement stmt = conn.createStatement();
            stmt.execute(query);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private String separar_campos(String[] campos) {
        int index = 0;
        String camposSelecionados = "";
        if (campos == null || campos.length == 0 || campos[0] == null) {
            camposSelecionados = "*";
        } else {
            for (String campo : campos) {
                if (index == 0) {
                    camposSelecionados += campo;
                } else {
                    camposSelecionados += ", " + campo;
                }
                index++;
            }
        }
        return camposSelecionados;
    }

    public static List<Map<String, Object>> result_to_list(ResultSet rs) {
        List<Map<String, Object>> results = new ArrayList<>();
        try {
            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
                    String columnName = rs.getMetaData().getColumnName(i);
                    Object value = rs.getObject(i);
                    row.put(columnName, value);
                }
                results.add(row);
            }
            return results;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
