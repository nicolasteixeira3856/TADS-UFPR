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

/**
 *
 * @author nicol
 */
@WebServlet(name = "MeuSeptServlet", urlPatterns = {"/MeuSeptServlet"})
public class MeuSeptServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
 /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>ExercicioServlet</title>");    
            out.println("<style>");
            out.println("table, th, td { border: 1px solid black; } td { padding:5px; } .setor { font-family: Verdana, Geneva, sans-serif; color: #0D89C5; } ");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1 class='setor'>SEPT</h1>");
            out.println("<p><small>Rua Dr. Alcides Vieira Arcoverde, 1225</small></p>");
            out.println("<table>");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th scope='col'>Curso</th>");
            out.println("<th scope='col'>Página</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            out.println("<tr>");
            out.println("<td>Petróleo e Gás</td>");
            out.println("<td><a href='http://www.sept.ufpr.br/portal/petroleogas/sobre-o-curso/'>http://www.sept.ufpr.br/portal/petroleogas/sobre-o-curso</a></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>Agente Comunitário de Saúde</td>");
            out.println("<td><a href='http://www.sept.ufpr.br/portal/agentesaude/sobre-o-curso/'>http://www.sept.ufpr.br/portal/agentesaude/sobre-o-curso/</a></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>Análise e Desenvolvimento de Sistemas</td>");
            out.println("<td><a href='http://www.sept.ufpr.br/portal/analisesistemas/sobre-o-curso/'>http://www.sept.ufpr.br/portal/analisesistemas/sobre-o-curso/</a></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>Comunicação Institucional</td>");
            out.println("<td><a href='http://www.sept.ufpr.br/portal/comunicacaoinstitucional/sobre-o-curso/'>http://www.sept.ufpr.br/portal/comunicacaoinstitucional/sobre-o-curso/</a></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>Gestão da Qualidade</td>");
            out.println("<td><a href='http://www.sept.ufpr.br/portal/gestaoqualidade/'>http://www.sept.ufpr.br/portal/gestaoqualidade</a></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>Gestão Pública</td>");
            out.println("<td><a href='http://www.sept.ufpr.br/portal/gestaopublica/'>http://www.sept.ufpr.br/portal/gestaopublica/</a></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>Luteria</td>");
            out.println("<td><a href='http://www.sept.ufpr.br/portal/luteria/sobre-o-curso/'>http://www.sept.ufpr.br/portal/luteria/sobre-o-curso/</a></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>Negócios Imobiliários</td>");
            out.println("<td><a href='http://www.sept.ufpr.br/portal/negociosimobiliarios/sobre-o-curso/'>http://www.sept.ufpr.br/portal/negociosimobiliarios/sobre-o-curso/</a></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>Produção Cênica</td>");
            out.println("<td><a href='http://www.sept.ufpr.br/portal/producaocenica/sobre-o-curso/'>http://www.sept.ufpr.br/portal/producaocenica/sobre-o-curso/</a></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>Secretariado</td>");
            out.println("<td><a href='http://www.sept.ufpr.br/portal/secretariado/sobre-o-curso/'>http://www.sept.ufpr.br/portal/secretariado/sobre-o-curso</a></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>Pós-Graduação em Bioinformátic</td>");
            out.println("<td><a href='http://www.bioinfo.ufpr.br'>http://www.bioinfo.ufpr.br</a></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>Especialização em Inteligência Artificial</td>");
            out.println("<td><a href='http://www.iaa.ufpr.br'>http://www.iaa.ufpr.br</a></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>Especialização em Engenharia de Software</td>");
            out.println("<td><a href='http://www.engenhariadesoftware.ufpr.br:28080/engenhariadesoftware/'>http://www.engenhariadesoftware.ufpr.br:28080/engenhariadesoftware/</a></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>MBA em Mercado Imobiliário</td>");
            out.println("<td><a href='http://www.sept.ufpr.br/portal/blog/arquivos/principal/mba-negocios-imobiliarios-2020'>http://www.sept.ufpr.br/portal/blog/arquivos/principal/mba-negocios-imobiliarios-2020</a></td>");
            out.println("</tr>");
            out.println("</tbody>");
            out.println("</table>");
            out.println("<a href='meutads.jsp'>Ir para o Meu Tads</a>");
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
