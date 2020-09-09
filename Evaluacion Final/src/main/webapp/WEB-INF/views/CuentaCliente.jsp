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
<title>Mi Cuenta</title>
<!-- Tipos Font -->
    <script src="https://kit.fontawesome.com/14907c5069.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
        rel="stylesheet">
 <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Select2 -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
<!-- Estilo Dialog -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<!-- Etilo CSS General -->  
    <link href="<c:url value="/resources/css/estilo_general.css" />" rel="stylesheet">
<!-- Manejo flex -->
    <style>
           
        .formTabla {display: none;} 
        .formOculto {display: inherit;}    
        @media only screen and (min-width: 800px) {
            #uno{order: 0;}
            #dos{order: 2;}
            #tres{order: 1;}
            #cuatro{order: 3;}
            #cinco{order: 4;}
            #seis{order: 5;}
            .formContacto { width:94% !important;}
            .formTabla {display: inherit;}   
            .formOculto {display: none;}   
            
            table {
		    width: 100%;
		    border-spacing: 0;
		    }
		
		    td {
		    border-right: none;
		    padding: 0.3em 0.8em 0.3em 0;
		    text-align: left;
		    }    
        }
        
        #nuevoMotivo{
            display: none;
        }
        
    </style>  
</head>
<body>

<%@include file="/resources/include/headerCliente.jsp" %>

<main id="contenido">

     <input id="alerta" type="hidden" value="${open}">

            <div class="col-5 titulo-pag" id="uno">
                <p>Mis datos</p>
            </div>
            
            <div class="col-5 cont-text-pag" id="dos">
            
			     <form class="formContacto" >
			        <span>Nombre empresa</span>
			        <br>
			        <input type="text" value="${cliente.getUsuario().getNombre()}" readonly>
			        <br>
			
			        <span>Rut</span>
			        <br>
			        <input type="text" value="${cliente.getRut()}" readonly>
			        <br>
			
			        <span>Dirección</span>
			        <br>
			        <input type="text" value="${cliente.getDireccion()}" readonly>
			        <br>
			        
			        <div class="formTabla">
			        <table>
		                <tr>
		                <td> <span> Representante Legal</span> </td>
		                <td> <span> Rubro</span> </td>
		                </tr>
		                
		                <tr>
		                <td>  <input type="text" value="${cliente.getRepresentante_legal()}" readonly> </td>
		                <td>  <input type="text" value="${cliente.getRubro()}" readonly>  </td>
		                </tr>
		                
		                <tr>
                        <td> <span> Número empleados</span> </td>
                        <td> <span> Mutualidad</span> </td>
                        </tr>
                        
                        <tr>
                        <td>  <input type="text" value="${cliente.getNumero_empleados()}" readonly> </td>
                        <td> <input type="text" value="${cliente.getMutualidad()}" readonly>  </td>
                        </tr>
		                
		              </table>
		          </div>
		          
		          <div class="formOculto">
			
			        <span>Representante Legal</span>
			        <br>
			        <input type="text" value="${cliente.getRepresentante_legal()}" readonly>
			        <br>
			
			        <span>Rubro</span>
			        <br>
			        <input type="text" value="${cliente.getRubro()}" readonly>
			        <br>
			
			         <span>Número empleados</span>
                    <br>
                    <input type="text" value="${cliente.getNumero_empleados()}" readonly>
                    <br>
                    
			        <span>Mutualidad</span>
			        <br>
			        <input type="text" value="${cliente.getMutualidad()}" readonly>
			        <br>
			     </div>
			
			     <div class="separadorForm"><p> Contacto </p></div>
			     
			      <div class="formTabla">
			         
			         <span>Delegado</span>
                    <br>
                    <input type="text" value="${cliente.getDelegado()}" readonly>
                    <br>
			      
                    <table>
                        <tr>
                        <td> <span> Email delegado</span> </td>
                        <td> <span> Teléfono</span> </td>
                        </tr>
                        
                        <tr>
                        <td>   <input type="text" value="${cliente.getEmail_delegado()}" readonly> </td>
                        <td>  <input type="text" value="${cliente.getTelefono()}" readonly>  </td>
                        </tr>
                     </table>
                  </div>
			       
			     <div class="formOculto">
			         <span>Delegado</span>
                    <br>
                    <input type="text" value="${cliente.getDelegado()}" readonly>
                    <br>
			     
			        <span>Email delegado</span>
			        <br>
			        <input type="text" value="${cliente.getEmail_delegado()}" readonly>
			        <br>
			
			        <span>Teléfono</span>
			        <br>
			        <input type="text" value="${cliente.getTelefono()}" readonly>
			        <br>
			     </div>
			        
			    </form>
            
            </div>
            
            <div class="col-6 titulo-pag" id="tres">
                <p>Preferencias</p>
            </div>
            
            <div class="col-6 cont-text-pag" id="cuatro">
            
            <div class="separadorForm" ><p> Cambiar contraseña </p></div>
            
             <form:form action="${pageContext.request.contextPath}/Cliente/cambioContrasena/${id_cliente}.html" class="formContacto"  name="validaClave" method="POST">
                <form:input  type= "hidden" path="id_usuario" value="${idU_cliente}"/> 
                <br>
                <input  name="clave1" type="password" id="clave1" placeholder="Ingrese nueva contraseña" >
                <br>
                <form:input  path="contrasena" type="password" placeholder="Reingrese nueva contraseña" />
                <br> 
                <div id="validadorClave" ></div>
                <button type="submit" class="btnForm">Validar</button>             
            </form:form>
            <br> 
            <br> 
         
            <div class="separadorForm" >  <a class="modal" href="${pageContext.request.contextPath}/Cliente/actualizarInfoCliente.html"> <p><i class="far fa-hand-point-up"></i> Solicitar actualizar datos </p></a></div>
            
             </div>
             
    <div id="dialog" style="display: none;" >
   </div>
             
    <div id="dialog2" style="display: none;" >
       <div style="display:flex; ">
            <div style="width: 20%; margin: auto;  font-size: 3em;">
                <span> <i class="far fa-check-circle"></i></span>
            </div>
            <div style="width: 77%; margin: auto; text-align: center;">
                <span>¡Contraseña cambiada correctamente!</span>
            </div>
        </div>
   </div>
   
