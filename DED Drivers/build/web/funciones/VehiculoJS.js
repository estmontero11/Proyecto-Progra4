$(function () {

    //agrega los eventos las capas necesarias
    $("#enviar").click(function () {
        enviar();
    });

    //agrega los eventos las capas necesarias
    $("#cancelar").click(function () {
        limpiarForm();
        $("#myModalFormulario").modal("hide");
    });
    
    $("#btMostarForm").click(function () {
        limpiarForm();
    });
    
    $("#buscar").click(function () {
        buscar();
    });
});

//******************************************************************************
//Se ejecuta cuando la página esta completamente cargada
//******************************************************************************

$(document).ready(function () {
    consultarVehiculos();
});

//******************************************************************************
//******************************************************************************
//metodos para consultas el listado de las personas
//******************************************************************************
//******************************************************************************

function consultarVehiculos() {
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de los vehiculos en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: 'VehiculoServlet',
        data: {
            accion: "consultarVehiculos"
        },
        error: function () { //si existe un error en la respuesta del ajax
            swal('Error', 'Se presento un error a la hora de cargar la información de los vehiculos en la base de datos', 'error');
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            dibujarTabla(data);
            // se oculta el modal esta funcion se encuentra en el utils.js
            ocultarModal("myModal");
        },
        type: 'POST',
        dataType: "json"
    });
}

function dibujarTabla(dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaVehiculos").html(""); 
    
    //muestra el enzabezado de la tabla
    var head = $("<thead />");
    var row = $("<tr />");
    head.append(row);
    $("#tablaVehiculos").append(head); 
    row.append($("<th><b>ID</b></th>"));
    row.append($("<th><b>AÑO</b></th>"));
    row.append($("<th><b>MODELO</b></th>"));
    row.append($("<th><b>PLACA</b></th>"));
    row.append($("<th><b>PUNTUACION</b></th>"));
    row.append($("<th><b>ESTADO</th>"));
    row.append($("<th><b>UBICACION ACTUAL</th>"));
    row.append($("<th><b>ID CHOFER</th>"));
    
    //carga la tabla con el json devuelto
    for (var i = 0; i < dataJson.length; i++) {
        dibujarFila(dataJson[i]);
    }
}

function dibujarFila(rowData) {
    //Cuando dibuja la tabla en cada boton se le agrega la funcionalidad de cargar o eliminar la informacion
    //de una persona
    
    var row = $("<tr />");
    $("#tablaVehiculos").append(row); 
    row.append($("<td>" + rowData.idVehiculo + "</td>"));
    row.append($("<td>" + rowData.anno + "</td>"));
    row.append($("<td>" + rowData.modelo + "</td>"));
    row.append($("<td>" + rowData.placa + "</td>"));
    row.append($("<td>" + rowData.color + "</td>"));
    row.append($("<td>" + rowData.puntuacion + "</td>"));
    row.append($("<td>" + rowData.estado + "</td>"));
    row.append($("<td>" + rowData.ubicacionActual + "</td>"));
    row.append($("<td>" + rowData.idChofer + "</td>"));
    row.append($('<td><button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="consultarVehiculoById('+rowData.idVehiculo+');">'+
                        '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>'+
                    '</button>'+
                    '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="eliminarVehiculo('+rowData.idVehiculo+');">'+
                        '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>'+
                    '</button></td>'));
}

//******************************************************************************
//******************************************************************************
//El metodo enviar funciona tanto para el insertar como para el modificar
//******************************************************************************
//******************************************************************************

