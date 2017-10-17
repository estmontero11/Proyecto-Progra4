<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>DED Drivers</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <!--CSS LOCAL-->
        <link href="estilos/css.css" rel="stylesheet" type="text/css"/>
        
        <!--Estilo de Bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        
        <!--Estilo de la fuente-->
        <link href="https://fonts.googleapis.com/css?family=Orbitron" rel="stylesheet"> 
        
        <link href="https://fortawesome.github.io/Font-Awesome/assets/font-awesome/css/font-awesome.css" rel="stylesheet">

        
        <!--JS LOCAL-->
        <script src="funciones/js.js" type="text/javascript"></script>
        
        
        <!--JS de Boostrap-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        
    </head>
    <!--Titulo y Barra de navegacion-->
    <header>
        <%@include file="navbar.jspf" %>
    </header>
    <!--Termina titulo y barra de navegacion-->
    <body>
        <div>
            <!--Slider-->
            <div class="carousel fade-carousel slide" data-ride="carousel" data-interval="4000" id="bs-carousel">
                <!-- Overlay -->
                <div class="overlay"></div>

                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#bs-carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#bs-carousel" data-slide-to="1"></li>
                    <li data-target="#bs-carousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item slides active">
                        <div class="slide-1"></div>
                        <div class="hero">
                            <hgroup>
                                <h1>VIAJE CON NOSOTROS</h1>        
                                <h3>Somos su mejor opción para trasladarse.</h3>
                            </hgroup>
                            
                        </div>
                    </div>
                    <div class="item slides">
                        <div class="slide-2"></div>
                        <div class="hero">        
                            <hgroup>
                                <h1>MEJOR SERVICIO.</h1>        
                                <h3>Contamos con el mejor servicio al cliente.</h3>
                            </hgroup>       
                            
                        </div>
                    </div>
                    <div class="item slides">
                        <div class="slide-3"></div>
                        <div class="hero">        
                            <hgroup>
                                <h1>SOMOS MODERNOS.</h1>        
                                <h3>Contamos con una aplicación con lo último en tecnología.</h3>
                            </hgroup>
                            
                        </div>
                    </div>
                </div> 
            </div>
            <!--Termina el slider-->
        </div>
    </body>
    <footer>
        <%@include file="footer.jspf" %>
    </footer>
</html>
