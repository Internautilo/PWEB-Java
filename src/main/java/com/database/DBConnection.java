package com.database;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.*;

public class DBConnection {
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/PWEB_Java";
    private String user = "root";
    private String password = "";
    private Connection conn;

    public DBConnection() {
        try {
            Class.forName(this.driver);
            this.conn = DriverManager.getConnection(this.url, this.user, this.password);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public DBConnection(String driver, String url, String user, String password) {
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

    public Connection getConnection() {
        return this.conn;
    }
}
