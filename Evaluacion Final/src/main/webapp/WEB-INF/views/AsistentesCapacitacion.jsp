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
<title>Asistentes Capacitacion</title>
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
	
	
	
	   <div class="mensajeEdit" style="width:95%; margin: 0 2.5%;">
	       <div class="separadorForm"><p> Lista Asistentes </p></div>
	           
	          
        <div id="contenedor2">
                <table id="tabla2" class="display responsive" style="width: 100%">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Rut</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="as" items="${lAsistentes}">
                                    <tr>
                                        <td><c:out value="${as.getNombre()}" /></td>  
                                        <td><c:out value="${as.getRut()}" /></td>                  
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
            </div>
              
	       <div class="separadorForm"></div>
	   </div>
	   
	   <p>  </p>
	   <div class="formEdit">
	   
	        <form:form action="${pageContext.request.contextPath}/Profesional/crearAsistente/${id_prof}.html" method="POST" class="formContacto" id="formEditCl" >
                    
                    <form:input type="hidden" path="capacitacion.id_capacitacion" value="${idCapacitacion}"/>
                    
                    <span>Nombre</span>
                    <br>
                    <form:input path="nombre" required="true"/>
                    <br>
            
                    <span>Rut</span>
                    <br>
                    <form:input path="rut" required="true"/>
                    <br>
            
                    <br><button type="submit" class="btnForm">Añadir Asistente</button><br>  
                </form:form>
       
       </div>
       
<script type="text/javascript">
$('#tabla2').DataTable({
    
    "order": [[ 0, "asc" ]],
    pageLength: 5,
    "bLengthChange": false,
    "language" : {"url" : "https://cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
                  }
});

$('#contenedor2').css("width", "100%");
$('#contenedor2').css("margin", "0");
$('#contenedor2').css("background-color","rgb(255, 255, 255)");
$('#contenedor2').css("font-size", "0.9em");

</script>
	</body>
</html>