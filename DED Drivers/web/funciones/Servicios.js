/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var source, destination;
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();

$(function () {
    $(document).on("click", function (e) {
        if ($(e.target).is("#verRuta")) {
            $("#contenido1").show();
            GetRoute();
            consultarVehiculoLibre();
            
        }
    });

    $(document).on("click",function (e){
         if ($(e.target).is("#mostrarRetro")) {
             $("#retro").show();
             
         }
    });
    $("#enviar").click(function () {
        enviar();
    });
});

google.maps.event.addDomListener(window, 'load', function () {
    new google.maps.places.SearchBox(document.getElementById('txtSource'));
    new google.maps.places.SearchBox(document.getElementById('txtDestination'));
    directionsDisplay = new google.maps.DirectionsRenderer({'draggable': true});
});

function GetRoute() {
    var chepe = new google.maps.LatLng(9.92580694, -84.09072459999999);
    var mapOptions = {
        zoom: 7,
        center: chepe
    };
    map = new google.maps.Map(document.getElementById('dvMap'), mapOptions);
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById('dvPanel'));

    //*********DIRECTIONS AND ROUTE**********************//
    source = document.getElementById("txtSource").value;
    destination = document.getElementById("txtDestination").value;

    var request = {
        origin: source,
        destination: destination,
        travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function (response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        }
    });

    //*********DISTANCE AND DURATION**********************//
    var service = new google.maps.DistanceMatrixService();
    service.getDistanceMatrix({
        origins: [source],
        destinations: [destination],
        travelMode: google.maps.TravelMode.DRIVING,
        unitSystem: google.maps.UnitSystem.METRIC,
        avoidHighways: false,
        avoidTolls: false
    }, function (response, status) {
        if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {
            var distance = response.rows[0].elements[0].distance.text;
            var duration = response.rows[0].elements[0].duration.text;
            document.getElementById("distancia").value = distance;
            document.getElementById("duracion").value = duration;

        } else {
            alert("Unable to find the distance via road.");
        }
//        myFunction();
        calcularHoraMin();
    });

}

function addZero(i) {
    if (i < 10) {
        i = "0" + i;
    }
    return i;
}

function calcularHoraMin() {
    /*
     * Calcular fecha
     */
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1;
    var yyyy = today.getFullYear();

    if (dd < 10) {
        dd = '0' + dd;
    }

    if (mm < 10) {
        mm = '0' + mm;
    }

    document.getElementById("fechaRealizado").value = dd + "/" + mm + "/" + yyyy;
    //min =2
    //hora=1
    var num;
    var num2;
    var num3;
    var suma;
    var precio;
    var d = new Date();
    var h = addZero(d.getHours());
    var m = addZero(d.getMinutes());

    var x = document.getElementById("salida");
    x.value = h + ":" + m + " " + "am/pm";

    var duracion = $("#duracion").val();


    var llegada = document.getElementById("llegada");

    if (duracion.charAt(2) === 'm') {
        num = duracion.charAt(0);
        num2 = parseInt(num);
        precio = 180 * num2;
        document.getElementById("precio").value = precio;
        num3 = parseInt(m);
        suma = num3 + num2;

        if (suma >= 60) {
            num = parseInt(h);
            num2 = num + 1;
            num3 = suma - 60;
            if (num3 < 10) {
                llegada.value = num2 + ":" + "0" + num3 + " " + "am/pm";
            } else {
                llegada.value = num2 + ":" + num3 + " " + "am/pm";
            }

        } else {
            if (suma < 10) {
                llegada.value = h + ":" + "0" + suma + " " + "am/pm";

            } else {
                llegada.value = h + ":" + suma + " " + "am/pm";
            }
        }
    } else {
        if (duracion.charAt(3) === 'm') {
            num = duracion.substr(0, 2);
            num2 = parseInt(num);
            precio = 180 * num2;
            document.getElementById("precio").value = precio;
            num3 = parseInt(m);
            suma = num3 + num2;
            if (suma >= 60) {
                num = parseInt(h);
                num2 = num + 1;
                num3 = suma - 60;
                if (num3 < 10) {
                    llegada.value = num2 + ":" + "0" + num3 + " " + "am/pm";

                } else {
                    llegada.value = num2 + ":" + num3 + " " + "am/pm";
                }
            } else {
                llegada.value = h + ":" + suma + " " + "am/pm";
            }
        } else {
            if (duracion.charAt(1) === 'h') {
                num = duracion.charAt(0);
                num2 = parseInt(num);
                precio = 4000 * num2;
                document.getElementById("precio").value = precio;
                num3 = parseInt(h);
                suma = num3 + num2;
                if (suma > 24) {
                    num = suma - num3;
                    if (num < 10) {
                        llegada.value = "0" + num + ":" + m + " " + "am/pm";
                    } else {
                        llegada.value = num + ":" + m + " " + "am/pm";
                    }
                } else {
                    llegada.value = suma + ":" + m + " " + "am/pm";
                }
            }
        }
    }
}

