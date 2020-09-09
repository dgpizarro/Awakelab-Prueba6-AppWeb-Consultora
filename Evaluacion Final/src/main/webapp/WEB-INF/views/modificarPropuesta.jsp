<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modificar Propuestas</title>
<!-- Tipos Font -->
<script src="https://kit.fontawesome.com/14907c5069.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
	rel="stylesheet">
<style>
.maestro {
	font-family: 'Montserrat';
	display: flex;
	flex-flow: row wrap;
	color: rgb(92, 92, 92);
}

.subMaestro {
	display: flex;
	flex-flow: row wrap;
	width: 100%;
	box-shadow: 0 4px 2px -2px gray;
	border-bottom: 1px solid rgb(9, 83, 219);
	margin-bottom: 1em;
	font-size: 0.8em;
}

.subMaestro p, .detalleModal p {
	margin: 0.25em 0 0.25em 0;
}

.tituloModalMensaje {
	width: 100%;
	box-shadow: 0 4px 2px -2px gray;
	border-bottom: 3px solid rgb(9, 83, 219);
	font-size: small;
}

.tituloModalMensaje h2 {
	font-size: 1em;
	margin-bottom: 0.8em;
}

.subModal {
	width: 100%;
}

.fechaModal {
	width: 100%;
}

.detalleModal {
	width: 100%;
	text-align: justify;
	font-size: 0.8em;
}

@media only screen and (min-width: 600px) {
	.subModal {
		width: 70%;
	}
	.fechaModal {
		width: 30%;
	}
	.subMaestro p, .detalleModal p {
		margin: 1em 0 1em 0;
		font-size: 1.25em;
	}
	.tituloModalMensaje h2 {
		font-size: 1.2em;
	}
}
</style>
</head>
<body>
	<div class="maestro">

		<div class="tituloModalMensaje">
			<h2>
				<p>Modificar Detalle</p>
			</h2>
		</div>
		
		<div class="subMaestro">
			<div class="subModal">

				 <form:form action="${pageContext.request.contextPath}/Profesional/ModificarPropuesta/${id_mejora}.html" method="POST" class="formContacto">
                   <form:input  type="hidden" value="1" path="visita.id_visita"/>
                   
                   	<span>Fecha Inicio</span> 
                    <br>
                   <form:input  type="radio" path="evento.fecha_" required="true" />
                    <br>
                    <span>Detalle</span> 
                    <br>
                 	<form:textarea class="detalleTA" rows="2" path="propuesta.detalle" required="true" maxlength="300"/>
                    <br>
                  
                  
                    <button type="submit" class="btnForm">Añadir Propuesta</button>
                </form:form>
			</div>

	</div>

</body>
</html>