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
<title>Gestión Visita</title>
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
        
<!-- Select2 -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>

<!-- Estilo Dialog -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
    
<!-- Etilo CSS General -->  
    <link href="<c:url value="/resources/css/estilo_general.css" />" rel="stylesheet">
    
    <style>
        .cont-text-pag-tabla { margin-bottom:0;} 
        .formContacto {padding: 1em 0;}   
        #contMax {display: flex; width: 100%; flex-flow: row wrap;}
        .contMin {width: 100%; }
        @media only screen and (min-width: 800px) {
            #uno{order: 0;}
            #dos{order: 2;}
            #tres{order: 1;}
            #cuatro{order: 3;}
            #cinco{order: 4;}
            #seis{order: 5;}
            .formContacto { width:70% !important;}
            .contMin {width: 50%; padding: 0.2em;}
        }
        
    </style>
</head>

<body>
<%@include file="/resources/include/headerProfesional.jsp" %>
<main id="contenido">
            <input id="alerta" type="hidden" value="${open}">

                <div class="col-1 titulo-pag" >
                    <p>Gestión Visitas</p>
                </div>
                
                <div class="col-1 cont-text-pag-tabla" >
                <div id="tabs">
                  <ul>
                    <li><a href="#listaVisitas"><span>Visitas Registradas</span></a></li>
                    <li><a href="#nuevaVisita"><span>Ingresar nueva Visita</span></a></li>
                    
                  </ul>
                  
                <div id="listaVisitas">    
                    <div id="contenedor1">
                        <table id="tabla1" class="display responsive" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Asunto</th>
                                <th>Cliente</th>
                                <th>Fecha Inicio</th>
                                <th>Fecha Fin</th>
                                <th>Detalle</th>
                                <th>Modificar</th>
                                <th>Informes</th>
                                <th>PM</th>
                                <th>Lista PM</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="v" items="${lvisitas}">
                                <tr>
                                	<td><c:out value="${v.getId_visita()}" /></td>
                                	<td><c:out value="${v.getEvento().getAsunto()}" /></td>
                                	<td><c:out value="${v.getEvento().getActividad().getCliente().getUsuario().getNombre()}"/></td>
                                    <td><c:out value="${v.getEvento().getFecha_inicio()}" /> </td>
                                    <td><c:out value="${v.getEvento().getFecha_fin()}" /> </td>
                                    <td style="text-align: center; font-size: 1.6em; ">
                                       <a class="modal" href="${pageContext.request.contextPath}/Profesional/irDetalleVisita/${v.getId_visita()}/${id_profesional}.html" ><i class="fas fa-plus-circle" style="color:rgb(9, 83, 219);"></i></a>
                                    </td>  
                                    <td style="text-align: center; font-size: 1.6em; ">
                                       <a class="modal2" href="${pageContext.request.contextPath}/Profesional/irModificarVisita/${v.getId_visita()}/${id_profesional}.html" ><i class="fas fa-pencil-alt" style="color:rgb(9, 83, 219);"></i></a>
                                    </td>       
                                    <td style="text-align: center; font-size: 1.6em; ">
                                       <a class="modal3" href="${pageContext.request.contextPath}/Profesional/irGestionInformeV/${v.getId_visita()}/${id_profesional}.html" ><i class="far fa-file-alt" style="color:rgb(9, 83, 219);"></i></a>
                                    </td> 
                                    <td style ="text-align: center; font-size: 1.6em; ">
                                    	<a class="modal4" href="${pageContext.request.contextPath}/Profesional/irFormulario/${v.getId_visita()}/${id_profesional}.html"><i class="fas fa-pencil-alt" style="color:rgb(9, 83, 219);"></i></a>
                                    </td>
                                    <td style ="text-align: center; font-size: 1.6em; ">
                                    	<a class="modal5" href="${pageContext.request.contextPath}/Profesional/irGestionMejoras/${v.getId_visita()}.html"><i class="fas fa-tasks" style="color:rgb(9, 83, 219);"></i></a>
                                    </td>
                                    
                                   
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>      
                </div>
            </div>
            
            <div id="nuevaVisita">  
         
                 <form:form action="${pageContext.request.contextPath}/Profesional/añadirVisita.html" method="POST" class="formContacto">
                   <form:input  type="hidden" value="${id_profesional}" path="evento.actividad.profesional.id_profesional"/>
                   
                    <span>Asunto</span> 
                    <br>
                 	<form:textarea class="detalleTA" rows="2" path="evento.asunto" required="true" maxlength="150"/>
                    <br>
                    <span>Fecha Inicio</span> 
                    <br>
                   <form:input type="date" path="evento.fecha_inicio" required="true" />
                    <br>
                    <span>Fecha Fin</span> 
                    <br>
                   <form:input type="date" path="evento.fecha_fin" required="true" />
                    <br>
                    <span>Hora</span> 
                    <br>
                   <form:input path="evento.hora"/>
                    <br>
                    <span>Dirección</span> 
                    <br>
                   <form:input path="evento.lugar.direccion" id="search_input" required="true" maxlength="300"/>
                   <form:input  type="hidden" path="evento.lugar.latitud" id="loc_lat" />
                   <form:input  type="hidden" path="evento.lugar.longitud" id="loc_long" />
                   <br>
                  
                  <span>Cliente</span> 
                    <br>  
                    <form:select path="evento.actividad.cliente.id_cliente" class="listadoDestinatarios" required="true" style="width: 100% !important; font-size: 1em !important;">
                             <c:forEach var="c" items="${listaClientes}">
                                 <form:option value="${c.getId_cliente()}"> <c:out value="${c.getUsuario().getNombre()}" />, <c:out value="${c.getRut()}" /> </form:option>
                             </c:forEach>        
                    </form:select>
                    <br>  
                                     
                    <span>Detalle</span> 
                    <br>
                    <form:textarea path="detalle" class="detalleTA" rows="7" placeholder="Ingrese detalle solicitud" required="true" maxlength="1000"/>
                    <br>
                    <button type="submit" class="btnForm">Agendar</button>
                </form:form>        
                 </div>
            </div>
            </div>
           
            
  		
        <div id="dialog" style="display: none;" >
        </div>
        
          <div id="dialog3" style="display: none;" >
        </div>
        
        <div id="dialog4" style="display: none;" >
        </div>
          
         <div id="dialog2" style="display: none;" >
       <div style="display:flex; ">
       
            <div style="width: 20%; margin: auto;  font-size: 3em;">
                <span> <i class="far fa-check-circle"></i></span>
            </div>
            <div style="width: 77%; margin: auto; text-align: center;">
                <span>¡Visita Registrada Correctamente!</span>
            </div>
        </div>
   </div>



