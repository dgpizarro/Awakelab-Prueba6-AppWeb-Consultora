<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Detalle Capacitación</title>
<!-- Tipos Font -->
<script src="https://kit.fontawesome.com/14907c5069.js"
	crossorigin="anonymous"></script>
<!-- Mapa -->	
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyAPBIgxJbDYk4SGlKjlv7CE_XinnfRkCqA"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAPBIgxJbDYk4SGlKjlv7CE_XinnfRkCqA&callback=initMap"></script>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap" rel="stylesheet">
<style>
.maestro {
	font-family: 'Montserrat';
	display: flex;
	flex-flow: row wrap;
	color: rgb(92, 92, 92);
}

.subMaestro {
	display: flex;
	flex-flow: row wrap;
	width: 100%;
	box-shadow: 0 4px 2px -2px gray;
	border-bottom: 1px solid rgb(9, 83, 219);
	margin-bottom: 1em;
	font-size: 0.8em;
}

.subMaestro p, .detalleModal p {
	margin: 0.25em 0 0.25em 0;
}

.tituloModalMensaje {
	width: 100%;
	box-shadow: 0 4px 2px -2px gray;
	border-bottom: 3px solid rgb(9, 83, 219);
	font-size: small;
}

.tituloModalMensaje h2 {
	font-size: 1em;
	margin-bottom: 0.8em;
}

.subModal {
	width: 100%;
}

.fechaModal {
	width: 100%;
}

.detalleModal {
	width: 100%;
	text-align: justify;
	font-size: 0.8em;
}

@media only screen and (min-width: 600px) {
	.subModal {
		width: 70%;
	}
	.fechaModal {
		width: 30%;
	}
	.subMaestro p, .detalleModal p {
		margin: 0.5em 0 0.5em 0;
		font-size: 1.25em;
	}
	.tituloModalMensaje h2 {
		font-size: 1.2em;
	}
	
    #Mapa {
  	height: 250px;
  	width: 100%;
  	box-shadow: 0 4px 2px -2px gray;
	margin: 1em 0;
    }
}
</style>
</head>
<body>
	<div class="maestro">

		<div class="tituloModalMensaje">
			<h2>
				Asunto:  <c:out value="${capacitacion.getEvento().getAsunto()}" />
			</h2>
		</div>
		<div class="subMaestro">
			<div class="subModal">
    
				<p> <b> Cliente: <c:out value="${capacitacion.getEvento().getActividad().getCliente().getUsuario().getNombre()}" /> 
				</b></p>
			</div>


		</div>
		<div class="detalleModal">
			<table class="tablaNoDinamica">

				<tr>
					<td>
						<p>
							<b> Fecha Inicio </b>
						</p>
					</td>
					<td>
						<div class="fechaModal">

							<p>
								<fmt:formatDate pattern="dd-MM-yyyy"
									value="${capacitacion.getEvento().getFecha_inicio()}" />

							</p>

						</div>
					</td>
				</tr>

				<tr>
					<td>
						<p>
							<b> Fecha Término </b>
						</p>
					</td>
					<td>
						<div class="fechaModal">

							<p>
								<fmt:formatDate pattern="dd-MM-yyyy"
									value="${capacitacion.getEvento().getFecha_fin()}" />

							</p>

						</div>
					</td>
				</tr>

				<tr>
					<td>
						<p>
							<b> Hora </b>
						</p>
					</td>
					<td>
						<p>
							<c:out value="${capacitacion.getEvento().getHora()}" />
						</p>
					</td>
				</tr>

				<tr>
					<td>
						<p>
							<b> Cumplimiento </b>
						</p>
					</td>
					<td>
						<p>
							<c:out value="${capacitacion.getEvento().getCumplimiento()}" />
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<p>
							<b> Detalles </b>
						</p>
					</td>
					<td>
						<p>
							<c:out value="${capacitacion.getDetalle()}" />
						</p>
					
				<tr>	
					<td>
				<p>
					<b> Lugar: 
					</b>
				</p>
				    </td>
				
				
				  
                    <td>
                <p>
                    <b>  <c:out value="${capacitacion.getEvento().getLugar().getDireccion()}" />
                    </b>
                </p>
                    </td>
                </tr>

			</table>
			<input type="hidden" id="latitud" value="${lugar.getLatitud()}" />
			<input type="hidden" id="longitud" value="${lugar.getLongitud()}" />
			<input type="hidden" id="direccion" value="${capacitacion.getEvento().getLugar().getDireccion()}"/>
             <div class="col-md-12 col-sm-12" id="Mapa"></div>
		</div>

	</div>
	<script>
		
		var direc = document.getElementById("direccion").value;
		var lat_cliente = document.getElementById("latitud").value;
         var long_cliente = document.getElementById("longitud").value;
        

     function initMap() {
         
	
    	 map = new google.maps.Map(document.getElementById('Mapa'), {
             center : {lat : parseFloat(lat_cliente), lng : parseFloat(long_cliente)},
             zoom : 13,
         });

         var marker = new google.maps.Marker({
             position : {lat : parseFloat(lat_cliente), lng : parseFloat(long_cliente)},
             map : map,
             title : direc
         });
         
         function deleteMarkers() {
               clearMarkers();
               markers = [];
             }
      }
 
	</script>
</body>
</html>