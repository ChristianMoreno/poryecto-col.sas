<%@ page session="true" %>
<%
HttpSession sesionOk = request.getSession();
sesionOk.invalidate();
%>
<jsp:forward page="index.jsp"/>
<html>
<head>
     <style> * { margin: 0; padding: 0; } html,body { height:100%; } /* Div que engloba el contenido de la página menos el footer */ #wrapper { min-height:100%; } header { display:block; background:#ccc; padding:10px 0px; } section { overflow: auto; /* Definimos el padding inferior: 50px del pie de pagina mas 10px de separacion */ padding-bottom: 60px; /* Definimos un padding superior */ padding-top:30px; } footer { position: relative; /* Altura total del footer en px con valor negativo */ margin-top: -50px; /* Altura del footer en px. Se han restado los 5px del margen superior mas los 5px del margen inferior */ height: 100px; padding:5px 0px; clear: both; background: #286af0; text-align: center; color: #fff; } /* Esta clase define la anchura del contenido y la posicion centrada El contenido queda centrado y limitado, pero la cabecera y el pie llegan hasta los limites del navegador. */ .define { width:960px; margin:0 auto; } </style>
     <title>Cerrar Sesion</title>
<script type="text/javascript">
history.forward();
</script>
       
</html>
