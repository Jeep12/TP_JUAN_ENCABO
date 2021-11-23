<?php
require_once("app/model/user.model.php");
require_once("helpers/users.helpers.php");
require_once("app/view/durcor.view.php");
class UserController
{

    public function __construct()
    {
        $this->modelUser = new UserModel();
        $this->userHelper = new UserHelper();
        $this->view = new DurCorView();
    }
    public function crearCuenta()
    {
        if (
            !empty($_POST['nick'])  &&
            !empty($_POST['nombre']) &&
            !empty($_POST['apellido']) &&
            !empty($_POST['telefono']) &&
            !empty($_POST['password']) &&
            !empty($_POST['passwordConfirmation'])
        ) {
            $nameAcc = $_POST['nick'];
            $nombre = $_POST['nombre'];
            $apellido = $_POST['apellido'];
            $direccion = $_POST['direccion'];
            $email = $_POST['email'];
            $telefono = $_POST['telefono'];
            $contrasenia = $_POST['password'];
            $contraseniaConfirmada = $_POST['passwordConfirmation'];

            $user = $this->modelUser->getUser($nameAcc);
            if ($user) {
                echo "<script>
                alert('Ya existe el usuario');
                window.location= '/proyectos/TP_ESPECIAL_JUAN_ENCABO/';
             </script>";
            } else {
                if ($contrasenia === $contraseniaConfirmada) {
                    $passwordHashing = password_hash($contrasenia, PASSWORD_ARGON2ID);
                    $this->modelUser->CrearCuenta($nameAcc, $nombre, $apellido, $direccion, $email, $telefono, $passwordHashing);
                    $this->login();
                    header("Location:" . BASE_URL);
                } else {

                    echo "<script>
                    alert('las contraseñas no coinciden');
                    window.location= '/proyectos/TP_ESPECIAL_JUAN_ENCABO/'
                 </script>";
                }
            }
        }
    }
    public function login()
    {
        if (!empty($_POST['nick']) && !empty($_POST['password'])) {
            $nick = $_POST['nick'];
            $password = $_POST['password'];
            $user = $this->modelUser->getUser($nick);
            header("Location: " . BASE_URL);
            if ($user && password_verify($password, $user->password)) {

                $this->userHelper->login($user);
            } else {
                header("Location: " . BASE_URL);
            }
        } else {
            header("Location: " . BASE_URL);
        }
    }
    public function logout()
    {
        //llama a la funcion logout del helper que destruye la session
        $this->userHelper->logout();
        header("Location: " . BASE_URL);
    }
    public function transformAdmin($id)
    {
        $admin =  $this->userHelper->admin();
        if ($admin) {
            $this->modelUser->transformAdmin($id);
            header("Location: " . BASE_URL . "panelAdmin");
        } else {
            header("Location: " . BASE_URL);
        }
    }
    public function untransformAdmin($id)
    {
        $admin =  $this->userHelper->admin();
        if ($admin) {
            $this->modelUser->untransformAdmin($id);
            header("Location: " . BASE_URL . "panelAdmin");
        } else {
            header("Location: " . BASE_URL);
        }
    }
    public function deleteUser($id)
    {
        $admin =  $this->userHelper->admin();
        if ($admin) {
            $this->modelUser->deleteUser($id);
            header("Location: " . BASE_URL . "panelAdmin");
        } else {
            header("Location: " . BASE_URL);
        }
    }
}
