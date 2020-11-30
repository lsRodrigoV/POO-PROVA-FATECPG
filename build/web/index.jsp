<%-- 
    Document   : index
    Created on : 3 de out de 2020, 02:45:33
    Author     : Rodrigo
--%>
<%@page import="br.edu.fatecpg.poo.Disciplinas" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>     
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/head-references.jspf"%>
        <title>Index</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <h1>Index</h1>
        <p>Nome: Rodrigo Vieira Lopes</p>
        <p>RA: 1290481722018</p>
        <p>Disciplinas Matriculadas: <%= Disciplinas.getList().size()%></p>
    </body>
</html>
