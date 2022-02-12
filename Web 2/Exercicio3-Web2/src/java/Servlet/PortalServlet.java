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
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;
import Model.Usuario;
import DAO.UsuarioDAO;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
/**
 *
 * @author nicol
 */
@WebServlet(name = "PortalServlet", urlPatterns = {"/PortalServlet"})
public class PortalServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String nome = (String) session.getAttribute("nome");
        if (nome == null) {
            RequestDispatcher rd = request.getRequestDispatcher("ErroServlet");
            request.setAttribute("msg", "Precisa estar logado");
            request.setAttribute("page", "index.html");
            rd.forward(request, response);
        }
        
        List<Usuario> usuarios = new ArrayList<Usuario>();
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarios = usuarioDAO.buscarTodos();
        
        response.setContentType("text/html;charset=UTF-8");        
        try (PrintWriter out = response.getWriter()) {
            //Comeca a pagina HTML
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PortalServlet</title>");   
            out.println("<style>table, th {border: 2px solid black;border-collapse: collapse;} td { border:2px solid black; padding:15px; }</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PortalServlet</h1>");
            out.println("<form action=\"CadastrarUsuarioServlet\" method=\"post\">");
            out.println("Nome: <input type=\"text\" name=\"nome\" /><br/>");
            out.println("Login: <input type=\"text\" name=\"login\" /><br/>");
            out.println("Senha: <input type=\"password\" name=\"senha\" /><br/>");
            out.println("<input type=\"submit\" name=\"Cadastrar usuário\" /><br/>");
            out.println("</form>");
            out.println("<h5>Listagem</h5>");
            out.println("<table>");
            out.println("<tr>");
            out.println("<th>Nome</th>");
            out.println("<th>Login</th>");
            out.println("<th>Senha</th>");
            out.println("</tr>");
            // For para percorrer o arraylist de usuarios
            for (int i = 0; i < usuarios.size(); i++) {
                out.println("<tr>");
                out.println("<td>" + usuarios.get(i).getNome()+ "</td>");
                out.println("<td>" + usuarios.get(i).getLogin()+ "</td>");
                out.println("<td>" + usuarios.get(i).getSenha()+ "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
            out.println("<a href=\"LogoutServlet\">Logout</a>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
