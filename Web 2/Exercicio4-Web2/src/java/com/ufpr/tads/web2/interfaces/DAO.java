/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.interfaces;

import com.ufpr.tads.web2.beans.Usuario;
import com.ufpr.tads.web2.exceptions.DAOException;

/**
 *
 * @author nicol
 * @param <T>
 */
public interface DAO<T> {
    void inserir(T t) throws DAOException;
    Usuario buscarPorLogin(T t) throws DAOException;
}
