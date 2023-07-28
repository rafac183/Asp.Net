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
            console.log(data.grupos);
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