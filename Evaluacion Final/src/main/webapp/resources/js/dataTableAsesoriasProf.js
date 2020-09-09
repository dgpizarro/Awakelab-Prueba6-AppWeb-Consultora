$(document).ready(function() {
    $('#tabla1').DataTable({
        responsive: true,
        "order": [[ 1, "desc" ]],
        "columnDefs": [ {
            "targets": 5,
            "orderable": false
          },
            { "width": "5%", "targets": 0 }
           ],
        "language" : {"url" : "https://cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
                      }
    });
    
  $('#contenedor1').css("width", "100%");
  $('#contenedor1').css("margin", "0");
  $('#contenedor1').css("background-color","rgb(255, 255, 255)");
  $('#contenedor1').css("font-size", "0.9em");
          
  });