<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Propuestas de mejora</title>
<!-- Tipos Font -->
    <script src="https://kit.fontawesome.com/14907c5069.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
        rel="stylesheet">
    
<!-- Etilo CSS General -->  
    <link href="<c:url value="/resources/css/estilo_general.css" />" rel="stylesheet">
    
    <style>
               
    </style>
</head>

<body>

<main >
           
                 <div id="contenedor5">
                <table id="tabla5" class="display responsive" style="width: 100%">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Detalle</th>
                                <th>Estado</th>
                                <th>Modificar<th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${lpro}">
                                <tr>
                                	<td><c:out value="${p.getId_mejora()}" /></td>
                                	<td><c:out value="${p.getDetalle()}" /></td>
                                	<td><c:out value="${p.getEstado()}"/></td>
                                    <td style="text-align: center; font-size: 1.6em; ">
                                       <a class="modal6" href="${pageContext.request.contextPath}/Profesional/ModificarPropuesta/${p.getVisita().getId_visita()}.html" ><i class="fas fa-pencil-alt" style="color:rgb(9, 83, 219);"></i></a>
                                    </td>                    
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>      
                    </div>  
    
</main>

<script type="text/javascript">

$('#tabla5').DataTable({
     pageLength: 7,
    "bLengthChange": false,    
    "language" : {"url" : "https://cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
                  }
});

$('#contenedor5').css("width", "100%");
$('#contenedor5').css("margin", "0");
$('#contenedor5').css("background-color","rgb(255, 255, 255)");
$('#contenedor5').css("font-size", "0.9em");


</script>

</body>
</html>