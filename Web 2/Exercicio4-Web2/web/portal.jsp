<%-- 
    Document   : portal
    Created on : 04/08/2020, 19:07:23
    Author     : nicol
--%>

<% if (session.getAttribute("LoginBean") == null) { 
        System.out.println("Não logado");
        RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");
        request.setAttribute("msg", "É necessário estar logado para realizar essa ação!");
        request.setAttribute("page", "index.html");
        rd.forward(request, response);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Portal JSP</title>
    </head>
    <body>
        <jsp:useBean id="LoginBean" class="com.ufpr.tads.web2.beans.LoginBean" scope="session"/>
        Nome: <jsp:getProperty name="LoginBean" property="nome" /><br />
        <a href="inserir.jsp">Inserir</a><br>
        <a href="LogoutServlet">Logout</a>
    </body>
</html>
