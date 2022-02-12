<%-- 
    Document   : erro
    Created on : 04/08/2020, 19:07:44
    Author     : nicol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Erro JSP</title>
    </head>
    <body>
        Erro: <%=request.getAttribute("msg")%><br>
        <a href="<%=request.getAttribute("page")%>">Voltar</a>
        <footer>
            <jsp:useBean id="configuracao" class="com.ufpr.tads.web2.beans.ConfigBean" scope="application" />
            Em caso de problemas contactar o administrador: <jsp:getProperty name="configuracao" property="email" />
        </footer>
    </body>
</html>
