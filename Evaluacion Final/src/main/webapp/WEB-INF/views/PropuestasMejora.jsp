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
<title>Propuestas de Mejora</title>
<!-- Tipos Font -->
    <script src="https://kit.fontawesome.com/14907c5069.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
        rel="stylesheet">
<!-- DataTable -->
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
        
        #nuevoMotivo{
            display: none;
        }
        
    </style> 
    <script> 
<!--Ventana Modal -->
$(document).ready(function () {
    $("#dialog").css('display','block');  
    $( "#dialog" ).dialog({
    	modal: true,
        autoOpen: false,
        draggable: false,
        resizable: false,
        minHeight: 0,
        dialogClass: "grande",
        closeText: ""
    });
    
    	$('body').on("click", '.modal', function(e){
        e.preventDefault();
        var href = $(this).attr('href').split(/[./]/)[4];;
        $( "#dialog" ).dialog({ title: 'Detalle Propuesta ID:\n' + href });
        $('#dialog').load(this.href).dialog('open');
    });
    	
    	 $("#dialog2").css('display','block');  
         $( "#dialog2" ).dialog({
             closeText: "",
             modal: true,
             autoOpen: false,
             draggable: false,
             resizable: false,
             minHeight: 0,
             dialogClass: "chica",
             buttons: [
               {
                 text: "OK",
                 click: function() {
                   $( this ).dialog( "close" );
                 }
               }
             ]
     });
    	
    var alerta = $("#alerta").val();
    if (alerta === "open") {
        $("#dialog2").dialog("open");
   }

});
</script> 
</head>
<body class="gestionMejoras">,

<%@include file="/resources/include/headerProfesional.jsp" %>

<main id="contenido">

 	<div class="col-2 titulo-pag" id="uno">
                <p>Listado de Propuestas</p>
    </div>
            
 	<div class="col-2 cont-text-pag" id="dos">
            <div id="contenedor1">
                    <table id="tabla1" class="display responsive" style="width:100%">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Detalle</th>
                                <th>Estado</th>
                                <th>Propuestas<th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${lpropuestas}">
                                <tr>
                                	<td><c:out value="${p.getId_mejora}" /></td>
                                	<td><c:out value="${p.getDetalle}" /></td>
                                	<td><c:out value="${p.getEstado}"/></td>
                                    <td style="text-align: center; font-size: 1.6em; ">
                                       <a class="modal" href="${pageContext.request.contextPath}/Profesional/irDetallePropuesta/${p.getId_mejora()}.html" ><i class="fas fa-plus-circle" style="color:rgb(9, 83, 219);"></i></a>
                                    </td>
                                    <td style="text-align: center; font-size: 1.6em; ">
                                       <a class="modal" href="${pageContext.request.contextPath}/Profesional/irDetallePropuesta/${p.getId_mejora()}.html" ><i class="fas fa-pencil-alt" style="color:rgb(9, 83, 219);"></i></a>
                                    </td>                    
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>        
                </div>
 	</div>
 	
 	<div class="col-2 titulo-pag" id="tres">
                <p>Añadir Propuesta</p>
    </div>
            
 	<div class="col-2 cont-text-pag" id="cuatro">
             <form:form action="${pageContext.request.contextPath}/Profesional/crearPropuesta.html" method="POST" class="formContacto">
                   <form:input  type="hidden" value="1" path="visita.id_visita"/> 
                    <br>
                    <span>Detalle</span> 
                    <br>
                    <form:textarea path="detalle" class="detalleTA" rows="7" placeholder="Ingrese detalle de la Propuesta" required="true" maxlength="300"/>
                    <br>
                    <button type="submit" class="btnForm">Añadir</button>
                </form:form>
 	</div>
            
</main>

<%@include file="/resources/include/sidebarProfesional.jsp" %>
<%@include file="/resources/include/footer.html" %>


<script src="<c:url value="/resources/js/sidebar.js" />" ></script>
<script src="<c:url value="/resources/js/modalLogout.js" />" ></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
		integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
		crossorigin="anonymous"></script>
	<script src="<c:url value="/resources/js/modals.js" />"></script>

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>
  
</body>
</html>