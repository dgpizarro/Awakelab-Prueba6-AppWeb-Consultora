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
<title>Edición Cliente</title>
<!-- Tipos Font -->
    <script src="https://kit.fontawesome.com/14907c5069.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Righteous&display=swap"
        rel="stylesheet">
<style>
         .#formEditCl {padding: 1em 0;}   
        #contMax {display: flex; width: 100%; flex-flow: row wrap;}
        .contMin {width: 100%; }
        
        @media only screen and (min-width: 800px) {
            #uno{order: 0;}
            #dos{order: 2;}
            #tres{order: 1;}
            #cuatro{order: 3;}
            #cinco{order: 4;}
            #seis{order: 5;}
           #formEditCl { width:95% !important;}
            .contMin {width: 50%; padding: 0.2em;}
            
        
        }
</style>
</head>
	<body>
	
	   <div class="mensajeEdit" style="width:95%; margin: 0 2.5%;">
	       <div class="separadorForm"><p> Solicitudes de Actualización </p></div>
	           
	          
                        <table class="tablaNoDinamica" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Fecha</th>
                                    <th>Solicitud</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="s" items="${lista}">
                                    <tr>
                                        <td><fmt:formatDate pattern="dd-MM-yyyy" value="${s.getFecha()}" /></td>
                                        <td><c:out value="${s.getDetalle()}" /></td>                         
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
              
	       <div class="separadorForm"></div>
	   </div>
	   
	   
	   
	   <div class="formEdit">
	   
	        <form:form action="${pageContext.request.contextPath}/Admin/editarCliente.html" method="POST" class="formContacto" id="formEditCl" >
                    <form:input type="hidden" path="id_cliente" />
                    <form:input type="hidden" path="usuario.id_usuario" />
                    <span>Nombre empresa</span>
                    <br>
                    <form:input path="usuario.nombre" />
                    <br>
            
                    <span>Rut</span>
                    <br>
                    <form:input path="rut"/>
                    <br>
            
                    <span>Dirección</span>
                    <br>
                    <form:input path="direccion" id="search_input"/>
                    <br>  
                           
                    <div id="contMax">
                            <div class="contMin">
                                <span> Representante Legal</span> 
                                <br>
                                <form:input path="representante_legal"/> 
                                <br>
                           </div>
                           <div class="contMin">
                                <span> Rubro</span> 
                                <br>
                                <form:input path="rubro"/> 
                                <br>   
                            </div>    
                            <div class="contMin"> 
                                <span> Número empleados</span> 
                                <br>
                                 <form:input path="numero_empleados"/> 
                                <br>
                             </div>   
                             <div class="contMin">
                                <span> Plan base (UF)</span> 
                                <br>
                                <form:input path="plan_base"/>  
                                <br>
                             </div>
                    </div>
                    
                    <span>Mutualidad</span>
                    <br>
                         <form:select path="mutualidad" >
                            <form:option value="ACHS, Asociación Chilena de Seguridad">ACHS, Asociación Chilena de Seguridad</form:option>
                            <form:option value="ISL, Instituto de Seguridad Laboral">ISL, Instituto de Seguridad Laboral</form:option>
                            <form:option value="IST, Instituto de Seguridad del trabajo">IST, Instituto de Seguridad del trabajo</form:option>
                            <form:option value="Mutual de Seguridad CChC">Mutual de Seguridad de la Cámara Chilena de la Construcción</form:option>
                        </form:select>
                    <br>
            
                    <div class="separadorForm"><p> Contacto </p></div>
                 
                    <span>Delegado</span>
                    <br>
                    <form:input path="delegado"/> 
                    <br>
                    
                    <div id="contMax">
                           
                         <div class="contMin">
                        <span> Email delegado</span> 
                        <br>
                         <form:input path="email_delegado"/>
                        <br>
                        </div>
                        
                        <div class="contMin">
                        <span> Teléfono</span> 
                        <br>
                        <form:input path="telefono"/>  
                        <br>
                        </div>
                    </div>                
                   
                    <div class="separadorForm"><p> Estado </p></div>
                         <form:select path="estado" >
                            <form:option value="Vigente">Vigente</form:option>
                            <form:option value="Sin contrato">Sin contrato</form:option>
                        </form:select>
                    <br>    
                        
                    
                    <br><button type="submit" class="btnForm">Actualizar</button><br>  
                </form:form>
       
       </div>
	  

	
	</body>
</html>