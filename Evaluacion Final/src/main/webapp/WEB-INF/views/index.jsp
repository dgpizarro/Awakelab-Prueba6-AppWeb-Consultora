<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<!-- Tipos Font -->
<script src="https://kit.fontawesome.com/14907c5069.js"
    crossorigin="anonymous"></script>
<link
    href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
    rel="stylesheet">
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Estilo Dialog -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<!-- Etilo CSS -->  
<link href="<c:url value="/resources/css/estilo_login.css" />" rel="stylesheet">
</head>
<body>

    <header>
        <div id="tituloLogin">
             <h1> NMD Consulting </h1>
        </div>
        <div id="sloganLogin">
            <h2>Velamos por la seguridad de sus colaboradores</h2>
        </div>
    </header>

    <main>
    
     <input id="alerta" type="hidden" value="${error}">
     
    <div class="login-box">
        <div class="tituloPermiso"> 
          <p>Acceso</p>
        </div>
	        <form class="log" name='loginForm' action="login" method='POST'>
	        
	           <input type="text" name='username' placeholder="Usuario" required>
                <br> 
                <input type="password" name='password' placeholder="Contraseña" required> 
                <div class="granBtnLogin"> 
                <div class="botonesLogin"> <input class="boton" name="reset" type="reset" value="Borrar">  </div>
                <div class="botonesLogin">  <input class="boton" name="submit" type="submit" value="Ingresar"> </div>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                
	        </form>
         </div>
      
       
     <div id="dialog3" style="display: none;" >
       <div style="display:flex; ">
            <div style="width: 20%; margin: auto;  font-size: 3em;">
                <span> <i class="fas fa-exclamation-circle"></i></span>
            </div>
            <div style="width: 77%; margin: auto; text-align: center;">
                <span>¡Credenciales incorrectas!</span>
            </div>
        </div>
   </div>
   
   
</main>

  

 <footer>
            <div class="copy"> Consultora NMD Ltda. <i class="far fa-copyright"></i></div>
            <div class="fono"> Llámenos al 800 700 8000 </div>
            <div class="rrss"> <i class="fab fa-facebook"></i> ConsultoraNMD</div>
            <div class="rrss"> <i class="fab fa-twitter"></i> @NMDChile</div>
            <div class="rrss"> <i class="fab fa-instagram"></i> @ConsultoraNMD</div>
</footer>

<script type="text/javascript">

$(document).ready(function () {
     var alerta = $("#alerta").val();
     $("#dialog3").css('display','block');  
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
 if (alerta === "true") {
      $("#dialog3").dialog("open");
 }
    
});
</script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>

</body>
</html>