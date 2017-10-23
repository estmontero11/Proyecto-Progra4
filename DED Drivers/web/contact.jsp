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
        
    </head>
    <!--Titulo y Barra de navegacion-->
    <header>
        <%@include file="navbar.jspf" %>
    </header>
    <!--Termina titulo y barra de navegacion-->
    <body>
        <div>
            <!-- Comienza el Texto -->
            <div class="container cuerpo">
                Para cualquier consulta, disconformidad o sugerencia se puede contactar con nosotros por los siguientes medios: <br>
                <ul>
                    <li>Linea atención al cliente al (506)800-23452345</li>
                    <li>Via correo electronico llenando el siguiente formulario:</li>
                </ul>
            </div>
            <!-- Termina el Texto -->
            <br>
            <!-- Comienza el Formulario -->
            <div class="container raleway">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="nombre">Nombre:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="nombre" placeholder="Ingrese su nombre">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="email">Correo electronico:</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="email" placeholder="Ingrese su correo electronico">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="texto"></label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="texto" placeholder="Ingrese sus consulta, disconformidad o sugerencia" rows="5"></textarea>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
    <footer>
        <%@include file="footer.jspf" %>
    </footer>
</html>
