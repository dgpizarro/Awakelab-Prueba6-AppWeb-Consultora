<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gesti�n Profesional</title>
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
     <script type="text/javascript"
        src="https://momentjs.com/downloads/moment-with-locales.min.js"></script> 
<!-- Estilo Dialog -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<!-- Etilo CSS General -->  
    <link href="<c:url value="/resources/css/estilo_general.css" />" rel="stylesheet">
    
    <style>
        .cont-text-pag-tabla { margin-bottom:0;} 
        .formContacto {padding: 2em 0;}   
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
        
        #nuevoMotivo{
            display: none;
        }
    </style>
</head>

<body>
<%@include file="/resources/include/headerAdmin.jsp" %>
<main id="contenido">
            <input id="alerta" type="hidden" value="${open}">

                <div class="col-1 titulo-pag" >
                    <p>Gesti�n Profesional</p>
                </div>
                
                <div class="col-1 cont-text-pag-tabla" >
                <div id="tabs">
                  <ul>
                    <li><a href="#listaProfesionales"><span>Profesionales Registrados</span></a></li>
                    <li><a href="#nuevoProfesional"><span>Ingresar nuevo Profesional</span></a></li>
                  </ul>
                  
                <div id="listaProfesionales">    
                    <div id="contenedor1">
                        <table id="tabla1" class="display responsive" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Nombre</th>
                                    <th>Rut </th>
                                    <th>Profesi�n</th>
                                    <th>Estado</th> 
                                    <th data-priority="1">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="p" items="${lprofesionales}">
                                    <tr>
                                        <td><c:out value="${p.getId_profesional()}" /></td>
                                        <td><c:out value="${p.getUsuario().getNombre()}" /></td>
                                        <td><c:out value="${p.getRut_profesional()}" /></td>
                                        <td><c:out value="${p.getProfesion()}"/></td>
                                        <td><c:out value="${p.getEstado()}" /></td>
                                        <td style="text-align: center; font-size: 1.1em;">
                                           <a class="modal" href="${pageContext.request.contextPath}/Admin/irDetalleProfesional/${p.getId_profesional()}.html" ><i class="fas fa-search-plus" style="color:rgb(9, 83, 219);"></i></a>
                                           &nbsp;  <a class="modal3" href="${pageContext.request.contextPath}/Admin/irKeyProfesional/${p.getUsuario().getId_usuario()}/${p.getId_profesional()}.html" ><i class="fas fa-key" style="color:rgb(9, 83, 219);"></i></a>
                                           &nbsp;<a class="modal2" href="${pageContext.request.contextPath}/Admin/irModificarProfesional/${p.getId_profesional()}.html" >Editar</a>
                                        </td>                                
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                </div>
            </div>
            
            <div id="nuevoProfesional">  
                <div class="col-1 cont-text-pag-tabla" >
                 <form:form action="${pageContext.request.contextPath}/Admin/crearNuevoProfesional.html" method="POST" class="formContacto" name="registrarProfesional" >
                    <span>Nombre </span>
                    <br>
                    <form:input path="usuario.nombre" />
                    <br>
            
                    <span>Rut</span>
                    <br>
                    <form:input path="rut_profesional"/>
                    <br>
            
                    <span>Direcci�n</span>
                    <br>
                    <form:input path="direccion_profesional" id="search_input"/>
                    <br>
                    
                    <span>Fecha de Nacimiento</span>
                    <br>
                    <form:input type="date" path="fecha_nacimiento"/>
                    <br>  
                    
                    <span>Profesi�n</span>
                    <br>
                    <form:input path="profesion"/>
                    <br>
            
            
                    <div class="separadorForm"><p> Contacto </p></div>
                    
                    <div id="contMax">
                           
                         <div class="contMin">
                        <span> Correo electr�nico</span> 
                        <br>
                         <form:input path="email_profesional"/>
                        <br>
                        </div>
                        
                        <div class="contMin">
                        <span> Tel�fono</span> 
                        <br>
                        <form:input path="telefono_profesional"/>  
                        <br>
                        </div>
                    </div>
                    
                    <div class="separadorForm"><p> Contrase�a </p></div>
                 
                        <div class="divideRegistro">             
                            <form:radiobutton  path="usuario.contrasena" name="tipo" value="1234" checked="checked" /> Por defecto (1234) <br>
                            <form:radiobutton  id="otroAsunto" path="usuario.contrasena" value="" name="tipo" /> Otra <br>
                        </div>
                        <input id="nuevoMotivo" onkeyup="concatenar();" maxlength="6" >
                    
                    <br><button type="submit" class="btnForm">Registrar</button><br>  
                </form:form>
                 </div>
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
                <span>�Profesional registrado correctamente!</span>
            </div>
        </div>
   </div>



