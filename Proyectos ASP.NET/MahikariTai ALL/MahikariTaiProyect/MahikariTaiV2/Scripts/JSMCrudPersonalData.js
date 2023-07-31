var fila;
var modal;
var txt = document.getElementById("txtModalAse");
var title = document.getElementById("titleModalAse");
var touchEvent = 'ontouchstart' in window ? 'touchstart' : 'click';

//Boton Añadir/Editar Integrante
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

//VERIFICACION DE LLENADO DE CAMPOS INGRESADOS----------------------------------------------------//
//Modal para mostrarlo
$("#modalCampos").on(touchEvent, '.btn-sure', function () {
    $(modal).modal("show");
});
//Verificacion de Llenado de todos los Datos Personales
function validarCamposPer() {
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
    var todosLlenos = true;
    for (var atributo in Miembro) {
        if (Miembro.hasOwnProperty(atributo)) {
            if (!Miembro[atributo]) {
                // Si el atributo está vacío, abrir el modal "modalCampos"
                $("#modalDatosPer").modal("hide");
                modal = "#modalDatosPer";
                $("#modalCampos").modal("show");
                todosLlenos = false;
                break; // Salir del bucle, ya que ya se ha encontrado un atributo vacío
            }
        }
    }
    //Si todo se Cumple Guardará los cambios
    if (todosLlenos) {
        guardar(Miembro)
    }
}
//------------------------------------------------------------------------------------------------//

//GUARDAR MODIFICACIONES/DATOS INGRESADOS --------------------------------------------------------//
//Modal Datos Personales
function guardar(Miembro) {
    var id = $("#txtRutId").val();
    //Si ID es '0' se añadirá un Integrante
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
            error: function () {
                console.error("Error al Añadir");
            }
        });
    //Si ID = '0' Se modificara el Integrante
    } else {
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
                txt.innerHTML = response.mensaje;
                title.innerHTML = response.mensaje2;
            },
            error: function () {
                console.error("Error al Modificar")
            }
        });
    };
    $("#modalDatosPer").modal("hide")
    $("#modalDatosKen").modal("show");
};

//Modal Kenshu Integrante
function guardarKenshu() {
    var id = $("#txtRutId").val();
    var Kenshu = {
        rut: $("#rutInput").val(),
        dateIni: $("#dateIniInput").val(),
        dateInt: $("#dateIntInput").val(),
        dateSup: $("#dateSupInput").val()
    };
    //Si ID es '0' se añadirá un Integrante
    if (id == 0) {
        $.ajax({
            url: añadirKenshuUrl,
            type: "POST",
            data: {
                rut: Kenshu.rut,
                dateIni: Kenshu.dateIni,
                dateInt: Kenshu.dateInt,
                dateSup: Kenshu.dateSup
            },
            success: function (response) {
                if (response.exitoso == false) {
                    $("#modalDatosKen").modal("hide");
                    modal = "#modalDatosKen";
                    $("#modalCampos").modal("show");
                } else {
                    txt.innerHTML = response.mensaje;
                    title.innerHTML = response.mensaje2;
                }                
            },
            error: function () {
                console.error("Error al Añadir Kenshu");
            }
        });
    //Si ID = '0' Se modificara el Integrante
    } else {
        $.ajax({
            url: modificarKenshuUrl,
            type: "POST",
            data: {
                rut: Kenshu.rut,
                dateIni: Kenshu.dateIni,
                dateInt: Kenshu.dateInt,
                dateSup: Kenshu.dateSup
            },
            success: function (response) {
                if (response.exitoso == false) {
                    $("#modalDatosKen").modal("hide");
                    modal = "#modalDatosKen";
                    $("#modalCampos").modal("show");
                } else {
                    txt.innerHTML = response.mensaje;
                    title.innerHTML = response.mensaje2;                    
                }
            },
            error: function () {
                console.error("Error al Modificar Kenshu");
            }
        });
    }
    $("#modalDatosKen").modal("hide");
    $("#modalUserEstado").modal("show");
}
//------------------------------------------------------------------------------------------------//

//BOTON ELIMINARR --------------------------------------------------------------------------------//
$("#tablaMembers tbody").on(touchEvent, '.btn-eliminar', function () {
    fila = $(this).closest('tr');
    txt.innerText = "Seguro que desea Eliminar el Miembro Seleccionado? No Funciona";
    title.innerText = "Eliminar Miembro";
    $(".btn-closes").hide();
    $(".btn-siDelete").show();
    $(".btn-noDelete").show();
    $("#modalUserEstado").modal("show");
});

$('#modalUserEstado').on(touchEvent, '.btn-noDelete', function () {
    setTimeout(function () {
        $(".btn-siDelete").hide();
        $(".btn-noDelete").hide();
        $(".btn-closes").show();
    }, 1000);
});

$('#modalUserEstado').on(touchEvent, '.btn-siDelete', function () {
    var datosFila = tablaData.row(fila).data();
    eliminar(datosFila);
});

function eliminar(json) {
    $("#modalUserEstado").modal("hide");
    setTimeout(function () {
        $.ajax({
            url: eliminarUrl,
            type: "POST",
            data: { rut: json.rut },
            success: function (respuesta) {
                txt.innerText = respuesta.mensaje;
                title.innerText = respuesta.mensaje2;
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

// -----------------------------------------------------------------------------------------------//

//Modales Restantes

function abrirCrearNuevo() {
    $("#modalDatosKen").modal("hide")
    $("#modalDatosPer").modal("show")
    /*$("#modalDatosFam").modal("show")*/
}
function abrirDatosFam() {
    $("#modalDatosPer").modal("hide")
    $("#modalDatosWS").modal("hide")
    $("#modalDatosFam").modal("show")
}

function abrirWorkStudy() {
    $("#modalDatosFam").modal("hide")
    $("#modalDatosWS").modal("show")
}