function validar() {
    var validacion = true;

    //Elimina estilo de error en los css
    //notese que es sobre el grupo que contienen el input


    $("#groupSalida").removeClass("has-error");
    $("#groupLlegada").removeClass("has-error");
    $("#groupDistancia").removeClass("has-error");
    $("#groupHoraSalida").removeClass("has-error");
    $("#groupHoraLlegada").removeClass("has-error");
    $("#groupFechaRealizado").removeClass("has-error");
    $("#groupPrecio").removeClass("has-error");
    $("#groupNombreChofer").removeClass("has-error");
    $("#groupModelo").removeClass("has-error");
    $("#groupPlaca").removeClass("has-error");
    $("#groupColor").removeClass("has-error");
    $("#groupUbicacion").removeClass("has-error");

    $("#groupIdRetro").removeClass("has-error");
    $("#groupPuntuacion").removeClass("has-error");
    $("#groupComentario").removeClass("has-error");


    //valida cada uno de los campos del formulario
    //Nota: Solo si fueron digitados


    if ($("#txtSource").val() === "") {
        $("#groupSalida").addClass("has-error");
        validacion = false;
    }
    if ($("#txtDestination").val() === "") {
        $("#groupLlegada").addClass("has-error");
        validacion = false;
    }
    if ($("#distancia").val() === "") {
        $("#groupDistancia").addClass("has-error");
        validacion = false;
    }
    if ($("#salida").val() === "") {
        $("#groupHoraSalida").addClass("has-error");
        validacion = false;
    }
    if ($("#llegada").val() === "") {
        $("#groupHoraLlegada").addClass("has-error");
        validacion = false;
    }
    if ($("#duracion").val() === "") {
        $("#groupDuracion").addClass("has-error");
        validacion = false;
    }
    if ($("#fechaRealizado").val() === "") {
        $("#groupFechaRealizado").addClass("has-error");
        validacion = false;
    }
    if ($("#precio").val() === "") {
        $("#groupPrecio").addClass("has-error");
        validacion = false;
    }
    if ($("#nombreChofer").val() === "") {
        $("#groupNombreChofer").addClass("has-error");
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
    if ($("#ubicacion").val() === "") {
        $("#groupUbicacion").addClass("has-error");
        validacion = false;
    }
    if ($("#idRetro").val() === "") {
        $("#groupIdRetro").addClass("has-error");
        validacion = false;
    }
    if ($("#count").text() === "") {
        $("#groupPuntuacion").addClass("has-error");
        validacion = false;
    }
    if ($("#comentario").val() === "") {
        $("#groupComentario").addClass("has-error");
        validacion = false;
    }

    return validacion;
}

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
            swal('Error', 'Se presento un error, contactar al administrador', 'error');
            cambiarMensajeModal("myModal", "Resultado acción", "Se presento un error, contactar al administrador");
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
            $("#ubicacionActual").val(data.ubicacionActual);
            consultarChoferById(data.idChofer);

        },
        type: 'POST',
        dataType: "json"
    });
}

function consultarChoferes() {
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de los choferes en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: 'ChoferServlet',
        data: {
            accion: "consultarChoferes"
        },
        error: function () { //si existe un error en la respuesta del ajax
            swal('Error', 'Se presento un error a la hora de cargar la información de los choferes en la base de datos', 'error');
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            ocultarModal("myModal");
            info = data;
            var chofer = document.getElementById("chofer");
            for (value in info) {
                var option = document.createElement("option");
                option.text = info[value].nombre + " " + info[value].apellidos + " " + info[value].idChofer;
                chofer.add(option);
            }
        },
        type: 'POST',
        dataType: "json"
    });
}

