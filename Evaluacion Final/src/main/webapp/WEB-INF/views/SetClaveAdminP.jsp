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
<title>Set Clave</title>
<!-- Tipos Font -->
    <script src="https://kit.fontawesome.com/14907c5069.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
        rel="stylesheet">
<style>      
       #nuevaKey{
            display: none;
        }
        #formSetKey{
            width:100% !important;
            padding: 0 !important;
        }
        #btnClave{
             width:75% !important;
             margin: 0 12.5% !important;
        }
</style>
</head>
<body>
       
       <div class="formEdit">
       
            <form:form action="${pageContext.request.contextPath}/Admin/cambioContrasenaP.html" method="POST" class="formContacto" id="formSetKey"  >
                    <form:input type="hidden" path="id_usuario" value="${id_us}" />
                    <div class="separadorForm"><p> Cambio contraseña profesional ID: ${id_pl} </p></div>
                 
                        <div class="divideRegistro">             
                            <form:radiobutton  path="contrasena" name="tipo" value="1234" checked="checked" /> Por defecto (1234) <br>
                            <form:radiobutton  id="otraKey" path="contrasena" value="" name="tipo" /> Otra <br>
                        </div>
                        <input id="nuevaKey" onkeyup="concatenar2();" maxlength="6" >
                    
                    <br><button type="submit" id="btnClave" class="btnForm">Guardar contraseña</button><br>  
                </form:form>
       
       </div>

<script type="text/javascript">

$("input[type=radio]").click(function(event){
    var valor = $(event.target).val();
    if(valor ==""){
        $("#nuevaKey").css("display","inherit");
    } else {
        $("#nuevaKey").css("display","none");
        $("#otraKey").val("");
        $("#nuevaKey").val("");
    } 
});

function concatenar2() {
    $("#otraKey").val($("#nuevaKey").val());
    var otro =  $("#otraKey").val();
    console.log(otro);
}

</script>
</body>
</html>