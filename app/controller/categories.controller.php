<?php
require_once("helpers/users.helpers.php");
require_once("app/model/categories.model.php");
class CategoriesController
{
    private $userHelper;
    private $modelCategories;
    function __construct()
    {
        $this->userHelper = new UserHelper();
        $this->modelCategories = new CategoriesModel();
    }
    public function addCategory()
    {
        $admin = $this->userHelper->admin();
        if ($admin == true) {
            if (!empty($_POST['nombreCategoria'])) {
                $nombreCategoria = $_POST['nombreCategoria'];
                $this->modelCategories->addCategory($nombreCategoria);
                header("Location:" . BASE_URL . "panelAdmin");
            }
        }
        else {
            echo "acceso no permitido";
        }
    }
    public function updateCategory()
    {
        $admin = $this->userHelper->admin();
        if ($admin == true) {
            if (!empty($_POST['categoria']) && !empty($_POST['nombreCategoria'])) {
                $categoria = $_POST['categoria'];
                $nuevoNombre = $_POST['nombreCategoria'];
                $this->modelCategories->updateCategory($nuevoNombre, $categoria);
                header("Location:" . BASE_URL . "panelAdmin");
            } else {
                header("Location:" . BASE_URL . "panelAdmin");
            }
        }else {
            echo "acceso no permitido";
        }
    }
    public function deleteCategory($id)
    {
        $admin = $this->userHelper->admin();
        if ($admin == true) {
            $this->modelCategories->deleteCategory($id);
            header("Location:" . BASE_URL . "panelAdmin");
        }else {
            echo "acceso no permitido";
        }
    }
}
