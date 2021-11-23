{literal}
<div id="productos">
    <div class="row">
        <div class="col-sm-4">
            <form action="#">
                <h5>Filtrar producto</h5>
                <input type="text" class="form-control" id="textSearch" placeholder="Buscar por titulo">
                <button class="btn btn-dark mt-1" id="busqueda">Buscar</button>
                <button class="btn btn-dark mt-1" id="mostrarTodo">Mostrar Todo</button>
            </form>
            <hr>

        </div>
        <div class="col-sm-8">
            <div class="alert alert-warning" role="alert" v-if="mensaje != ' '">
                <p style="text-align: center;">{{mensaje}}</p>
            </div>
            <div class="containerP" type="button">
                <div class="containerProduct" v-for="product in products">
                    <img class="img-fluid imgProducts" v-bind:src="product.imagen">
                    <h3>{{product.titulo}}</h3>

                    <p style="font-size: 20px;">${{product.precio}}</p>
                    <hr>
                    <a class="btn btn-dark" :href="'producto?product=' + product.id">Ver Detalle</a>
                </div>
            </div>
            <nav aria-label="Page navigation navPaginacion ">
                <ul class="pagination pagination-lg" style="align-items: center;">

                    <li class="page-item" v-for="i in totalPaginas">
                        <a type="button" class="page-link posicion" :data-posicion="i">

                            <span class="sr-only"> {{i}}</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

    </div>

</div>
{/literal}