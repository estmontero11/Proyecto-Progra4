/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function () {
    //Genera el datapicker
    $('#fechaNacimiento').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    
    $('#ultFechModif').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });

    //agrega los eventos las capas necesarias
    $("#enviar").click(function () {
        enviar();
    });    
    
    $("#btMostarForm").click(function () {
        limpiarForm();
    });
    
    $("#buscar").click(function () {
        buscar();
    });
});


$(document).ready(function () {
    consultarUsuarios();
});

function consultarUsuarios() {
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de los usuarios en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: 'UsuarioServlet',
        data: {
            accion: "consultarUsuario"
        },
        error: function () { //si existe un error en la respuesta del ajax
            swal ('Error', 'Se presento un error a la hora de cargar la información de los usuarios en la base de datos', 'error');
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
    $("#tablaUsuarios").html(""); 
    
    //muestra el enzabezado de la tabla
    var head = $("<thead />");
    var row = $("<tr />");
    head.append(row);
    $("#tablaUsuarios").append(head); 
    row.append($("<th><b>NOMBRE</b></th>"));
    row.append($("<th><b>APELLIDOS</b></th>"));
    row.append($("<th><b>FEC.NACIMIENTO</b></th>"));
    row.append($("<th><b>DIRECCIÓN</b></th>"));
    row.append($("<th><b>TÉLEFONO</b></th>"));
    row.append($("<th><b>CORREO</b></th>"));
    row.append($("<th><b>USUARIO</b></th>"));
    row.append($("<th><b>CONTRASEÑA</b></th>"));
    row.append($("<th><b>ULT.USU.MODIF</b></th>"));
    row.append($("<th><b>ULT.FEC.MODIF</b></th>"));
    row.append($("<th><b>ACCIÓN</b></th>"));
    
    //carga la tabla con el json devuelto
    for (var i = 0; i < dataJson.length; i++) {
        dibujarFila(dataJson[i]);
    }
}

function dibujarFila(rowData) {
    //Cuando dibuja la tabla en cada boton se le agrega la funcionalidad de cargar o eliminar la informacion
    //de una chofer
    
    var row = $("<tr/>");
    $("#tablaUsuarios").append(row); 
    row.append($("<td>" + rowData.nombre + "</td>"));
    row.append($("<td>" + rowData.apellidos + "</td>"));
    row.append($("<td>" + rowData.fechaNacimiento + "</td>"));
    row.append($("<td>" + rowData.direccion + "</td>"));
    row.append($("<td>" + rowData.telefonoTrabajo + "</td>"));
    row.append($("<td>" + rowData.correoElectronico + "</td>"));
    row.append($("<td>" + rowData.idUsuario + "</td>"));
    row.append($("<td>" + rowData.contrasena + "</td>"));
    row.append($("<td>" + rowData.ultimoUsuario + "</td>"));
    row.append($("<td>" + rowData.ultimaFecha + "</td>"));
    
    row.append($('<td><button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="consultarChoferById('+rowData.idChofer+');">'+
                        '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>'+
                    '</button>'+
                    '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="eliminarChofer('+rowData.idChofer+');">'+
                        '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>'+
                    '</button></td>'));
}

function validar() {
    var validacion = true;

    //Elimina estilo de error en los css
    //notese que es sobre el grupo que contienen el input

    
    $("#groupNombre").removeClass("has-error");
    $("#groupApellidos").removeClass("has-error");
    $("#groupFechaNacimiento").removeClass("has-error");
    $("#groupDireccion").removeClass("has-error");
    $("#groupTelefono").removeClass("has-error");
    $("#groupCorreo").removeClass("has-error"); 
    $("#groupIdUsuario").removeClass("has-error");
    $("#groupContrasena").removeClass("has-error");
    $("#groupUltUsuario").removeClass("has-error");
    $("#groupUltFechModif").removeClass("has-error");

    //valida cada uno de los campos del formulario
    //Nota: Solo si fueron digitados
    
    
    if ($("#nombre").val() === "") {
        $("#groupNombre").addClass("has-error");
        validacion = false;
    }
    if ($("#apellidos").val() === "") {
        $("#groupApellidos").addClass("has-error");
        validacion = false;
    }
    if ($("#fechaNacimiento").data('date') === "") {
        $("#groupFechaNacimiento").addClass("has-error");
        validacion = false;
    }
    if ($("#direccion").val() === "") {
        $("#groupDireccion").addClass("has-error");
        validacion = false;
    }
    if ($("#telefono").val() === "") {
        $("#groupTelefono").addClass("has-error");
        validacion = false;
    }
    if ($("#correo").val() === "") {
        $("#groupCorreo").addClass("has-error");
        validacion = false;
    }
    if ($("#idUsuario").val() === "") {
        $("#groupIdUsuario").addClass("has-error");
        validacion = false;
    }
    if ($("#contrasena").val() === "") {
        $("#groupContrasena").addClass("has-error");
        validacion = false;
    }
    if ($("#idUltUsuario").val() === "") {
        $("#groupUltUsuario").addClass("has-error");
        validacion = false;
    }
    if ($("#ultFechModif").data('date') === "") {
        $("#groupUltFechModif").addClass("has-error");
        validacion = false;
    }

    return validacion;
}

function enviar() {
    if (validar()) {
        //Se envia la información por ajax
        $.ajax({
            url: 'UsuarioServlet',
            data: {
                accion: $("#usuarioAction").val(),
                nombre: $("#nombre").val(),
                apellidos: $("#apellidos").val(),
                fechaNacimiento: $("#fechaNacimiento").data('date'),
                direccion: $("#direccion").val(),
                telefono: $("#telefono").val(),
                correo: $("#correo").val(),
                idUsuario: $("#idUsuario").val(),
                contrasena: $("#contrasena").val(),
                ultimoUsuario: $("#idUltUsuario").val(),
                ultimaFecha: $("#ultFechModif").data('date')
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
                    consultarUsuarios();
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