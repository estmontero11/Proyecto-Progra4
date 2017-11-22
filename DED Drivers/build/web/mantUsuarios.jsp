<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>

<%
    HttpSession sesion = request.getSession(true);
    String tipoUsuario = "";
    String usuario ="";
    if(sesion!=null){
        if (sesion.getAttribute("usuario")  == null) {
            response.sendRedirect("LoginJSP.jsp");
        }else{
            if(sesion.getAttribute("tipo") != "Administrador"){
                response.sendRedirect("index.jsp");
            }else{
                tipoUsuario = (String)sesion.getAttribute("tipo");
                usuario = (String)sesion.getAttribute("usuario");
            }
        }
    }else{
        response.sendRedirect("LoginJSP.jsp");
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Usuarios</title>
         <!--CSS LOCAL-->
        <link href="estilos/css.css" rel="stylesheet" type="text/css"/>

        <!--Estilo de Bootstrap-->
        <link href="estilos/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="estilos/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>

        <!--Estilo de la fuente-->
        <link href="https://fonts.googleapis.com/css?family=Orbitron" rel="stylesheet"> 
        <link href="https://fortawesome.github.io/Font-Awesome/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">

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
        
        <!--Script de paginacion-->
        <script src="funciones/jquery.twbsPagination.js" type="text/javascript"></script>
        
        <!--Script de mapa-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDomGs0dCkbZbNVwNybUTcmtwAtDcNlm-A&callback=initMap" async defer></script>

        <!-- Script's de Usuarios -->
        <script src="funciones/UsuariosJS.js" type="text/javascript"></script>
        
        <!-- JS Sweetalert -->
        <script src="funciones/sweetalert2.js" type="text/javascript"></script>  
        
        <!-- CSS Sweetalert -->
        <link href="estilos/sweetalert2.css" rel="stylesheet" type="text/css"/>
               
    </head>
    
    <header>
        <%@include file="navbarAdm.jspf" %>
    </header>
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
        <!-- ********************************************************** -->

        <!-- ********************************************************** -->
        <!-- ********************************************************** -->
        <!-- Modal del BootsTrap para mostrar el formulario de insertar -->
        <!-- o modificar
        <!-- ********************************************************** -->
        <!-- ********************************************************** -->
        <div class="modal fade" id="myModalFormulario" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="myModalTitle">Insertar / Modificar Usuarios
                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <form role="form" onsubmit="return false;" id="formUsuario">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group" id="groupNombre">
                                        <label for="nombre">Nombre:</label>
                                        <input type="text" class="form-control" id="nombre" autofocus="true" placeholder="Ingrese su nombre">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group" id="groupApellidos">
                                        <label for="apellidos">Apellidos:</label>
                                        <input type="text" class="form-control" id="apellidos" placeholder="Ingrese sus apellidos" >
                                    </div>
                                </div>
                                <div class="col-md-4"> 
                                    <div class="form-group" id="groupFechaNacimiento">
                                        <label for="fechaNacimiento">Fecha Nacimiento:</label>
                                        <div id="fechaNacimiento" class="input-group date form_date" data-date="" data-date-format="dd/mm/yyyy" data-link-field="dtp_input2" data-link-format="dd/mm/yyyy">
                                            <input class="form-control" type="text" value="" readonly placeholder="dd/mm/aaaa" id="fechaNacimientoTxt">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group" id="groupDireccion">
                                        <label for="direccion">Dirección:</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="direccion" placeholder="Ingrese su dirección física exacta" readonly>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-map-marker" id="mapita"></span>
                                            </span>
                                        </div>
                                        <div class="form-control " id="map" action="javascript::initMap();"></div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group" id="groupTelefono">
                                        <label for="telefono">Télefono/Celular:</label>
                                        <div class="input-group">
                                            <input type="number" min="0" class="form-control" id="telefono" placeholder="99999999">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-phone-alt"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group" id="groupCorreo">
                                        <label for="correo">Correo electrónico:</label>
                                        <div class="input-group">
                                            <input type="email" class="form-control" id="correo" placeholder="ejemplo@hotmail.com">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-envelope"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group" id="groupIdUsuario">
                                        <label for="idUsuario">Usuario:</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="idUsuario">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-usuario"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group" id="groupContrasena">
                                        <label for="contrasena">Contraseña:</label>
                                        <div class="input-group">
                                            <input  type="text" class="form-control" id="contrasena">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-qrcode"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group" id="groupTipoUsuario">
                                        <label for="tipoUsuario">Tipo de usuario:</label>
                                        <select class="form-control" id="tipoUsuario">
                                            <option value="0" >Administrador</option>
                                            <option value="1" >Usuario</option>
                                            <option value="2" >Transportista</option>
                                        </select>
                                    </div>
                                </div>
                                <input type="hidden" class="form-control" id="ultimoUsuario" value="<%=usuario%>">
                            </div>
                            <div class="row"> 
                                <div class="col-md-4"></div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input type="hidden" value="agregarUsuarios2" id="usuarioAction"/>
                                        <button type="submit" class=" btn btn-success" id="enviar">Guardar</button>
                                        <button type="reset" class="btn btn-danger" id="cancelar">Cancelar</button>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group height25" >
                                <div class="alert alert-success hiddenDiv" id="mesajeResult">
                                    <strong id="mesajeResultNeg">Info!</strong> 
                                    <span id="mesajeResultText">This alert box could indicate a neutral informative change or action.</span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- ********************************************************** -->
        <!-- ********************************************************** -->
        <!-- ********************************************************** -->
        
        <div class="container cuerpo">
            <div class="page-header">
                <h1><center>Mantenimiento de usuarios.</center></h1>
            </div>
            <!-- PANEL DEL MANTENIMIENTO DE Choferes -->
            
            <div class="panel panel-primary">
                <div class="panel-body">
                    <center>
                        <button type="button" class="boton" data-toggle="modal" data-target="#myModalFormulario" id="btMostarForm">Insertar Usuario</button>
                    </center><br>
                    <!-- ********************************************************** -->
                    <div class="col-sm-12">
                        <form role="form" onsubmit="return false;" id="formUsuario" class="form-horizontal centered">
                            <div class="form-group" id="groupBuscarNombre">
                                <div class="col-sm-4" style="text-align: right; vertical-align: middle;">
                                    <p><b>Buscar por nombre del usuario:</b></p>
                                </div>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="textoBuscar" placeholder="Digite el nombre del usuario">
                                </div>
                                <div class="col-sm-4">
                                    <button type="button" class="boton" id="buscar">
                                        Buscar <span class="glyphicon glyphicon-search"></span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- ********************************************************** -->
                    
                    <div class="container-fluid table-responsive" style="overflow-x: auto;">
                        <table border="1" class="table table-hover table-condensed" id="tablaUsuarios"></table>
                    </div>
                    
                    <nav aria-label="Page navigation" id="mio">
                        <ul class="pagination" id="pagination"></ul>
                    </nav>
                    
                </div>
            </div> 
        </div>    
    </body>
    <div class="height20"></div>
    <footer>
        <%@include file="footer.jspf" %>
    </footer>
</html>
