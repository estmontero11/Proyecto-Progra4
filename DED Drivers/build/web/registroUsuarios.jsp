<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>

<%

    HttpSession sesion = request.getSession(true);
    String tipoUsuario = "";
    if(sesion!=null){
        if (sesion.getAttribute("usuario")  == null) {
            tipoUsuario = "Invitado";
        }else{
            tipoUsuario = (String)sesion.getAttribute("tipo");
        }
    }else{
        tipoUsuario = "Invitado";
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrese</title>
        
        <!--CSS LOCAL-->
        <link href="estilos/css.css" rel="stylesheet" type="text/css"/>
        
        <!--Estilo de Bootstrap-->
        <link href="estilos/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="estilos/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        
        <!--Estilo de la fuente-->
        <link href="https://fonts.googleapis.com/css?family=Orbitron" rel="stylesheet">
        <link href="https://fortawesome.github.io/Font-Awesome/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
        
        <!--Estilo de JQueryUI-->
        <link href="estilos/jquery-ui.css" rel="stylesheet" type="text/css"/>
        
        <!--JS de JQueryUI--> 
        <script src="funciones/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="funciones/jquery-ui.min.js" type="text/javascript"></script>
        
        <!--JS de Boostrap-->
        <script src="funciones/bootstrap.min.js" type="text/javascript"></script>
        
        <!-- Includes para el datapicker -->
        <link href="estilos/datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <script src="funciones/datetimepicker.js" type="text/javascript"></script>
        
        <!-- Script's de UTILERIAS -->
        <script src="funciones/utils.js" type="text/javascript"></script>
        
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDomGs0dCkbZbNVwNybUTcmtwAtDcNlm-A&callback=initMap" async defer></script>

        <!-- Script's de Usuarios -->
        <script src="funciones/UsuarioJS.js" type="text/javascript"></script>
 
        <!-- JS Sweetalert -->
        <script src="funciones/sweetalert2.js" type="text/javascript"></script>
        
        <!-- CSS Sweetalert -->
        <link href="estilos/sweetalert2.css" rel="stylesheet" type="text/css"/>
        
    </head> 
     <!--Titulo y Barra de navegacion-->
    <header>
        <% if(tipoUsuario.equals("Administrador")) { %>
            <%@include file="navbarAdm.jspf" %>
        <% } %>
        <% if(tipoUsuario.equals("Normal")) { %>
            <%@include file="navbarNorm.jspf" %>
        <% } %>
        <% if(tipoUsuario.equals("Invitado")) { %>
            <%@include file="navbarInv.jspf" %>
        <% } %>
        <% if(tipoUsuario.equals("Transportista")) { %>
            <%@include file="navbarTransp.jspf" %>
        <% } %>
    </header>
    <!--Termina titulo y barra de navegacion-->
    <body>
        
        <!-- ********************************************************** -->
        <!-- ********************************************************** -->
        <!-- Modal del BootsTrap para mostrar mensajes                  -->
        <!-- ********************************************************** -->
        <!-- ********************************************************** -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="myModalTitle">Modal Header</h4>
                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <p>This is a small modal.</p>
                    </div>
                </div>
            </div>
        </div>
         <!-- ********************************************************** -->
        <!-- ********************************************************** -->
        
        <h1 id="tituloRegistro" align="center">Ingrese sus datos.</h1>
        <br>
        <div class="container center_div" id="contenedorRegistro">
        <div class="row">      
            <form id="formUsuario" class="form-group" onsubmit="return false;">
                <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4" id="groupNombre">
                    <label for="nombre">Nombre</label>
                    <input type="text" class="form-control" id="nombre" placeholder="Ingrese su nombre">
                </div>  
                <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4" id="groupApellidos">
                    <label for="apellidos">Apellidos</label>
                    <input type="text" class="form-control" id="apellidos" placeholder="Ingrese sus apellidos">
                </div>
                <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4" id="groupFechaNacimiento">
                    <label for="fechaNacimiento">Fecha de nacimiento</label>
                    <div  id="fechaNacimiento" class="input-group date form_date" data-date="" data-date-format="dd/mm/yyyy" data-link-field="dtp_input2" data-link-format="dd/mm/yyyy">
                        <input class="form-control" type="text" value="" readonly placeholder="dd/mm/aaaa" id="fechaNacTxt">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4" id="groupTelefono">
                    <label for="telefono">Télefono/Celular</label>
                    <div class="input-group">
                    <input type="number" min="0"  class="form-control" id="telefono" placeholder="9999-9999">
                    <span class="input-group-addon">
                         <span class="glyphicon glyphicon-phone-alt"></span>
                    </span>
                    </div>
                </div>
                <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4" id="groupCorreo">
                    <label for="correo">Correo electrónico</label>
                    <div class="input-group">
                    <input type="email" class="form-control" id="correo" placeholder="ejemplo@hotmail.com">
                    <span class="input-group-addon">
                         <span class="glyphicon glyphicon-envelope"></span>
                    </span>
                    </div>
                </div>
                <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4" id="groupDireccion">
                    <label for="direccion">Dirección</label>
                    <div class="input-group">
                    <input type="text" class="form-control" id="direccion" placeholder="Ingrese su dirección física exacta" readonly>
                    <span class="input-group-addon" >
                         <span class="glyphicon glyphicon-map-marker" id="mapita" ></span>
                    </span>
                    </div>
                    <div class="form-control " id="map" action="javascript::initMap();"></div>
                </div>
                <div class="clearfix"></div>
                <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4" id="groupIdUsuario">
                    <label for="idUsuario">Usuario</label>
                    <div class="input-group">
                    <input type="text" class="form-control" id="idUsuario">
                    <span class="input-group-addon">
                         <span class="glyphicon glyphicon-user"></span>
                    </span>
                    </div>
                </div>
                <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4" id="groupContrasena">
                    <label for="contrasena">Contraseña</label>
                    <div class="input-group">
                    <input type="password" class="form-control" id="contrasena">
                    <span class="input-group-addon">
                         <span class="glyphicon glyphicon-qrcode"></span>
                    </span> 
                    </div>
                </div>
                <div class="clearfix"></div>
                <input type="hidden" value="agregarUsuarios" id="usuarioAction"/>
                <div class="col-xs-10 col-sm-4 col-md-4 col-lg-4">
                    <button type="submit" class="btn btn-success" id="enviar">Agregar usuario</button>
                    <button type="reset" class="btn btn-danger" id="cancelar">Cancelar información</button>
                </div>
                <br>
                <div class="form-group height25" >
                    <div class="alert alert-success hiddenDiv" id="mesajeResult">
                        <strong id="mesajeResultNeg">Info!</strong> 
                        <span id="mesajeResultText">This alert box could indicate a neutral informative change or action.</span>
                    </div>
                </div>
            </form>
        </div>
        </div>
    </body>
    <br><br>
    <footer>
        <%@include file="footer.jspf" %>
    </footer>
</html>
