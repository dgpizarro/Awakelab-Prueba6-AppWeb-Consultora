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
                     <span>Portal Administración: &nbsp; ${nombre}.</span>
                    <input type="hidden"  value="${id_usuario}">
                </div>
            </div>
            <a id="btnSalir" href="${pageContext.request.contextPath}/Admin/logout.html"> <button type="submit" id="out"><i class="fas fa-power-off"></i></button> </a>
        </div>
        
        <nav class="menu-desktop" id="menu-movil">
                <ul>
                     <li>
                        <a id="menu2" class="abrir-cerrar" href="javascript:void(0)" onclick="mostrar()">
                            <span><i class="fas fa-bars"></i></span>
                        </a>
                    </li>
                     <li>
                        <a href="${pageContext.request.contextPath}/Admin/home.html" >
                            <span>General</span>
                        </a>
                </ul>
            </nav>
                
         <nav class="menu-desktop" id="menu-largo">
                <ul>
                     <li>
                        <a href="${pageContext.request.contextPath}/Admin/home.html" >
                            <span>General</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/Admin/irMensajesAdmin.html">
                            <span>Mensajes</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/Admin/irGestionCliente.html" >
                            <span>Gestión Cliente</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/Admin/irGestionProfesional.html" >
                            <span>Gestión Profesional</span>
                        </a>
                    </li>
                  
                </ul>
            </nav>
    </header>