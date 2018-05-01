<%-- 
    Document   : menu
    Created on : 3/11/2017, 06:33:09 PM
    Author     : crisa
--%>

<%@page import="java.sql.ResultSet"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Usuario</title>
    </head>
    <body>
        <form action="miservlet" method="post">
        <h1>Consultar Estudiante</h1>
        <h3> Identificacion <INPUT type=?text? name= "Identificacion"> </h3>
        <br>
        <br>
      <buton>
          <input type="submit" value= "Enviar" name="enviar"required>
      </buton>
        </form>
    </body>
</html>


