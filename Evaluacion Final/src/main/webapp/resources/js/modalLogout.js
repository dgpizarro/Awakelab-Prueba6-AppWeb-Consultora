
$(document).ready(function () {

    $("#btnSalir").on("click", function (event) {
      
        var $self = $(this);

              event.preventDefault();

            $("<div />").text("\u00BFEst\u00E1 seguro que desea abandonar la sesi\u00F3n?").dialog({
                closeText: "",
                modal: true,
                autoOpen: true,
                draggable: false,
                resizable: false,
                minHeight: 0,
                dialogClass: "chica",
                title: "Confirmaci\u00F3n",
                buttons: {
                    "Salir": function () {
                        window.location.href = $self.attr('href');
                    },
                    "Cancelar": function () {
                        $(this).dialog("close");
                    }
                }
            });

        

    });

});