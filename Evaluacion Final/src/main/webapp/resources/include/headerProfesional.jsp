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
                     <span>Portal Profesional: &nbsp; ${nombre}, &nbsp; rut ${rut}.</span>
                    <input type="hidden"  value="${id_profesional}">
                    <input type="hidden"  value="${idU_profesional}">
                </div>
            </div>
            <a id="btnSalir" href="${pageContext.request.contextPath}/Profesional/logout.html"> <button type="submit" id="out"><i class="fas fa-power-off"></i></button> </a>
        </div>
        
        <nav class="menu-desktop" id="menu-movil">
                <ul>
                     <li>
                        <a id="menu2" class="abrir-cerrar" href="javascript:void(0)" onclick="mostrar()">
                            <span><i class="fas fa-bars"></i></span>
                        </a>
                    </li>
                     <li>
                        <a href="${pageContext.request.contextPath}/Profesional/home.html" class="homeProfesional">
                            <span>Mi resumen</span>
                        </a>
                </ul>
            </nav>
                
         <nav class="menu-desktop" id="menu-largo">
                <ul>
                     <li>
                        <a href="${pageContext.request.contextPath}/Profesional/home.html" class="homeProfesional">
                            <span>Mi resumen</span>
                        </a>
                    </li>
                     <li>
                        <a href="${pageContext.request.contextPath}/Profesional/irMensajesAdmin/${idU_profesional}.html">
                            <span>Mensajes</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/Profesional/irGestionVisitas/${id_profesional}.html" >
                            <span>Visitas</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/Profesional/gestionAsesorias/${id_profesional}.html" >
                            <span>Asesorías</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/Profesional/gestionCapacitaciones/${id_profesional}.html">
                            <span>Capacitaciones</span>
                        </a>
                    </li>
                      
                     <li>
                        <a href="${pageContext.request.contextPath}/Profesional/checklist/${id_profesional}.html">
                            <span>CheckList</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/Profesional/miCuenta/${id_profesional}.html">
                            <span>Mi cuenta</span>
                        </a>
                    </li>
                    
                </ul>
            </nav>
    </header>