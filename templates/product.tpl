{include file="templates/header.tpl"}
<div class="row">
{*IF PRINCIPAL QUE PREGUNTA SI EXISTE EL PRODUCTO*}
    {if $product}
    <img src="{{$product->imagen}}" alt="imagen del producto" class="imgProduct">
    <p></p>
    {**DETALLE DEL PRODUCTO*}
    <div class="row">
        <div class="col-sm-12">
            <div class="list-group" style="text-align: center;">
                <li class="list-group-item list-group-item-action"><b>{$product->titulo}</b></li>
                <li class="list-group-item list-group-item-action">{$product->detalle}</li>
                <li class="list-group-item list-group-item-action">Precio: ${$product->precio}</li>
            </div>
        </div>
    </div>
    <p></p>
    <hr>
    {*COMENTARIOS DEL PRODUCTO POR VUE JS*}
    <div class="row">
        <h5 style="text-align: center;">Opiniones sobre {$product->titulo}</h5>
        <div class="containerComentarios" id="boxComentarios" data-id="{$product->id}" data-nombre="{$nombre}" data-admin="{$admin}">
            <ul class="listComentario" id="listComentario">
                
            </ul>
        
        </div>
    </div>
    <hr>
    {*FORMULARIO INGRESAR COMENTARIO SI EXISTE SESION*}
    {if $sesion eq true}
    <div class="row" id="containerAddComments" data-id="{$product->id}">
        <h5>Ingrese un comentario</h5>
        <form >
            <div class="form-group">
                <label for="exampleFormControlSelect1">Puntuacion</label>
                <select class="form-control" id="selectValue">
                    <option selected disabled>Seleccione puntuacion</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
            <div class="form-group">
                <label for="exampleFormControlTextarea1">Comentario</label>
                <textarea class="form-control" id="commentUser" rows="3"></textarea>
            </div>
            <p></p>
            <button class="btn btn-dark" style="margin: auto;display: block;" id="sendComment">Enviar</button>
        </form>
    </div>
    {/if}
    {else}
        {*SI NO EXISTE EL PRODUCTO *}
    <div style="min-height: 400px;">
        <div class="alert alert-light" role="alert">
            <p style="text-align: center;"><b>Producto no encontrado</b></p>
        </div>
    </div>
    {/if}
</div>
{include file="templates/footer.tpl"}