function enviar() {
    if (validar()) {
        //Se envia la información por ajax
        $.ajax({
            url: 'VehiculoServlet',
            data: {
                accion: $("#vehiculoAction").val(),
                idVehiculo: $("#idVehiculo").val(),
                anno: $("#anno").val(),
                modelo: $("#modelo").val(),
                placa: $("placa").val(),
                color: $("#color").val(),
                puntuacion: $("#puntuacion").val(),
                estado: $("#estado").val(),
                ubicacionActual: $("#ubicacionActual").val(),
                idChofer: $("#idChofer").val()
            },
            error: function () { //si existe un error en la respuesta del ajax
                swal('Error', 'Se genero un error, contacte al administrador (Error del ajax)', 'error');
            },
            success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
                var respuestaTxt = data.substring(2);
                var tipoRespuesta = data.substring(0, 2);
                if (tipoRespuesta === "C~") { //correcto
                    swal('Correcto', respuestaTxt, 'success');
                    $("#myModalFormulario").modal("hide");
                    consultarVehiculos();
                } else {
                    if (tipoRespuesta === "E~") { //error
                        swal('Error', respuestaTxt, 'error');
                    } else {
                        swal('Error', 'Se genero un error, contacte al administrador', 'error');
                    }
                }

            },
            type: 'POST'
        });
    } else {
        mostrarMensaje("alert alert-danger", "Debe digitar los campos del formulario", "Error!");
    }
}

function validar() {
    var validacion = true;

    //Elimina estilo de error en los css
    //notese que es sobre el grupo que contienen el input
    $("#groupIdVehiculo").removeClass("has-error");
    $("#groupAnno").removeClass("has-error");
    $("#groupModelo").removeClass("has-error");
    $("#groupPlaca").removeClass("has-error");
    $("#groupColor").removeClass("has-error");
    $("#groupPuntuacion").removeClass("has-error");
    $("#groupEstado").removeClass("has-error");
    $("#groupUbicacionActual").removeClass("has-error");
    $("#groupIdChofer").removeClass("has-error");

    //valida cada uno de los campos del formulario
    //Nota: Solo si fueron digitados
    if ($("#idVehiculo").val() === "") {
        $("#groupIdVehiculo").addClass("has-error");
        validacion = false;
    }
    if ($("#anno").val() === "") {
        $("#groupAnno").addClass("has-error");
        validacion = false;
    }
    if ($("#modelo").val() === "") {
        $("#groupModelo").addClass("has-error");
        validacion = false;
    }
    if ($("#placa").val() === "") {
        $("#groupPlaca").addClass("has-error");
        validacion = false;
    }
    if ($("#color").val() === "") {
        $("#groupColor").addClass("has-error");
        validacion = false;
    }
    if ($("#puntuacion").val() === "") {
        $("#groupPuntuacion").addClass("has-error");
        validacion = false;
    }
    if ($("#estado").val() === "") {
        $("#groupEstado").addClass("has-error");
        validacion = false;
    }
    if ($("#ubicacionActual").val() === "") {
        $("#groupUbicacionActual").addClass("has-error");
        validacion = false;
    }
    if ($("#idChofer").val() === "") {
        $("#groupIdChofer").addClass("has-error");
        validacion = false;
    }

    return validacion;
}

//******************************************************************************
//******************************************************************************
//metodos para eliminar personas
//******************************************************************************
//******************************************************************************

function eliminarVehiculo(idVehiculo) {
    swal({
        title: 'Alerta',
        text: "¿Está seguro que quiere eliminar esta chofer?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, eliminar',
        cancelButtonText: 'No, cancelar',
        confirmButtonClass: 'btn btn-success',
        cancelButtonClass: 'btn btn-danger',
        buttonsStyling: false
    }).then(function () {
        mostrarModal("myModal", "Espere por favor..", "Se esta eliminando al vehiculo seleccionado");
        //Se envia la información por ajax
        $.ajax({
            url: 'VehiculoServlet',
            data: {
                accion: "eliminarVehiculo",
                idVehiculo: idVehiculo
            },
            error: function () { //si existe un error en la respuesta del ajax
                ocultarModal("myModal");
                swal('Error', 'Se presento un error, contactar al administrador', 'error');
            },
            success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
                // se cambia el mensaje del modal por la respuesta del ajax
                var respuestaTxt = data.substring(2);
                var tipoRespuesta = data.substring(0, 2);
                if (tipoRespuesta === "E~") {
                    cambiarMensajeModal("myModal","Resultado acción",respuestaTxt);
                }else{
                    setTimeout(consultarVehiculos, 3000);// hace una pausa y consulta la información de la base de datos
                    swal('Correcto', 'El vehiculo se ha eliminado correctamente', 'success');
                }
            },
            type: 'POST',
            dataType: "text"
        });
    }, function (dismiss) {
        if (dismiss === 'cancel') {
          swal('Cancelado','No se ha eliminado el vehiculo','error');
        }
    });
}

