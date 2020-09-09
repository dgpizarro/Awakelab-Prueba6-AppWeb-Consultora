<meta charset="ISO-8859-1">

 <header id="header1">
        <div id="cabecerafija2">
            <div class="logo">
            </div>
            <div class="titulo-cabecera-fija">
                <div id="tituloHI">
                    <span>NMD</span>
                </div>
                <div id="tituloSubHI">
                     <span>Portal Cliente: &nbsp; ${empresa}, &nbsp; rut ${rut}.</span>
                    <input type="hidden" name="id_cliente" value="${id_cliente}">
                    <input type="hidden" name="idU_cliente" value="${idU_cliente}">
                </div>
            </div>
            <a id="btnSalir" href="${pageContext.request.contextPath}/Cliente/logout.html"> <button type="submit" id="out"><i class="fas fa-power-off"></i></button> </a>
        </div>
        
        <nav class="menu-desktop" id="menu-movil">
                <ul>
                     <li>
                        <a id="menu2" class="abrir-cerrar" href="javascript:void(0)" onclick="mostrar()">
                            <span><i class="fas fa-bars"></i></span>
                        </a>
                    </li>
                     <li>
                        <a href="${pageContext.request.contextPath}/Cliente/home.html" class="homeCliente">
                            <span>Mi resumen</span>
                        </a>
                </ul>
            </nav>
                
         <nav class="menu-desktop" id="menu-largo">
                <ul>
                     <li>
                        <a href="${pageContext.request.contextPath}/Cliente/home.html" class="homeCliente">
                            <span>Mi resumen</span>
                        </a>
                    </li>
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
            </nav>
    </header>