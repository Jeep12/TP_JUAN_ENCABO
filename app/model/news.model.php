<?php 


class NewsModel extends Model {

    public function addNew($titulo,$textoNoticia,$fechaActual){
        $sql = "INSERT INTO noticias (titulo, mensaje, fecha) VALUES (?,?,?)";
        $query = $this->pdo->prepare($sql);
        $query->execute([$titulo,$textoNoticia,$fechaActual]);
    }
    public function cantPaginas (){
        $sql = "SELECT * FROM noticias";
        $query = $this->pdo->prepare($sql);
        $query->execute();

        $articulos_x_pagina = 4;//<- cantidad de articulos por pagina
        $totalFilas = $query->rowCount();//<-- cuenta las filas
        $cantPaginas = $totalFilas/$articulos_x_pagina; //<- divido la cantidad de filas por la cantidad de articulos
        $cantPaginas = ceil($cantPaginas);//<- redondeo el resultado por arriba si tiene decimal
        return $cantPaginas;
    }
    public function getNews($pagina){
        $articulosMax = 4;
        $iniciar = ($pagina-1)*$articulosMax;
        $sql = "SELECT * FROM noticias ORDER BY id DESC LIMIT $iniciar,$articulosMax";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $noticias = $query->fetchAll(PDO::FETCH_OBJ);
        return $noticias;
    }
}
