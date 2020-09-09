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
<title>Checklist</title>
<!-- Tipos Font -->
<script src="https://kit.fontawesome.com/14907c5069.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/locale/es.min.js"></script>
<!-- Estilo Dialog -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<!-- Etilo CSS General -->
<link href="<c:url value="/resources/css/estilo_general.css" />"
	rel="stylesheet">
<!-- Select2 -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
<!-- Manejo flex -->
<style>
.formContacto{
    width: 80%;
}
.btnForm{
    width: 30%;
    font-size: 0.85em;
    margin: 1em 35%;
}
@media only screen and (min-width: 800px) {
	#uno {
		order: 0;
	}
	#dos {
		order: 2;
	}
	#tres {
		order: 1;
	}
	#cuatro {
		order: 3;
	}
	#cinco {
		order: 4;
	}
	#seis {
		order: 5;
	}
}
</style>

</head>
<body class="gestionCapacitacion">

	<%@include file="/resources/include/headerProfesional.jsp"%>

	<main id="contenido">
	
	<input id="alerta" type="hidden" value="${chkAlert}">
	
		<div class="col-2 titulo-pag" id="uno">
			<p>Listado Clientes</p>
		</div>
		<div class="col-2 cont-text-pag-tabla" id="dos">
			<div id="contenedor1">
				<table id="tabla1" class="display responsive" style="width: 100%">
					<thead>
						<tr>
							<th>Id</th>
							<th>Empresa</th>
							<th>Rut</th>
							<th>Crear checkList</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach var="c" items="${listaC}">
							<tr>
								<td><c:out value="${c.getId_cliente()}" /></td>
								<td><c:out value="${c.getUsuario().getNombre()}" /></td>
								<td><c:out value="${c.getRut()}" /></td>
								<td style="text-align: center; font-size: 1.2em;"><a
									href="${pageContext.request.contextPath}/Profesional/nuevocheck/${c.getId_cliente()}/${id_profesional}.html"><i
										class="fas fa-plus-circle" style="color: rgb(9, 83, 219);"></i></a>
								</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
		<div class="col-2 titulo-pag" id="tres">
			<p>Checklist creados</p>
		</div>

		<div class="col-2 cont-text-pag-tabla" id="cuatro">
			<div id="contenedor2">
				<table id="tabla2" class="display responsive" style="width: 100%">
					<thead>
						<tr>
							<th>ID</th>
							<th>Empresa</th>
							<th>Fecha</th>
							<th>Cambios 1</th>
							<th>Cambios 2</th>
							<th>Nueva Tarea</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cck" items="${misCheckList}">
							
							<tr>
								<td><c:out value="${cck.getId_checklist()}" /></td>
								<td><c:out value="${cck.getActividad().getCliente().getUsuario().getNombre()}" /></td>
								<td><c:out value="${cck.getFecha_creacion()}" /></td>
								<td><c:out value="${cck.getFecha_act_1()}" /></td>
								<td><c:out value="${cck.getFecha_act_2()}" /></td>
								<td style="text-align: center; font-size: 1.2em;"><a class="modal1"
									href="${pageContext.request.contextPath}/Profesional/irNuevaTarea/${cck.getId_checklist()}/${id_profesional}.html">
									<i class="fas fa-tasks" style="color: rgb(9, 83, 219);"></i></a>
								</td>



							</tr>
							
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		
		
		<div class="col-1 titulo-pag" id="cinco">
				<p>Revisión tareas Checklist</p>
		</div>

		<div class="col-1 cont-text-pag-tabla" id="cinco">
		  <form:form action="${pageContext.request.contextPath}/Profesional/filtrarChecklist/${id_profesional}.html" method="POST" class="formContacto">                       
                <span> Seleccione cliente:</span>
                <br>
                <form:select path="id_cliente" class="listadoDestinatarios" required="true" style="width: 100% !important; font-size: 1em !important;">
                             <c:forEach var="c" items="${listaClientes}">
                                 <form:option value="${c.getId_cliente()}"> <c:out value="${c.getUsuario().getNombre()}" />, <c:out value="${c.getRut()}" /> </form:option>
                             </c:forEach>        
                </form:select>
                    
                <button type="submit" class="btnForm">Buscar tareas</button> 
            </form:form>
		
			<div id="contenedor3">
			<h2>Tareas de: ${nombreCliente}</h2>
				<table id="tabla3" class="display responsive" style="width: 100%">
					<thead>
						<tr>
							<th>ID CheckList</th>
							<th>Detalle Tarea</th>
							<th>Acciones </th>
						</tr>
					</thead>

						<tbody>
						<c:forEach var="tr" items="${listTarea}">
							<tr>
								<td><c:out value="${tr.checklist.getId_checklist()}" /></td>
								<td><c:out value="${tr.getDetalle_tarea()}" /></td>
								<td style="text-align: center;"><a class="modal5"
									href="${pageContext.request.contextPath}/Profesional/editarTarea/${tr.checklist.getId_checklist()}/${id_profesional}.html"><i
										class="fas fa-edit" style="color: rgb(9, 83, 219);"></i></a></td>
							</tr>
							</c:forEach>
							</tbody>
					</table>
					
				
				</div>
			</div>


		<div id="dialog" style="display: none;"></div>

		<div id="dialog2" style="display: none;">
			<div style="display: flex;">
				<div style="width: 20%; margin: auto; font-size: 3em;">
					<span> <i class="far fa-check-circle"></i></span>
				</div>
				<div style="width: 77%; margin: auto; text-align: center;">
					<span>¡CheckList creado exitosamente!</span>
				</div>
			</div>
		</div>
	
	<div id="dialog3" style="display: none;">
            <div style="display: flex;">
                <div style="width: 20%; margin: auto; font-size: 3em;">
                    <span> <i class="fas fa-exclamation-circle"></i> </span>
                </div>
                <div style="width: 77%; margin: auto; text-align: center;">
                    <span>¡El cliente ya posee un checklist creado este año!</span>
                </div>
            </div>
        </div>
 
    </main>

	<%@include file="/resources/include/sidebarProfesional.jsp"%>

	<%@include file="/resources/include/footer.html"%>
	<script>
	<!--Ventana Modal -->
		$(document)
				.ready(
						function() {
							

						     $(".listadoDestinatarios").select2({
						         placeholder: "Buscar",
						         allowClear: true
						     });
							
							$("#dialog").css('display', 'block');
							$("#dialog").dialog({
								modal : true,
								autoOpen : false,
								draggable : false,
								resizable : false,
								minHeight : 0,
								dialogClass : "grande",
								closeText : ""
							});

							$('body')
									.on(
											"click",
											'.modal',
											function(e) {
												e.preventDefault();
												var href = $(this).attr('href')
														.split(/[./]/)[4];
												;
												$("#dialog")
														.dialog(
																{
																	title : 'Editar Checklist:\n'
																			+ href
																});
												$('#dialog').load(this.href)
														.dialog('open');
											});

							$('body').on(
									"click",
									'.modal1',
									function(e) {
										e.preventDefault();
										var href = $(this).attr('href').split(
												/[./]/)[4];
										;
										$("#dialog").dialog({
											title : 'Agregar Tarea a CheckList ID:\n' + href
										});
										$('#dialog').load(this.href).dialog(
												'open');
									});

							$('body')
									.on(
											"click",
											'.modal2',
											function(e) {
												e.preventDefault();
												var href = $(this).attr('href')
														.split(/[./]/)[4];
												;
												$("#dialog")
														.dialog(
																{
																	title : 'Agregar Nueva Checklist:\n'
																			+ href
																});
												$('#dialog').load(this.href)
														.dialog('open');
											});

							$('body').on(
									"click",
									'.modal5',
									function(e) {
										e.preventDefault();
										var href = $(this).attr('href').split(
												/[./]/)[4];
										;
										$("#dialog").dialog({
											title : 'Editar Tarea:\n' + href
										});
										$('#dialog').load(this.href).dialog(
												'open');
									});

							$("#dialog2").css('display', 'block');
							$("#dialog2").dialog({
								closeText : "",
								modal : true,
								autoOpen : false,
								draggable : false,
								resizable : false,
								minHeight : 0,
								dialogClass : "chica",
								buttons : [ {
									text : "OK",
									click : function() {
										$(this).dialog("close");
									}
								} ]
							});

							$("#dialog3").css('display', 'block');
							$("#dialog3").dialog({
								closeText : "",
								modal : true,
								autoOpen : false,
								draggable : false,
								resizable : false,
								minHeight : 0,
								dialogClass : "chica",
								buttons : [ {
									text : "OK",
									click : function() {
										$(this).dialog("close");
									}
								} ]
							});

							var alerta = $("#alerta").val();
							if (alerta === "chkCreado") {
                                $("#dialog2").dialog("open");
                                console.log(alerta);
                            }							
							if (alerta === "chkExistente") {
                                $("#dialog3").dialog("open");
                                console.log(alerta);
                            }
							$('#tabla1')
									.DataTable(
											{ 
												"order" : [ [ 1, "asc" ] ],
												 pageLength: 5,
												"bLengthChange": false,
												"columnDefs" : [ {
													targets : 3,
													orderable : false
												} ],
												"language" : {
													"url" : "https://cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
												}
											});

							$('#contenedor1').css("width", "100%");
							$('#contenedor1').css("margin", "0");
							$('#contenedor1').css("background-color",
									"rgb(255, 255, 255)");
							$('#contenedor1').css("font-size", "0.9em");

							$('#tabla2')
									.DataTable(
											{
												"order" : [ [ 1, "desc" ] ],
												 pageLength: 5,
												 "bLengthChange": false,
												"columnDefs" : [
														{
															targets : 1,
														
														},
														{
															targets : 2,
															render : $.fn.dataTable.render
																	.moment(
																			'YYYY-MM-DD',
																			'DD-MM-YYYY')
														},
														{
															targets : 3,
															render : $.fn.dataTable.render
																	.moment('YYYY-MM-DD',
																			'DD-MM-YYYY')
														},
														{
															targets : 4,
															render : $.fn.dataTable.render
																	.moment(
																			'YYYY-MM-DD',
																			'DD-MM-YYYY')
														},
														{
		                                                    targets : 5,
		                                                    orderable : false
		                                                }
														],
												"language" : {
													"url" : "https://cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
												}
											});

							$('#contenedor2').css("width", "100%");
							$('#contenedor2').css("margin", "0");
							$('#contenedor2').css("background-color",
									"rgb(255, 255, 255)");
							$('#contenedor2').css("font-size", "0.9em");
							
							$('#tabla3').DataTable({
							    "order": [[ 1, "asc" ]],
							    pageLength: 5,
							    "bLengthChange": false,
							    "language" : {"url" : "https://cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
							                  }
							});

							$('#contenedor3').css("width", "100%");
							$('#contenedor3').css("margin", "0");
							$('#contenedor3').css("background-color","rgb(255, 255, 255)");
							$('#contenedor3').css("font-size", "0.9em");

						});
	</script>
	<script src="<c:url value="/resources/js/sidebar.js" />"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
		crossorigin="anonymous"></script>
	<script src="<c:url value="/resources/js/modalLogout.js" />" ></script>



</body>
</html>