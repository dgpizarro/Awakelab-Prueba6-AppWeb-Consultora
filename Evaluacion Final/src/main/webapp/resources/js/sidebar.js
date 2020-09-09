function mostrar() {
    document.getElementById("sidebar").style.width = "225px";
    document.getElementById("contenido").style.marginLeft = "225px";
    document.getElementById("footer1").style.marginLeft = "225px"; 
    document.getElementById("menu-movil").style.marginLeft = "237px";
    document.getElementById("cabecerafija2").style.marginLeft = "225px";
    document.getElementById("menu2").style.display = "none";
   
}

function ocultar() {
    document.getElementById("sidebar").style.width = "0";
    document.getElementById("contenido").style.marginLeft = "0";
    document.getElementById("footer1").style.marginLeft = "0";
    document.getElementById("menu-movil").style.marginLeft = "1em";
    document.getElementById("cabecerafija2").style.marginLeft = "0";
    document.getElementById("menu2").style.display = "inline";
    
}


function ocultaLateral(x) {
    if (x.matches) { // If media query matches
        document.getElementById("menu-movil").style.display = "inline";
        document.getElementById("menu-largo").style.display = "none";
    } else {
        document.getElementById("menu-movil").style.display = "none";
        document.getElementById("menu-largo").style.display = "inline";
        
    }
}

var x = window.matchMedia("(max-width: 760px)")
ocultaLateral(x);
x.addListener(ocultaLateral);