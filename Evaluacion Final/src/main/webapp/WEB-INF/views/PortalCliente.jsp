<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Portal Cliente</title>
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
    <script type="text/javascript" src="https://cdn.datatables.net/plug-ins/1.10.21/dataRender/datetime.js"></script> 
     <script type="text/javascript" src="https://momentjs.com/downloads/moment-with-locales.min.js"></script> 
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
        }
        
        #nuevoMotivo{
            display: none;
        }
        
    </style>  
<!--Manejo motivo adicional otro motivo form solicitudes -->
    <script type="text/javascript">
    function concatenar() {
        $("#otroAsunto").val($("#nuevoMotivo").val());
        var otro =  $("#otroAsunto").val();
        console.log(otro);
    }
    
    $(document).ready(function() {
    	
        $("input[type=radio]").click(function(event){
            var valor = $(event.target).val();
            if(valor ==""){
                $("#nuevoMotivo").css("display","inherit");
            } else {
                $("#nuevoMotivo").css("display","none");
            } 
        });
        var morosidad = $("#obtieneMorosidad").val();
        if (morosidad == "T") {
            $("#muestraMorosidad").html("Presenta mora");
            $("#estadoPagos").addClass("conMora");
        }
        if (morosidad != "T") {
            $("#muestraMorosidad").html("Al día");
            $("#estadoPagos").addClass("sinMora");
        }
    });
    </script> 
</head>
<body class="homeCliente">

<%@include file="/resources/include/headerCliente.jsp" %>

