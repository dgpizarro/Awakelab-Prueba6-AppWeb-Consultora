<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ingreso Accidente</title>
<!-- Tipos Font -->
    <script src="https://kit.fontawesome.com/14907c5069.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
        rel="stylesheet">
<!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Estilo Dialog -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<!-- Etilo CSS General -->        
    <link href="<c:url value="/resources/css/estilo_general.css" />" rel="stylesheet">
    <style>
    table {
    width: 100%;
    border-spacing: 0;
    }

    td {
    border-right: none;
    padding: 0.3em 0.8em 0.3em 0;
    text-align: left;
    }
    
    
    </style>
</head>
<body>

<%@include file="/resources/include/headerCliente.jsp" %>
    
    <main id="contenido">
            <div class="col-1 titulo-pag">
                <p>Registro de nuevo acccidente</p>
            </div>
            <div class="col-1 cont-text-pag">
            <form:form action="${pageContext.request.contextPath}/Cliente/insertarAccidente.html" method="POST" class="formContacto" id="myForm"> 
                <form:input  type= "hidden" path="cliente.id_cliente" value="${id_cliente}"/> 
                               
                <span>Tipo de Accidente (breve descripción)</span>
                <br>
                <form:input path="tipo_accidente" required="true" maxlength="100"/>
                <br>
                
                <span> Lugar</span>
                <br>
                <form:input path="lugar_accidente" id="search_input" required="true" maxlength="100"/> 
                <br>
                
                <table>
                <tr>
                <td> <span> Fecha</span> </td>
                <td> <span> Número accidentados</span> </td>
                <td> <span> Número personas fallecidas</span> </td>
                </tr>
                
                <tr>
                <td> <form:input  type="date" path="fecha_accidente" required="true"/>  </td>
                <td> <form:input path="n_accidentados" required="true" />  </td>
                <td> <form:input path="muertes" />  </td>
                </tr>
                
                </table>
                               
                <br>
                <span> Trabajadores involucrados</span><br>
                <div class="seccionForm"> 
                    <input type="text" id="nombreEmpleado" placeholder="Nombre">
                    <input style="width: 33%; margin: 0.1em auto 0.4em auto;" type="text" id="rutEmpleado" placeholder="Rut">
                     <select style="width: 33% ; height: 1.845em; margin: 0.1em auto 0.4em auto;" id="tipoContrato">
                            <option selected disabled>Tipo de contrato</option>
                            <option value="Fijo">Fijo</option>
                            <option value="Indefinido">Indefinido</option>
                            <option value="Honorarios">Honorarios</option>
                        </select>
                    <input style="width: 33%; margin: 0.1em auto 0.4em auto; font-weight: bold;" type="button" onclick="concatenar();" value="Agregar"><br>    
                         <form:textarea path="accidentados" value="" maxlength="1000" id="totalEmpleados" cols="80" rows="2" readonly="true" class="detalleTA"  required="true"/><br>
                    <input type="button" style="width: 49%; margin: 0.5em auto 0.4em auto; font-weight: bold;" onclick="borrarUltimo();" value="Borrar último">
                    <input type="button" style="width: 49%; margin: 0.5em auto 0.4em auto; font-weight: bold;" onclick="borrarTodo();" value="Borrar todos">          
                </div>
                 <br>
                                  
                <span> Detalle</span>
                <br>
                <form:textarea path="detalle" class="detalleTA" required="true" maxlength="1000" rows="5" /><br>
                <br>
                
                <br><button type="submit" class="btnForm">Registrar</button><br>    
                
            </form:form>
            </div>    
            
        <div id="dialog3" style="display: none;" >
	       <div style="display:flex; ">
	            <div style="width: 20%; margin: auto;  font-size: 3em;">
	                <span> <i class="fas fa-exclamation-circle"></i></span>
	            </div>
	            <div style="width: 77%; margin: auto; text-align: center;">
	                <span>¡Debe indicar nombre(s) accidentado(s)!. </span> 
	            </div>
	        </div>
        </div>
        
        <div id="dialog4" style="display: none;" >
           <div style="display:flex; ">
                <div style="width: 20%; margin: auto;  font-size: 3em;">
                    <span> <i class="fas fa-exclamation-circle"></i></span>
                </div>
                <div style="width: 77%; margin: auto; text-align: center;">
                    <span>¿Está seguro de reportar este accidente? </span> 
                </div>
            </div>
        </div>
             
                      
        </main>
        
    <%@include file="/resources/include/sidebarCliente.jsp" %>
    
    <%@include file="/resources/include/footer.html" %>

    <script>
    
    var id_empleado = 1;
    
   function concatenar() {
        var txt1 = $("#totalEmpleados").val();
        var nombre = $("#nombreEmpleado").val();
        var rut = $("#rutEmpleado").val();
        var contrato = $("#tipoContrato").val();

        if (nombre != "" && rut != "" && contrato != null) {
            $("#totalEmpleados").val(txt1 + "#" + id_empleado + " " + nombre + ", RUT(" + rut + "), CONTRATO(" + contrato + ")" + "\n");
            id_empleado += 1;
            $("#nombreEmpleado").val("");
            $("#rutEmpleado").val("");
            $("#tipoContrato").val("");
        }

    }

    function borrarTodo() {
        $("#totalEmpleados").val("");
        id_empleado = 1;
    }

    function borrarUltimo() {
        var removeval = $("#totalEmpleados").val();
        removeval = removeval.trim();
        var n = removeval.split("\n");
        delete n[(n.length) - 1];
        var newval = n.join('\n');
        $("#totalEmpleados").val(newval);
        id_empleado = id_empleado - 1;
    }

    var searchInput = 'search_input';
    $(document).ready(function () {
        var autocomplete;
        
        autocomplete = new google.maps.places.Autocomplete((document.getElementById(searchInput)),{
            types: ['geocode'],
            componentRestrictions: {
                country: "CHL"
            }
        });
        
 
        $( "#dialog3" ).dialog({
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
             
		  $('.formContacto').on('submit', function(e){
			  var form = $(this);
			  var textAreaEmpleados =  $("#totalEmpleados").val();
		         if(textAreaEmpleados == "") {
		         e.preventDefault();
		         $("#dialog3").dialog("open");
		         } else {
		        	 e.preventDefault();
		        	 $( "#dialog4" ).dialog({
		                 closeText: "",
		                 modal: true,
		                 autoOpen: true,
		                 draggable: false,
		                 resizable: false,
		                 minHeight: 0,
		                 dialogClass: "chica",
		                 buttons: {
		                     "Registrar": function () {
		                    	 $(form).submit;
		                     },
		                     "Cancelar": function () {
		                         $(this).dialog("close");
		                     }
		                 }
		        	 });
		         }
		  });
        
       

    });
           
    </script>



<script src="<c:url value="/resources/js/sidebar.js" />" ></script>
 <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyAPBIgxJbDYk4SGlKjlv7CE_XinnfRkCqA"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>
<script src="<c:url value="/resources/js/modalLogout.js" />" ></script>

</body>
</html>