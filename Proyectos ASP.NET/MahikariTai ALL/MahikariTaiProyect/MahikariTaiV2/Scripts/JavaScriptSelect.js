var tablaDataSelect;
var filaSelect;
var ase = document.querySelector("#nameSelect");
if (ase) {
    var tablaSelect = ase.value;
}

$(document).ready(function () {
    tablaDataSelect = $(tablaSelect).DataTable({
        responsive: true,
        lengthMenu: [5, 10, 25, 50, 100],
        language: {
            url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json'
        },
        "columnDefs": [
            { "orderable": false, "targets": -1 }, // Desactivar ordenamiento para la última columna (Acciones)
            { "searchable": false, "targets": -1 },
            { "width": "50px", "targets": -1 },
            { "width": "90px", "targets": 0 },
            { "visible": false, "targets": [3, 4, 5, 7, 8, 11, 12, 13] }
        ]

    });
    if ($(window).width() < 992) {
        tablaData.column(-1).visible(false);
    }

    // Actualizar la visibilidad de la columna al cambiar el tamaño de la pantalla
    $(window).resize(function () {
        if ($(window).width() < 992) {
            tablaData.column(-1).visible(false);
        } else {
            tablaData.column(-1).visible(true);
        }
    });

});

var touchEvent = 'ontouchstart' in window ? 'touchstart' : 'click';
$(tablaSelect + " tbody").on(touchEvent, '.btn-allInfoS', function () {
    filaSelect = $(this).closest('tr');
    var datosFila = tablaDataSelect.row(filaSelect).data();
    allInfoSelect(datosFila);
});

//Toda Informacion del Miembro de Categoria Especifica
function allInfoSelect(json) {
    var title = document.getElementById("titleInfo");
    title.innerText = "Se Muestrar los Datos del Rut: '" + json[0] + "'";
    $("#rutTxt").html(json[0]);
    $("#nameTxt").html(json[1]);
    $("#firstLastNameTxt").html(json[2]);
    $("#secondLastNameTxt").html(json[3]);
    $("#generoTxt").html(json[4]);
    $("#categoriaTxt").html(json[5]);
    $("#emailTxt").html(json[6]);
    var birthdate = json.birthdate/*new Date(parseInt(json.birthdate.substr(6)));*/
    $("#birthdateTxt").html(moment(birthdate).format("DD-MM-YYYY").toString());
    $("#nacionalidadTxt").html(json[8]);
    $("#phoneTxt").html(json[9]);
    $("#streetTxt").html(json[10]);
    $("#regionTxt").html(json[11]);
    $("#provinciaTxt").html(json[12]);
    $("#comunaTxt").html(json[13]);
    $("#hobbiesTxt").html(json[14]);
    $("#modalAllInfo").modal("show")
}