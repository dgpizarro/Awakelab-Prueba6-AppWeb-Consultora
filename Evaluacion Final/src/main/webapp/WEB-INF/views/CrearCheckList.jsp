<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crear Checklist</title>
</head>
<body>
         <form:form action="${pageContext.request.contextPath}/Profesional/crearCheckList.html" method="POST" class="formCheckList"> 
                    <form:input  type="hidden" value="1" path="profesional.id_profesional.checklist()"/> 
                   
                    <span>Nombre Cliente</span> 
                    <br>
                 	<form:input type="text" path="checklist.actividad.cliente.usuario.nombre" required="true" />
                    <br>
                    <span>Fecha Creacion</span> 
                    <br>
                   <form:input type="date" path="checklist.fecha_creacion" required="true" />
                    <br>
                    <span>Fecha Actividad 1</span> 
                    <br>
                    
                   <form:input type="date" path="checklist.fecha_act_1" required="true" />
                    <br>
                   <span>Fecha Actividad 2</span> 
                    <br>
                    
                   <form:input type="date" path="checklist.fecha_act_2" required="true" />
                    <br> 
                  
                  
                    <button type="submit" class="btnForm">Agregar</button>
                </form:form> 
</body>
</html>