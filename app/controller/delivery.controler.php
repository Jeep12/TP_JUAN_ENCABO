<?php
require_once("app/model/products.model.php");
require_once("app/model/categories.model.php");
require_once("app/model/user.model.php");
require_once("app/model/news.model.php");

require_once("app/view/durcor.view.php");
require_once("helpers/users.helpers.php");


class DeliveryController
{
    private $view;
    private $modelUsers;
    private $modelProducts;
    private $modelCategories;
    private $modelNews;


    function __construct()
    {   
        $this->view = new DurCorView();
        $this->modelUsers = new UserModel;
        $this->modelNews = new NewsModel();
        $this->modelProducts = new ProductsModel();
        $this->modelCategories = new CategoriesModel();
        $this->userHelper = new UserHelper();
    }
    //muestra el inicio
    public function showHome()
    {
        $nombre = '';
        $pagina = 1;
        if (!empty($_SESSION['USERNAME'])) {
            $nombre =   $_SESSION['USERNAME'];
        }
        if (isset($_GET['pagina'])) {
            $pagina  = $_GET['pagina'];
        }
     
        $news = $this->modelNews->getNews($pagina);
        $cantPaginas = $this->modelNews->cantPaginas();
        $admin = $this->userHelper->admin();
        $sesion = $this->userHelper->checkLoggedIn();
        $this->view->renderHome($admin, $sesion, $nombre,$cantPaginas,$pagina,$news);
    }
    //muestra el panel admin
    public function showPanelAdmin()
    {
        $admin = $this->userHelper->admin();
        if ($admin == true) {
            $nombre = '';
            if (!empty($_SESSION['USERNAME'])) {
                $nombre =   $_SESSION['USERNAME'];
            }
            $users = $this->modelUsers->getUsuarios();
            $categories = $this->modelCategories->getAllCategories();
            $products  = $this->modelProducts->getAllProducts();
            $sesion = $this->userHelper->checkLoggedIn();
            $this->view->renderAdmin($admin, $sesion, $nombre, $categories, $products,$users);
        } else {
            header("Location:" . BASE_URL);
        }
    }
    //Muestra la parte de productos
    public function showProducts()
    {
        $nombre = '';
        if (!empty($_SESSION['USERNAME'])) {
            $nombre =   $_SESSION['USERNAME'];
        }
        $admin = $this->userHelper->admin();
        $sesion = $this->userHelper->checkLoggedIn();
        $this->view->renderShowProducts($admin, $nombre, $sesion);
    }
    //Muestra un detalle de un producto
    public function showProduct()
    {
        if (!empty($_GET['product'])) {
            $nombre = '';
            $idProduct = $_GET['product'];
            if (!empty($_SESSION['USERNAME'])) {
                $nombre =   $_SESSION['USERNAME'];
            }
            $admin = $this->userHelper->admin();
            $sesion = $this->userHelper->checkLoggedIn();
            $product = $this->modelProducts->getProduct($idProduct);
            if ($product) {
                $this->view->renderProduct($product, $admin, $nombre, $sesion);
            } else {
                $this->view->renderProduct($product, $admin, $nombre, $sesion);
            }
        } else {
            header("Location:" . BASE_URL . "productos");
        }
    }

    //Muestra la parte de nosotros
    public function showAbout()
    {
        $nombre = '';

        if (!empty($_SESSION['USERNAME'])) {
            $nombre =   $_SESSION['USERNAME'];
        }
        $admin = $this->userHelper->admin();
        $sesion = $this->userHelper->checkLoggedIn();
        $this->view->renderAbout($admin, $nombre, $sesion);
    }

    //Muestra la parte de contacto
    public function showContact()
    {  
        $nombre = '';
        if (!empty($_SESSION['USERNAME'])) {
            $nombre =   $_SESSION['USERNAME'];
        }
        $admin = $this->userHelper->admin();
        $sesion = $this->userHelper->checkLoggedIn();
        $this->view->renderContact($admin, $nombre, $sesion);
    }
}
