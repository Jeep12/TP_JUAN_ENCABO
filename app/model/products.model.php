<?php
require_once("app/model/model.php");
class ProductsModel extends Model
{

    public function getAllProducts()
    {
        $sql = "SELECT * FROM comidas";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $products = $query->fetchAll(PDO::FETCH_OBJ);
        return $products;
    }
    public function getProduct($id)
    {
        $sql = "SELECT * FROM comidas WHERE id = ?";
        $query = $this->pdo->prepare($sql);
        $query->execute([$id]);
        $product = $query->fetch(PDO::FETCH_OBJ);
        return $product;
    }
    public function addProduct($rutaTemporal, $rutaGuardado, $titulo, $categoria, $detalle, $precio)
    {
        move_uploaded_file($rutaTemporal, $rutaGuardado);
        $sql = "INSERT INTO comidas (titulo,categoria_fk,detalle,imagen,precio) VALUES (?,?,?,?,?)";
        $query = $this->pdo->prepare($sql);
        $query->execute([$titulo, $categoria, $detalle, $rutaGuardado, $precio]);
    }
    public function upgradeProduct($titulo, $categoria, $detalle, $precio, $rutaGuardado, $rutaTemporal, $producto)
    {
        move_uploaded_file($rutaTemporal, $rutaGuardado);
        $sql = "UPDATE comidas
         SET titulo = ?, categoria_fk = ?, detalle = ?, imagen = ?, precio = ? 
        WHERE comidas.id = ?";
        $query = $this->pdo->prepare($sql);
        $query->execute([$titulo, $categoria, $detalle, $rutaGuardado, $precio, $producto]);
    }
    public function deleteProduct($id)
    {
        $query = $this->pdo->prepare("DELETE FROM comidas WHERE id = ?");
        $query->execute([$id]);
    }
    public function getPagination($paginacion)
    {
        $iniciar = ($paginacion - 1) * 4;
        $sql = "SELECT * FROM comidas LIMIT $iniciar, 4";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $paginacion = $query->fetchAll(PDO::FETCH_OBJ);
        return $paginacion;
    }
    public function getSearch($id){
        $sql = "SELECT * FROM comidas WHERE titulo LIKE '%' ? '%'";
        $query = $this->pdo->prepare($sql);
        $query->execute([$id]);
        $paginacion = $query->fetchAll(PDO::FETCH_OBJ);
        return $paginacion;
    }
}
