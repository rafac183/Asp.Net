var fila;
var touchEvent = 'ontouchstart' in window ? 'touchstart' : 'click';

//Configuracion del Boton Toda la Informacion del integrante
$("#tablaMembers tbody").on(touchEvent, '.btn-allInfo', function () {
    fila = $(this).closest('tr');
    var datosFila = tablaData.row(fila).data();
    allInfoPer(datosFila);
});
$("#modalAllInfo").on(touchEvent, '.btn-datosK', function () {
    var datosFila = tablaData.row(fila).data();
    allInfoKen(datosFila);
    
});
$("#modalAllKen").on(touchEvent, '.btn-datosP', function () {
    $("#modalAllInfo").modal("show");
});
$("#modalAllKen").on(touchEvent, '.btn-datosF', function () {
    var datosFila = tablaData.row(fila).data();
    allInfoFam(datosFila);
});
//$("#modalAllKen").on(touchEvent, '.btn-datosP', function () {
//    $("#modalAllInfo").modal("show");
//});
//$("#modalAllFam").on(touchEvent, '.btn-datosO', function () {
//    var datosFila = tablaData.row(fila).data();
//    allInfoOtr(datosFila);
//});

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
    $("#modalAllInfo").modal("show");
}

function allInfoKen(json) {
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
}

function AllInfoCargo(json) {

}

