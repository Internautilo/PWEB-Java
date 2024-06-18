package com.dao;

import java.sql.ResultSet;

public interface DAOInterface {
    public int inserir(Object object) throws Exception;
    public ResultSet listar(int[] ids);
    public ResultSet listar();
    public int alterar(int id, Object object) throws Exception;
    public int remover(int id);
}
