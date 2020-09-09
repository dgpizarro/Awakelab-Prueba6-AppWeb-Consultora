<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mensajes</title>
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
<!-- Select2 -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
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
</head>
<body>

<%@include file="/resources/include/headerAdmin.jsp" %>

<main id="contenido">

            <input id="alerta" type="hidden" value="${open}">

            <div class="col-1 titulo-pag" >
                <p>Servicio Mensajería</p>
            </div>
            
            <div class="col-3 cont-text-pag-tabla" >      
                <div id="tabs">
                  <ul>
                    <li><a href="${pageContext.request.contextPath}/Admin/todosLosMensajesNoLeidos/${id_usuario}.html"><span>No leídos</span></a></li>
                    <li><a href="${pageContext.request.contextPath}/Admin/todosLosMensajes/${id_usuario}.html"><span>Recibidos</span></a></li>
                    <li><a href="${pageContext.request.contextPath}/Admin/mensajesEnviados/${id_usuario}.html"><span>Enviados</span></a></li>
                  </ul>
                      <div id="noLeidos">    
                      </div>
                      <div id="leidos">  
                      </div>
                </div>
            </div>
            
             <div class="col-4 cont-text-pag-tabla">
                <div class="tituloInterno"><h3>Nuevo Mensaje</h3></div>
             
                <form:form action="${pageContext.request.contextPath}/Admin/generaMensaje.html" method="POST" class="formContacto">
                   <form:input  type="hidden" value="${id_usuario}" path="remitente.id_usuario"/>
                    <span>Destinatario</span> 
                    <br>  
                    <form:select path="destinatario.id_usuario" class="listadoDestinatarios" required="true" style="width: 100% !important; font-size: 1em !important;">
                           <c:forEach var="p" items="${listaP}">
                                 <form:option value="${p.getUsuario().getId_usuario()}"><c:out value="${p.getUsuario().getNombre()}" /> ,  <c:out value="${p.getProfesion()}" /></form:option>
                             </c:forEach>
                              <c:forEach var="c" items="${listaC}">
                                 <form:option value="${c.getUsuario().getId_usuario()}"><c:out value="${c.getUsuario().getNombre()}" /> </form:option>
                             </c:forEach>        
                    </form:select>
                    <br>
                    <br>
                    <span>Mensaje tipo</span> 
                    <br>
                    <div class="divideRegistro">             
                        <form:radiobutton  path="asunto" name="tipo" value="Información actualizada" required="true"/> Actualización de información cuenta <br>
                        <form:radiobutton  path="asunto" name="tipo" value="Emisión de informe" required="true"/> Emisión de informe<br>
                        <form:radiobutton  path="asunto" name="tipo" value="Atraso en evento agendado" required="true"/> Notificación atrasos<br>
                        <form:radiobutton  path="asunto" name="tipo" value="Regularice situación de pagos" required="true"/> Regularización de pagos<br>
                        <form:radiobutton  id="otroAsunto" path="asunto" value="" name="tipo" required="true" /> Otro motivo <br>
                    </div>
                    <textarea class="detalleTA" rows="2" id="nuevoMotivo" onkeyup="concatenar();" placeholder="Indique motivo" maxlength="150" required ></textarea>
                    <br>
                    <span>Detalle</span> 
                    <br>
                    <form:textarea path="detalle" class="detalleTA" rows="5" placeholder="Ingrese detalle solicitud" required="true" maxlength="1000"/>
                    <br>
                    <button type="submit" class="btnForm">Enviar</button>
                </form:form>  
                
            </div>
            
     <div id="dialog" style="display: none;" >
   </div>
           
        <div id="dialog2" style="display: none;" >
       <div style="display:flex; ">
            <div style="width: 20%; margin: auto;  font-size: 3em;">
                <span> <i class="far fa-check-circle"></i></span>
            </div>
            <div style="width: 77%; margin: auto; text-align: center;">
                <span>¡Mensaje enviado correctamente!</span>
            </div>
        </div>
   </div>
 
<script>
$(document).ready(function () {
    

    $(".listadoDestinatarios").select2({
        placeholder: "Buscar",
        allowClear: true
    });
    
    $( "#tabs" ).tabs({
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

function concatenar() {
    $("#otroAsunto").val($("#nuevoMotivo").val());
    var otro =  $("#otroAsunto").val();
    
}
</script>

</main>

<%@include file="/resources/include/sidebarAdmin.jsp" %>
    
<%@include file="/resources/include/footer.html" %>

<script src="<c:url value="/resources/js/sidebar.js" />" ></script>
<script src="<c:url value="/resources/js/datatableBuzon.js" />" ></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>
<script src="<c:url value="/resources/js/modalLogout.js" />" ></script>

</body>
</html>