<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lista Destinatarios</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
        rel="stylesheet">
 <style>
        html {
            
        }

        table {
           font-family: 'Montserrat';
            width: 100%;
            border-spacing: 0;
        }
        
        th,
        td {
            border-right: none;
            border-bottom: 1px solid rgb(192, 192, 192);
        }

        th,
        td {
            padding: 0.5em;
            text-align: left;
        }
        
        a:hover {
           color: rgb(32, 32, 219);
           font-weight: bold;
        }

        tr:hover {background-color: #ebe8e8;}
</style>
</head>
<body>

     <table>
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Profesión </th>
                <th> </th>
            </tr>
        </thead>
        <tbody>
             <tr>
                <td>Administrador</td>
                <td> ------</td>
                <td style="text-align: center;">
                    <a href="${pageContext.request.contextPath}/Cliente/seleccionarDestinatario/3/Administrador.html" >Seleccionar</a>
                </td>
            </tr>
                <c:forEach var="d" items="${lista}">
                    <tr>
                        <td><c:out value="${d.getUsuario().getNombre()}" /></td>
                        <td><c:out value="${d.getProfesion()}" /></td>
                        <td style="text-align: center;"><a href="${pageContext.request.contextPath}/Cliente/seleccionarDestinatario/${d.getUsuario().getId_usuario()}/${d.getUsuario().getNombre()}.html" >Seleccionar</a></td>
                    </tr>
                </c:forEach>
        </tbody>
    </table>

</body>
</html>