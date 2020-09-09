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
<title>Editar Visita</title>
<!-- Tipos Font -->
    <script src="https://kit.fontawesome.com/14907c5069.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
        rel="stylesheet">
<style>
         .#formEditCl {padding: 1em 0;}   
        #contMax {display: flex; width: 100%; flex-flow: row wrap;}
        .contMin {width: 100%; }
        
        @media only screen and (min-width: 800px) {
            #uno{order: 0;}
            #dos{order: 2;}
            #tres{order: 1;}
            #cuatro{order: 3;}
            #cinco{order: 4;}
            #seis{order: 5;}
           #formEditCl { width:95% !important;}
            .contMin {width: 50%; padding: 0.2em;}
            
        }
</style>
</head>
<body>
		
		<div class="FormEdit">

				 <form:form action="${pageContext.request.contextPath}/Profesional/editarVisita.html" method="POST" class="formContacto">
                   <form:input  type="hidden" value="1" path="id_visita"/>
                   
                    <span>Asunto</span> 
                    <br>
                 	<form:textarea class="detalleTA" rows="2" path="evento.asunto" required="true" maxlength="150"/>
                    <br>
                    <span>Fecha Inicio</span> 
                    <br>
                   <form:input type="date" path="evento.fecha_inicio" required="true" />
                    <br>
                    <span>Fecha Fin</span> 
                    <br>
                   <form:input type="date" path="evento.fecha_fin" required="true" />
                    <br>
                    <span>Hora</span> 
                    <br>
                   <form:input path="evento.hora"/>
                    <br>
                    <span>Dirección</span> 
                    <br>
                   <form:input path="evento.lugar.direccion" required="true" maxlength="300"/>
                   <form:input  type="hidden" path="evento.lugar.latitud" value="1" />
                   <form:input  type="hidden" path="evento.lugar.longitud" value="1" />
                   <br>
                                      
                    <span>Detalle</span> 
                    <br>
                    <form:textarea path="detalle" class="detalleTA" rows="7" placeholder="Ingrese detalle solicitud" required="true" maxlength="1000"/>
                    <br>
                    <button type="submit" class="btnForm">Agendar</button>
                </form:form>
			</div>

</body>
</html>