<?php
require_once("helpers/users.helpers.php");
require_once("app/model/news.model.php");
class NewsController
{

    private $modelNews;
    private $userHelper;

    function __construct()
    {
        $this->userHelper = new UserHelper();
        $this->modelNews = new NewsModel();
    }

    public function addNew()
    {
       
        $admin = $this->userHelper->admin();
        if ($admin) {
            if (!empty($_POST['tituloNoticia']) && !empty($_POST['textoNoticia'])) {
                $titulo = $_POST['tituloNoticia'];
                $textoNoticia = $_POST['textoNoticia'];
                $fechaActual = date('d-m-Y');
                $this->modelNews->addNew($titulo,$textoNoticia,$fechaActual);
                header("Location:" . BASE_URL . "panelAdmin");
            }else {
                header("Location:" . BASE_URL . "panelAdmin");
            }
        } else {
            echo "Acceso denegado";
        }
    }
}
