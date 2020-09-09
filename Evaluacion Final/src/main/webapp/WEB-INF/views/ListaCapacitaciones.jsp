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
<title>Gestión Capacitaciones</title>

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
<script type="text/javascript"
        src="https://cdn.datatables.net/plug-ins/1.10.21/dataRender/datetime.js"></script> 
 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/locale/es.min.js"></script>

<!-- Mapa -->
<script
src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyAPBIgxJbDYk4SGlKjlv7CE_XinnfRkCqA"></script>

<!-- Estilo Dialog -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />

<!-- Select2 -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>

<!-- Etilo CSS General -->
<link href="<c:url value="/resources/css/estilo_general.css" />"
	rel="stylesheet">

<!-- Manejo flex -->
<style>
 @media only screen and (min-width: 800px) {
            #uno{order: 0;}
            #dos{order: 2;}
            #tres{order: 1;}
            #cuatro{order: 3;}
            #cinco{order: 4;}
            #seis{order: 5;}
            .formContacto { width:100% !important;}
        }

#nuevoMotivo {
	display: none;
}

</style>
    
</head>
<body>

<%@include file="/resources/include/headerProfesional.jsp"%>

<main id="contenido">
	
	 <input id="alerta" type="hidden" value="${id_capx}">

		<div class="col-3 titulo-pag" id="uno">
			<p>Mis Capacitaciones</p>
		</div>


		<div class="col-3 cont-text-pag-tabla" id="cuatro">
			<div id="contenedor1">
				<table id="tabla1" class="display responsive" style="width: 100%">
					<thead>
						<tr>
							<th>ID</th>
							<th>Empresa</th>
							<th>Fecha</th>
							<th>Hora</th>
							<th>Lugar</th>
							
							<th>Detalle</th>
                            <th>Asistentes</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cap" items="${lcapacitaciones}">
						<tr>
                            	<td><c:out value="${cap.getId_capacitacion()}" /></td>
                            	<td><c:out value="${cap.getEvento().getActividad().getCliente().getUsuario().getNombre()}" /></td>
								<td><c:out  value="${cap.getEvento().getFecha_inicio()}" /></td>
								<td><c:out value="${cap.getEvento().getHora()}" /></td>
								<td><c:out value="${cap.getEvento().getLugar().getDireccion()}" /></td>
								
								<td style="text-align: center;">
								<a class="modal" href="${pageContext.request.contextPath}/Profesional/irDetalleCapacitacion/${cap.getId_capacitacion()}.html">							
								<i class="fas fa-plus-circle" style="color: rgb(9, 83, 219);"></i></a>
								</td>
								
								<td style="text-align: center;">
								<a class="modal2" href="${pageContext.request.contextPath}/Profesional/listadoAsistentes/${cap.getId_capacitacion()}/${id_profesional}.html">
								<i class="fas fa-users" style="color: rgb(9, 83, 219);"></i></a>
								</td>
														
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>


		<div class="col-4 titulo-pag" id="tres">
			<p>Nueva Capacitación</p>
		</div>

		<div class="col-4 cont-text-pag" id="cuatro">
			<form:form action="${pageContext.request.contextPath}/Profesional/crearCapacitacion.html"
				method="POST" class="formContacto">
				
				<form:input type="hidden" value="${id_profesional}" path="evento.actividad.profesional.id_profesional" />
                           
                <span>Cliente</span>
                <form:select path="evento.actividad.cliente.id_cliente" class="listadoDestinatarios" required="true" style="width: 100% !important; font-size: 1em !important;">
                             <c:forEach var="c" items="${listaClientes}">
                                 <form:option value="${c.getId_cliente()}"> <c:out value="${c.getUsuario().getNombre()}" />, <c:out value="${c.getRut()}" /> </form:option>
                             </c:forEach>        
                </form:select>

				<span>Asunto:</span>
				<br>
				<form:textarea class="detalleTA" rows="2" path="evento.asunto"
					required="true" maxlength="150" />
				<br>

				<span>Fecha Inicio:</span>
				<br>
				<form:input type="date" path="evento.fecha_inicio" required="true" />
				<br>
				<span>Fecha Fin:</span>
				<br>
				<form:input type="date" path="evento.fecha_fin" required="true" />
				<br>
				<span>Hora:</span>
				<br>
				<form:input path="evento.hora" />
				<br>

				<form:input type="hidden" value="F" path="evento.cumplimiento" />

				<span>Dirección:</span>
				<br>
				<form:input path="evento.lugar.direccion" id="search_input" required="true" />
				<form:input type="hidden" path="evento.lugar.latitud" id="loc_lat" />
				<form:input type="hidden" path="evento.lugar.longitud" id="loc_long" />
				<br>

				<span>Detalle:</span>
				<br>
				<form:textarea path="detalle" class="detalleTA" rows="7"
					placeholder="Ingrese detalle solicitud" required="true"
					maxlength="1000" />
				<br>
                <br>
				<span>Tipo:</span>
				<br>
				<div class="divideRegistro">
					<form:radiobutton path="extra" name="tipo" value="F"
						required="true" />
					Normal <br>
					<form:radiobutton path="extra" name="tipo" value="V"
						required="true" />
					Extra<br>
				</div>
				
				<br>
					
				<button type="submit" class="btnForm">Guardar Capacitación</button>
			</form:form>

		</div>
		<div id="dialog" style="display: none;" >
         </div>
   
	    <div id="dialog4" style="display: none;" >
	   </div>
   
	   <div id="dialog2" style="display: none;" >
	       <div style="display:flex; ">
	            <div style="width: 20%; margin: auto;  font-size: 3em;">
	                <span> <i class="far fa-check-circle"></i></span>
	            </div>
	            <div style="width: 77%; margin: auto; text-align: center;">
	                <span>¡Capacitacion registrada correctamente!</span>
	            </div>
	        </div>
	   </div>

	</main>

