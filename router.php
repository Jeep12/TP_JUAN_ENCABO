<?php
require_once("app/controller/user.controller.php");
require_once("app/controller/delivery.controler.php");
require_once("app/controller/products.controller.php");
require_once("app/controller/categories.controller.php");
require_once("app/controller/news.controller.php");


define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');


if (!empty($_GET['action'])) {
   $action = $_GET['action'];
} else {
   $action = 'home';
}
$controllerNew = new NewsController();
$controllerUser = new UserController();
$controllerDelivery = new DeliveryController();
$controllerProduct = new ProductsController();
$controllerCategory = new CategoriesController();

$params = explode('/', $action);
switch ($params[0]) {
   case 'home':
      $controllerDelivery->showHome();;
      break;
   case 'crearCuenta':
      $controllerUser->crearCuenta();;
      break;
   case 'InicSesion':
      $controllerUser->login();;
      break;
   case 'logout':
      $controllerUser->logout();;
      break;
   case 'darPermiso':
      $controllerUser->transformAdmin($params[1]);
      break;
   case 'quitarPermiso':
      $controllerUser->untransformAdmin($params[1]);
      break;
   case 'eliminarUsuario':
      $controllerUser->deleteUser($params[1]);
      break;

   case 'panelAdmin':
      $controllerDelivery->showPanelAdmin();;
      break;
   case 'addProduct':
      $controllerProduct->addProduct();;
      break;
   case 'upgradeProduct':
      $controllerProduct->upgradeProduct();;
      break;
   case 'deleteProduct':
      $controllerProduct->deleteProduct($params[1]);
      break;
   case 'addCategorie':
      $controllerCategory->addCategory();
      break;
   case 'upgradeCategory':
      $controllerCategory->updateCategory();
      break;
   case 'deleteCategory':
      $controllerCategory->deleteCategory($params[1]);
      break;
   case 'productos':
      $controllerDelivery->showProducts();
      break;
   case 'producto':
      $controllerDelivery->showProduct();
      break;
   case 'nosotros':
      $controllerDelivery->showAbout();
      break;
   case 'contacto':
      $controllerDelivery->showContact();
      break;
   case 'addNew':
      $controllerNew->addNew();
      break;

   default:
      echo "Error 404, pagina no encontrada";
      break;
}
