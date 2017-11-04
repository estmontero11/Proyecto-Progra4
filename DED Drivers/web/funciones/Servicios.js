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
        }
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
    
    document.getElementById("fechaRealizado").value= dd + "/" + mm + "/" + yyyy;
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
        precio= 180*num2;
        document.getElementById("precio").value= precio;
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
            precio= 180*num2;
            document.getElementById("precio").value= precio;
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
                precio= 4000*num2;
                document.getElementById("precio").value= precio;
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
    if ($("#distancia").val()=== "") {
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


    return validacion;
}

