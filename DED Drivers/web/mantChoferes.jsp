<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Mantenimiento de choferes</title>
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

        <!-- Script's de Choferes -->
        <script src="funciones/ChoferJS.js" type="text/javascript"></script>
        
        <!-- JS Sweetalert -->
        <script src="funciones/sweetalert2.js" type="text/javascript"></script>
        
        <!-- CSS Sweetalert -->
        <link href="estilos/sweetalert2.css" rel="stylesheet" type="text/css"/>
            
    </head>
    <!--Titulo y Barra de navegacion-->
    <header>
        <%@include file="navbar.jspf" %>
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
        <!-- Modal del BootsTrap para mostrar el formulario de insertar -->
        <!-- o modificar
        <!-- ********************************************************** -->
        <!-- ********************************************************** -->
        <div class="modal fade" id="myModalFormulario" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="myModalTitle">Insertar / Modificar Choferes
                    </div>
                    <div class="modal-body" id="myModalMessage">
                  <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group" id="groupId">
                                        <label for="cedula">Cédula del chofer:</label>
                                        <input type="text" class="form-control" id="id" autofocus="true" placeholder="Ingrese aquí la cédula del chofer">
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group" id="groupNombre">
                                        <label for="nombre">Nombre:</label>
                                        <input type="text" class="form-control" id="nombre" placeholder="Ingrese aquí el nombre del chofer" >
                                    </div>
                                </div >
                                <div class="col-md-4">
                                    <div class="form-group" id="groupApellidos">
                                        <label for="apellidos">Apellidos:</label>
                                        <input type="text" class="form-control" id="apellidos" placeholder="Ingrese aquí los apellidos del chofer">
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-4"> 
                                    <div class="form-group" id="groupFechaNacimiento">
                                        <label for="dpFechaNacimiento">Fecha Nacimiento:</label>
                                        <div id="dpFechaNacimiento" class="input-group date form_date" data-date="" data-date-format="dd/mm/yyyy" data-link-field="dtp_input2" data-link-format="dd/mm/yyyy">
                                            <input class="form-control" type="text" value="" readonly placeholder="dd/mm/aaaa" id="dpFechaNacimientoText">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group" id="groupFechaVencimiento">
                                        <label for="dpFechaVencimiento">Fecha Vencimiento:</label>
                                        <div id="dpFechaVencimiento" class="input-group date form_date" data-date="" data-date-format="dd/mm/yyyy" data-link-field="dtp_input2" data-link-format="dd/mm/yyyy">
                                            <input class="form-control" type="text" value="" readonly placeholder="dd/mm/aaaa" id="dpFechaVencimientoText">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group" id="groupTipoLicencia">
                                        <label for="tipoLicencia">Tipo Licencia:</label>
                                        <select class="form-control" id="tipoLicencia">
                                            <option value="B1" selected="selected">B1</option>
                                            <option value="B2">B2</option>
                                            <option value="B3">B3</option>
                                            <option value="B4">B4</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group" id="groupEstado">
                                        <label for="estado">Estado (es el chofer del vehiculo):</label>
                                        <select class="form-control" id="estado">
                                            <option value="0" selected="selected">No</option>
                                            <option value="1">Si</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group" id="groupEsClienteTransportista">
                                        <label for="esClienteTransportista">Es Cliente Transportista:</label>
                                        <select class="form-control" id="esClienteTransportista">
                                            <option value="NO" selected="selected">No</option>
                                            <option value="SI">Si</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row"> 
                                <div class="col-md-4"></div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input type="hidden" value="agregarChofer" id="choferAction"/>
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
                <h1><center>Módulo de mantenimiento de choferes</center></h1>
            </div>
            <!-- PANEL DEL MANTENIMIENTO DE Choferes -->
            
            <div class="panel panel-primary">
                <div class="panel-body">
                    <center>
                        <button type="button" class="boton" data-toggle="modal" data-target="#myModalFormulario" id="btMostarForm">Insertar Chofer</button>
                    </center><br>
                    <!-- ********************************************************** -->
                    <div class="col-sm-12">
                        <form role="form" onsubmit="return false;" id="formChofer" class="form-horizontal centered">
                            <div class="form-group" id="groupBuscarCedula">
                                <div class="col-sm-4" style="text-align: right; vertical-align: middle;">
                                    <p><b>Buscar por nombre del chofer:</b></p>
                                </div>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="textoBuscar" placeholder="Digite el nombre del chofer">
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

                    <table class="table table-hover table-condensed" id="tablaChoferes"></table>
                </div>
            </div> 
        </div>
    </body>
    <div class="height38"></div>
    <footer>
        <%@include file="footer.jspf" %>
    </footer>
</html>
