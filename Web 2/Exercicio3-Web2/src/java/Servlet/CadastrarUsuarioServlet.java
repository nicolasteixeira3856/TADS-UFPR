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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CadastrarUsuarioServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>APENAS MÉTODO POST!</h1>");
            out.println("<a href=\"PortalServlet\">PortalServlet</a>");
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
        /* Inicio da lógica de inserção no DAO */
        String nome = request.getParameter("nome");
        String login = request.getParameter("login"); 
        String senha = request.getParameter("senha"); 
        
        if (nome.isEmpty() || login.isEmpty() || senha.isEmpty()) {
            RequestDispatcher rd = request.getRequestDispatcher("ErroServlet");
            request.setAttribute("msg", "Preencha todos os campos do formulário!");
            request.setAttribute("page", "PortalServlet");
            rd.forward(request, response);
            return;
        }
        
        senha = MD5.MD5Transformed(senha);
        Usuario u = new Usuario();
        u.setNome(nome);
        u.setLogin(login);
        u.setSenha(senha);
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        boolean insert = usuarioDAO.inserir(u);
        /* */
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if (insert) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet CadastrarUsuarioServlet</title>");            
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Usuario cadastrado com sucesso!</h1>");
                out.println("<a href=\"PortalServlet\">PortalServlet</a>");
                out.println("</body>");
                out.println("</html>");
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("ErroServlet");
                request.setAttribute("msg", "Não foi possível cadastrar o usuário");
                request.setAttribute("page", "PortalServlet");
                rd.forward(request, response);
            }
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Cadastro de usuário";
    }// </editor-fold>

}
