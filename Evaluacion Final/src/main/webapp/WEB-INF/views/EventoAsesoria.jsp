<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Agendar Asesor�a</title>

<!-- Tipos Font -->
<script src="https://kit.fontawesome.com/14907c5069.js"
	crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
	rel="stylesheet">
  
<!-- Busqueda direccion -->

 
<!-- Manejo flex -->
<style>
@media only screen and (min-width: 800px) {
	#uno {
		order: 0;
	}
	#dos {
		order: 2;
	}
	#tres {
		order: 1;
	}
	#cuatro {
		order: 3;
	}
	#cinco {
		order: 4;
	}
	#seis {
		order: 5;
	}
}
</style>
<body>

	<form:form
		action="${pageContext.request.contextPath}/Profesional/crearEventoAsesoria.html" method="POST" class="formContacto">
		
		<span>Fecha Asesor�a:</span>
		<br>
		<form:input  type="date" path="fecha_evento" required="true"/> 
		<br>
		
		<span>Hora Asesor�a:</span>
		<br>
		<form:textarea path="hora_evento" class="detalleTA" rows="1" placeholder="Ingrese hora de la asesor�a" required="true" />
		<br>
		
		<span>Direcci�n:</span>
		<br>	
		<form:input id="search_input" path="lugar.direccion"   placeholder="Ingresa la direcci�n" required="true"/>
		<form:input type="hidden"  path="lugar.latitud" id="loc_lat" />
		<form:input type="hidden"  path="lugar.longitud" id="loc_long"/>
		
		<form:input type="hidden" value="${idAsesoria}" path="asesoria.id_asesoria" />
		
		<form:input type="hidden" value="${id_profesional}" path="asesoria.actividad.profesional.id_profesional" />
	
		<button type="submit" class="btnForm">Agendar Asesor�a</button>
	</form:form>



<script>

var searchInput = 'search_input';
var lat_cliente = null;
var long_cliente = null;

$(document).ready(function () {
	
	$(window).keydown(function(event){
	    if(event.keyCode == 13) {
	      event.preventDefault();
	      return false;
	    }
	  });

var autocomplete;
autocomplete = new google.maps.places.Autocomplete((document.getElementById(searchInput)), {
    types: ['geocode'],
    componentRestrictions: {
        country: "CHL"
    }
	});

google.maps.event.addListener(autocomplete, 'place_changed', function () {
    var near_place = autocomplete.getPlace();
    document.getElementById('loc_lat').value = near_place.geometry.location.lat();
    document.getElementById('loc_long').value = near_place.geometry.location.lng();

	});

$(document).on('change', '#' + searchInput, function () {
    document.getElementById('latitude_input').value = '';
    document.getElementById('longitude_input').value = '';

	});

});
</script>



</body>
</html>

