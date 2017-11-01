/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var swal;
$(function () {
    //Genera el datepicker
    $('#fechaNacimiento').datetimepicker({
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
    
    
    
    $("#enviar").click(function () {
        enviar();
        limpiarForm();
    });
});



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
                contrasena: $("#contrasena").val()
            },
            error: function () { //si existe un error en la respuesta del ajax
                swal ('Error', 'Se genero un error, contacte al administrador (Error del ajax)', 'error');
            },
            success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
                var respuestaTxt = data.substring(2);
                var tipoRespuesta = data.substring(0, 2);
                if (tipoRespuesta === "C~") {
                    swal('Correcto', "El usuario se creó correctamente", 'success');
                } else {
                    if (tipoRespuesta === "E~") {
                        swal('Error', "Ocurrió un error al crear el usuario", 'error');
                    } else {
                        swal('Error', 'Se genero un error, contacte al administrador', 'error');
                    }
                }

            },
            type: 'POST'
        });
    } else {
        swal('Error', "Debe digitar los campos del formulario", "error");
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

function limpiarForm() {
    //setea el focus del formulario
    $('#idUsuario').focus();
    $("#idUsuario").removeAttr("readonly"); //elimina el atributo de solo lectura
    
    //se cambia la accion por agregarPersona
    $("#usuarioAction").val("agregarUsuarios"); 

    //esconde el div del mensaje
    mostrarMensaje("hiddenDiv", "", "");

    //Resetear el formulario
    $('#formUsuario').trigger("reset");
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