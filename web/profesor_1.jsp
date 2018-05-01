<%-- 
    Document   : profesor
    Created on : 19/11/2017, 04:37:05 PM
    Author     : crisa
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Logica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="conexion.Conexion"%>
<%@page import ="java.util.*" %>

<%
   String identificacion="";
   String id_actividad_usuario="";
   String id_actividad="";
   String id_usuario="";
   String nota="";
   
   String control = "";
   
   
    
    
    
    
    
    identificacion =request.getParameter("identificacion");
            Logica Conexion = new Logica();
            String consulta= "select u.nombre estudiante, m.nombre materias, a.descripcion actividad,  au.nota notaa from materias m\n" +
"INNER JOIN materias_curso mc ON m.id_materia=mc.id_materia INNER JOIN actividades a \n" +
"ON mc.id_materia_curso=a.id_materia_curso INNER JOIN actividades_usuario au \n" +
"ON a.id_actividad=au.id_actividad INNER JOIN usuarios u ON au.id_usuario=u.id_usuario where u.identificacion = '"+identificacion+"'";
            ResultSet res= Conexion.ConsultaGeneralSQL(consulta);
        while(res.next()){
        
        
        String estudiante=res.getString(1);
        String materias=res.getString(2);
        String actividad =res.getString(3);
        String notaa=res.getString(4);
       
        
        
 
        control="si";

        }
    %>
<%
    if (request.getParameter("modificar")!= null){
    if(request.getParameter("id_actividad_usuario")!=null &&  request.getParameter("id_actividad")!=null && request.getParameter("id_usuario")!=null && 
            request.getParameter("nota")!=null )
        {
        id_actividad_usuario=  request.getParameter("id_actividad_usuario");
        id_actividad =  request.getParameter("id_actividad");
        id_usuario =  request.getParameter("id_usuario");
        nota = request.getParameter("nota");
        
 
        String modificar="update actividades_usuario set id_actividad_usuario='"+id_actividad_usuario+"',id_actividad='"+id_actividad+"',id_usuario='"+id_usuario+"',nota='"+nota+"' where identificacion='"+identificacion+"'";
        int rs= Conexion.ModificarGeneralSQL(modificar);
        if(rs==1)
            {%>
             <script>
               alert("El registro se modifico correctamente");  
             </script>
            <%}
         else
            {%>
            <script>
               alert("El registro no se modifico correctamente");  
             </script>
            <%}
}
else
{%>
<script>
alert("Debe llenar todos los campos");  
</script>
<%}
}%>
<%
    if (request.getParameter("borrar")!=null){
    String borrar="delete from actividades_usuario where identificacion = '"+identificacion+"'";
    int rs= Conexion.DeleteGeneralSQL(borrar);
    if (rs==1)
    {%>
    <script>
               alert("El registro se modifico correctamente");  
             </script>
            <%}
         else
            {%>
            <script>
               alert("El registro no se borro correctamente");  
             </script>
            <%}}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <head>
    <style type="text/css">
    
    body
{
background-image:
url("imagen/vehiculogold.jpg");
background-position: center center;
background-repeat:
no-repeat;
background-size: cover;
background-attachment:
fixed


}
</style>
<head/>      
        
        
    
    
<form action="profesor.jsp"  method="post">
      <font color="#ffbf00">
      <font face="Comic Sans MS">
        <h1>Formulario Consultar </h1>
        <P ALIGN=right><<<<<a href="Index.jsp" title="">Cerrar Sesion</a>
            <br>
            <br>
            <IMG SRC="imagen/logo.gif" align = "right" width="70" height="70" ALT="Logo">
        
        <h3> identificacion <INPUT type=“text” name= "identificacion" value="<%=identificacion%>" </h3>
        <h3> id_actividad_usuario <INPUT type=“text” name= "nombre" value="<%=id_actividad_usuario%>"</h3>
        <h3> id_actividad <INPUT type=“text” name= "apellido" value="<%=id_actividad%>"</h3>
        <h3> id_usuario <INPUT type=“text” name= "fecha_nacimiento" value="<%=id_usuario%>"</h3>
        <h3> Correo <INPUT type=“text” name= "correo" value="<%=nota%>"</h3>
        
        <br>
        <br>
      <buton>
          <input type="submit" value= "Buscar" name="buscar"required>
          <%if(control=="si")
          {%>
          <input type="submit" value= "modificar" name="modificar">
          <input type="submit" value= "borrar" name="borrar">
          <%}%>
      </buton>
        <form>
                            
                              <input type="button" value="Regresar" name="regresar 2" onclick="history.back()" />
                              <br>
                              <br>
                             
                            
                          </form>
        <br>
        <br>
        <br>
        
        </form>
</font>
    </body>
</html>