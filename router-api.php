<?php
require_once("libs/Router.php");
require_once("api/controller/api.controller.php");

$router = new Router();

$router->addRoute('products', 'GET', 'ApiDeliveryController', 'getAllProducts');
$router->addRoute('paginacion', 'GET', 'ApiDeliveryController', 'pagination');
$router->addRoute('comments/:ID', 'GET', 'ApiDeliveryController', 'getAllComments');
$router->addRoute('comments', 'POST', 'ApiDeliveryController', 'sendComment');
$router->addRoute('comments/:ID', 'DELETE', 'ApiDeliveryController', 'deleteComment');
$router->addRoute('getSearch/:ID', 'GET', 'ApiDeliveryController', 'getSearch');



$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);
