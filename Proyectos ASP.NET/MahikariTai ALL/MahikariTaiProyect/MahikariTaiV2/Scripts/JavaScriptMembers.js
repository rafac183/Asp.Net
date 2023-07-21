//Modificar tabla Configuracion de la Tabla Completa
var tablaData;
var fila;
var txt = document.getElementById("txtMemberRegistrado");
var txt2 = document.getElementById("txtMemberRegistrado2");
var title = document.getElementById("titleModalAse");
var touchEvent = 'ontouchstart' in window ? 'touchstart' : 'click';

$(document).ready(function () {
    tablaData = $("#tablaMembers").DataTable({
        responsive: true,
        lengthMenu: [5, 10, 25, 50, 100],
        headerBorder: true,
        language: {
            url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json'
        },
        "columnDefs": [
            { "orderable": false, "targets": -1 }, // Desactivar ordenamiento para la última columna (Acciones)
            { "searchable": false, "targets": -1 }, // Desactivar búsqueda para la última columna (Acciones)
            { "width": "100px", "targets": -1 },
            { "width": "80px", "targets": 0 },
            { "width": "100px", "targets": 1 },
            { "width": "50px", "targets": 2 },
            { "width": "50px", "targets": 3 },
            { "width": "50px", "targets": 4 },
            { "width": "50px", "targets": 5 },
            { "width": "50px", "targets": 6 },
            {
                className: 'text-center',
                targets: -1 // Centrar contenido en la última columna (Acciones)
            }

        ],
        "ajax": {
            url: allMembersUrl,
            type: "GET",
            dataType: "json"
        },
        "columns": [
            { "data": "rut" },
            { "data": "names" },
            { "data": "firstLastname" },
            { "data": "secondLastname" },
            { "data": "category" },
            { "data": "phone" },
            { "data": "email" },
            {
                "data": null,
                "defaultContent": '<button class="btn btn-info btn-sm btn-allInfo"><i class="fa fa-info-circle"></i></button>' +
                    '<button class= "btn btn-primary btn-sm m-2 btn-editar" > <i class="fas fa-pen"></i></button >' +
                    '<button class="btn btn-danger btn-sm btn-eliminar" ><i class="fas fa-trash"></i></button>'
            }
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
    regionsSelect();
});

//Configuracion del Boton Toda la Informacion del integrante


$("#tablaMembers tbody").on(touchEvent, '.btn-allInfo', function () {    
    fila = $(this).closest('tr');
    var datosFila = tablaData.row(fila).data();
    allInfo(datosFila);
});

//Toda Informacion del Miembro
function allInfo(json) {
    var title = document.getElementById("titleInfo");
    title.innerText = "Se Muestrar los Datos del Rut: '" + json.rut + "'";
    $("#rutTxt").html(json.rut);
    $("#nameTxt").html(json.names);
    $("#firstLastNameTxt").html(json.firstLastname);
    $("#secondLastNameTxt").html(json.secondLastname);
    $("#generoTxt").html(json.gender);
    $("#categoriaTxt").html(json.category);
    $("#emailTxt").html(json.email);
    var birthdate = new Date(parseInt(json.birthdate.substr(6)));
    $("#birthdateTxt").html(moment(birthdate).format("DD-MM-YYYY").toString());
    $("#nacionalidadTxt").html(json.nacionality);
    $("#phoneTxt").html(json.phone);
    $("#streetTxt").html(json.street + " " + json.number);
    $("#regionTxt").html(json.region);
    $("#provinciaTxt").html(json.provincia);
    $("#comunaTxt").html(json.comuna);
    $("#hobbiesTxt").html(json.hobbies);
    $("#modalAllInfo").modal("show")
}



$("#tablaMembers tbody").on(touchEvent, '.btn-eliminar', function () {
    fila = $(this).closest('tr');
    var txt = document.getElementById("txtMemberRegistrado");
    var title = document.getElementById("titleModalAse");
    txt.innerText = "Seguro que desea Eliminar el Miembro Seleccionado?";
    title.innerText = "Eliminar Miembro";
    $(".btn-closes").hide();
    $(".btn-siDelete").show();
    $(".btn-noDelete").show();
    $("#modalUserEstado").modal("show");
});

$('#modalUserEstado').on(touchEvent, '.btn-siDelete', function () {
    var datosFila = tablaData.row(fila).data();
    eliminar(datosFila);
});

$("#tablaMembers tbody").on(touchEvent, '.btn-editar', function () {
    fila = $(this).closest('tr');
    $("#modalCarOrEdit").modal("show");    
});

$('#modalCarOrEdit').on(touchEvent, '.btn-editDatos', function () {
    var datosFila = tablaData.row(fila).data();
    $("#modalCarOrEdit").modal("hide");
    abrirModal(datosFila);
});

$('#modalCarOrEdit').on(touchEvent, '.btn-editCargo', function () {
    var datosFila = tablaData.row(fila).data();
    $("#modalCarOrEdit").modal("hide");
    $("#modalCargos").modal("show");
    /*editCargo(datosFila);*/
});

//Abrir Modal para Crear Integrante O Editar Integrante (Limpiar Casillas o Traer Datos)
function abrirModal(json) {

    var title = document.getElementById("titleModal");
    title.innerText = "Crear Miembro";
    $("#txtRutId").val("0");
    $("#rutInput").val("").prop('disabled', false);
    $("#nameInput").val("");
    $("#firstLastNameInput").val("");
    $("#secondLastNameInput").val("");
    $("#generoSelect").val($("#generoSelect option:first").val());
    $("#categoriaSelect").val($("#categoriaSelect option:first").val());
    $("#emailInput").val("");
    $("#birthdateInput").val("");
    $("#nacionalidadSelect").val($("#nacionalidadSelect option:first").val());
    $("#phoneInput").val("");
    $("#streetInput").val("");
    $("#numberInput").val("");
    $("#regionSelect").val($("#regionSelect option:first").val())/*.empty()*/;
    $("#provinciaSelect").val($("#provinciaSelect option:first").val()).prop('disabled', true);
    $("#comunaSelect").val($("#comunaSelect option:first").val()).prop('disabled', true);
    $("#hobbiesInput").val("");
    

    if (json != null) {
        title.innerText = "Editar Miembro";
        $("#txtRutId").val("1");
        $("#rutInput").val(json.rut).prop('disabled', true);
        $("#nameInput").val(json.names);
        $("#firstLastNameInput").val(json.firstLastname);
        $("#secondLastNameInput").val(json.secondLastname);
        $("#generoSelect").val(json.gender);
        $("#categoriaSelect").val(json.category);
        $("#emailInput").val(json.email);
        var birthdate = new Date(parseInt(json.birthdate.substr(6)));
        $("#birthdateInput").val(moment(birthdate).format("YYYY-MM-DD"));
        $("#nacionalidadSelect").val(json.nacionality);
        $("#phoneInput").val(json.phone);
        $("#streetInput").val(json.street);
        $("#numberInput").val(json.number);
        $("#regionSelect").val(json.region);
        // Obtener las ciudades de la región seleccionada
        $.ajax({
            url: getProvinciasUrl,
            type: "POST",
            data: { region: json.region }, // Enviar el valor de la región seleccionada
            success: function (data) {
                // Limpiar las opciones actuales del selector de ciudades
                $('#provinciaSelect').empty();

                $('#provinciaSelect').append('<option value="" disabled selected>Elige Una...</option>');
                // Iterar sobre las ciudades devueltas y agregarlas como opciones en el select
                $.each(data.provincias, function (index, provincia) {
                    $('#provinciaSelect').append('<option value="' + provincia + '">' + provincia + '</option>');
                });
                // Asignar la ciudad seleccionada al campo correspondiente
                $("#provinciaSelect").val(json.provincia).prop('disabled', false);
            },
            error: function () {
                console.error('Error al obtener las provincia por región');
            }
        });

        // Obtener las comunas de la ciudad seleccionada
        $.ajax({
            url: getComunasUrl,
            type: "POST",
            data: { provincia: json.provincia },
            success: function (data) {
                // Limpiar las opciones actuales del selector de comunas
                $('#comunaSelect').empty();

                $('#comunaSelect').append('<option value="" disabled selected>Elige Una...</option>');
                // Iterar sobre las comunas devueltas y agregarlas como opciones en el select
                $.each(data.comunas, function (index, comuna) {
                    $('#comunaSelect').append('<option value="' + comuna + '">' + comuna + '</option>');
                });
                // Asignar la comuna seleccionada al campo correspondiente
                $("#comunaSelect").val(json.comuna).prop('disabled', false);
            },
            error: function () {
                console.error('Error al obtener las comunas por provincia');
            }
        });
        $("#hobbiesInput").val(json.hobbies);
    }
    $("#modalDatosFam").modal("hide")
    $("#modalDatosPer").modal("show")
}

//Guardar Datos modificados o ingresados
function guardar() {

    id = $("#txtRutId").val();
    var Miembro = {
        rut: $("#rutInput").val(),
        names: $("#nameInput").val(),
        firstLastname: $("#firstLastNameInput").val(),
        secondLastname: $("#secondLastNameInput").val(),
        gender: $("#generoSelect").val(),
        category: $("#categoriaSelect").val(),
        email: $("#emailInput").val(),
        birthdate: $("#birthdateInput").val(),
        nacionality: $("#nacionalidadSelect").val(),
        phone: $("#phoneInput").val(),
        street: $("#streetInput").val(),
        number: parseInt($("#numberInput").val()),
        region: $("#regionSelect").val(),
        provincia: $("#provinciaSelect").val(),
        comuna: $("#comunaSelect").val(),
        hobbies: $("#hobbiesInput").val()
    }
    if (id == 0) {
        $.ajax({
            url: añadirUrl,
            type: "POST",
            data: {
                rut: Miembro.rut,
                nombres: Miembro.names,
                primerApellido: Miembro.firstLastname,
                segundoApellido: Miembro.secondLastname,
                genero: Miembro.gender,
                categoria: Miembro.category,
                email: Miembro.email,
                birthdate: Miembro.birthdate,
                nacionalidad: Miembro.nacionality,
                phone: Miembro.phone,
                calle: Miembro.street,
                numero: Miembro.number,
                region: Miembro.region,
                provincia: Miembro.provincia,
                comuna: Miembro.comuna,
                hobbies: Miembro.hobbies
            },
            success: function (response) {
                // Handle the successful response from the server
                txt.innerText = response.mensaje;
                title.innerText = response.mensaje2;
            },
            error: function () {
                console.error("Error al Añadir");
            }
        })
    } else if (id == 1) {
        $.ajax({
            url: modificarUrl,
            type: "POST",
            data: {
                rut: Miembro.rut,
                nombres: Miembro.names,
                primerApellido: Miembro.firstLastname,
                segundoApellido: Miembro.secondLastname,
                genero: Miembro.gender,
                categoria: Miembro.category,
                email: Miembro.email,
                birthdate: Miembro.birthdate,
                nacionalidad: Miembro.nacionality,
                phone: Miembro.phone,
                calle: Miembro.street,
                numero: Miembro.number,
                region: Miembro.region,
                provincia: Miembro.provincia,
                comuna: Miembro.comuna,
                hobbies: Miembro.hobbies
            },
            success: function (response) {
                // Handle the successful response from the server
                txt.innerText = response.mensaje;
                title.innerText = response.mensaje2;
            },
            error: function () {
                console.error("Error al Modificar")
            }
        })


    }
    $("#modalDatosPer").modal("hide")
    $("#modalUserEstado").modal("show");
    

}

//Eliminar Miembro

function eliminar(json) {
    var jsonRut = json.rut;
    var title = document.getElementById("titleModalAse");
    $("#modalUserEstado").modal("hide");
    setTimeout(function () {
        $.ajax({
            url: eliminarUrl,
            type: 'POST',
            data: { rut: jsonRut },
            success: function (response) {
                txt.innerText = response.mensaje;
                title.innerText = response.mensaje2;
            },
            error: function () {
                console.error("Error al eliminar");
            }

        });
        $(".btn-siDelete").hide();
        $(".btn-noDelete").hide();
        $(".btn-closes").show();
        $("#modalUserEstado").modal("show");
    }, 1000);
}

//Modales Restantes

function abrirDatosFam() {
    $("#modalDatosPer").modal("hide")
    $("#modalWorkStudy").modal("hide")
    $("#modalDatosFam").modal("show")
}

function abrirWorkStudy() {
    $("#modalDatosFam").modal("hide")
    $("#modalWorkStudy").modal("show")
}



function regionsSelect() {
    $.ajax({
        url: getRegionesUrl,
        type: "POST",
        success: function (data) {
            $.each(data.regiones, function (index, region) {
                $('#regionSelect').append('<option value="' + region + '">' + region + '</option>');
            });
        },
        error: function () {
            // Manejar el error en caso de que la llamada AJAX falle
            console.error('Error al obtener las regiones');
        }
    });
}

//Funcion para Traer Ciudades de cierta Region
$('#regionSelect').change(function () {
    var selectedRegion = $(this).val(); // Obtener el valor seleccionado

    // Realizar la llamada AJAX
    $.ajax({
        url: getProvinciasUrl,
        type: "POST",
        data: { region: selectedRegion }, // Enviar el valor de la región seleccionada
        success: function (data) {
            // Limpiar las opciones actuales del select de ciudades
            $("#comunaSelect").val($("#comunaSelect option:first").val()).prop('disabled', true);
            $('#provinciaSelect').prop('disabled', false);
            $('#provinciaSelect').empty();

            $('#provinciaSelect').append('<option value="" disabled selected>Elige Una...</option>');
            // Iterar sobre las ciudades devueltas y agregarlas como opciones en el select
            $.each(data.provincias, function (index, provincia) {
                $('#provinciaSelect').append('<option value="' + provincia + '">' + provincia + '</option>');
            });
        },
        error: function () {
            // Manejar el error en caso de que la llamada AJAX falle
            console.error('Error al obtener las Provincias por Región');
        }
    });
});

//Funcion para Traer Comunas de cierta Ciudad

$('#provinciaSelect').change(function () {
    var selectedProvincia = $(this).val(); // Obtener el valor seleccionado

    // Realizar la llamada AJAX
    $.ajax({
        url: getComunasUrl,
        type: "POST",
        data: { provincia: selectedProvincia }, // Enviar el valor de la región seleccionada
        success: function (data) {
            // Limpiar las opciones actuales del select de ciudades
            $('#comunaSelect').prop('disabled', false);
            $('#comunaSelect').empty();

            $('#comunaSelect').append('<option value="" disabled selected>Elige Una...</option>');
            // Iterar sobre las ciudades devueltas y agregarlas como opciones en el select
            $.each(data.comunas, function (index, comuna) {
                $('#comunaSelect').append('<option value="' + comuna + '">' + comuna + '</option>');
            });
        },
        error: function () {
            // Manejar el error en caso de que la llamada AJAX falle
            console.error('Error al obtener las Comunas por Provincia');
        }
    });
});

//Recargar Pagina
function recargar() {
    tablaData.ajax.reload(null, false);
}