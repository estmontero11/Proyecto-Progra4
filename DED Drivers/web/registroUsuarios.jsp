<%-- 
    Document   : RegistoUsuarios
    Created on : 17/10/2017, 03:48:13 PM
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrese</title>
        
        
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
       
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <link href="estilos/css.css" rel="stylesheet" type="text/css"/>
        
        <link href="estilos/datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <script src="funciones/datetimepicker.js" type="text/javascript"></script>
                
        
        
        <script src="funciones/utils.js" type="text/javascript"></script>
        <script src="funciones/UsuarioJS.js" type="text/javascript"></script>
        
        <!--Estilo de la fuente-->
        <link href="https://fonts.googleapis.com/css?family=Orbitron" rel="stylesheet"> 
        
        <link href="https://fortawesome.github.io/Font-Awesome/assets/font-awesome/css/font-awesome.css" rel="stylesheet">

      
 
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
        
        <h1 id="tituloRegistro" align="center" style="padding-top: 167px; font-family: 'Orbitron', sans-serif ">Ingrese sus datos.</h1>
        <br>
        <div class="container center_div">
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
                <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4" id="groupDireccion">
                    <label for="direccion">Dirección</label>
                    <div class="input-group">
                    <input type="text" class="form-control" id="direccion" placeholder="Ingrese su dirección física exacta">
                    <span class="input-group-addon">
                         <span class="glyphicon glyphicon-map-marker"></span>
                    </span>
                    </div>
                </div>
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
