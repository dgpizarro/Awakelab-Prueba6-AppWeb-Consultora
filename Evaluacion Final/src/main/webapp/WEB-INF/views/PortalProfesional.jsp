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
<title>Portal Profesional</title>

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
    
<!-- Full Callendar -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/main.min.css">
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/main.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/locales-all.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/package.json"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/locales-all.min.js"></script>
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
    </style>  
</head>
<body class="homeProfesional">

<%@include file="/resources/include/headerProfesional.jsp" %>

<main id="contenido">

        <div class="col-3 titulo-pag" id="uno">
                <p>Agenda</p>
        </div>
        
        <div class="col-3 cont-text-pag-tabla" id="dos">
            
             <div id='calendar'></div>    
             
             <div class="coloresEventos">
                <div id="colorC"> <p> Capacitaciones </p> </div>
                <div id="colorV"> <p> Visitas </p> </div>
                <div id="colorA"> <p> Asesorías </p> </div>
            </div> 
        </div>
         
         <div class="col-4 titulo-pag" id="tres">
                <p>Notificaciones</p>
        </div>
        
        <div class="col-4 cont-text-pag-tabla" id="cuatro">
        
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
                                       <a class="modal2" href="${pageContext.request.contextPath}/Profesional/quitarNotificacion/${n.getId_mensaje()}.html" ><i class="fas fa-plus-circle" style="color:rgb(9, 83, 219);"></i></a>
                                    </td>                                   
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>        
                </div>
        
         </div>
         
          <div id="dialog" style="display: none;" >
            </div>
            
            <div id="dialog2" style="display: none;" >
        </div>
    
        

</main>

<%@include file="/resources/include/sidebarProfesional.jsp" %>
    
<%@include file="/resources/include/footer.html" %>

<script type="text/javascript">

$(document).ready(function () {
        
    <!--Ventana Modal --->
    $("#dialog").css('display','block');  
    $( "#dialog" ).dialog({
        closeText: "",
        autoOpen: false,
        draggable: false,
        resizable: false,
        minHeight: 0,
        dialogClass: "grande",
    });
       $('.modal2').click(function(e) {
        e.preventDefault();
        $( "#dialog" ).dialog({ title: 'Nuevo mensaje'});
        $('#dialog').load(this.href).dialog('open');
    });
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
                         url: '${pageContext.request.contextPath}/Profesional/irDetalleCapacitacion/<c:out value="${c.getId_capacitacion()}"/>.html'
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
                         url: '${pageContext.request.contextPath}/Profesional/irDetalleVisita/<c:out value="${v.getId_visita()}"/>/${id_profesional}.html',
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
                         url: '${pageContext.request.contextPath}/Profesional/irDetalleAsesoria/<c:out value="${a.getAsesoria().getId_asesoria()}"/>.html',
                         },
                      </c:forEach> 
                  ],
                   color: '#58ACFA',    
                    textColor: 'black' 
          },          
          ],
     eventClick: function(info){
    	 event.preventDefault();
               $("#dialog2").dialog({ modal: true, dialogClass: "grande",  maxHeight: 550, closeText: "", draggable: false, resizable: false,});
               $("#dialog2").load(info.event.url);
          },
    });
    calendar.render();
  });

</script>

<script src="<c:url value="/resources/js/sidebar.js" />" ></script>
<script src="<c:url value="/resources/js/datatableBuzon.js" />" ></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>
<script src="<c:url value="/resources/js/modalLogout.js" />" ></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/locale/es.min.js"></script>


</body>
</html>