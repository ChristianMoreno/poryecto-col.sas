<%-- 
    Document   : iniciarSecion
    Created on : 18/11/2017, 12:35:17 PM
    Author     : crisa
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Logica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="conexion.Conexion"%>
<%@page import ="java.util.*" %>

<%
    String identificacionBD="";
    String claveBD="";
  
    
    
    if (request.getParameter("ingresar")!= null){
      
    if(request.getParameter("identificacion")!="" && request.getParameter ("clave")!= "")
        
    {
        
        
        String identificacion = request.getParameter("identificacion");
        String  clave =  request.getParameter("clave");
        
        
        Logica Conexion = new Logica();
        
        ResultSet rs=Conexion.ConsultaSQLClave(identificacion, clave);
        
        
        while(rs.next()){
        
        
        
        identificacionBD=rs.getString(3);
         
        claveBD=rs.getString(10);
        }
        if(identificacionBD.equals(identificacion) && claveBD.equals(clave))
 {
 HttpSession sesionOk = request.getSession();
 
  sesionOk.setAttribute("identificacion",identificacionBD);
 
 %>
 <jsp:forward page="sesionPadre.jsp"/>
<%}else
{
             %>
             <script>
               alert("Usuario y/o contraseña incorrectos");  
               alert("Intente de nuevo");
             </script>
            <%}
}
}
 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Monitor School</title>
        
    </head>
   
    
    <body style="background-image: url(imagen/pattern.png) , url(imagen/Fondo.jpg);">
        <h1>Bienvenido Padre</h1>
        <form action="" method="post">
        <h2 class="form-titulo">Bienvenido</h2>
        <div class="contenedor-inputs">
        
        <input type="text"   placeholder="&#127380; Usuario" name="identificacion" class="input-100" > 
        <input type="password"   placeholder="&#128272; Contraseña" name="clave" class="input-100"> 
        
        <p class="form_link">¿No tienes una cuenta? <a href="registrar.jsp">Ingresa Aqui</a></p>
        <input type="submit"  value="Ingresar" name="ingresar" class="btn-enviar" required>
        
        </div>
       </form>
       
        
        
    </body>
</html>
