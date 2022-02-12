<%-- 
    Document   : inserir
    Created on : 04/08/2020, 19:08:28
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
        <title>Inserir JSP</title>
    </head>
    <body>
        <form action="CadastrarUsuarioServlet" method="post">
            Nome:  <input type="text" name="nome" /><br/>
            Login: <input type="text" name="login" /><br/>
            Senha: <input type="password" name="senha" /><br/>
            <input type="submit" name="Cadastrar usuário" /><br/>
        </form>
    </body>
</html>
