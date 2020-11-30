<%-- 
    Document   : disciplinas
    Created on : 3 de out de 2020, 09:17:04
    Author     : Rodrigo
--%>

<%@page import="br.edu.fatecpg.poo.Disciplinas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String exceptionMessage = null;
    if(request.getParameter("cancelar")!=null){
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("formInsert")!=null){
        try {
            String nome = request.getParameter("nome");
            String ementa = request.getParameter("ementa");
            int ciclo = Integer.parseInt(request.getParameter("ciclo"));
            double nota = Double.parseDouble(request.getParameter("nota"));
            Disciplinas.Insert(nome, ementa, ciclo, nota);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    if(request.getParameter("formUpdate")!=null){
        try {
            String nomeAntigo = request.getParameter("nomeAntigo");
            String nome = request.getParameter("nome");
            String ementa = request.getParameter("ementa");
            int ciclo = Integer.parseInt(request.getParameter("ciclo"));
            double nota = Double.parseDouble(request.getParameter("nota"));
            Disciplinas.Update(nomeAntigo, nome, ementa, ciclo, nota);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    if(request.getParameter("formDelete")!=null){
        try {
            String nome = request.getParameter("nome");
            Disciplinas.Delete(nome);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        }
    }

%>

<!DOCTYPE html>


<html>
    <head>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/head-references.jspf" %>
        <title>Disciplinas</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <h1>Disciplinas</h1><hr/>
        
                <table class="table-sm table-bordered">
            <thead>
                <tr align="center">
                    <th class="table-spot">Nome</th>
                    <th class="table-spot">Ementa</th>
                    <th class="table-spot">Ciclo</th>
                    <th class="table-spot">Nota</th>
                    <th class="table-spot">Comandos</th>
                </tr>
            </thead>
            <tbody>
                <%for(Disciplinas d: Disciplinas.getList()){%>
                <tr align="center">
                    <td style="width: 120px;"><%= d.getNome()%></td>
                    <td style="width: 400px; font-size: 11px"><%= d.getEmenta()%></td>
                    <td style="width: 80px;"><%= d.getCiclo()%>º</td>
                    <td style="width: 80px;"><%= d.getNota()%></td>
                    <td>
                        <form method="post">
                            <input type="hidden" name="nome" value="<%= d.getNome()%>"/>
                            <input type="hidden" name="ementa" value="<%= d.getEmenta()%>"/>
                            <input type="hidden" name="ciclo" value="<%= d.getCiclo()%>"/>
                            <input type="hidden" name="nota" value="<%= d.getNota()%>"/>
                            <input type="submit" name="prepUpdate" value="Alterar"/>
                            <input type="submit" name="prepDelete" value="Deletar"/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
            <br><hr>
        
        
        <%if(request.getParameter("prepInsert")!=null){%>
        <h3>Inserir Disciplina</h3>
        <form>
            
            Nome: <input type="text" name="nome">
            Ementa: <input type="text" name="ementa">
            Ciclo: <input name="ciclo">
            Nota: <input type="number" step="0.01" min="0" max="10" name="nota">
            <input type="submit" name="formInsert" value="Inserir"/>
            <input type="submit" name="cancelar" value="Cancelar"/>
        </form>
        
        <%}else if(request.getParameter("prepUpdate")!=null){%>
        <%
            String nome = request.getParameter("nome");
            String ementa = request.getParameter("ementa");
            String ciclo = request.getParameter("ciclo");
            String nota = request.getParameter("nota");
        %>
        <h3>Atualizar Disciplina</h3>
        <form>
            <input type="hidden" name="nomeAntigo" value="<%= nome%>">
            Nome: <input type="text" name="nome" value="<%= nome%>">
            Ementa: <input type="text" name="ementa" value="<%= ementa%>">
            Ciclo: <input name="ciclo" value="<%= ciclo%>">
            Nota: <input type="number" name="nota" step="0.01" min="0" max="10" value="<%= nota%>">
            <input type="submit" name="formUpdate" value="Atualizar"/>
            <input type="submit" name="cancelar" value="Cancelar"/>
        </form>
            
        <%}else if(request.getParameter("prepDelete")!=null){%>
        <%String nome = request.getParameter("nome");%>
        <h3>Deletar Disciplina</h3>
        <form>
            <input type="hidden" name="nome" value="<%= nome%>"/>
            Deseja Apagar a Disciplina <b><%= nome%></b>?
            <input type="submit" name="formDelete" value="Deletar"/>
            <input type="submit" name="cancelar" value="Cancelar"/>
        </form>
        
        <%}else{%>    
        <form method="post">
            <input type="submit" name="prepInsert" value="Inserir">
        </form> 
        <%}%>
        </div>
    </body>
</html>

