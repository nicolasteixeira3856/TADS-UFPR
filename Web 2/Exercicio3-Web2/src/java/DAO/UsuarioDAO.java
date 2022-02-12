/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Model.Usuario;
import Factories.ConnectionFactory;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nicol
 */
public class UsuarioDAO {

    public UsuarioDAO() {
    }
    
    public Usuario buscarPorLogin(Usuario usuario) {
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        Usuario u = new Usuario();
        
        try {
            con = ConnectionFactory.getConnection();
            st = con.prepareStatement("SELECT id_usuario, login_usuario, senha_usuario, nome_usuario FROM tb_usuario WHERE login_usuario = ?");
            st.setString(1, usuario.getLogin());
            rs = st.executeQuery();
            
            if (rs.next()) {
                u.setId(Integer.valueOf(rs.getString("id_usuario")));
                u.setLogin(rs.getString("login_usuario"));
                u.setSenha(rs.getString("senha_usuario"));
                u.setNome(rs.getString("nome_usuario"));
            }
           
            return u;  
        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally {
            if (st!=null)
                try {st.close();} catch (SQLException e){}
            if (con!=null)
                try {con.close();} catch (SQLException e){}
        }
        return null;
    }
    
    public boolean inserir(Usuario usuario) {
        Connection con = null;
        PreparedStatement st = null;
        
        try {
            con = ConnectionFactory.getConnection();
            st = con.prepareStatement("insert into tb_usuario (login_usuario, senha_usuario, nome_usuario) values (?, ?, ?)");
            st.setString(1, usuario.getLogin());
            st.setString(2, usuario.getSenha());
            st.setString(3, usuario.getNome());
            int retorno = st.executeUpdate();
            
            if(retorno == 0){
                return false;
            }
            return true;
            
        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally {
            if (st!=null)
                try {st.close();} catch (SQLException e){}
            if (con!=null)
                try {con.close();} catch (SQLException e){}
        }
        return false;
    }
    
    public List<Usuario> buscarTodos() {
        List<Usuario> usuarios = new ArrayList<Usuario>();
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            con = ConnectionFactory.getConnection();
            st = con.prepareStatement("SELECT * FROM tb_usuario");
            rs = st.executeQuery();
            while (rs.next()) {
                Usuario ub = new Usuario();
                ub.setId(Integer.valueOf(rs.getString("id_usuario")));
                ub.setLogin(rs.getString("login_usuario"));
                ub.setSenha(rs.getString("senha_usuario"));
                ub.setNome(rs.getString("nome_usuario"));
                usuarios.add(ub);
            }
            return usuarios;
        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                }
            }
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException e) {
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                }
            }
        }
        return null;
    }
}
