<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gestión Asesorías</title>


<!-- Tipos Font -->
<script src="https://kit.fontawesome.com/14907c5069.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap" rel="stylesheet">
	
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
 <script type="text/javascript"
        src="https://cdn.datatables.net/plug-ins/1.10.21/dataRender/datetime.js"></script> 
 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/locale/es.min.js"></script>
	
<!-- Estilo Dialog -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
	
<!-- Etilo CSS General -->
<link href="<c:url value="/resources/css/estilo_general.css" />"
	rel="stylesheet">
	
<!-- Select2 -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
    
<!-- Direccion -->
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyAPBIgxJbDYk4SGlKjlv7CE_XinnfRkCqA"></script>	
<!-- Manejo flex -->
<style>
@media only screen and (min-width: 800px) {
	 @media only screen and (min-width: 800px) {
            #uno{order: 0;}
            #dos{order: 2;}
            #tres{order: 1;}
            #cuatro{order: 3;}
            #cinco{order: 4;}
            #seis{order: 5;}
            .formContacto { width:100% !important;}
        }
}

#nuevoMotivo {
	display: none;
}

</style>

<script>

</script>
</head>
<body class="GestionAsesorias">

	<%@include file="/resources/include/headerProfesional.jsp"%>

	<main id="contenido">

		<div class="col-3 titulo-pag" id="uno">
			<p>Mis Asesorías</p>
		</div>

		<div class="col-3 cont-text-pag-tabla" id="dos">

			<div id="contenedor1">
				<table id="tabla1" class="display responsive" style="width: 100%">
					<thead>
						<tr>
							<th>ID</th>
							<th>Fecha Creación</th>
							<th>Asunto</th>
							<th>Cliente</th>
							<th>Detalle</th>
							<th>Agendar</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="a" items="${lasesorias}">
							<tr>
								<td><c:out value="${a.getId_asesoria()}" /></td>
								<td><c:out value="${a.getFecha_creacion()}" /></td>
								<td><c:out value="${a.getAsunto()}" /></td>
								<td><c:out value="${a.getActividad().getCliente().getUsuario().getNombre()}" /></td>
								<td style="text-align: center; font-size: 1.6em;">
								<a class="modal" href="${pageContext.request.contextPath}/Profesional/irDetalleAsesoria/${a.getId_asesoria()}.html">
										<i class="fas fa-plus-circle" style="color: rgb(9, 83, 219);"></i>
								</a></td>

								<td style="text-align: center; font-size: 1.6em;"><a
									class="modal2" href="${pageContext.request.contextPath}/Profesional/irAgendarAsesoria/${a.getId_asesoria()}/${id_profesional}.html"> <i class="fas fa-address-book"
										style="color: rgb(9, 83, 219);"></i>
								</a></td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<div class="col-4 titulo-pag" id="tres">
			<p>Nueva Asesoría</p>
		</div>

		<div class="col-4 cont-text-pag" id="cuatro">
			<form:form
				action="${pageContext.request.contextPath}/Profesional/crearAsesoria.html"
				method="POST" class="formContacto">
				<form:input type="hidden" value="${id_profesional}" path="actividad.profesional.id_profesional" />
                           
                <span>Cliente</span>
                <form:select path="actividad.cliente.id_cliente" class="listadoDestinatarios" required="true" style="width: 100% !important; font-size: 1em !important;">
                             <c:forEach var="c" items="${listaClientes}">
                                 <form:option value="${c.getId_cliente()}"> <c:out value="${c.getUsuario().getNombre()}" />, <c:out value="${c.getRut()}" /> </form:option>
                             </c:forEach>        
                </form:select>

				<span>Asunto</span>
				<br>
				<form:textarea class="detalleTA" rows="2" path="asunto" required="true" maxlength="150" />
				<br>
				
				<br>
				<span>Detalle</span>
				<br>
				<form:textarea path="detalle" class="detalleTA" rows="7" placeholder="Ingrese detalle asesoría" required="true"
					maxlength="1000" />
				<br>
                <br>
                
				<span>Tipo:</span>
				<br>
				<div class="divideRegistro">
					<form:radiobutton path="extra" name="tipo" value="F" required="true" /> Normal <br>
					<form:radiobutton path="extra" name="tipo" value="V" required="true" /> Extra <br>
				</div>
								
				<button type="submit" class="btnForm">Crear Asesoría</button>
			</form:form>

		</div>

		<div id="dialog" style="display: none;"></div>

		<div id="dialog2" style="display: none;">
			<div style="display: flex;">
				<div style="width: 20%; margin: auto; font-size: 3em;">
					<span> <i class="far fa-check-circle"></i></span>
				</div>
				<div style="width: 77%; margin: auto; text-align: center;">
					<span>¡Asesoría registrada correctamente!</span>
				</div>
			</div>
		</div>


	</main>

	<%@include file="/resources/include/sidebarProfesional.jsp"%>

	<%@include file="/resources/include/footer.html"%>

<script>
var searchInput = 'search_input';
$(document).ready(function () {
	
	 $(".listadoDestinatarios").select2({
	        placeholder: "Buscar",
	        allowClear: true
	    });
    
	 $('#tabla1').DataTable({
	        
	        "order": [[ 1, "desc" ]],
	        "columnDefs": [{ targets: 1, render: $.fn.dataTable.render.moment('YYYY-MM-DD','DD-MM-YYYY') },
	            {targets: 4, orderable: false}, {targets: 5, orderable: false},  
	            ],
	        "language" : {"url" : "https://cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
	                      }
	    });
	 
	 $('#contenedor1').css("width", "100%");
	  $('#contenedor1').css("margin", "0");
	  $('#contenedor1').css("background-color","rgb(255, 255, 255)");
	  $('#contenedor1').css("font-size", "0.9em");
	
	
	$("#dialog").css('display','block');  
    $( "#dialog" ).dialog({
        modal: true,
        autoOpen: false,
        draggable: false,
        resizable: false,
        maxHeight: 550,
        dialogClass: "grande",
        closeText: "",
        
    });
    
        $('body').on("click", '.modal', function(e){
        e.preventDefault();
        var href = $(this).attr('href').split(/[./]/)[4];;
        $( "#dialog" ).dialog({ title: 'Detalle Asesoría ID:\n' + href });
        $('#dialog').load(this.href).dialog('open');
        });
        
        $('body').on("click", '.modal2', function(e){
            e.preventDefault();
            var href = $(this).attr('href').split(/[./]/)[4];;
            $( "#dialog" ).dialog({ title: 'Agendar Asesoría ID:\n' + href });
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

<script src="<c:url value="/resources/js/sidebar.js" />"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
crossorigin="anonymous"></script>
<script src="<c:url value="/resources/js/modalLogout.js" />"></script>
</body>
</html>