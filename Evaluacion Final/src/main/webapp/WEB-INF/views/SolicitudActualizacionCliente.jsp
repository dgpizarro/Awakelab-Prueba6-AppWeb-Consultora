<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Solicitud Actualización</title>

</head>
<body>

	<form:form action="${pageContext.request.contextPath}/Cliente/generaMensaje.html" method="POST" class="formContacto">
		<form:input type="hidden" value="${idU_cliente}" path="remitente.id_usuario" />
		<form:input type="hidden" value="Solicito actualizar mis datos" path="asunto" />
		<form:input type="hidden" value="3" path="destinatario.id_usuario"/>
		<span>Destinatario: Administrador</span>
		<br>
		<br>
		<span>Detalle</span>
		<br>
		<form:textarea path="detalle" class="detalleTA" rows="5"
			placeholder="Indíquenos qué información personal desea actualizar" required="true"
			maxlength="1000" />
		<br>
		<button type="submit" class="btnForm">Enviar</button>
	</form:form>


</body>
</html>