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
<title>muestra detalles checklist</title>
<!-- Tipos Font -->
    <script src="https://kit.fontawesome.com/14907c5069.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
        rel="stylesheet">
<!-- DataTable -->
	
	<link rel="stylesheet" href="https://cdn.materialdesignicons.com/5.3.45/css/materialdesignicons.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" type="text/css"
        href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css" />
    <link rel="stylesheet" type="text/css"
        href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.dataTables.min.css" />
    <script type="text/javascript"
        src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
    <script type="text/javascript"
        src="https://cdn.datatables.net/responsive/2.2.5/js/dataTables.responsive.min.js"></script> 
<!-- Estilo Dialog -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<!-- Etilo CSS General -->        
    <link href="<c:url value="/resources/css/estilo_general.css" />" rel="stylesheet">
</head>
<body>
	<div class="container">
		<h1 class="display-4">Detalle Checklist</h1>
		<br>
		<table class="table">
			<thead class="thead_dark">
				<tr>
					    <th>#</th>
					    <th>Descripcion</th>
                        <th>Estado</th>
                        <th>Checklist</th>
				</tr>
				</thead>
			<tbody>
			<c:forEach items="${model.lista}" var="detallecheck">
				<tr>
					<th scope="row">${detallecheck.getId_detallechecklist()}</th>
					<td>${detallecheck.getDescripcion()}</td>
					<td>${detallecheck.getEstado()}</td>
					<td>${detallecheck.getChecklist().getId_checklist()}</td>
					<td><a class="btn btn-primary" href="${pageContext.request.contextPath}/editarDetalleChecklist/${detallecheck.getId_detallechecklist()}">Editar </a>  <a class="btn btn-danger" href="${pageContext.request.contextPath}/eliminarDetalleChecklist/${detallecheck.getId_detallechecklist()}/${model.id_checklist}">Borrar</a></td>
			</c:forEach>
			</tbody>
			
		</table>
		<p><a class="btn btn-primary" href="../crearDetalleChecklist/${model.id_checklist}">Crear Detalle Checklist</a></p>
		<p><a class="btn btn-danger" href="../listarChecklist">Volver al Checklist</a></p>
	</div>
</body>
</html>