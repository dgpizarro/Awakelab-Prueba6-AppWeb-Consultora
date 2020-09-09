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
<title>Detalle Capacitación</title>
<!-- Tipos Font -->
<script src="https://kit.fontawesome.com/14907c5069.js"
    crossorigin="anonymous"></script>
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
     .subMaestro p, .detalleModal p {
        margin: 0.5em 0 0.5em 0;
        font-size: 1.25em;
    }
    .tituloModalMensaje h2 {
        font-size: 1.2em;
    }
    .formContacto{
        width: 100% !important;
    }
    
}
</style>
</head>
<body>
    <div class="maestro">

        <div class="subMaestro">
            <div class="subModal">
                <p> <b> Asunto capacitación:  <c:out value="${capacitacion.getEvento().getAsunto()}" /></b>                
                </p>
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
                            <b> Lugar </b>
                        </p>
                    </td>
                    <td>
                        <p>
                           <c:out value="${capacitacion.getEvento().getLugar().getDireccion()}" />
                        </p>
                    </td>
                </tr>   
                
                 <tr>
                    <td>
                        <p>
                            <b> ¿Cumplió el profesional? </b>
                        </p>
                    </td>
                    <td>
                    <form:form action="${pageContext.request.contextPath}/Cliente/cumplimientoCapacitacion/${id_cl}.html" method="POST" class="formContacto" >
		                    <form:input type="hidden" path="evento.id_evento" />
                                <form:select path="evento.cumplimiento" >
		                            <form:option value="F">No</form:option>
		                            <form:option value="T">Sí</form:option>
                                 </form:select>
		                    <br><button type="submit" id="btnClave" class="btnForm">Informar</button><br>  
                    </form:form>
                    </td>
                </tr>        
                
        </table>
        
    </div>
      </div>
   
</body>
</html>