</main>

<%@include file="/resources/include/sidebarProfesional.jsp" %>
    
<%@include file="/resources/include/footer.html" %>

<script type="text/javascript">

var searchInput = 'search_input';
var lat_cliente = null;
var long_cliente = null;

$(document).ready(function() {
	
	 $(".listadoDestinatarios").select2({
         placeholder: "Buscar",
         allowClear: true
     });
    
     $("#dialog").css('display','block');  
        $( "#dialog" ).dialog({
            modal: true,
            autoOpen: false,
            draggable: false,
            resizable: false,
            maxHeight: 550,
            dialogClass: "grande",
            closeText: ""
        });
        
       
        
        $("#dialog4").css('display','block');  
        $( "#dialog4" ).dialog({
            modal: true,
            autoOpen: false,
            draggable: false,
            resizable: false,
            maxHeight: 600,
            dialogClass: "grande",
            closeText: ""
        });
        
            $('body').on("click", '.modal', function(e){
            e.preventDefault();
            var href = $(this).attr('href').split(/[./]/)[4];;
            $( "#dialog" ).dialog({ title: 'Detallle Visita ID:\n' + href });
            $('#dialog').load(this.href).dialog('open');
        });
            
            $('body').on("click", '.modal2', function(e){
                e.preventDefault();
                var href = $(this).attr('href').split(/[./]/)[4];;
                $( "#dialog" ).dialog({ title: 'Modificar Visita ID:\n' + href });
                $('#dialog').load(this.href).dialog('open');
            });
            
            $('body').on("click", '.modal3', function(e){
                e.preventDefault();
                var href = $(this).attr('href').split(/[./]/)[4];;
                $( "#dialog" ).dialog({ title: 'Informe visita ID:\n' + href });
                $('#dialog').load(this.href).dialog('open');
            });
        
            $('body').on("click", '.modal4', function(e){
                e.preventDefault();
                var href = $(this).attr('href').split(/[./]/)[4];;
                $( "#dialog" ).dialog({ title: 'Crear Propuesta Visita ID:\n' + href });
                $('#dialog').load(this.href).dialog('open');
            });
            
            $('body').on("click", '.modal5', function(e){
                e.preventDefault();
                var href = $(this).attr('href').split(/[./]/)[4];;
                $( "#dialog" ).dialog({ title: 'Listado propuestas mejora Visita ID:\n' + href });
                $('#dialog').load(this.href).dialog('open');
            });
            
            $('body').on("click", '.modal6', function(e){
                e.preventDefault();
                var href = $(this).attr('href').split(/[./]/)[4];;
                $( "#dialog" ).dialog({ title: 'Crear Propuesta ID:\n' + href });
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
    
    
     $( "#tabs" ).tabs({
     });
    
    
    $('#tabla1').DataTable({
        responsive: true,
        "order": [[ 3, "desc" ]],
         "columnDefs": [{ targets: 3, render: $.fn.dataTable.render.moment('YYYY-MM-DD','DD-MM-YYYY') },
        	 { targets: 4, render: $.fn.dataTable.render.moment('YYYY-MM-DD','DD-MM-YYYY') },
        	 {targets: 5, orderable: false}, {targets: 6, orderable: false}, {targets: 7, orderable: false}], 
        
        "language" : {"url" : "https://cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
                      }
    });
    
  $('#contenedor1').css("width", "100%");
  $('#contenedor1').css("margin", "0");
  $('#contenedor1').css("background-color","rgb(255, 255, 255)");
  $('#contenedor1').css("font-size", "0.9em");
  
  $('#contenedor2').css("width", "100%");
  $('#contenedor2').css("margin", "0");
  $('#contenedor2').css("background-color","rgb(255, 255, 255)");
  $('#contenedor2').css("font-size", "0.9em");
  
  
  var searchInput = 'search_input';
  
  var autocomplete;
  
  autocomplete = new google.maps.places.Autocomplete((document.getElementById(searchInput)),{
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
   
    
  
  $(function() {
      
      $("form[name='registroProfesional']").validate({
         rules: {
        'usuario.nombre': { required: true,  maxlength: 100 },
        rut_profesional: { required: true,   maxlength: 20 },
        direccion_profesional: { required: true,  maxlength: 300 },
        fecha_nacimiento: { required: true,  maxlength: 50 },
        profesion: { required: true,  maxlength: 50 },
        email_profesional: {required: true, maxlength: 50},
        telefono_profesional:{ required: true, maxlength: 15},
        'usuario.contrasena': { required: true,  maxlength: 6 }
         },
        messages: {
            'usuario.nombre': { required: "Campo requerido", maxlength: "Máximo 100 caracteres permitidos"},
            rut_profesional: { required: "Campo requerido", maxlength: "Máximo 20 caracteres permitidos"},
            direccion_profesional: { required: "Campo requerido", maxlength: "Máximo 300 caracteres permitidos"},
            fecha_nacimiento:{ required: "Campo requerido", maxlength: "Máximo 10 caracteres permitidos"},
            profesion:{ required: "Campo requerido", maxlength: "Máximo 50 caracteres permitidos"},
            email_profesional: { required: "Campo requerido", maxlength: "Máximo 50 caracteres permitidos"},
            telefono_profesional: { required: "Campo requerido", maxlength: "Máximo 15 caracteres permitidos"},
           'usuario.contrasena': { required: "Campo requerido", maxlength: "Máximo 6 caracteres permitidos"}
        },
        submitHandler: function(form) {
             event.preventDefault();
             $("<div />").text("¿Está seguro?").dialog({
                 closeText: "",
                 modal: true,
                 autoOpen: true,
                 draggable: false,
                 resizable: false,
                 minHeight: 0,
                 dialogClass: "chica",
                 title: "Confirmación",
                 buttons: {
                     "Registrar": function () {
                         form.submit();
                     },
                     "Cancelar": function () {
                         $(this).dialog("close");
                     }
                 }
             });
            
            
         
        }
      });
    });    
  
          
  });
  
function concatenar() {
    $("#otroAsunto").val($("#nuevoMotivo").val());
    var otro =  $("#otroAsunto").val();
    console.log(otro);
}
  



</script>

<script src="<c:url value="/resources/js/sidebar.js" />" ></script>
 <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyAPBIgxJbDYk4SGlKjlv7CE_XinnfRkCqA"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<script src="<c:url value="/resources/js/modalLogout.js" />" ></script>


</body>
</html>