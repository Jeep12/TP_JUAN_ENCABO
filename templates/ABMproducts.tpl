 {*PARTE FORMULARIO AGREGAR PRODUCTO*}

 <div class="accordion accordion-flush" id="accordionFlushExample">
     <div class="accordion-item">
         <h2 class="accordion-header" id="flush-headingOne">
             <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                 data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                 Agregar producto
             </button>
         </h2>
         <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
             data-bs-parent="#accordionFlushExample">
             <div class="accordion-body">
                 <form action="addProduct" class="formAddFood" method="POST" enctype="multipart/form-data">
                     <label for="Titulo producto">
                         Titulo
                         <input type="text" placeholder="Titulo de la comida" class="form-control" name="titulo">
                     </label>
                     <hr>
                     <label for="Categoria producto">
                         Seleccione Categoria
                         <select name="categoria" class="form-control form-control-lg">
                             <option selected disabled>Seleccione</option>
                             {foreach from=$categories item=categoria}
                                 <option value='{$categoria->id}'>{$categoria->nombre_categoria}</option>
                             {/foreach}
                         </select>
                     </label>
                     <hr>
                     <label for="Detalle producto">
                         Detalle
                         <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="detalle"></textarea>
                     </label>
                     <hr>
                     <label for="Precio producto">
                         Precio
                         <input type="number" placeholder="Precio" class="form-control" name="precio">
                     </label>
                     <hr>
                     <label for="Imagen producto">
                         <input type="file" name="imagen">
                     </label>
                     <hr>
                     <button type="submit" class="btn btn-dark">Crear</button>
                 </form>
             </div>
         </div>
     </div>
     {*PARTE FORMULARIO ACTUALIZAR PRODUCTO*}

     <div class="accordion-item">
         <h2 class="accordion-header" id="flush-headingTwo">
             <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                 data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                 Actualizar producto
             </button>
         </h2>
         <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo"
             data-bs-parent="#accordionFlushExample">
             <div class="accordion-body">
                 <form action="upgradeProduct" class="formAddFood" method="POST" enctype="multipart/form-data">
                     <label for="producto elgido">
                         <p style="font-weight: bold;background-color: #E9E7E7;padding: 15px;border-radius: 5px;">
                             Seleccione un producto para actualizar </p>
                         *Obligatorio*
                         <select class="form-control form-control-lg" name="producto"
                             class="form-control form-control-lg">
                             <option selected disabled>Seleccione</option>
                             {foreach from=$products item=product}
                                 <option value='{$product->id}'>{$product->titulo}</option>
                             {/foreach}
                         </select>
                     </label>
                     <hr>
                     *Obligatorio*
                     <label for="Titulo producto">
                         Titulo
                         <input type="text" placeholder="Titulo de la comida" class="form-control" name="titulo">
                     </label>
                     <hr>
                     *Obligatorio*
                     <label for="Categoria producto">
                         Seleccione Categoria
                         <select name="categoria" class="form-control form-control-lg">
                             <option selected disabled>Seleccione</option>
                             {foreach from=$categories item=categoria}
                                 <option value='{$categoria->id}'>{$categoria->nombre_categoria}</option>
                             {/foreach}
                         </select>
                     </label>
                     <hr>
                     *Obligatorio*
                     <label for="Detalle producto">
                         Detalle
                         <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="detalle"></textarea>
                     </label>
                     <hr>
                     *Obligatorio*
                     <label for="Precio producto">
                         Precio
                         <input type="number" placeholder="Precio" class="form-control" name="precio">
                     </label>
                     <hr>
                     *Opcional*
                     <label for="Imagen producto">
                         <input type="file" name="imagen">
                     </label>
                     <hr>
                     <button type="submit" class="btn btn-dark">Actualizar</button>
                 </form>
             </div>
         </div>
     </div>
     <div class="accordion-item">
         <h2 class="accordion-header" id="flush-headingThree">
             <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                 data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                 Eliminar producto
             </button>
         </h2>
         <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree"
             data-bs-parent="#accordionFlushExample">
             <div class="accordion-body">
                 <label for="producto elgido">
                     <p style="font-weight: bold;background-color: #E9E7E7;padding: 15px;border-radius: 5px;">
                         Seleccione un producto para eliminar </p>
                     *Obligatorio*
                     <select class="form-control form-control-lg" name="producto" id="selectProduct"
                         class="form-control form-control-lg">
                         <option selected disabled>Seleccione</option>
                         {foreach from=$products item=product}
                             <option value='{$product->id}'>{$product->titulo}</option>
                         {/foreach}
                     </select>
                 </label>
                 <hr>
                 <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#deleteProduct">
                     Eliminar
                 </button>

             </div>
         </div>
     </div>
 </div>
{include file="templates/deleteProduct.tpl"}