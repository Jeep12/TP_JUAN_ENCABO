<!DOCTYPE html>
<html lang="en">

<head>
{*Fuentes e iconos de google*}
<link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Icons+Outlined" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Icons+Round" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Icons+Sharp" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Icons+Two+Tone" rel="stylesheet">


    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    <title>ANDO GANAS</title>
</head>

<body>
    <header>
        <div class="logo">
            <img src="images/logo.gif" alt="">
            <div class="btn_menu"><a type="button"><img src="images/icomenu.png" /></a></div>
            <div class="fb-like" data-href="https://www.facebook.com/durquetg" data-width="" data-layout="button_count"
                data-action="like" data-size="small" data-share="true"></div>
        </div>

        <div class="menu">
            <ul class="navigation text-uppercase">
                <li type="button"><a href="home">Inicio</a></li>
                <li type="button"><a href="nosotros">Nosotros</a></li>
                <li type="button"><a href="contacto">Contacto</a></li>
                <li type="button"><a href="productos">Productos</a></li>
            </ul>
            <ul class="register-login text-uppercase">
            {if $sesion eq false}
                <li class="login" type="button" data-bs-toggle="modal" data-bs-target="#login">Log In</li>
                <li>
                    <button type="button" data-bs-toggle="modal" data-bs-target="#register">
                        SIG IN
                    </button>
                </li>
                {else}
                    <p class="saludo">Hola, {$nombre}</p>  
                <li class="panelUser">
                    <a   class="nav-link dropdown-toggle"  id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <span class="material-icons-outlined">
                    account_circle
                </span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        {if $admin eq true}
                        <li><a  href="panelAdmin">Panel De Control</a></li>
                        {/if}
                      <li><a  href="#">Mis Datos</a></li>
                      <hr  style="background-color: rgb(117, 117, 117);"class="dropdown-divider">
                      <li><a   href="logout">Cerrar Sesion</a></li>
                    </ul>
                  </li>
            {/if}
            </ul>
        </div>
    </header>
    {include file="templates/login.tpl"}
    {include file="templates/register.tpl"}
<div class="container" >

    