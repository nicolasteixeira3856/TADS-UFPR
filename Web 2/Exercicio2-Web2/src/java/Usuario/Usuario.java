/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Usuario;

/**
 *
 * @author nicol
 */
public class Usuario {
    private String name;
    private String login;
    private String senha;
    
    public Usuario() {}
    
    public Usuario(String name, String login, String senha) {
        this.name = name;
        this.login = login;
        this.senha = senha;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getLogin() {
        return login;
    }
    
    public void setLogin(String login) {
         this.login = login;
    }
    
    public String getSenha() {
        return senha;
    }
    
    public void setSenha(String senha) {
        this.senha = senha;
    }
}
