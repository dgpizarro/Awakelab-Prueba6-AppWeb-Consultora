<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Detalle Cliente</title>
<!-- Tipos Font -->
    <script src="https://kit.fontawesome.com/14907c5069.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
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
        text-align: right;
    }
    .subMaestro p, .detalleModal p {
       font-size: 1.25em;
    }
    .tituloModalMensaje h2 {
        font-size: 1.2em;
        
    }
}
</style>
</head>


<body>
    <div class="maestro">
        <div class="tituloModalMensaje">
            <h2>
                <c:out value="${cliente.getUsuario().getNombre()}" />
            </h2>
        </div>
        <div class="subMaestro">
            <div class="subModal">
                    <p> <b>
                        Contacto:
                        <c:out value="${cliente.getDelegado()}" />
                    </b></p>
               
                    <p> Email: <c:out value="${cliente.getEmail_delegado()}" /> </p>
            </div>
            <div class="fechaModal">
                
                    <p>  Teléfono: <c:out value="${cliente.getTelefono()}" /></p> 
                
            </div>
        </div>

        <div class="detalleModal">
            <table class="tablaNoDinamica" >
            <tr> 
                <td>  <p> <b> Rut  </b> </p> 
                 </td>
                 <td> <p> <c:out value="${cliente.getRut()}" /> </p> 
                 </td>
            </tr>
            <tr> 
                <td> <p> <b> Dirección </b></p>  
                 </td>
                 <td> <p><c:out value="${cliente.getDireccion()}" /> </p>  
                 </td>
            </tr>
            <tr> 
                <td> <p> <b> Representante Legal  </b> </p> 
                 </td>
                 <td> <p><c:out value="${cliente.getRepresentante_legal()}" /> </p> 
                 </td>
            </tr>
            <tr> 
                <td> <p> <b> Rubro  </b> </p> 
                 </td>
                 <td> <p><c:out value="${cliente.getRubro()}" /> </p> 
                 </td>
            </tr>
            <tr> 
                <td> <p> <b> Mutualidad  </b> </p> 
                 </td>
                 <td> <p><c:out value="${cliente.getMutualidad()}" /> </p> 
                 </td>
            </tr>
            <tr> 
                <td> <p> <b> Número empleados </b> </p> 
                 </td>
                 <td> <p><c:out value="${cliente.getNumero_empleados()}" /> </p> 
                 </td>
            </tr>
            <tr> 
                <td> <p> <b> Plan Base (UF)  </b> </p> 
                 </td>
                 <td> <p><c:out value="${cliente.getPlan_base()}" /> </p> 
                 </td>
              </tr>
                <tr> 
                <td> <p> <b> Fecha registro  </b> </p> 
                 </td>
                 <td> <p><fmt:formatDate pattern="dd-MM-yyyy" value="${registro}" /></p> 
                 </td>
            </tr>
           
                <tr> 
                <td> <p> <b> Estado  </b> </p> 
                 </td>
                 <td> <p><c:out value="${cliente.getEstado()}" /> </p> 
                 </td>
            </tr>
            
            </table>
        
            
        </div>
    </div>
</body>


</html>