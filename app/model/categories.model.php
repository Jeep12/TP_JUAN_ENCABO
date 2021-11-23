<?php

class CategoriesModel extends Model {


    public function getAllCategories (){
        $sql = "SELECT * FROM categorias";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $categories = $query->fetchAll(PDO::FETCH_OBJ);
        return $categories;
    }
    public function addCategory ($nombreCategoria){
        $sql = "INSERT INTO categorias (nombre_categoria) VALUES (?)";
        $query = $this->pdo->prepare($sql);
        $query->execute([$nombreCategoria]);
    }
    public function updateCategory ($nuevoNombre,$categoria){
        $sql = "UPDATE categorias SET nombre_categoria = ? WHERE categorias.id = ?";
        $query = $this->pdo->prepare($sql);
        $query->execute([$nuevoNombre,$categoria]);
    }
    public function deleteCategory ($id){
        $query = $this->pdo->prepare("DELETE FROM categorias WHERE id = ?");
        $query->execute([$id]);
    }
}