
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
            if(sesion.getAttribute("tipo") != "Normal"){
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
        <title>Retroalimentacion</title>

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

        <!-- Script's de UTILERIAS -->
        <script src="funciones/utils.js" type="text/javascript"></script>

        <script src="funciones/RetroJS.js" type="text/javascript"></script>

        <!-- JS Sweetalert -->
        <script src="funciones/sweetalert2.js" type="text/javascript"></script>

        <!-- CSS Sweetalert -->
        <link href="estilos/sweetalert2.css" rel="stylesheet" type="text/css"/>



    </head>

    <header>
        <%@include file="navbarNorm.jspf" %>
    </header>

    <body>

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
        <br>
        <div  class="row" style="width: 1350px; padding-left: 10px;">           
            <div class="col-md-6">
                <h1 id="tituloRegistro">Retroalimentación del viaje.</h1>
                <br>
                <form class="form-group" id="formularioRetro" onsubmit="return false;" >
                    <div class="row">
                        <div class="col-md-7">
                            <div class="form-group" id="groupPuntuacion">
                                <label for="puntuacion">Puntuación del viaje es de <span id="count">0</span> estrella(s)</label>
                                <div id="hearts" class="starrr" style="color: #ee8b2d; font-size: 25px;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-7">
                            <div class="form-group" id="groupComentario">
                                <label for="comentario">Comentario.</label>
                                <textarea id="comentario" class="form-control" placeholder="Ingrese su comentario"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-10">
                            <div class="form-group">
                                <input type="hidden" value="agregarRetro" id="retroAction"/>
                                <button type="submit" class=" btn btn-success" id="enviar">Guardar Retroalimentación</button>
                                <button type="reset" class="btn btn-danger" id="cancelar">Cancelar Retroalimentación</button>
                            </div>
                        </div>
                    </div>
                    <input type="text" value="<%(String) session.getAttribute("modelo");%>" />
                </form>
            </div>
        </div>


    </body>
    <div style="height: 5px;"></div>
    <footer>
        <%@include file="footer.jspf" %>
    </footer>
</html>
