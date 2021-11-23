<?php
require_once("app/model/model.php");
class UserModel extends Model
{


    public function CrearCuenta($nameAcc, $nombre, $apellido, $direccion, $email, $telefono, $passwordHashing)
    {
        $query = $this->pdo->prepare("INSERT INTO `usuarios` (`id`, `nick`, `nombre`, `apellido`, `direccion`,`email`,`telefono`,`password`) VALUES (NULL,?,?,?,?,?,?,?);");
        $query->execute([$nameAcc, $nombre, $apellido, $direccion, $email, $telefono, $passwordHashing]);
        return $this->pdo->lastInsertId();
    }
    public function getUser($nick)
    {
        $query = $this->pdo->prepare('SELECT * FROM usuarios WHERE nick = ?');
        $query->execute([$nick]);
        $user = $query->fetch(PDO::FETCH_OBJ);
        return $user;
    }

    public function getUsuarios()
    {
        $query = $this->pdo->prepare('SELECT * FROM usuarios');
        $query->execute();
        $users = $query->fetchAll(PDO::FETCH_OBJ);
        return $users;
    }
    public function transformAdmin($id)
    {
        $sql = " UPDATE usuarios SET admin = 1 WHERE usuarios.id = ?";
        $query = $this->pdo->prepare($sql);
        $query->execute([$id]);
    }
    public function untransformAdmin($id)
    {
        $sql = " UPDATE usuarios SET admin = 0 WHERE usuarios.id = ?";
        $query = $this->pdo->prepare($sql);
        $query->execute([$id]);
    }
    public function deleteUser($id){
        $sql = "DELETE FROM usuarios WHERE usuarios.id = ?";
        $query = $this->pdo->prepare($sql);
        $query->execute([$id]);
    }
}