function consultarChoferById(idChofer) {
    //Se envia la información por ajax
    $.ajax({
        url: 'ChoferServlet',
        data: {
            accion: "consultarChoferById",
            idChofer: idChofer
        },
        error: function () { //si existe un error en la respuesta del ajax
            ocultarModal("myModal");
            swal('Error', 'Se presento un error, contactar al administrador', 'error');
            cambiarMensajeModal("myModal", "Resultado acción", "Se presento un error, contactar al administrador");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data            
            //se carga la información en el formulario
            $("#chofer").val(data.nombre);
        },
        type: 'POST',
        dataType: "json"
    });
}

function consultarChoferById(idChofer) {
    //Se envia la información por ajax
    $.ajax({
        url: 'ChoferServlet',
        data: {
            accion: "consultarChoferById",
            idChofer: idChofer
        },
        error: function () { //si existe un error en la respuesta del ajax
            ocultarModal("myModal");
            swal('Error', 'Se presento un error, contactar al administrador', 'error');
            cambiarMensajeModal("myModal", "Resultado acción", "Se presento un error, contactar al administrador");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data            
            //se carga la información en el formulario
            $("#nombreChofer").val(data.nombre);
        },
        type: 'POST',
        dataType: "json"
    });
}


function consultarVehiculoLibre() {
    //Se envia la información por ajax
    var data1;
    $.ajax({
        url: 'ServiciosServlet',
        data: {
            accion: "consultarVehiculoLibre"
        },
        error: function () { //si existe un error en la respuesta del ajax
            swal('Error', 'Se presento un error, contactar al administrador', 'error');
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            data1 = data[0];
            //$("nombreChofer").val(data.nameChofer);
            $("#modelo").val(data1.modelo);
            $("#placa").val(data1.placa);
            $("#color").val(data1.color);


            $("#ubicacion").val(data1.ubicacionActual);
            consultarChoferById(data1.idChofer);

        },
        type: 'POST',
        dataType: "json"
    });
}

function enviar() {
        var input = document.getElementById("count");
        var puntuacion=input.innerHTML;
        //Se envia la información por ajax
        $.ajax({
            url: 'ServiciosServlet',
            
            data: {
                accion: $("#accion").val(),
                salida: $("#txtSource").val(),
                llegada: $("#txtDestination").val(),
                duracion: obtenerDuracion(),
                horaSalida: obtenerHoraSalida(),
                horaLlegada: obtenerHoraLlegada(),
                fechaRealizado: $("#fechaRealizado").val(),
                precio: $("#precio").val(),
                puntuacion: puntuacion,
                comentario: $("#comentario").val(),
                ultimoUsuario: $("#ultimoUsuario").val()
            },
            error: function () { //si existe un error en la respuesta del ajax
                swal('Error', 'Se genero un error, contacte al administrador (Error del ajax)', 'error');
            },
            success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
                var respuestaTxt = data.substring(2);
                var tipoRespuesta = data.substring(0, 2);
                if (tipoRespuesta === "C~") { //correcto
                    swal('Correcto', respuestaTxt, 'success');
                } else {
                    if (tipoRespuesta === "E~") { //error
                        swal('Error', respuestaTxt, 'error');
                    } else {
                        swal('Error', 'Se genero un error, contacte al administrador', 'error');
                    }
                }

            },
            type: 'POST',
            dataType: "text"
        });
}

function obtenerHoraSalida(){
    var horaSalida = $("#salida").val();
    var textoSalida = "";
    for (var i=0; i<horaSalida.length; i++){
        if(horaSalida.substr(i,1)===" "){
            return textoSalida;
        }else{
            textoSalida = textoSalida + horaSalida.substr(i,1) ;
        }
    }
};

function obtenerHoraLlegada(){
    var horaLlegada = $("#llegada").val();
    var textoLlegada = "";
    for (var i=0; i<horaLlegada.length; i++){
        if(horaLlegada.substr(i,1)===" "){
            return textoLlegada;
        }else{
            textoLlegada = textoLlegada + horaLlegada.substr(i,1) ;
        }
    }
};

function obtenerDuracion(){
    var duracion = $("#duracion").val();
    var textoDuracion = "";
    for (var i=0; i<duracion.length; i++){
        if(duracion.substr(i,1)===" "){
            return textoDuracion;
        }else{
            textoDuracion = textoDuracion + duracion.substr(i,1) ;
        }
    }
};