<main id="contenido">

            <input id="alerta" type="hidden" value="${open}">

            <div class="col-2 titulo-pag" id="uno">
                <p>Mis estadísticas</p>
            </div>
            
            <div class="col-2 cont-text-pag" id="dos">
                <p class="enfasisP">Resumen mes ${mes} ${year} </p>
                <hr style="border: 0.55px solid;">
                <table class="tablaNoDinamica">
	                <tr> 
	                <td><span>Asesorías ocupadas: </span>    </td>
	                <td> &nbsp; &nbsp; <span class="nMes"> ${tA}</span>  &nbsp; <span> <b>/ &nbsp;10</b> </span> </td>
	                </tr>
	                <tr> 
                    <td><span>Visitas recibidas: </span>    </td>
                    <td> &nbsp;  &nbsp; <span class="nMes"> ${tV}</span>  &nbsp; <span> <b> / &nbsp;2</b> </span>  </td>
                    </tr>
                    <tr> 
                    <td><span>Capacitaciones recibidas: </span>    </td>
                    <td> &nbsp;  &nbsp; <span class="nMes">${tC}</span>   </td>
                    </tr>
                    <tr> 
                    <td><span>Accidentes reportados este mes: </span>    </td>
                    <td> &nbsp;  &nbsp; <span class="nMes">${aM}</span>    </td>
                    </tr>
                </table>
                <br>
                <p class="enfasisP">Resumen año ${year} </p>
                <hr style="border: 0.55px solid;">
                <table class="tablaNoDinamica">
                    <tr> 
                    <td><span>Modificaciones lista de chequeo: </span>    </td>
                    <td>  &nbsp;  &nbsp; <span class="nMes">${mC}</span> </span>  &nbsp; <span> <b>/ &nbsp;2 </b> </span> </td>
                    </tr>
                    <tr> 
                    <td><span>Total accidentes reportados: </span>    </td>
                    <td> &nbsp;  &nbsp; <span class="nMes">${aT}</span>    </td>
                    </tr>
                </table>
                <br>
                <p class="enfasisP">Estado pagos </p>
                <hr style="border: 0.55px solid;">
                <div id="estadoPagos"> 
                    <input id="obtieneMorosidad" type="hidden" value="${estado_pagos}">
                    <span id="muestraMorosidad"></span>
                </div>
            </div>
            
             <div class="col-2 titulo-pag" id="tres">
                <p>Notificaciones</p>
            </div>
            
            <div class="col-2 cont-text-pag-tabla" id="cuatro">
            
                <div id="contenedor1">
                    <table id="tabla1" class="display responsive" style="width:100%">
                        <thead>
                            <tr>
                                <th>Fecha</th>
                                <th>Mensaje </th>
                                <th> </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="n" items="${newsP}">
                                <tr>
                                    <td><c:out value="${n.getFecha()}" /> </td>
                                    <td><b><c:out value="${n.getAsunto()}" /></b> <br>
                                        Enviado por: <c:out value="${n.getRemitente().getNombre()}"/>
                                     </td>
                                    <td style="text-align: center; font-size: 1.6em; ">
                                       <a class="modal2" href="${pageContext.request.contextPath}/Cliente/quitarNotificacion/${n.getId_mensaje()}.html" ><i class="fas fa-plus-circle" style="color:rgb(9, 83, 219);"></i></a>
                                    </td>                                   
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>        
                </div>
                
            </div>
            
            <div class="col-1 titulo-pag" id="cinco">
                <p>Formulario De Contacto  &nbsp;  &nbsp;<i class="far fa-envelope"></i></p>
            </div>
            
            <div class="col-1 cont-text-pag" id="seis">
                <form:form action="generaSolicitud.html" method="POST" class="formContacto">
                   <form:input  type="hidden" value="${idU_cliente}" path="remitente.id_usuario"/>
                    <span>Cliente</span> 
                    <br>
                    <input type="text" value="${empresa}" readonly>
                    <br>
                    <span>Rut</span> 
                    <br>
                    <input type="text" value="${rut}" readonly>
                    <br>
                    <span>Destinatario</span> 
                    <br>  
                       <div class="buscaForm">
                            <div class="buscaForm1"> <input  type="text" value="${profesional}" readonly> </div>
                             <div class="buscaForm2"> <a class="modal" href="${pageContext.request.contextPath}/Cliente/buscarDestinatarios.html" ><i class="fas fa-search-plus"></i></a></div>
                       </div>
                    <form:input  type="hidden" id="oculto" value="${idU_profesional}" path="destinatario.id_usuario" />
                    <span>Tipo solicitud</span> 
                    <br>
                    <div class="divideRegistro">             
                        <form:radiobutton  path="asunto" name="tipo" value="Solicitud de asesoría" required="true"/> Asesoría <br>
                        <form:radiobutton  path="asunto" name="tipo" value="Solicitud de capacitación" required="true"/> Capacitación<br>
                        <form:radiobutton  path="asunto" name="tipo" value="Solicitud de visita" required="true"/> Visita<br>
                        <form:radiobutton  path="asunto" name="tipo" value="Solicitud de asesoría especial" required="true"/> Asesoría Especial<br>
                        <form:radiobutton  id="otroAsunto" path="asunto" value="" name="tipo" required="true" /> Otro motivo <br>
                    </div>
                    <input type="text" id="nuevoMotivo" onkeyup="concatenar();" placeholder="Indique motivo" maxlength="150"/>
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
   
   <div id="dialog3" style="display: none;" >
       <div style="display:flex; ">
            <div style="width: 20%; margin: auto;  font-size: 3em;">
                <span> <i class="fas fa-exclamation-circle"></i></span>
            </div>
            <div style="width: 77%; margin: auto; text-align: center;">
                <span>¡Debe seleccionar un destinatario!</span>
            </div>
        </div>
   </div>
                 
</main>
 
<%@include file="/resources/include/sidebarCliente.jsp" %>
    
<%@include file="/resources/include/footer.html" %>


<script src="<c:url value="/resources/js/sidebar.js" />" ></script>
<script src="<c:url value="/resources/js/datatableBuzon.js" />" ></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>
<script src="<c:url value="/resources/js/modalsPortalCliente.js" />" ></script>
<script src="<c:url value="/resources/js/modalLogout.js" />" ></script>



</body>
</html>