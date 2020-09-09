<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Nuevos Admin</title>
<!-- Tipos Font -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
        rel="stylesheet">
<!-- DataTable -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" type="text/css"
        href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css" />
    
    <script type="text/javascript"
        src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
        
     <script type="text/javascript"
        src="https://cdn.datatables.net/plug-ins/1.10.21/dataRender/datetime.js"></script> 
     <script type="text/javascript"
        src="https://momentjs.com/downloads/moment-with-locales.min.js"></script> 
    
<!-- Etilo CSS General -->  
    <link href="<c:url value="/resources/css/estilo_general.css" />" rel="stylesheet">
</head>
<body>
<div id="contenedor1">
                    <table id="tabla1" class="display " style="width:100%">
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
                                       <a class="modal" href="${pageContext.request.contextPath}/Admin/quitarNotificacion/${n.getId_mensaje()}.html" ><i class="fas fa-plus-circle" style="color:rgb(9, 83, 219);"></i></a>
                                    </td>                                   
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>        
                </div>

<script>
$(document).ready(function() {
    $.noConflict();
    $('#tabla1').DataTable({
       
        "order": [[ 0, "desc" ]],
        "columnDefs": [{ targets: 0, render: $.fn.dataTable.render.moment('YYYY-MM-DD','DD-MM-YYYY') },
            {targets: 1, orderable: false}, {targets: 2, orderable: false},  {targets: 0, width: "15%"}
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
      closeText: "",
      modal: true,
      autoOpen: false,
      draggable: false,
      resizable: false,
      minHeight: 0,
      dialogClass: "grande",
  });
  
  $('body').on("click", '.modal', function(e){
      e.preventDefault();
      var href = $(this).attr('href').split(/[./]/)[4];;
      $( "#dialog" ).dialog({ title: "Nuevo mensaje" });
      $('#dialog').load(this.href).dialog('open');
  });
  
 
          
  });


</script>


</body>
</html>