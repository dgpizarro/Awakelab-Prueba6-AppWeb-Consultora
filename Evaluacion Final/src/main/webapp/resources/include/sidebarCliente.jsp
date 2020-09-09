<meta charset="ISO-8859-1">

<div id="sidebar" class="sidebar">
        <a href="#" class="boton-cerrar" onclick="ocultar()"><i class="far fa-times-circle"></i></a>
        <ul class="menu">
        
            	<li>
                        <a href="${pageContext.request.contextPath}/Cliente/registrarNuevoAccidente.html" class="ReporAcc">
                            <span>Reportar Accidente</span>
                        </a>
                    </li>
            	 <li>
                        <a href="${pageContext.request.contextPath}/Cliente/irMensajesCliente.html" class="Preferencias">
                            <span>Mensajes</span>
                        </a>
                 </li>
                 <li>
                        <a href="${pageContext.request.contextPath}/Cliente/listarAccidentes/${id_cliente}.html" class="AccRepor">
                            <span>Registro Accidentes</span>
                        </a>
                 </li>
            	<li>
                        <a href="${pageContext.request.contextPath}/Cliente/irServicios/${id_cliente}.html" >
                            <span>Servicios</span>
                        </a>
                </li>
                 <li>
                        <a href="#.html" class="Preferencias">
                            <span>Pagos</span>
                        </a>
                 </li>
                 <li>
                        <a href="#.html" class="Preferencias">
                            <span>Informes</span>
                        </a>
                 </li>
                  <li>
                        <a href="${pageContext.request.contextPath}/Cliente/miCuenta/${id_cliente}.html" >
                            <span>Mi Cuenta</span>
                        </a>
                    </li>
        </ul>
</div> 