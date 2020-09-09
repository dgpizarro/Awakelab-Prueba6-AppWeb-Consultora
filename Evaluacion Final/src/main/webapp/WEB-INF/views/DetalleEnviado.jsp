<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Detalle Enviado</title>
<link
    href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
    rel="stylesheet">
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

.remitenteModal {
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
    .remitenteModal {
        width: 70%;
    }
    .fechaModal {
        width: 30%;
        text-align: right;
    }
    .subMaestro p, .detalleModal p {
        margin: 1em 0 1em 0;
        font-size: 1.25em;
    }
    .tituloModalMensaje h2 {
        font-size: 1.5em;
        
    }
}
</style>
</head>
<body>
    <div class="maestro">
        <div class="tituloModalMensaje">
            <h2>
                <c:out value="${mensaje.getAsunto()}" />
            </h2>
        </div>
        <div class="subMaestro">
            <div class="remitenteModal">
                <b>
                    <p>
                        Para:
                        <c:out value="${mensaje.getDestinatario().getNombre()}" /> , <c:out value="${profesion}" />
                    </p>
                </b>
                <p></p>
            </div>
            <div class="fechaModal">
                <b>
                    <p>
                        <fmt:formatDate pattern="dd-MM-yyyy" value="${mensaje.getFecha()}" />
                    </p>
                </b>
            </div>
        </div>

        <div class="detalleModal">
            <p>
                <c:out value="${mensaje.getDetalle()}" />
            </p>
        </div>
    </div>
</body>
</html>