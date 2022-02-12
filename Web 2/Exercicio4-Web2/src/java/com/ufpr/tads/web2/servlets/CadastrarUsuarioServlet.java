/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.servlets;

import com.ufpr.tads.web2.beans.Usuario;
import com.ufpr.tads.web2.dao.UsuarioDAO;
import com.ufpr.tads.web2.utils.MD5;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.ufpr.tads.web2.dao.ConnectionFactory;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nicol
 */
@WebServlet(name = "CadastrarUsuarioServlet", urlPatterns = {"/CadastrarUsuarioServlet"})
public class CadastrarUsuarioServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            if (session.getAttribute("LoginBean") == null) {
                RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");
                request.setAttribute("msg", "É necessário estar logado para realizar essa ação!");
                request.setAttribute("page", "index.html");
                rd.forward(request, response);
            }
            
            /* Inicio da lógica de inserção no DAO */
            String nome = request.getParameter("nome");
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            
            if (nome.isEmpty() || login.isEmpty() || senha.isEmpty()) {
                RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");
                request.setAttribute("msg", "Preencha todos os campos do formulário!");
                request.setAttribute("page", "portal.jsp");
                rd.forward(request, response);
                return;
            }
            
            senha = MD5.MD5Transformed(senha);
            Usuario u = new Usuario();
            u.setNome(nome);
            u.setLogin(login);
            u.setSenha(senha);
            ConnectionFactory con = new ConnectionFactory();
            UsuarioDAO usuarioDAO = new UsuarioDAO(con.getConnection());
            usuarioDAO.inserir(u);
            response.sendRedirect("portal.jsp");
            /* */
        } catch (Exception ex) {
            RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");
            request.setAttribute("msg", "Não foi possível cadastrar usuário! " + ex.getMessage());
            request.setAttribute("page", "portal.jsp");
            rd.forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
