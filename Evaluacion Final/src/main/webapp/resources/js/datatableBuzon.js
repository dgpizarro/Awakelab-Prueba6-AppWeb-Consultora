$(document).ready(function() {
    $('#tabla1').DataTable({
        responsive: true,
        pageLength: 5,
        "bLengthChange": false,
        "order": [[ 0, "desc" ]],
        "columnDefs": [{ targets: 0, render: $.fn.dataTable.render.moment('YYYY-MM-DD','DD-MM-YYYY') },
           {targets: 1, orderable: false}, {targets: 2, orderable: false},  {targets: 0,  sWidth: '24%'}
           ],
        "language" : {"url" : "https://cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
                      }
    });
    
  $('#contenedor1').css("width", "100%");
  $('#contenedor1').css("margin", "0");
  $('#contenedor1').css("background-color","rgb(255, 255, 255)");
  $('#contenedor1').css("font-size", "0.9em");
          
  });