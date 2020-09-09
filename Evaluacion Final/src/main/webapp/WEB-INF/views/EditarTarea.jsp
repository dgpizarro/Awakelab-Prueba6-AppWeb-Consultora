<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Editar Tarea</title>
<!-- Tipos Font -->
    <script src="https://kit.fontawesome.com/14907c5069.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
        rel="stylesheet">
  
<!-- Etilo CSS General -->  
    <link href="<c:url value="/resources/css/estilo_general.css" />" rel="stylesheet">
<!-- Manejo flex -->
    <style>
        @media only screen and (min-width: 800px) {
            #uno{order: 0;}
            #dos{order: 2;}
            #tres{order: 1;}
            #cuatro{order: 3;}
            #cinco{order: 4;}
            #seis{order: 5;}
            .formContacto { width:90% !important;}
        }
        
     
        
    </style>  
</head>
<body>

<main>

               
             
                <form:form action="${pageContext.request.contextPath}/Profesional/editarTarea/${id_prof}.html" class="formContacto" method="POST">
                	
                   <form:input  type="hidden" value="${id_ck}" path="checklist.id_checklist"/>
                    
                    <span>Editar Tarea</span> 
                    <br>
                    <form:textarea path="detalle_tarea" class="detalleTA" rows="5" placeholder="Ingrese detalles de la tarea" required="true" maxlength="1000"/>
                    <br>
                    <button type="submit" class="btnForm">Editar</button>
                </form:form>  
                
         
     
</main>
</body>
</html>