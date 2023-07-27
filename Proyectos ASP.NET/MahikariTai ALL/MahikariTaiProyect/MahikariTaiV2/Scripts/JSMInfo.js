var tablaDataInfo;
var fila;
var touchEvent = 'ontouchstart' in window ? 'touchstart' : 'click';

//Configuracion del Boton Toda la Informacion del integrante
$("#tablaMembers tbody").on(touchEvent, '.btn-allInfo', function () {
    fila = $(this).closest('tr');
    $("#modalQInfo").modal("show");
});
$("#modalQInfo").on(touchEvent, '.btn-dataPersonal', function () {
    $("#modalQInfo").modal("hide");
    var datosFila = tablaData.row(fila).data();
    allInfoPer(datosFila);
});
$("#modalQInfo").on(touchEvent, '.btn-dataKenshu', function () {
    $("#modalQInfo").modal("hide");
    var datosFila = tablaData.row(fila).data();
    allInfoKen(datosFila);
});
$("#modalQInfo").on(touchEvent, '.btn-dataFamily', function () {
    $("#modalQInfo").modal("hide");
    var datosFila = tablaData.row(fila).data();
    allInfoFam(datosFila);
});
$("#modalQInfo").on(touchEvent, '.btn-dataOtros', function () {
    $("#modalQInfo").modal("hide");
    var datosFila = tablaData.row(fila).data();
    allInfoOtr(datosFila);
});

//Toda Informacion del Miembro
function allInfoPer(json) {
    var title = document.getElementById("titleInfoPer");
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

function allInfoKen(json, modal = false) {
    if (modal == false) {
        var title = document.getElementById("titleInfoKen");
        title.innerText = "Se Muestrar los Datos del Rut: '" + json.rut + "'";

        // Obtener la referencia al elemento HTML donde se mostrará la tabla
        var tablaContainer = document.getElementById("tablaKenshu");

        // Realizar la llamada AJAX para obtener los datos
        $.ajax({
            url: allKenshuMUrl,
            type: "POST",
            data: { rut: json.rut },
            success: function (data) {
                // Construir el contenido HTML de la tabla
                var tablaHTML = "<table>";
                tablaHTML += "<thead><tr><th>Grado</th><th>Fecha</th></tr></thead>";
                tablaHTML += "<tbody>";

                // Iterar sobre los datos recibidos y agregar filas a la tabla
                for (var i = 0; i < data.data.length; i++) {
                    tablaHTML += "<tr>";
                    tablaHTML += "<td>" + data.data[i].grado + "</td>";
                    var fecha = moment(data.data[i].date).format("MM-YYYY");
                    tablaHTML += "<td>" + fecha + "</td>";
                    tablaHTML += "</tr>";
                }

                tablaHTML += "</tbody></table>";

                // Agregar la tabla al elemento HTML seleccionado
                tablaContainer.innerHTML = tablaHTML;

                // Mostrar el modal
                $("#modalAllKen").modal("show");
            },
            error: function (xhr, status, error) {
                // Manejar el error en caso de que la llamada AJAX falle
                console.error("Error al obtener los datos: " + error);
            }
        });
    } else {
        $.ajax({
            url: allKenshuMUrl,
            type: "POST",
            data: { rut: json.rut },
            success: function (data) {
                console.log(data.data.length);
                var fechaK;
                if (data.data.length == 0) {
                    console.log("No hay datos");
                }
                if (data.data.length >= 1) {
                    fechaK = new Date(parseInt(data.data[0].date.substr(6)));
                    $("#dateIniInput").val(moment(fechaK).format("YYYY-MM"));
                }
                if (data.data.length >= 2) {
                    fechaK = new Date(parseInt(data.data[1].date.substr(6)));
                    $("#dateIntInput").val(moment(fechaK).format("YYYY-MM"));
                    $("#yesOrNotSelectIn").val("Si");
                    $("#dateIntInput").prop('disabled', false);

                }
                if (data.data.length == 3) {
                    fechaK = new Date(parseInt(data.data[2].date.substr(6)));
                    $("#dateSupInput").val(moment(fechaK).format("YYYY-MM"));
                    $("#yesOrNotSelectSu").val("Si");
                    $("#dateSupInput").prop('disabled', false);
                }                
            },
            error: function (xhr, status, error) {
                // Manejar el error en caso de que la llamada AJAX falle
                console.error("Error al obtener los datos del Kenshu: " + error);
            }
        });
    }
}

