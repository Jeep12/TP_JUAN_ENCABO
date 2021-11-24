<?php
require_once("app/model/model.php");

class CommentsModel extends Model
{

    public function getAllComment($idComida_fk)
    {
        
        $sql = "SELECT * FROM comentarios WHERE id_comida_fk = ?";
        $query = $this->pdo->prepare($sql);
        $query->execute([$idComida_fk]);
        $foods = $query->fetchAll(PDO::FETCH_OBJ);

        return $foods;
    }
    public function insertComment($id_comida_fk, $usuario, $comentario, $valoracion, $fecha)
    {
        $sql =  "INSERT INTO comentarios (id_comida_fk,usuario,comentario,valoracion,fecha) VALUES (?,?,?,?,?)";
        $query = $this->pdo->prepare($sql);
        $query->execute([$id_comida_fk, $usuario, $comentario, $valoracion, $fecha]);
        return $query;
    }
    public function getComment ($id){
        $sql = "SELECT * FROM comentarios WHERE id = ?";
        $query = $this->pdo->prepare($sql);
        $query->execute([$id]);
        $comment = $query->fetch(PDO::FETCH_OBJ);
        return $comment;

    }
    public function deleteComment($id){
        $sql = "DELETE FROM comentarios WHERE id = ?";
        $query = $this->pdo->prepare($sql);
        $query->execute([$id]);
        return $query->rowCount();
        
    }
}
