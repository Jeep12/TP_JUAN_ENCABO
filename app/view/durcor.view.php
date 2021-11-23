<?php 
require_once("libs\smarty\libs\Smarty.class.php");
class DurCorView {
    private $smarty;
    public function __construct()
    {
        $this->smarty = new Smarty();
      
    }
    public function renderHome ($admin,$sesion,$nombre){
        $this->smarty->assign("admin", $admin);
        $this->smarty->assign("sesion", $sesion);
        $this->smarty->assign("nombre", $nombre);
        $this->smarty->display("templates/home.tpl");
    }
    public function renderAdmin ($admin,$sesion,$nombre,$categories,$products,$users){
         $this->smarty->assign("nombre", $nombre);
        $this->smarty->assign("admin", $admin);
        $this->smarty->assign("sesion", $sesion);
        $this->smarty->assign("users", $users);
        $this->smarty->assign("categories", $categories);
        $this->smarty->assign("products", $products);
        $this->smarty->display("templates/admin.tpl");
      
    }
    public function renderShowProducts ($admin,$nombre,$sesion){
        $this->smarty->assign("nombre", $nombre);
        $this->smarty->assign("admin", $admin);
        $this->smarty->assign("sesion", $sesion);
        $this->smarty->display("templates\products.tpl");

    }
    public function renderProduct ($product, $admin, $nombre, $sesion){
        $this->smarty->assign("nombre", $nombre);
        $this->smarty->assign("admin", $admin);
        $this->smarty->assign("sesion", $sesion);
        $this->smarty->assign("product", $product);
        $this->smarty->display("templates\product.tpl");
    }
    public function renderAbout($admin,$nombre,$sesion) {
        $this->smarty->assign("nombre", $nombre);
        $this->smarty->assign("admin", $admin);
        $this->smarty->assign("sesion", $sesion);
        $this->smarty->display("templates\about.tpl");
    }
    public function renderContact($admin,$nombre,$sesion){
        $this->smarty->assign("nombre", $nombre);
        $this->smarty->assign("admin", $admin);
        $this->smarty->assign("sesion", $sesion);
        $this->smarty->display("templates\contact.tpl");
    }

}
