//******************************************************************************
// // Funcion para generar el datetimepicker
// Además de agregar los eventos a las respectivas etiquetas
//******************************************************************************

var info = [];
var max;
var min;
var inicio;

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

    //agrega los eventos las capas necesarias
    $("#enviar").click(function () {
        enviar();
    });
    
    $("#btMostarForm").click(function () {
        limpiarForm();
    });
});
//******************************************************************************
//Se ejecuta cuando la página esta completamente cargada
//******************************************************************************

$(document).ready(function (){
    usuario = $("#idUsuario").val();
    consultarPerfil(usuario);
});


//******************************************************************************
//******************************************************************************
//El metodo enviar funciona tanto para el insertar como para el modificar
//******************************************************************************
//******************************************************************************

function enviar() {
    if (validar()) {
        //Se envia la información por ajax
        $.ajax({
            url: 'UsuarioServlet',
            data: {
                accion: $("#action").val(),
                nombre: $("#nombre").val(),
                apellidos: $("#apellidos").val(),
                fechaNacimiento: $("#fechaNacimiento").data('date'),
                telefono: $("#telefono").val(),
                correo: $("#correo").val(),
                direccion: $("#direccion").val(),
                idUsuario: $("#idUsuario").val(), 
                contrasena: $("#contrasena").val(),
                tipoUsuario: $("#tipoUsuario").val(),
                ultimoUsuario: $("#idUsuario").val(),
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
    } else {
        mostrarMensaje("alert alert-danger", "Debe digitar los campos del formulario", "Error!");
    }
}

function validar() {
    var validacion = true;

    //Elimina estilo de error en los css
    //notese que es sobre el grupo que contienen el input
    $("#groupNombre").removeClass("has-error");
    $("#groupApellidos").removeClass("has-error");
    $("#groupFechaNacimiento").removeClass("has-error");
    $("#groupTelefono").removeClass("has-error");
    $("#groupCorreo").removeClass("has-error")
    $("#groupDireccion").removeClass("has-error");
    $("#groupIdUsuario").removeClass("has-error");
    $("#groupContraseña").removeClass("has-error");

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
    if ($("#telefono").data('date') === "") {
        $("#groupTelefono").addClass("has-error");
        validacion = false;
    }
    if ($("#correo").data('date') === "") {
        $("#groupCorreo").addClass("has-error");
        validacion = false;
    }
    if ($("#direccion").data('date') === "") {
        $("#groupDireccion").addClass("has-error");
        validacion = false;
    }
    if ($("#idUsuario").data('date') === "") {
        $("#groupIdUsuario").addClass("has-error");
        validacion = false;
    }
    if ($("#contraseña").data('date') === "") {
        $("#groupContraseña").addClass("has-error");
        validacion = false;
    }
    return validacion;
}

function consultarPerfil(idUsuario) {
    mostrarModal("myModal", "Espere por favor..", "Consultando la informacion del usuario");
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
            //carga información de la chofer en el formulario
            //************************************************************************
            $("#idUsuario").attr('readonly', 'readonly');
            
            $("#nombre").val(data.nombre);
            $("#apellidos").val(data.apellidos);
            
            //carga de fecha
            var fechaNac = new Date(data.fechaNacimiento);
            var fechaTxtNac = fechaNac.getDate() +"/" +(fechaNac.getMonth()+1) + "/" + fechaNac.getFullYear();
            $("#fechaNacimiento").data({date: fechaTxtNac});
            $("#fechaNacTxt").val(fechaTxtNac);
            
            $("#direccion").val(data.direccion);
            $("#telefono").val(data.telefonoTrabajo);
            $("#correo").val(data.correoElectronico);
            $("#idUsuario").val(data.idUsuario);
            $("#contrasena").val(data.contrasena);
            $("#tipoUsuario").val(data.tipoUsuario);
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
    
    //se cambia la accion por agregarChofer
    $("#choferAction").val("agregarChofer"); 

    //esconde el div del mensaje
    mostrarMensaje("hiddenDiv", "", "");

    //Resetear el formulario
    $('#formChofer').trigger("reset");
}