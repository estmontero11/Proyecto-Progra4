/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var info = [];
var max;
var min;
var inicio;



$(function () {
    
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
    row.append($("<th><b>TIPO USUARIO</b></th>"));
    row.append($("<th><b>ULT.USU.MODIF</b></th>"));
    row.append($("<th><b>ULT.FEC.MODIF</b></th>"));
    row.append($("<th><b>ACCIÓN</b></th>"));
    
    for (var i = 1; i < 11; i++) {
        var row = $("<tr />");
        row.addClass("page" + i);
        $("#tablaUsuarios").append(row);
    }  
    
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

    $(document).on("click", function (e) {
        if ($(e.target).is("#direccion")){
            $("#map").show();
            initMap();        
        }else {
            if ($(e.target).is("#mapita")){
                $("#map").hide();
            }
        }
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


function calcularTamaño() {
    return Math.ceil(info.length / 10);
};

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
            swal ('Error','Se presento un error a la hora de cargar la información de los usuarios en la base de datos', 'error');
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            ocultarModal("myModal");
            info = data;
            $('#mio').html("<ul class='pagination' id='pagination'></ul>");
            $('#pagination').twbsPagination({
                totalPages: calcularTamaño(),
                visiblePages: 5,
                onPageClick: function (event, page) {
                    max = page * 10;
                    min = max - 10;
                    inicio = 1;
                    for (var i = 1; i < 11; i++) {
                        $('.page' + inicio).html("");
                        inicio++;
                    }
                    inicio = 1;
                    for (var j = min; j < max; j++) {
                        if (info[j] == null) {
                            break;
                        }
                        dibujarFila('.page' + inicio, info[j]);
                        inicio++;
                    }
                }
            });
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
    row.append($("<th><b>TIPO USUARIO</b></th>"));
    row.append($("<th><b>ULT.USU.MODIF</b></th>"));
    row.append($("<th><b>ULT.FEC.MODIF</b></th>"));
    row.append($("<th><b>ACCIÓN</b></th>"));
    
    //carga la tabla con el json devuelto
    for (var i = 0; i < dataJson.length; i++) {
        dibujarFila(dataJson[i]);
    }
}

function dibujarFila(page, rowData) {
    //Cuando dibuja la tabla en cada boton se le agrega la funcionalidad de cargar o eliminar la informacion
    //de una chofer
    
    var row = $(page);
    $("#tablaUsuarios").append(row); 
    row.append($("<td>" + rowData.nombre + "</td>"));
    row.append($("<td>" + rowData.apellidos + "</td>"));
    row.append($("<td>" + rowData.fechaNacimiento + "</td>"));
    row.append($("<td>" + rowData.direccion + "</td>"));
    row.append($("<td>" + rowData.telefonoTrabajo + "</td>"));
    row.append($("<td>" + rowData.correoElectronico + "</td>"));
    row.append($("<td>" + rowData.idUsuario + "</td>"));
    row.append($("<td>" + rowData.contrasena + "</td>"));
    row.append($("<td>" + rowData.tipoUsuario + "</td>"));
    
    if(rowData.ultimoUsuario===undefined){
        row.append($("<td>No asignado</td>"));
    }
    else{
        row.append($("<td>" + rowData.ultimoUsuario + "</td>"));
    }
    
    if(rowData.ultimaFecha===undefined){
        row.append($("<td>No asignado</td>"));
    }
    else{
        row.append($("<td>" + rowData.ultimaFecha + "</td>"));
    }
    row.append($('<td><button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="consultarUsuarioById(\''+rowData.idUsuario+'\');">'+
                        '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>'+
                    '</button>'+
                    '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="eliminarUsuario(\''+rowData.idUsuario+'\');">'+
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
    $("#groupTipoUsuario").removeClass("has-error");
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
                tipoUsuario: $("#tipoUsuario").val(),
                ultimoUsuario: $("#ultimoUsuario").val()
            },
            error: function () { //si existe un error en la respuesta del ajax
                swal('Error', 'Se genero un error, contacte al administrador (Error del ajax)', 'error');
            },
            success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
                var respuestaTxt = data.substring(2);
                var tipoRespuesta = data.substring(0, 2);
                if (tipoRespuesta === "C~") { //correcto
                    swal('Correcto',"Se agregó correctamente el usuario", 'success');
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

//******************************************************************************
//******************************************************************************
//metodos para eliminar chofers
//******************************************************************************
//******************************************************************************

function eliminarUsuario(idUsuario) {
    swal({
        title: 'Alerta',
        text: "¿Está seguro que quiere eliminar este chofer?",
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
        mostrarModal("myModal", "Espere por favor..", "Se esta eliminando a el usuario seleccionada");  
        //Se envia la información por ajax
        $.ajax({
            url: 'UsuarioServlet',
            data: {
                accion: "eliminarUsuario",
                idUsuario: idUsuario
            },
            error: function () { //si existe un error en la respuesta del ajax
                ocultarModal("myModal");
                swal('Error', 'Se presento un error, contactar al administrador', 'error');
            },
            success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
                // se cambia el mensaje del modal por la respuesta del ajax
                var respuestaTxt = data.substring(2);
                var tipoRespuesta = data.substring(0, 2);
                ocultarModal("myModal");
                if (tipoRespuesta === "E~") {
                    cambiarMensajeModal("myModal","Resultado acción",respuestaTxt);
                }else{            
                    setTimeout(consultarUsuarios, 1000);// hace una pausa y consulta la información de la base de datos   
                    swal('Correcto', 'El usuario se ha eliminado correctamente', 'success');
                }
            },
            type: 'POST',
            dataType: "text"
        });
    }, function (dismiss) {
        if (dismiss === 'cancel') {
          swal('Cancelado','No se ha eliminado el usuario','error');
        }
    });
}

//******************************************************************************
//******************************************************************************
//metodos para eliminar choferes
//******************************************************************************
//******************************************************************************

function consultarUsuarioById(idUsuario) {
    mostrarModal("myModal", "Espere por favor..", "Consultando el usuario seleccionado");
    //Se envia la información por ajax
    $.ajax({
        url: 'UsuarioServlet',
        data: {
            accion: "consultarUsuarioById",
            idUsuario: idUsuario
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
            //carga información del usuario en el formulario
            //************************************************************************
            //se indicar que la cédula es solo readOnly
            $("#idUsuario").attr('readonly', 'readonly');
            
            //se modificar el hidden que indicar el tipo de accion que se esta realizando
            $("#usuarioAction").val("modificarUsuario"); 
            
            //se carga la información en el formulario
            $("#nombre").val(data.nombre);
            $("#apellidos").val(data.apellidos);
       
            //carga de fecha
            var fechaNac = new Date(data.fechaNacimiento);
            var fechaTxtNac = fechaNac.getDate() +"/" +(fechaNac.getMonth()+1) + "/" + fechaNac.getFullYear();
            $("#fechaNacimiento").data({date: fechaTxtNac});
            $("#fechaNacimientoTxt").val(fechaTxtNac);
            
            $("#direccion").val(data.direccion);
            $("#telefono").val(data.telefonoTrabajo);
            $("#correo").val(data.correoElectronico);
            $("#idUsuario").val(data.idUsuario);
            $("#contrasena").val(data.contrasena);
            $("#tipoUsuario").val(data.tipoUsuario);
            $("#idUltUsuario").val(data.ultimoUsuario);
            
            var fechaNac2 = new Date(data.ultimaFecha);
            var fechaTxtNac2 = fechaNac2.getDate() +"/" +(fechaNac2.getMonth()+1) + "/" + fechaNac2.getFullYear();
            $("#ultFechModif").data({date: fechaTxtNac2});
            $("#ultFechModifTxt").val(fechaTxtNac2);
        },
        type: 'POST',
        dataType: "json"
    });
}

function limpiarForm() {
    //setea el focus del formulario
    $('#idUsuario').focus();
    $("#idUsuario").removeAttr("readonly"); //elimina el atributo de solo lectura
    
    //se cambia la accion por agregarChofer
    $("#usuarioAction").val("agregarUsuarios2"); 

    //esconde el div del mensaje
    mostrarMensaje("hiddenDiv", "", "");

    //Resetear el formulario
    $('#formUsuario').trigger("reset");
}

function buscar(){
    var name = document.getElementById("textoBuscar").value;
    consultarUsuarioByName(name);
}

function consultarUsuarioByName(nameUsuario) {
    mostrarModal("myModal", "Espere por favor..", "Consultando el usuario seleccionado");
    //Se envia la información por ajax
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de los usuarios en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: 'UsuarioServlet',
        data: {
            accion: "consultarUsuarioByName",
            nameUsuario: nameUsuario
        },
        error: function () { //si existe un error en la respuesta del ajax
            swal('Error', 'Se presento un error a la hora de cargar la información de los choferes en la base de datos', 'error');
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            ocultarModal("myModal");
            info = data;
            $('#mio').html("<ul class='pagination' id='pagination'></ul>");
            $('#pagination').twbsPagination({
                totalPages: calcularTamaño(),
                visiblePages: 5,
                onPageClick: function (event, page) {
                    max = page * 10;
                    min = max - 10;
                    inicio = 1;
                    for (var i = 1; i < 11; i++) {
                        $('.page' + inicio).html("");
                        inicio++;
                    }
                    inicio = 1;
                    for (var j = min; j < max; j++) {
                        if (info[j] == null) {
                            break;
                        }
                        dibujarFila('.page' + inicio, info[j]);
                        inicio++;
                    }
                }
            });
        },
        type: 'POST',
        dataType: "json"
    });
}

function initMap() {
    var uluru = {lat: 10.0000000, lng: -84.0000000};
    var map = new google.maps.Map(document.getElementById("map"), {
        zoom: 4,
        center: uluru
    });
    var marker = new google.maps.Marker({position: uluru, map: map, title: 'Click to zoom'});
    marker.addListener('click', function () {
        map.setZoom(8);
        marker.setPosition(uluru);
        map.setCenter(marker.getPosition());
    });
    google.maps.event.addListener(map, 'click', function (e) {
        placeMarker(e.latLng, map, marker);
    });
}
function placeMarker(position, map, marker) {
    var geocoder = new google.maps.Geocoder;
    var infowindow = new google.maps.InfoWindow({
        content: 'An InfoWindow'
    });
    infowindow.close();
    marker.setPosition(position);
    geocodeLatLng(geocoder, map, infowindow, position, marker);
    map.panTo(position);
}
function geocodeLatLng(geocoder, map, infowindow, position, marker) {
    geocoder.geocode({'location': position}, function (results, status) {
        if (status === 'OK') {
            if (results[1]) {
                infowindow.setContent(results[0].formatted_address);
                infowindow.open(map, marker);
                document.getElementById("direccion").value = results[0].formatted_address;
            } else {
                window.alert('No results found');
            }
        } else {
            window.alert('Geocoder failed due to: ' + status);
        }
    });
}