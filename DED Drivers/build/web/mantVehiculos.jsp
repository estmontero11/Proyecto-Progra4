<%-- 
    Document   : mantVehiculos
    Created on : 17/10/2017, 02:45:35 AM
    Author     : esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mantenimiento de Vehiculos</title>
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

        <!-- Script's de Vehiculos -->
        <script src="funciones/VehiculoJS.js" type="text/javascript"></script>
        
        <!-- JS Sweetalert -->
        <script src="funciones/sweetalert2.js" type="text/javascript"></script>
        
        <!-- CSS Sweetalert -->
        <link href="estilos/sweetalert2.css" rel="stylesheet" type="text/css"/>
    
    </head>
    <header>
        <%@include file="navbar.jspf" %>
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
                        <h4 class="modal-title" id="myModalTitle">Insertar / Modificar Vehiculos
                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <form role="form" onsubmit="return false;" id="formVehiculo">
                            <div class="form-group" id="groupIdVehiculo">
                                <label for="idVehiculo">IdVehiculo:</label>
                                <input type="text" class="form-control" id="idVehiculo" autofocus="true" placeholder="IdVehiculo">
                            </div>

                            <div class="form-group" id="groupAnno">
                                <label for="anno">Anno:</label>
                                <input type="text" class="form-control" id="anno" placeholder="anno" >
                            </div>

                            <div class="form-group" id="groupModelo">
                                <label for="modelo">Modelo:</label>
                                <input type="text" class="form-control" id="modelo" placeholder="modelo">
                            </div>
                            
                            <div class="form-group" id="groupPlaca">
                                <label for="placa">Placa:</label>
                                <input type="text" class="form-control" id="placa" placeholder="placa">
                            </div>
                            
                            <div class="form-group" id="groupColor">
                                <label for="color">Color:</label>
                                <input type="text" class="form-control" id="color" placeholder="color">
                            </div>
                            
                            <div class="form-group" id="groupPuntuacion">
                                <label for="puntuacion">Puntuacion:</label>
                                <input type="text" class="form-control" id="puntuacion" placeholder="puntuacion">
                            </div>
                            
                            <div class="form-group" id="groupEstado">
                                <label for="estado">Estado (es el chofer del vehiculo):</label>
                                <select class="form-control" id="estado">
                                        <option value="0" selected="selected">No</option>
                                        <option value="1">Si</option>
                                </select>
                            </div>
                            
                            <div class="form-group" id="groupUbicacionActual">
                                <label for="ubicacionActual">Ubicacion Actual:</label>
                                <input type="text" class="form-control" id="ubicacionActual" placeholder="ubicacionActual">
                            </div>
                            
                            <div class="form-group" id="groupIdChofer">
                                <label for="idChofer">Id Chofer:</label>
                                <input type="text" class="form-control" id="idChofer" placeholder="idChofer">
                            </div>
                            
                            <div class="form-group">
                                <input type="hidden" value="agregarVehiculo" id="vehiculoAction"/>
                                <button type="submit" class="btn btn-primary" id="enviar">Guardar</button>
                                <button type="reset" class="btn btn-danger" id="cancelar">Cancelar</button>
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
                <h1><center>Modulo de mantenimiento de vehiculos</center></h1>
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
                                    <p><b>Buscar por id del Vehiculo</b></p>
                                </div>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="textoBuscar" placeholder="Digite el id del Vehiculo">
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

                    <table class="table table-hover table-condensed" id="tablaVehiculos"></table>
                </div>
            </div> 
        </div>
    </body>
    <div class="height38"></div>
    <footer>
        <%@include file="footer.jspf" %>
    </footer>
</html>
