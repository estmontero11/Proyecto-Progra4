<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>

<%

    HttpSession sesion = request.getSession(true);
    String tipoUsuario = "";
    if(sesion!=null){
        if (sesion.getAttribute("usuario")  == null) {
            tipoUsuario = "Invitado";
        }else{
            if(sesion.getAttribute("usuario") == "Administrador" || sesion.getAttribute("usuario") == "Normal"){
                response.sendRedirect("index.jsp");
            }else{
                tipoUsuario = (String)sesion.getAttribute("tipo");
            }
        }
    }else{
        tipoUsuario = "Invitado";
    }
%>

<html>
    <head>
        <title>DED Drivers</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
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
        
        <!--JS de Login--> 
        <script src="funciones/Login.js" type="text/javascript"></script>
        
    </head>
    <!--Titulo y Barra de navegacion-->
    <header>
        <%@include file="navbarInv.jspf" %>
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
        <div class="container cuerpo">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="page-header">
                        <h1><center>Login</center></h1>
                    </div>
                    <br/>
                    <form role="form" onsubmit="return false;" id="formLogin">
                        <div class="form-group" id="groupUsario">
                            <label for="cedula">Usuario:</label>
                            <input type="text" class="form-control" id="usuario" autofocus="true" placeholder="Usuario">
                        </div>

                        <div class="form-group" id="groupPassword">
                            <label for="nombre">Contraseña:</label>
                            <input type="password" class="form-control" id="contrasena" placeholder="Contraseña" >
                        </div>

                        <div class="form-group">
                            <input type="hidden" value="agregarPersona" id="personasAction"/>
                            <button type="submit" class="btn btn-success" id="enviar">Ingresar</button>
                            <button type="reset" class="btn btn-danger" id="cancelar">Cancelar</button>
                        </div>

                        <div class="form-group height25" >
                            <div class="alert alert-success hiddenDiv" id="mesajeResult">
                                <strong id="mesajeResultNeg">Info!</strong> 
                                <span id="mesajeResultText">Digite su usuario y contraseña para Iniciar Sesión</span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
        <div class="height60"></div>
    </body>
    
    <footer>
        <%@include file="footer.jspf" %>
    </footer>
</html>