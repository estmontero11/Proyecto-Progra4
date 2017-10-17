//******************************************************************************
// // Funcion para generar el datetimepicker
// Además de agregar los eventos a las respectivas etiquetas
//******************************************************************************
$(function () {
    //Genera el datapicker
    $('#dpFechaNacimiento').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    
    $('#dpFechaVencimiento').datetimepicker({
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
    consultarChoferes();
});

//******************************************************************************
//******************************************************************************
//metodos para consultas el listado de las personas
//******************************************************************************
//******************************************************************************

function consultarChoferes() {
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de los choferes en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: 'ChoferServlet',
        data: {
            accion: "consultarChoferes"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información de los choferes en la base de datos");
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
    $("#tablaChoferes").html(""); 
    
    //muestra el enzabezado de la tabla
    var head = $("<thead />");
    var row = $("<tr />");
    head.append(row);
    $("#tablaChoferes").append(head); 
    row.append($("<th><b>ID</b></th>"));
    row.append($("<th><b>NOMBRE</b></th>"));
    row.append($("<th><b>APELLIDOS</b></th>"));
    row.append($("<th><b>FEC. NACIMIENTO</b></th>"));
    row.append($("<th><b>FEC. VENCIMIENTO</b></th>"));
    row.append($("<th><b>TIPO LICENCIA</th>"));
    row.append($("<th><b>ESTADO</th>"));
    row.append($("<th><b>ES CLIENTE TRANSPORTISTA</th>"));
    
    //carga la tabla con el json devuelto
    for (var i = 0; i < dataJson.length; i++) {
        dibujarFila(dataJson[i]);
    }
}

function dibujarFila(rowData) {
    //Cuando dibuja la tabla en cada boton se le agrega la funcionalidad de cargar o eliminar la informacion
    //de una persona
    
    var row = $("<tr />");
    $("#tablaChoferes").append(row); 
    row.append($("<td>" + rowData.idChofer + "</td>"));
    row.append($("<td>" + rowData.nombre + "</td>"));
    row.append($("<td>" + rowData.apellidos + "</td>"));
    row.append($("<td>" + rowData.fechaNacimiento + "</td>"));
    row.append($("<td>" + rowData.fechaVencimiento + "</td>"));
    row.append($("<td>" + rowData.tipoLicencia + "</td>"));
    row.append($("<td>" + rowData.estado + "</td>"));
    row.append($("<td>" + rowData.esClienteTransportista + "</td>"));
    row.append($('<td><button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="consultarChoferById('+rowData.idChofer+');">'+
                        '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>'+
                    '</button>'+
                    '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="eliminarChofer('+rowData.idChofer+');">'+
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
            url: 'ChoferServlet',
            data: {
                accion: $("#choferAction").val(),
                id: $("#id").val(),
                nombre: $("#nombre").val(),
                apellidos: $("#apellidos").val(),
                fechaNacimiento: $("#dpFechaNacimiento").data('date'),
                fechaVencimiento: $("#dpFechaVencimiento").data('date'),
                tipoLicencia: $("#tipoLicencia").val(),
                estado: $("#estado").val(),
                esClienteTransportista: $("#esClienteTransportista").val()
            },
            error: function () { //si existe un error en la respuesta del ajax
                mostrarMensaje("alert alert-danger", "Se genero un error, contacte al administrador (Error del ajax)", "Error!");
            },
            success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
                var respuestaTxt = data.substring(2);
                var tipoRespuesta = data.substring(0, 2);
                if (tipoRespuesta === "C~") { //correcto
                    mostrarMensaje("alert alert-success", respuestaTxt, "Correcto!");
                    $("#myModalFormulario").modal("hide");
                    consultarChoferes();
                } else {
                    if (tipoRespuesta === "E~") { //error
                        mostrarMensaje("alert alert-danger", respuestaTxt, "Error!");
                    } else {
                        mostrarMensaje("alert alert-danger", "Se genero un error, contacte al administrador", "Error!");
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
    $("#groupId").removeClass("has-error");
    $("#groupNombre").removeClass("has-error");
    $("#groupApellidos").removeClass("has-error");
    $("#groupFechaNacimiento").removeClass("has-error");
    $("#groupFechaVencimiento").removeClass("has-error");
    $("#groupTipoLicencia").removeClass("has-error");
    $("#groupEstado").removeClass("has-error");
    $("#groupEsClienteTransportista").removeClass("has-error");

    //valida cada uno de los campos del formulario
    //Nota: Solo si fueron digitados
    if ($("#Id").val() === "") {
        $("#groupId").addClass("has-error");
        validacion = false;
    }
    if ($("#nombre").val() === "") {
        $("#groupNombre").addClass("has-error");
        validacion = false;
    }
    if ($("#apellidos").val() === "") {
        $("#groupApellidos").addClass("has-error");
        validacion = false;
    }
    if ($("#dpFechaNacimiento").data('date') === "") {
        $("#groupFechaNacimiento").addClass("has-error");
        validacion = false;
    }
    if ($("#dpFechaVencimiento").data('date') === "") {
        $("#groupFechaVencimiento").addClass("has-error");
        validacion = false;
    }

    return validacion;
}

//******************************************************************************
//******************************************************************************
//metodos para eliminar personas
//******************************************************************************
//******************************************************************************

function eliminarChofer(idChofer) {
    mostrarModal("myModal", "Espere por favor..", "Se esta eliminando a la persona seleccionada");
    //Se envia la información por ajax
    $.ajax({
        url: 'ChoferServlet',
        data: {
            accion: "eliminarChofer",
            idChofer: idChofer
        },
        error: function () { //si existe un error en la respuesta del ajax
            cambiarMensajeModal("myModal","Resultado acción","Se presento un error, contactar al administador");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            // se cambia el mensaje del modal por la respuesta del ajax
            var respuestaTxt = data.substring(2);
            var tipoRespuesta = data.substring(0, 2);
            if (tipoRespuesta === "E~") {
                cambiarMensajeModal("myModal","Resultado acción",respuestaTxt);
            }else{
                setTimeout(consultarChoferes, 3000);// hace una pausa y consulta la información de la base de datos
            }
        },
        type: 'POST',
        dataType: "text"
    });
}

//******************************************************************************
//******************************************************************************
//metodos para eliminar personas
//******************************************************************************
//******************************************************************************

function consultarChoferById(idChofer) {
    mostrarModal("myModal", "Espere por favor..", "Consultando la persona seleccionada");
    //Se envia la información por ajax
    $.ajax({
        url: 'ChoferServlet',
        data: {
            accion: "consultarChoferById",
            idChofer: idChofer
        },
        error: function () { //si existe un error en la respuesta del ajax
            cambiarMensajeModal("myModal","Resultado acción","Se presento un error, contactar al administador");
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
            $("#id").attr('readonly', 'readonly');
            
            //se modificar el hidden que indicar el tipo de accion que se esta realizando
            $("#choferAction").val("modificarChofer"); 
            
            //se carga la información en el formulario
            $("#id").val(data.idChofer);
            $("#nombre").val(data.nombre);
            $("#apellidos").val(data.apellidos);
            
            //carga de fecha
            var fechaNac = new Date(data.fechaNacimiento);
            var fechaTxtNac = fechaNac.getDate() +"/" +(fechaNac.getMonth()+1) + "/" + fechaNac.getFullYear();
            $("#dpFechaNacimiento").data({date: fechaTxtNac});
            $("#dpFechaNacimientoText").val(fechaTxtNac);
            
            var fechaVen = new Date(data.fechaVencimiento);
            var fechaTxtVen = fechaVen.getDate() +"/" +(fechaVen.getMonth()+1) + "/" + fechaVen.getFullYear();
            $("#dpFechaVencimiento").data({date: fechaTxtVen});
            $("#dpFechaVencimientoText").val(fechaTxtVen);
            
            $("#tipoLicencia").val(data.tipoLicencia);
            $("#estado").val(data.estado);
            $("#esClienteTransportista").val(data.esClienteTransportista);
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
    $('#id').focus();
    $("#id").removeAttr("readonly"); //elimina el atributo de solo lectura
    
    //se cambia la accion por agregarPersona
    $("#choferAction").val("agregarChofer"); 

    //esconde el div del mensaje
    mostrarMensaje("hiddenDiv", "", "");

    //Resetear el formulario
    $('#formChofer').trigger("reset");
}

//******************************************************************************
//Metodo de busqueda según el nombre
//******************************************************************************
function buscar(){
    var name = document.getElementById("textoBuscar").value;
    consultarPersonaByName(name);
}

function consultarPersonaByName(nameChofer) {
    mostrarModal("myModal", "Espere por favor..", "Consultando el chofer seleccionada");
    //Se envia la información por ajax
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de los choferes en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: 'ChoferServlet',
        data: {
            accion: "consultarChoferByName",
            nameChofer: nameChofer
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información de los choferes en la base de datos");
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