$(document).ready(function () {
    <!--Validación form submit -->
    
    var oculto= $("#oculto").val();
    var alerta = $("#alerta").val();
    
    $("#dialog2").css('display','block');  
        $( "#dialog2" ).dialog({
            closeText: "",
            modal: true,
            autoOpen: false,
            draggable: false,
            resizable: false,
            minHeight: 0,
            dialogClass: "chica",
            buttons: [
              {
                text: "OK",
                click: function() {
                  $( this ).dialog( "close" );
                }
              }
            ]
    });
  $("#dialog3").css('display','block');  
        $( "#dialog3" ).dialog({
            closeText: "",
            modal: true,
            autoOpen: false,
            draggable: false,
            resizable: false,
            minHeight: 0,
            dialogClass: "chica",
            buttons: [
              {
                text: "OK",
                click: function() {
                  $( this ).dialog( "close" );
                }
              }
            ]
    });
    if (alerta === "open") {
         $("#dialog2").dialog("open");
    }
   $('.formContacto').on('submit', function(e){        	
          if(oculto == 0) {
          e.preventDefault();
          $("#dialog3").dialog("open");
          }
   });
    
    <!--Ventana Modal --->
    $("#dialog").css('display','block');  
    $( "#dialog" ).dialog({
        closeText: "",
        autoOpen: false,
        draggable: false,
        resizable: false,
        minHeight: 0,
        dialogClass: "grande",
    });
    $('.modal').click(function(e) {
        e.preventDefault();
        $( "#dialog" ).dialog({ title: 'Lista destinatarios'});
        $('#dialog').load(this.href).dialog('open');
    });
    $('.modal2').click(function(e) {
        e.preventDefault();
        $( "#dialog" ).dialog({ title: 'Nuevo mensaje'});
        $('#dialog').load(this.href).dialog('open');
    });
});