<%@include file="/resources/include/sidebarProfesional.jsp"%>

<%@include file="/resources/include/footer.html"%>
	
<script>

  var searchInput = 'search_input';
  var lat_cliente = null;
  var long_cliente = null;
  
$(document).ready(function () {
	
	 $(".listadoDestinatarios").select2({
         placeholder: "Buscar",
         allowClear: true
     });
 
  $('#tabla1').DataTable({
         "order": [[ 2, "desc" ]],
         "columnDefs": [{ targets: 2, render: $.fn.dataTable.render.moment('YYYY-MM-DD','DD-MM-YYYY') },
             {targets: 5, orderable: false}, {targets: 6, orderable: false},  
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
          maxHeight: 560,
          dialogClass: "grande",
          closeText: ""
      });
      
          $('body').on("click", '.modal', function(e){
          e.preventDefault();
          var href = $(this).attr('href').split(/[./]/)[4];;
          $( "#dialog" ).dialog({ title: 'Detalle Capacitación ID:\n' + href });
          $('#dialog').load(this.href).dialog('open');
      });
          
          $('body').on("click", '.modal2', function(e){
              e.preventDefault();
              var href = $(this).attr('href').split(/[./]/)[4];;
              $( "#dialog" ).dialog({ title: 'Asistentes Capacitación ID:\n' + href });
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
           if (alerta != "") {
        	   console.log("probando redireccion")
        	   console.log("${pageContext.request.contextPath}/Profesional/listadoAsistentes/"+alerta+"/${id_profesional}.html");
        	   $("#dialog4").dialog({ autoOpen: true, modal: true, maxHeight: 560, dialogClass: "grande", title: "Asistentes capacitación ID:"+ alerta, closeText: "", draggable: false, resizable: false,});
        	   $("#dialog4").load("${pageContext.request.contextPath}/Profesional/listadoAsistentes/"+alerta+"/${id_profesional}.html");
           }
           
           
           
           var autocomplete;
           autocomplete = new google.maps.places.Autocomplete((document.getElementById(searchInput)), {
               types: ['geocode'],
               componentRestrictions: {
                   country: "CHL"
               }
           });

           google.maps.event.addListener(autocomplete, 'place_changed', function () {
               var near_place = autocomplete.getPlace();
               document.getElementById('loc_lat').value = near_place.geometry.location.lat();
               document.getElementById('loc_long').value = near_place.geometry.location.lng();

           });

           $(document).on('change', '#' + searchInput, function () {
               document.getElementById('latitude_input').value = '';
               document.getElementById('longitude_input').value = '';

           });
      
  });
    
</script>

<script src="<c:url value="/resources/js/sidebar.js" />"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
        crossorigin="anonymous"></script>

<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyAPBIgxJbDYk4SGlKjlv7CE_XinnfRkCqA"></script>


</body>
</html>