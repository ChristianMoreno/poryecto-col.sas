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
    String id_tipo_documento="";
    String identificacion="";
    String nombre="";
    String apellido="";
    String fecha_nacimiento="";
    String correo="";
    String telefono="";
    String clave="";
    String id_rol="";
    String control = "";
    
    
    
    
    
    identificacion =request.getParameter("identificacion");
            Logica Conexion = new Logica();
            String consulta= "select * from usuarios where identificacion = '"+identificacion+"'";
            ResultSet res= Conexion.ConsultaGeneralSQL(consulta);
        while(res.next()){
        id_tipo_documento=res.getString(2);
        identificacion=res.getString(3);
        nombre=res.getString(5);
        apellido=res.getString(6);
        fecha_nacimiento=res.getString(7);
        correo=res.getString(8);
        telefono=res.getString(9);
        clave=res.getString(10);
        id_rol=res.getString(11);
        
 
        control="si";

        }
    %>
<%
    if (request.getParameter("modificar")!= null){
    if(request.getParameter("id_tipo_documento")!=null &&  request.getParameter("nombre")!=null && request.getParameter("apellido")!=null && 
            request.getParameter("fecha_nacimiento")!=null && request.getParameter("correo")!=null &&
            request.getParameter("telefono")!=null && request.getParameter("clave")!=null && request.getParameter("id_rol")!=null)
        {
        id_tipo_documento =  request.getParameter("id_tipo_documento");
        identificacion =  request.getParameter("identificacion");
        nombre =  request.getParameter("nombre");
        apellido = request.getParameter("apellido");
        fecha_nacimiento =  request.getParameter("fecha_nacimiento");
        correo =  request.getParameter("correo");
        telefono = request.getParameter("telefono");
        clave = request.getParameter("clave");
 
        String modificar="update usuarios set id_tipo_documento='"+id_tipo_documento+"',nombre='"+nombre+"',apellido='"+apellido+"',fecha_nacimiento='"+fecha_nacimiento+"',correo='"+correo+"',telefono='"+telefono+"',clave='"+clave+"' where identificacion='"+identificacion+"'";
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
    String borrar="delete from usuarios where identificacion = '"+identificacion+"'";
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
        <h3> T. Documento <INPUT type=“text” name= "id_tipo_documento" value="<%=id_tipo_documento%>" </h3>
        <h3> identificacion <INPUT type=“text” name= "identificacion" value="<%=identificacion%>" </h3>
        <h3> Nombre <INPUT type=“text” name= "nombre" value="<%=nombre%>"</h3>
        <h3> Apellido <INPUT type=“text” name= "apellido" value="<%=apellido%>"</h3>
        <h3> Fecha de nacimiento <INPUT type=“text” name= "fecha_nacimiento" value="<%=fecha_nacimiento%>"</h3>
        <h3> Correo <INPUT type=“text” name= "correo" value="<%=correo%>"</h3>
        <h3> Telefono <INPUT type=“text” name= "telefono" value="<%=telefono%>" </h3>
        <h3> clave <INPUT type=“text” name= "clave" value="<%=clave%>"</h3>
        <h3> id_rol <INPUT type=“text” name= "id_rol" value="<%=id_rol%>"</h3>
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