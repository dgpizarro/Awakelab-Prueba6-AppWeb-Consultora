<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Servicios</title>
<!-- Tipos Font -->
    <script src="https://kit.fontawesome.com/14907c5069.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
        rel="stylesheet">
<!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>       
<!-- Full Callendar -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/main.min.css">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/main.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/locales-all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/package.json"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/locales-all.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/locale/es.min.js"></script>
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
            #agendaCliente {width: 85% !important; margin: 0 7.5%;}
        }
        
    </style>  
</head>
<body>

<%@include file="/resources/include/headerCliente.jsp" %>

<main id="contenido">

            <input id="alerta" type="hidden" value="${open}">

            <div class="col-1 titulo-pag" >
                <p>Servicios</p>
            </div>
            
            <div class="col-1 cont-text-pag-tabla" >      
                <div id="tabs">
                  <ul>
                    <li><a href="#agendaCliente"><span>Asesorías, Visitas y Capacitaciones</span></a></li>
                    <li><a href="#checkCliente"><span>Mi CheckList</span></a></li>
                  </ul>
                      <div id="agendaCliente">  
             
				             <div class="coloresEventos">
				                <div id="colorC"> <p> Capacitaciones </p> </div>
				                <div id="colorV"> <p> Visitas </p> </div>
				                <div id="colorA"> <p> Asesorías </p> </div>
				            </div> 
				            
				            <div id='calendar'></div>  
                        
                      </div>
                      <div id="#checkCliente">  
                      </div>
                </div>
            </div>
                        
     <div id="dialog" style="display: none;" >
   </div>
   
    <div id="dialog3" style="display: none;" >
   </div>
           
        <div id="dialog2" style="display: none;" >
       <div style="display:flex; ">
            <div style="width: 20%; margin: auto;  font-size: 3em;">
                <span> <i class="far fa-check-circle"></i></span>
            </div>
            <div style="width: 77%; margin: auto; text-align: center;">
                <span>¡!</span>
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

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,listWeek' 
          },
      locale: 'es',
      fixedWeekCount: false, 
      displayEventTime: false,
      eventSources: [
          {
              events: [ 
                  
                      <c:forEach var="c" items="${capacitaciones}">
                         {title  :'<c:out value="${c.getEvento().getAsunto()}"/>', 
                         start : '<c:out value="${c.getEvento().getFecha_inicio()}" />',
                         end : '<c:out value="${c.getEvento().getFecha_fin()}" />T23:59:00',
                         url: '${pageContext.request.contextPath}/Cliente/irDetalleCapacitacion/<c:out value="${c.getId_capacitacion()}"/>/${id_cliente}.html'
                         },
                      </c:forEach> 
                  ],
                   color: '#2E2E2E',     
                    textColor: 'white' 
          },
          {
              events: [ 
                  
                      <c:forEach var="v" items="${visitas}">
                         {title  :'<c:out value="${v.getEvento().getAsunto()}"/>', 
                         start : '<c:out value="${v.getEvento().getFecha_inicio()}" />',
                         end : '<c:out value="${v.getEvento().getFecha_fin()}" />T23:59:00',
                         url: '${pageContext.request.contextPath}/Cliente/irDetalleVisita/<c:out value="${v.getId_visita()}"/>/${id_cliente}.html',
                         },
                      </c:forEach> 
                  ],
                   color: '#D7DF01',    
                    textColor: 'black' 
          },
          {
              events: [ 
                  
                      <c:forEach var="a" items="${asesorias}">
                         {title  :'<c:out value="${a.getAsesoria().getAsunto()}"/>', 
                         start : '<c:out value="${a.getFecha_evento()}" />',
                         url: '${pageContext.request.contextPath}/Cliente/irDetalleAsesoria/<c:out value="${a.getAsesoria().getId_asesoria()}"/>/${id_cliente}.html',
                         },
                      </c:forEach> 
                  ],
                   color: '#58ACFA',    
                    textColor: 'black' 
          },          
          ],
     eventClick: function(info){
         event.preventDefault();
               $("#dialog3").dialog({ modal: true, dialogClass: "grande", closeText: "", draggable: false, resizable: false,});
               $("#dialog3").load(info.event.url);
          },
    });
    calendar.render();
  });

</script>

</main>

<%@include file="/resources/include/sidebarCliente.jsp" %>
    
<%@include file="/resources/include/footer.html" %>

<script src="<c:url value="/resources/js/sidebar.js" />" ></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>
<script src="<c:url value="/resources/js/modalLogout.js" />" ></script>

</body>
</html>