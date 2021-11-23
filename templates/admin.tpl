{include file="templates/header.tpl"}
<h1 style="text-align: center;">Panel de control</h1>
<div class="row" style="text-align: center;margin-top:80px">
    <div class="col-sm-6">
        <h5>PRODUCTOS</h5>
        {include file="templates/ABMproducts.tpl"}
    </div>
    <div class="col-sm-6">
        <h5>CATEGORIAS</h5>
        {include file="templates/ABMcategories.tpl"}
    </div>
</div>
<div class="row" style="text-align: center;margin-top:80px">
    <div class="col-sm-6">
        <h5>Agregar una noticia</h5>
    </div>
    <div class="col-sm-6">
        <h5>Lista de usuarios</h5>
        {include file="templates/listUsers.tpl"}

    </div>
</div>
{include file="templates/footer.tpl"}
