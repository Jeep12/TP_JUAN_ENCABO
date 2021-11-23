<?php
require_once("helpers/users.helpers.php");
require_once("app/model/products.model.php");
class ProductsController
{
    private $modelProducts;
    private $userHelper;

    function __construct()
    {
        $this->userHelper = new UserHelper();
        $this->modelProducts = new ProductsModel();
    }

    public function addProduct()
    {
        $admin = $this->userHelper->admin();
        if ($admin) {
            if (
                !empty($_POST['titulo']) &&
                !empty($_POST['categoria']) &&
                !empty($_POST['detalle']) &&
                !empty($_POST['precio'])
            ) {
                $titulo = $_POST['titulo'];
                $categoria = $_POST['categoria'];
                $detalle = $_POST['detalle'];
                $precio = $_POST['precio'];
                if (
                    $_FILES['imagen']['type'] == "image/jpg" ||
                    $_FILES['imagen']['type'] == "image/jpeg" ||
                    $_FILES['imagen']['type'] == "image/png" ||
                    $_FILES['imagen']['type'] == "image/gif"
                ) {
                    $nombreImagen = $_FILES['imagen']['name'];
                    $rutaTemporal = $_FILES['imagen']['tmp_name'];
                    $rutaGuardado = "images/$nombreImagen";
                }
                $this->modelProducts->addProduct($rutaTemporal, $rutaGuardado, $titulo, $categoria, $detalle, $precio);
                header("Location:" . BASE_URL . "panelAdmin");
            } else {
                header("Location:" . BASE_URL . "panelAdmin");
            }
        } else {
            echo "acceso no permitido";
        }
    }
    public function upgradeProduct()
    {
        $admin = $this->userHelper->admin();
        if ($admin) {
            if (
                !empty($_POST['titulo']) &&
                !empty($_POST['detalle']) &&
                !empty($_POST['precio']) &&
                !empty($_POST['producto']) &&
                !empty($_POST['categoria'])

            ) {
                $titulo = $_POST['titulo'];
                $detalle = $_POST['detalle'];
                $precio = $_POST['precio'];
                $producto = $_POST['producto'];
                $categoria = $_POST['categoria'];
                if (
                    $_FILES['imagen']['type'] == "image/jpg" ||
                    $_FILES['imagen']['type'] == "image/jpeg" ||
                    $_FILES['imagen']['type'] == "image/png" ||
                    $_FILES['imagen']['type'] == "image/gif"
                ) {
                    $nombreImagen = $_FILES['imagen']['name'];
                    $rutaTemporal = $_FILES['imagen']['tmp_name'];
                    $rutaGuardado = "images/$nombreImagen";
                }
                $this->modelProducts->upgradeProduct($titulo, $categoria, $detalle, $precio, $rutaGuardado, $rutaTemporal, $producto);
                header("Location:" . BASE_URL . "panelAdmin");
            }else {
                header("Location:" . BASE_URL . "panelAdmin");
            }
        } else {
            echo "acceso no permitido";
        }
    }
    public function deleteProduct($id)
    {
        $admin = $this->userHelper->admin();
        if ($admin) {
            $this->modelProducts->deleteProduct($id);
            header("Location:" . BASE_URL . "panelAdmin");
        } else {
            echo "acceso no permitido";
        }
    }
}
