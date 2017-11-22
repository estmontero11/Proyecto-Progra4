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
        <title>Solicitar Servicio</title>

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

        <!--JS del mapa-->
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDomGs0dCkbZbNVwNybUTcmtwAtDcNlm-A&sensor=false&libraries=places"></script>

        <!--JS de retro-->
        <script src="funciones/RetroJS.js" type="text/javascript"></script>
        
        <!--JS de Servicios-->
        <script src="funciones/Servicios.js" type="text/javascript"></script>
        
        <link href="estilos/sweetalert2.css" rel="stylesheet" type="text/css"/>

    </head>
    <header>
        <%@include file="navbarNorm.jspf" %>
    </header>

    <body>
        <br>
        <h1 id="tituloRegistro"><center>Solicite su servicio.</center></h1>
        <br>

        <form class="form-group" id="formularioServicio" onsubmit="return false;">
            <div class="row" style="width: 980px;">
                <div class="col-md-3 col-md-offset-5">
                    <div class="form-group" id="groupSalida">
                        <label for="txtSource">Salida:</label>
                        <input class="form-control" type="text" id="txtSource" value="">
                    </div>
                </div>
                <div class="col-md-3 col-md-offset-1">
                    <div class="form-group" id="groupLlegada">
                        <label for="txtDestination">Llegada:</label>
                        <input class="form-control" type="text" id="txtDestination" value="">
                    </div>
                </div>
            </div>
            <div class="row" style="width: 980px;">
                <div class="col-md-offset-5">
                    <center><button type="submit" class="btn btn-primary" id="verRuta" onclick="GetRoute()">Ver Ruta</button></center>
                </div>
            </div>  


            <div id="contenido1">
                <hr>
                <center>
                    <div class="row" style="width: 980px;">
                        <div class="col-md-2">
                            <div class="form-group" id="groupDistancia">
                                <label for="distancia">Distancia:</label>
                                <input type="text" class="form-control" id="distancia" readonly placeholder="Distancia del viaje">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group" id="groupHoraSalida">
                                <label for="salida">Hora de Salida:</label>
                                <input type="text" class="form-control" id="salida" readonly placeholder="00:00 am/pm">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group" id="groupHoraLlegada">
                                <label for="llegada">Hora de Llegada:</label>
                                <input type="text" class="form-control" id="llegada" readonly placeholder="00:00 am/pm">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group" id="groupDuracion">
                                <label for="duracion">Duración:</label>
                                <input type="text" class="form-control" id="duracion" readonly placeholder="Duración del viaje">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group" id="groupFechaRealizado">
                                <label for="fechaRealizado">Fecha del viaje:</label>
                                <input type="text" class="form-control" id="fechaRealizado" readonly placeholder="dd/mm/aa">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group" id="groupPrecio">
                                <label for="precio">Precio:</label>
                                <input type="text" class="form-control" id="precio" readonly placeholder="$">
                            </div>
                        </div>
                    </div>
                </center>

                <table>
                    <tr>
                        <td>
                            <div id="dvMap"></div>
                        </td>
                        <td>
                            <h1 id="tituloTabla">Información del vehículo.</h1>
                            <br>
                            <div class="col-md-4">
                                <div class="form-group" id="groupNombreChofer">
                                    <label for="nombreChofer">Nombre del chofer:</label>
                                    <input type="text" class="form-control" id="nombreChofer" readonly>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group" id="groupModelo">
                                    <label for="modelo">Marca del carro:</label>
                                    <input type="text" class="form-control" id="modelo" readonly>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group" id="groupPlaca">
                                    <label for="placa">N° de placa:</label>
                                    <input type="text" class="form-control" id="placa" readonly>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group" id="groupColor">
                                    <label for="color">Color:</label>
                                    <input type="text" class="form-control" id="color" readonly>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group" id="groupUbicacion">
                                    <label for="ubicacion">Ubicación actual:</label>
                                    <input type="text" class="form-control" id="ubicacion" readonly>
                                </div>
                            </div>
                            <input type="hidden" value="agregarServicio" id="servicioAction"/>
                            <div class="col-md-5">
                                <button type="submit" class="btn btn-success" id="enviar">Aceptar servicio</button>
                                <button type="reset" class="btn btn-danger" id="cancelar">Cancelar servicio</button>
                            </div>
                          
                        </td>
                        <!--
                        <td>
                            <div id="dvPanel" style="width: 400px; height: 400px"></div>
                        </td>
                        -->
                    </tr>
                </table>
            </div>
        </form>
        <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">

                <input type="hidden" name="cmd" value="_ext-enter" />
                <input type="hidden" name="redirect_cmd" value="_xclick" />
                <input type="hidden" name="business" value="estmontero11-facilitator@hotmail.com" />
                <!–   Aquí pondriamos el email de usuario de la cuenta de vendedor de Paypal o el nº de usuario de Paypal  –>

                <input type="hidden" name="item_name" value="Viaje en DED" />
                <!–   Aquí debemos de poner el nombre del producto para poder identificarlo –>


                <input type="hidden" name="quantity" value="1" />
                <!–   Cantidad de producto a cobrar. En este ejemplo he puesto dos, es decir, multiplicara por 2 la catidad que viene aquí debajo –>

                <input type="hidden" name="amount" id="amount" />
                <!–   Precio de cada producto –>

                <input type="hidden" name="currency_code" value="USD" />
                <!–   Tipo de moneda en la que se va a cobrar al cliente o pagador –>

                <input type="hidden" name="return" value="http://localhost:44695/DED_Drivers/servicios.jsp" />                
                <!–   URL o dirección a la cual nos redirigirá Paypal despues de terminar la compra satisfactoriamente –>

                <input type="hidden" name="cancel_return" value="http://localhost:44695/DED_Drivers/index.jsp" />
                <!–   URL o dirección a la cual nos redirigirá Paypal si se produce un error en el pago o el cliente lo cancela –>

                <div align="center">
                    <input type="image" src="http://www.paypal.com/es_XC/i/btn/x-click-but01.gif"
                           name="submit"
                           alt="Make payments with PayPal - it's fast, free and secure!">
                </div>
            </form>
        <hr>
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
                                <input type="hidden" value="agregarRetro" id="retro"/>
                                <button type="submit" class=" btn btn-success" id="enviar">Guardar Retroalimentación</button>
                                <button type="reset" class="btn btn-danger" id="cancelar">Cancelar Retroalimentación</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
    </body>
    <div id="height200"></div>
    <footer id="footerNuevo">
        <%@include file="footer.jspf" %>
    </footer>
</html>