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
        <title>Mantenimiento de Vehículos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
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

        <!-- Script's de Vehiculos -->
        <script src="funciones/VehiculoJS.js" type="text/javascript"></script>
        
        <!-- JS Sweetalert -->
        <script src="funciones/sweetalert2.js" type="text/javascript"></script>
        
        <!-- CSS Sweetalert -->
        <link href="estilos/sweetalert2.css" rel="stylesheet" type="text/css"/>
        
    
    </head>
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
        <!-- Modal del BootsTrap para mostrar el formulario de insertar -->
        <!-- o modificar
        <!-- ********************************************************** -->
        <!-- ********************************************************** -->
        <div class="modal fade" id="myModalFormulario" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="myModalTitle">Insertar / Modificar Vehículos
                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <form role="form" onsubmit="return false;" id="formVehiculo">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group" id="groupIdVehiculo">
                                        <label for="idVehiculo">Identificador del Vehículo:</label>
                                        <input type="number" min="1" class="form-control" id="idVehiculo" autofocus="true" placeholder="Ingrese aquí el identificador del vehiculo">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group" id="groupAnno">
                                        <label for="anno">Año:</label>
                                        <input type="number" min="1986" class="form-control" id="anno" placeholder="Ingrese aquí el año del vehículo" >
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group" id="groupModelo">
                                        <label for="modelo">Modelo:</label>
                                        <input type="text" class="form-control" id="modelo" placeholder="Ingrese aquí el modelo del vehículo">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group" id="groupPlaca">
                                        <label for="placa">Placa:</label>
                                        <input type="text" class="form-control" id="placa" placeholder="Ingrese aquí la placa del vehículo">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group" id="groupColor">
                                        <label for="color">Color:</label>
                                        <input type="text" class="form-control" id="color" placeholder="Ingrese aquí el color del vehículo">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group" id="groupPuntuacion">
                                        <label for="puntuacion">Puntuación:</label>
                                        <input type="text" value="0" class="form-control" id="puntuacion" readonly="">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group" id="groupEstado">
                                        <label for="estado">Estado del vehículo en este momento:</label>
                                        <select class="form-control" id="estado">
                                            <option value="0" >No Activo</option>
                                            <option value="1" >Activo</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group" id="groupUbicacionActual">
                                        <label for="ubicacionActual">Ubicación actual:</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="ubicacionActual" placeholder="Ubicación física actual" readonly>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-map-marker" id="mapita"></span>
                                            </span>
                                        </div>
                                        <div class="form-control " id="map" action="javascript::initMap();"></div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group" id="groupIdChofer">
                                        <label for="chofer">Chofer asignado al vehículo:</label>
                                        <select class="form-control" id="chofer">
                                            <option value="0">Seleccione un Chofer</option>
                                        </select>
                                    </div>
                                </div>
                                <input type="hidden" class="form-control" id="ultimoUsuario" value="<%=usuario%>">
                            </div>
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input type="hidden" value="agregarVehiculo" id="vehiculoAction"/>
                                        <button type="submit" class="btn btn-success" id="enviar">Guardar</button>
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
                <h1><center>Mantenimiento de vehículos</center></h1>
            </div>
            
            <!-- PANEL DEL MANTENIMIENTO DE Vehiculo -->
            
            <div class="panel panel-primary">
                <div class="panel-body">
                    <center>
                        <button type="button" class="boton" data-toggle="modal" data-target="#myModalFormulario" id="btMostarForm">Insertar Vehiculo</button>
                    </center><br>
                    <!-- ********************************************************** -->
                    <div class="col-sm-12">
                        <form role="form" onsubmit="return false;" id="formVehiculo" class="form-horizontal centered">
                            <div class="form-group" id="groupBuscarIdVehiculo">
                                <div class="col-sm-4" style="text-align: right; vertical-align: middle;">
                                    <p><b>Buscar por id del vehículo</b></p>
                                </div>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="textoBuscar" placeholder="Digite el id del vehículo">
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
                        <table border="1" class="table table-hover table-condensed" id="tablaVehiculos"></table>
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
