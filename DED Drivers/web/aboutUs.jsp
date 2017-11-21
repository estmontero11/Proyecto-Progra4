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
        <title>About Us</title>
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
        
        <script>
            $(function () {
                $("#accordion").accordion();
            });
        </script>


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
    </header>
    <!--Termina titulo y barra de navegacion-->
    <body>
            <!--Slider-->

            <!--Termina el slider-->
            
            <!--Historia-->
            <div>
                <div class="container cuerpo">
                    <div class="row">
                        <div class="col-md-5">                            
                                <img id="imagen1" src="https://d1a3f4spazzrp4.cloudfront.net/chameleon/cms/uploads/2016/6/22/1466622512-Uber_Music_web.jpg" class="img-responsive" alt="" align="justify"/> 
                        </div>
                        <div class="col-md-5">
                            <div>
                                <p class="parrafo">Somos jovenes que trabajamos para conectar a los usuarios con 
                                    vehículos con conductor privado. Nuestra misión es moverte por la ciudad de la manera 
                                    más segura, sencilla y agradable. Con deseos de ir mejorando día con día, para ello 
                                    estamos atentos a sugerencias por parte de nuestros clientes.
                                </p>  
                            </div>
                        </div>
                </div>
                    <br>
                <div id="accordion">
                    <h3 class="title acordion">Historia</h3>
                    <div>
                        <p class="parrafoH" >DED Driver nació en 2017, como proyecto del curso Programacion 4, de la Escuela de Informatica de la UNA en Costa Rica a cargo de sus creadores: Esteban Montero, Daniel Zamora y Daniel Gutierrez</p>
                        <p class="parrafoH">Nuestro sueño siempre fue ofrecer una opcion distina, segura y de calidad a todas esas personas que diariamente usan servicios de transporte publico</p>

                    </div>
                    <h3 class="title">Vision</h3>
                    <div>
                        <ul class="list-group">
                            <li class="listas">Lograr que cada uno de nuestros vehiculo llegue a cubrir la mayor parte del pais</li>
                            <li class="listas">Poder expandir el servicio en otros medios de transporte como el aéreo</li>
                            <li class="listas">Generar muchas mas fuentes de empleo a todas esas personas que por una u otra razon, no estan activas en el ambito laboral del país</li>
                        </ul>
                    </div>
                    <h3 class="title">Valores</h3>
                    <div>
                        <ul class="list-group">
                            <li class="listas">Calidad</li>
                            <li class="listas">Seguridad</li>
                            <li class="listas">Responsabilidad</li>
                            <li class="listas">Puntualidad</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--Termina la Historia-->
        </div>
    </body>
    <footer>
        <%@include file="footer.jspf" %>
    </footer>
</html>