//******************************************************************************
//******************************************************************************
//metodos para eliminar vehiculos
//******************************************************************************
//******************************************************************************

function consultarVehiculoById(idVehiculo) {
    mostrarModal("myModal", "Espere por favor..", "Consultando la persona seleccionada");
    //Se envia la información por ajax
    $.ajax({
        url: 'VehiculoServlet',
        data: {
            accion: "consultarVehiculoById",
            idVehiculo: idVehiculo
        },
        error: function () { //si existe un error en la respuesta del ajax
            ocultarModal("myModal");
            swal('Error','Se presento un error, contactar al administrador','error');
            cambiarMensajeModal("myModal","Resultado acción","Se presento un error, contactar al administrador");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            // se oculta el mensaje de espera
            ocultarModal("myModal");
            limpiarForm();
            //se muestra el formulario
            $("#myModalFormulario").modal();
            
            //************************************************************************
            //carga información de la persona en el formulario
            //************************************************************************
            //se indicar que la cédula es solo readOnly
            $("#idVehiculo").attr('readonly', 'readonly');
            
            //se modificar el hidden que indicar el tipo de accion que se esta realizando
            $("#vehiculoAction").val("modificarVehiculo"); 
            
            //se carga la información en el formulario
            $("#idVehiculo").val(data.idVehiculo);
            $("#anno").val(data.anno);
            $("#modelo").val(data.modelo);
            $("#placa").val(data.placa);
            $("#color").val(data.color);
            $("#puntuacion").val(data.puntuacion);
            $("#estado").val(data.estado);
            $("ubicacionActual").val(data.ubicacionActual);
            $("#idChofer").val(data.idChofer);
           
        },
        type: 'POST',
        dataType: "json"
    });
}

//******************************************************************************
//******************************************************************************

function mostrarMensaje(classCss, msg, neg) {
    //se le eliminan los estilos al mensaje
    $("#mesajeResult").removeClass();

    //se setean los estilos
    $("#mesajeResult").addClass(classCss);

    //se muestra la capa del mensaje con los parametros del metodo
    $("#mesajeResult").fadeIn("slow");
    $("#mesajeResultNeg").html(neg);
    $("#mesajeResultText").html(msg);
    $("#mesajeResultText").html(msg);
}

//******************************************************************************
//******************************************************************************

function limpiarForm() {
    //setea el focus del formulario
    $('#idVehiculo').focus();
    $("#idVehiculo").removeAttr("readonly"); //elimina el atributo de solo lectura
    
    //se cambia la accion por agregarPersona
    $("#vehiculoAction").val("agregarVehiculo"); 

    //esconde el div del mensaje
    mostrarMensaje("hiddenDiv", "", "");

    //Resetear el formulario
    $('#formVehiculo').trigger("reset");
}

//******************************************************************************
//Metodo de busqueda según el nombre
//******************************************************************************
function buscar(){
    var name = document.getElementById("textoBuscar").value;
    consultarVehiculoByName(name);
}

function consultarVehiculoByName(nameVehiculo) {
    mostrarModal("myModal", "Espere por favor..", "Consultando el vehiculo seleccionado");
    //Se envia la información por ajax
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de los Vehiculos en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: 'VehiculoServlet',
        data: {
            accion: "consultarVehiculoByName",
            nameVehiculo: nameVehiculo
        },
        error: function () { //si existe un error en la respuesta del ajax
            swal('Error', 'Se presento un error a la hora de cargar la información de los vehiculos en la base de datos', 'error');
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            dibujarTabla(data);
            // se oculta el modal esta funcion se encuentra en el utils.js
            ocultarModal("myModal");
        },
        type: 'POST',
        dataType: "json"
    });
}

