/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import com.ufpr.tads.web2.exceptions.DAOException;

/**
 *
 * @author nicol
 */
public class ConnectionFactory implements AutoCloseable {
    
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/ex3web2?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false";
    private static final String LOGIN = "root";
    private static final String SENHA = "root";

    private Connection con = null;

    public Connection getConnection() {
        if (con == null) {
            try {
                Class.forName(DRIVER);
                con = DriverManager.getConnection(URL, LOGIN, SENHA);
            }
            catch(SQLException e) {
                throw new DAOException("Erro conectando ao BD: " + URL + "/" + LOGIN + "/" + SENHA, e);
            } catch (ClassNotFoundException ex) {
                throw new DAOException("Driver do banco não encontrado: " + DRIVER, ex);
            }
        }
        return con;
    }

    @Override
    public void close() {
        if (con!=null) {
            try {
                con.close();
                con = null;
            }
            catch(Exception e) {
                System.out.println("Erro fechando a conexão. IGNORADO");
                e.printStackTrace();
            }
        }
    }
}
