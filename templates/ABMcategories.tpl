<div class="accordion" id="accordionPanelsStayOpenExample">
    <div class="accordion-item">
        <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false"
                aria-controls="panelsStayOpen-collapseTwo">
                Crear categoria
            </button>
        </h2>
        <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse"
            aria-labelledby="panelsStayOpen-headingTwo">
            <div class="accordion-body">
                <form action="addCategorie" method="post">
                    <label for="nombre categoria">Nombre de categoria
                        <input type="text" name="nombreCategoria" class="form-control" placeholder="Nombre categoria">
                    </label>
                    <hr>
                    <button type="submit" class="btn btn-dark">Crear</button>
                </form>
            </div>
        </div>
    </div>
    <div class="accordion-item">
        <h2 class="accordion-header" id="panelsStayOpen-headingThree">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false"
                aria-controls="panelsStayOpen-collapseThree">
                Actualizar Categoria
            </button>
        </h2>
        <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse"
            aria-labelledby="panelsStayOpen-headingThree">
            <div class="accordion-body">
                <form action="upgradeCategory" method="post">
                    <label for="categoria">
                        Seleccione categoria para actualizar
                        <select name="categoria" class="form-control form-control-lg">
                            <option selected disabled>Seleccione</option>
                            {foreach from=$categories item=category}
                            <option value='{$category->id}'>{$category->nombre_categoria}</option>
                            {/foreach}
                        </select>
                    </label>
                    <hr>
                    <label for="nuevo nombre categoria">
                        Nuevo nombre
                        <input type="text" name="nombreCategoria" class="form-control">
                    </label>
                    <hr>
                    <button type="submit" class="btn btn-dark">Actualizar</button>
                </form>
            </div>
        </div>
    </div>
    <div class="accordion-item">
        <h2 class="accordion-header" id="panelsStayOpen-headingOne">
            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
                aria-controls="panelsStayOpen-collapseOne">
                Eliminar categoria
            </button>
        </h2>
        <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse"
            aria-labelledby="panelsStayOpen-headingOne">
            <div class="accordion-body">

                <label for="categoria">
                    Seleccione categoria para eliminar
                    <select name="categoria" class="form-control form-control-lg" id="selectCategory">
                        <option selected disabled>Seleccione</option>
                        {foreach from=$categories item=category}
                        <option value='{$category->id}'>{$category->nombre_categoria}</option>
                        {/foreach}
                    </select>
                </label>
                <hr>
                <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#deleteCategory">
                    Eliminar
                </button>
            </div>
        </div>
    </div>
</div>
{include file="templates/deleteCategory.tpl"}