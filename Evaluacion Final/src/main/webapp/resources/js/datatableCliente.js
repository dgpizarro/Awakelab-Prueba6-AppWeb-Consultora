$(document).ready(function() {
    $('#tabla1').DataTable({
        responsive: true,
        "columnDefs": [ {
            "targets": 5,
            "orderable": false,
            "searchable": false
          } ],
        
        
        "language" : {"url" : "https://cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
                      }
    });
    
  $('#contenedor1').css("width", "100%");
  $('#contenedor1').css("margin", "0");
  $('#contenedor1').css("background-color","rgb(255, 255, 255)");
  $('#contenedor1').css("font-size", "0.9em");
          
  });
  