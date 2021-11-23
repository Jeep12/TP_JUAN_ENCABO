<?php
require_once("app/model/comments.model.php");
require_once("app/model/products.model.php");
require_once("api/view/api-view.php");
class ApiDeliveryController
{
    private $modelComments;
    private $modelProducts;
    private $view;
    private $data;

    public function __construct()
    {
        $this->modelComments = new CommentsModel();
        $this->modelProducts = new ProductsModel();
        $this->view = new APIView();
        $this->data = file_get_contents("php://input");
    }
    public function get_data()
    {
        return json_decode($this->data);
    }
    public function getAllProducts()
    {
        $products = $this->modelProducts->getAllProducts();
        $this->view->response($products, 200);
    }
    public function pagination()
    {
        if (isset($_GET['page'])) {
            $posicion = $_GET['page'];
            $page = $this->modelProducts->getPagination($posicion);
            $this->view->response($page, 200);
        }
    }
    public function getAllComments($param)
    {
        $id = $param[':ID'];

        $comments = $this->modelComments->getAllComment($id);
        if ($comments) {
            $this->view->response($comments, 200);
        } else {
            $this->view->response("no existen comentarios", 404);
        }
    }
    public function sendComment()
    {

        $comment = $this->get_data();
        $sendOk = $this->modelComments->insertComment($comment->id_comida_fk, $comment->usuario, $comment->comentario, $comment->valoracion, $comment->fecha);

        if ($sendOk) {
            $this->view->response("Se insertó correctamente", 200);
        } else {
            $this->view->response("Hubo un error", 500);
        }
    }
    public function deleteComment($params)
    {
        $id = $params[':ID'];
        $comment = $this->modelComments->getComment($id);
        if ($comment) {
            $this->modelComments->deleteTask($id);
            $this->view->response("El comentario se elimino con exito", 200);
        } else {
            $this->view->response("No existe el comentario", 404);
        }
    }
    public function getSearch($params)
    {
        $id = $params[':ID'];
      
        $search = $this->modelProducts->getSearch($id);
        if ($search) {
            $this->view->response($search, 200);
        } else {
            $this->view->response("No se encontro nada", 404);
        }
    }
}
