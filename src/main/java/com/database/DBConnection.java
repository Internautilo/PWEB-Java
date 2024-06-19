package com.database;

import java.sql.*;

public class DBConnection {
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/PWEB_Java";
    private String user = "root";
    private String password = "";
    private Connection conn;

    private DBConnection() {
        try {
            Class.forName(this.driver);
            this.conn = DriverManager.getConnection(this.url, this.user, this.password);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private DBConnection(String driver, String url, String user, String password) {
        this.driver = driver;
        this.url = url;
        this.user = user;
        this.password = password;
        try {
            Class.forName(this.driver);
            this.conn = DriverManager.getConnection(this.url, this.user, this.password);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static Connection getConnection() {
        DBConnection connection = new DBConnection();
        return connection.conn;
    }
}
