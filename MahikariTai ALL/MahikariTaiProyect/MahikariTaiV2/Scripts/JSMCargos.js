var touchEvent = 'ontouchstart' in window ? 'touchstart' : 'click';
$("#cargoSelect").change(function () {
    var carSelect = $(this).val();
    recargarCargos(carSelect);
});

function recargarCargos(cargo) {
    $.ajax({
        url: getGruposUrl,
        type: "POST",
        data: { cargo: cargo },
        success: function (data) {
            $('#grupoSelect').empty();
            $('#grupoSelect').append('<option value="" disabled selected>Elige Una...</option>');
            $.each(data.grupos, function (index, grupo) {
                $('#grupoSelect').append('<option value="' + grupo + '">' + grupo + '</option>');
            });
            $("#grupoSelect").prop('disabled', false);
        },
        error: function () {
            // Manejar el error en caso de que la llamada AJAX falle
            console.error('Error al obtener Cargos');
        }
    });
}

$("#modalVAñadirCargos").on(touchEvent, 'btn-siCargo', function () {
    $("#modalCargos").modal("show");
});

$("#modalVAñadirCargos").on(touchEvent, 'btn-noCargo', function () {
    $("#modalUserEstado").modal("show");
});


function guardarCargo(json) {
    
};