/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.ufpr.tads.web2.beans.Usuario;
import java.sql.SQLException;
import com.ufpr.tads.web2.interfaces.DAO;
import com.ufpr.tads.web2.exceptions.DAOException;

/**
 *
 * @author nicol
 */
public class UsuarioDAO implements DAO<Usuario> {
    
    private static final String QUERY_BUSCAR_LOGIN = "SELECT id_usuario, login_usuario, senha_usuario, nome_usuario FROM tb_usuario WHERE login_usuario = ?";
    private static final String QUERY_INSERIR = "INSERT INTO tb_usuario (login_usuario, senha_usuario, nome_usuario) VALUES (?, ?, ?)";
    
    private Connection con = null;

    public UsuarioDAO(Connection con) throws Exception {
        if (con == null) {
            throw new Exception("Conexão nula ao criar PessoaDAO.");
        }
        this.con = con;
    }
    
    /**
     *
     * @param usuario
     */
    @Override
    public void inserir(Usuario usuario) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(QUERY_INSERIR)) {
            st.setString(1, usuario.getLogin());
            st.setString(2, usuario.getSenha());
            st.setString(3, usuario.getNome());
            st.executeUpdate();
        }
        catch(SQLException e) {
            throw new DAOException("Erro inserindo usuario: " +
            QUERY_INSERIR +
            "/ " + usuario.toString(), e);
        }
    }

    /**
     * 
     * @param usuario
     * @return 
     */
    @Override
    public Usuario buscarPorLogin(Usuario usuario) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(QUERY_BUSCAR_LOGIN)) {
            st.setString(1, usuario.getLogin());
            System.out.println(st);
            ResultSet rs = st.executeQuery();
            Usuario u = new Usuario();
            if (rs.next()) {
                u.setId(Integer.valueOf(rs.getString("id_usuario")));
                u.setLogin(rs.getString("login_usuario"));
                u.setSenha(rs.getString("senha_usuario"));
                u.setNome(rs.getString("nome_usuario"));
            }
            return u;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar usuario: " +
            QUERY_INSERIR +
            "/ " + usuario.toString(), e);
        }
    }
}
