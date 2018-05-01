<%-- 
    Document   : registrar
    Created on : 18/11/2017, 12:51:13 PM
    Author     : crisa
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Logica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="conexion.Conexion"%>
<%@page import ="java.util.*" %>
<%
        String id_tipo_documento;
        String identificacion;
        String nombre;
        String apellido;
        String fecha_nacimiento;
        String correo;
        String telefono;
        String clave;
        String id_rol;
%>
<%
    if (request.getParameter("registrar")!= null){
    if(request.getParameter("id_tipo_documento")!="" &&  
       request.getParameter("identificacion")!="" &&  
       request.getParameter("nombre")!="" &&  
       request.getParameter("apellido")!="" &&  
       request.getParameter("fecha_nacimiento")!="" &&  
       request.getParameter("correo")!="" && 
       request.getParameter("telefono")!="" && 
       request.getParameter("id_rol")!="" && 
       
       request.getParameter("clave")!="")
        {
        id_tipo_documento = request.getParameter("id_tipo_documento");
        identificacion =  request.getParameter("identificacion");
        nombre =  request.getParameter("nombre");
        apellido = request.getParameter("apellido");
        fecha_nacimiento =  request.getParameter("fecha_nacimiento");
        correo =  request.getParameter("correo");
        telefono = request.getParameter("telefono");
        clave = request.getParameter("clave");
        id_rol = request.getParameter("id_rol");
        
 
        Logica Conexion=new Logica();
        String insertar="insert into usuarios (id_tipo_documento,identificacion,nombre,apellido,fecha_nacimiento,correo,telefono,clave,id_rol)values('"+id_tipo_documento+"','"+identificacion+"','"+nombre+"','"+apellido+"','"+fecha_nacimiento+"','"+correo+"','"+telefono+"','"+clave+"','"+id_rol+"')";
        int rs= Conexion.InsertarGeneralSQL(insertar);
        if(rs==1)
            {%>
             <script>
               alert("El registro se insertó correctamente");  
             </script>
             <jsp:forward page="iniciarSecion_Estud.jsp"/>
             
            
            <%}
         else
            {%>
            <script>
               alert("El registro no se insertó correctamente");  
             </script>
             
            <%}

}else

{%>
<script>
alert("Debe llenar todos los campos");  
</script>
<%}
}%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estiloR.css">
        <title>Registrar</title>
        
    </head>
    
        
        <body  style="background-image: url(imagen/pattern.png) , url(imagen/Fondo.jpg);">
            <h1>Formulario de Registro</h1>
            
            <form action="registrar.jsp" method="post" class="form-registrar">
        
                <h2 class="form-titulo">Registrar</h2>
                <div class="contenedor-inputs">
        
            <input type="text"  placeholder="&#128697; Tipo Documento"   name="id_tipo_documento"  id="tipo" class="input-48">        
            <input type="text"  placeholder="&#128697; Documento"   name="identificacion"  id="iduser" class="input-48"> 
            
            <input type="text"  placeholder="&#128697; Nombre"   name="nombre"  id="name" class="input-48">        
            <input type="text"  placeholder="&#128697; Apellido" name="apellido" id="apell" class="input-48">    
            <input type="date" placeholder="&#128366; fecha Nacimiento"   name="fecha_nacimiento" id="curso" class="input-48" >
            <input type="text"placeholder="&#9329; Correo" name="correo" id="correo" class="input-48">
            <input type="text"placeholder="&#9329; telefono" name="telefono" id="telefono" class="input-48">
            <input type="text"placeholder="&#9329; rol" name="id_rol" id="rol" class="input-48">
            <!--<input type="text"  placeholder="&#127380; Identificacion" name="iduser" id="iduser"class="input-100">-->
               
            <input type="password" placeholder="&#128272; Contraseña" name="clave" id="pass"class="input-100">                    
            <input type="password" placeholder="&#128272; Confirmar Contraseña"name="pass2" id="pass" class="input-100">
            <p class="form_link">¿Ya tienes un cuenta? <a href="index.jsp">Ingresa Aqui</a></p>

            
            <input type="submit"  value="Registrar"  name="registrar"class="btn-enviar" required>
                </div>
                
        </form>
        
            
    </body>
</html>
