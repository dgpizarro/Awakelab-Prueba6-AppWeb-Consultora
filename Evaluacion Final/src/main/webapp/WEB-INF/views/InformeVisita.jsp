<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Informe Visita</title>
<!-- Tipos Font -->
    <script src="https://kit.fontawesome.com/14907c5069.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
        rel="stylesheet">
<style>
                
      #informeVisita{
        width: 90% !important;
      }
</style>
</head>
	<body>  	  
	
	        <div class="separadorForm"> <p> Genere informe </p> </div>
	   
	        <form:form action="${pageContext.request.contextPath}/Profesional/crearInformeVisita/${id_profesional}.html" method="POST" class="formContacto" id="informeVisita">
                    <form:input type="hidden" path="visita.id_visita" value="${idvisita}"/>

                    <br>
                    <form:textarea class="detalleTA" rows="10" placeholder="Ingrese obervaciones de visita realizada..." required="true" maxlength="1000" path="observaciones" />
                    <br>
            
                    <br><button type="submit" class="btnForm">Guardar observaciones</button><br>  
                </form:form>
       
     
       
	
	</body>
</html>