</main>

<%@include file="/resources/include/sidebarAdmin.jsp" %>
    
<%@include file="/resources/include/footer.html" %>

<script type="text/javascript">

$(document).ready(function() {
    
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
        
        $("#dialog3").css('display','block');  
        $( "#dialog3" ).dialog({
            modal: true,
            autoOpen: false,
            draggable: false,
            resizable: false,
            minHeight: 0,
            dialogClass: "dialog-calendario",
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
            $( "#dialog" ).dialog({ title: 'Detalle Profesional ID:\n' + href });
            $('#dialog').load(this.href).dialog('open');
        });
            
            $('body').on("click", '.modal2', function(e){
                e.preventDefault();
                var href = $(this).attr('href').split(/[./]/)[4];;
                $( "#dialog4" ).dialog({ title: 'Modificar Profesional ID:\n' + href });
                $('#dialog4').load(this.href).dialog('open');
            });
        
            $('body').on("click", '.modal3', function(e){
                e.preventDefault();
                var href = $(this).attr('href').split(/[./]/)[4];;
                $('#dialog3').load(this.href).dialog('open');
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
        "order": [[ 1, "asc" ]],
         "columnDefs": [{targets: 5, orderable: false}], 
        
        "language" : {"url" : "https://cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
                      }
    });
    
  $('#contenedor1').css("width", "100%");
  $('#contenedor1').css("margin", "0");
  $('#contenedor1').css("background-color","rgb(255, 255, 255)");
  $('#contenedor1').css("font-size", "0.9em");
  
  var searchInput = 'search_input';
  
  var autocomplete;
  
  autocomplete = new google.maps.places.Autocomplete((document.getElementById(searchInput)),{
      types: ['geocode'],
      componentRestrictions: {
          country: "CHL"
      }
  });
  
  $("input[type=radio]").click(function(event){
      var valor = $(event.target).val();
      if(valor ==""){
          $("#nuevoMotivo").css("display","inherit");
      } else {
          $("#nuevoMotivo").css("display","none");
          $("#otroAsunto").val("");
          $("#nuevoMotivo").val("");
      } 
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
            'usuario.nombre': { required: "Campo requerido", maxlength: "M�ximo 100 caracteres permitidos"},
            rut_profesional: { required: "Campo requerido", maxlength: "M�ximo 20 caracteres permitidos"},
            direccion_profesional: { required: "Campo requerido", maxlength: "M�ximo 300 caracteres permitidos"},
            fecha_nacimiento:{ required: "Campo requerido", maxlength: "M�ximo 10 caracteres permitidos"},
            profesion:{ required: "Campo requerido", maxlength: "M�ximo 50 caracteres permitidos"},
            email_profesional: { required: "Campo requerido", maxlength: "M�ximo 50 caracteres permitidos"},
            telefono_profesional: { required: "Campo requerido", maxlength: "M�ximo 15 caracteres permitidos"},
           'usuario.contrasena': { required: "Campo requerido", maxlength: "M�ximo 6 caracteres permitidos"}
        },
        submitHandler: function(form) {
             event.preventDefault();
             $("<div />").text("�Est� seguro?").dialog({
                 closeText: "",
                 modal: true,
                 autoOpen: true,
                 draggable: false,
                 resizable: false,
                 minHeight: 0,
                 dialogClass: "chica",
                 title: "Confirmaci�n",
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