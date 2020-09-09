<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lista Accidentes</title>
    <link rel="icon" href="img/logo1.png">
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
    
<script> 
<!--Ventana Modal -->
$(document).ready(function () {
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
    
    	$('body').on("click", '.modal', function(e){
        e.preventDefault();
        var href = $(this).attr('href').split(/[./]/)[4];;
        $( "#dialog" ).dialog({ title: 'Detalle accidente ID:\n' + href });
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
    
</head>
<body class="AccRepor">

<%@include file="/resources/include/headerCliente.jsp" %>
 
  <main id="contenido">
  
  <input id="alerta" type="hidden" value="${open}">
 
            <div class="col-1 titulo-pag">
                <p>Accidentes Reportados</p>
            </div>
                
    <div class="col-1 cont-text-pag-tabla">
    <div id="contenedor1">
        <table id="tabla1" class="display responsive" style="width:100%">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Fecha</th>
                    <th>N° Accidentados </th>
                    <th>Tipo accidente </th>
                    <th>Lugar</th>
                    <th>Detalle</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="a" items="${lacc}">
                    <tr>
                        <td><c:out value="${a.getId_accidente()}" /></td>
                        <td><c:out value="${a.getFecha_accidente()}" /></td>
                        
                        <td style="text-align: center;"><c:out value="${a.getN_accidentados()}" /></td>
                        <td><c:out value="${a.getTipo_accidente()}" /></td>
                        <td><c:out value="${a.getLugar_accidente()}" /> </td>
                        <td style="text-align: center; font-size: 1.1em;">
                           <a class="modal" href="${pageContext.request.contextPath}/Cliente/irDetalleAccidente/${a.getId_accidente()}.html" ><i class="fas fa-search-plus" style="color:rgb(9, 83, 219);"></i></a>
                        </td>
                        <td style="text-align: center;"> Asesoría</td>
                        
                    </tr>
                </c:forEach>

            </tbody>
        </table>
        
        
    </div>
    </div>
    
        
   <div id="dialog" style="display: none;" >
   </div>
   
   <div id="dialog2" style="display: none;" >
       <div style="display:flex; ">
            <div style="width: 20%; margin: auto;  font-size: 3em;">
                <span> <i class="far fa-check-circle"></i></span>
            </div>
            <div style="width: 77%; margin: auto; text-align: center;">
                <span>¡Accidente registrado correctamente!</span>
            </div>
        </div>
   </div>
                
            
                       
        </main>
 
 <%@include file="/resources/include/sidebarCliente.jsp" %>
    
<%@include file="/resources/include/footer.html" %>


<script src="<c:url value="/resources/js/sidebar.js" />" ></script>
<script src="<c:url value="/resources/js/dataTableListaAccidentesCliente.js" />" ></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>
<script src="<c:url value="/resources/js/modalLogout.js" />" ></script>
    

</body>
</html>