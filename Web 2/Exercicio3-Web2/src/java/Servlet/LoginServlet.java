/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.Usuario;
import DAO.UsuarioDAO;
import Utils.MD5;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nicol
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        
        /* Inicio da lógica de busca no DAO */
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        Usuario u = new Usuario();
        u.setLogin(login);
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = usuarioDAO.buscarPorLogin(u);
        /**/
        
        senha = MD5.MD5Transformed(senha);
        
        if (usuario.getLogin() != null) {
            if (senha.equals(usuario.getSenha())) {
                HttpSession session = request.getSession(true);
                session.setAttribute("nome", usuario.getNome());
                RequestDispatcher rd = request.getRequestDispatcher("PortalServlet");
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("ErroServlet");
                request.setAttribute("msg", "Usuário ou senha incorretos!");
                request.setAttribute("page", "index.html");
                rd.forward(request, response);
            }
        } else { 
            RequestDispatcher rd = request.getRequestDispatcher("ErroServlet");
            request.setAttribute("msg", "Usuário não encontrado!");
            request.setAttribute("page", "index.html");
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
        return "Servlet de Login";
    }// </editor-fold>

}
