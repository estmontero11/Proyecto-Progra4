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
            if(sesion.getAttribute("tipo") != "Transportista"){
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
        <title>Perfil</title>
        
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
        
        <!-- Script's de Transportista -->
        <script src="funciones/Transportista.js" type="text/javascript"></script>
 
        <!-- JS Sweetalert -->
        <script src="funciones/sweetalert2.js" type="text/javascript"></script>
        
        <!-- CSS Sweetalert -->
        <link href="estilos/sweetalert2.css" rel="stylesheet" type="text/css"/>
        
    </head> 
     <!--Titulo y Barra de navegacion-->    
    <header>
        <%@include file="navbarTransp.jspf" %>
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
        
        <h1 id="tituloRegistro" align="center">Perfil Chofer</h1>
        <br>
        <div class="container center_div" id="contenedorRegistro">
        <div class="row">      
            <form id="formUsuario" class="form-group" onsubmit="return false;">
                <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4" id="groupNombre">
                    <label for="usuario">Usuario</label>
                    <input type="text" class="form-control" id="usuario" value="<%=usuario%>">
                </div>  
                <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4" id="groupNombre">
                    <label for="nombre">Nombre</label>
                    <input type="text" class="form-control" id="nombre" placeholder="Ingrese su nombre">
                </div>  
                <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4" id="groupApellidos">
                    <label for="apellidos">Apellidos</label>
                    <input type="text" class="form-control" id="apellidos" placeholder="Ingrese sus apellidos">
                </div>
                <div class="clearfix"></div>
                <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4" id="groupFechaNacimiento">
                    <label for="fechaNacimiento">Fecha de nacimiento</label>
                    <div  id="fechaNacimiento" class="input-group date form_date" data-date="" data-date-format="dd/mm/yyyy" data-link-field="dtp_input2" data-link-format="dd/mm/yyyy">
                        <input class="form-control" type="text" value="" readonly placeholder="dd/mm/aaaa" id="fechaNacTxt">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
                <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4" id="groupFechaVencimiento">
                    <label for="fechaVencimiento">Fecha de vencimiento</label>
                    <div  id="fechaVencimiento" class="input-group date form_date" data-date="" data-date-format="dd/mm/yyyy" data-link-field="dtp_input2" data-link-format="dd/mm/yyyy">
                        <input class="form-control" type="text" value="" readonly placeholder="dd/mm/aaaa" id="fechaVenTxt">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
                <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4" id="groupFechaVencimiento">
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
                <div class="clearfix"></div>
                <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4"></div>
                <input type="hidden" value="modificarChofer" id="action"/>
                <div class="col-xs-10 col-sm-4 col-md-4 col-lg-4">
                    <button type="submit" class="btn btn-success" id="enviar">Actualizar información</button>
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