</main>

<%@include file="/resources/include/sidebarCliente.jsp" %>
    
<%@include file="/resources/include/footer.html" %>

<script> 
<!--Ventana Modal -->
$(document).ready(function () {
    
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
        minHeight: 0,
        dialogClass: "grande",
        closeText: ""
    });
    
        $('body').on("click", '.modal', function(e){
        e.preventDefault();
        $( "#dialog" ).dialog({ title: 'Solicitar actualización datos' });
        $('#dialog').load(this.href).dialog('open');
    });
    
        
    $("#dialog").css('display','block');         
         $("#dialog2").css('display','block');  
         $( "#dialog2" ).dialog({
             closeText: "",  modal: true, autoOpen: false, draggable: false, resizable: false, minHeight: 0,
             dialogClass: "chica",
             buttons: [{ text: "OK",
                 click: function() {
                   $( this ).dialog( "close" ); }}]
     });
        
    var alerta = $("#alerta").val();
    if (alerta === "open") {
        $("#dialog2").dialog("open");
   }
    
    $(function() {
          
          $("form[name='validaClave']").validate({
             rules: {
             clave1: { required: true,  maxlength: 6 },
           contrasena: { required: true,   maxlength: 6, equalTo: "#clave1" }
             },
            messages: {
               clave1: {
                required: "Campo requerido",
                maxlength: "Máximo 6 caracteres permitidos"
              },
              contrasena: {
                  required: "Campo requerido",
                  maxlength: "Máximo 6 caracteres permitidos",
                  equalTo: "Contraseñas no coincidentes"
                },
            },
            submitHandler: function(form) {
              form.submit();
            }
          });
        });    

});
</script>    


<script src="<c:url value="/resources/js/sidebar.js" />" ></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<script src="<c:url value="/resources/js/modalLogout.js" />" ></script>

</body>
</html>