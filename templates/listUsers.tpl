<div class="listUsers">
    <ul class="list-group">
        {foreach from=$users item=$user}

            <li class="list-group-item">
                Nick de cuenta: <b>{$user->nick}</b>
                <br>
                Nombre: <b>{$user->nombre}</b>
                <br>
                Apellido: <b>{$user->apellido}</b>
                <br>
                Dirección: <b>{$user->direccion}</b>
                <br>
                Email: <b>{$user->email}</b>
                <br>
                Telefono: <b>{$user->telefono}</b>
                <br>
                ¿Es admin?:
                {if $user->admin eq 0}
                    <b> No </b>
                {else}
                    <b> Si </b>
                {/if}
                <br>
                {if $user->admin eq 0}
                    <br>
                    Dar permisos:
                    <a href="darPermiso/{$user->id}" style="margin-top:5x" type="button" class="btn btn-warning">Convertir</a>
                    <br>
                {else}
                    <br>
                    Quitar permisos:
                    <a href="quitarPermiso/{$user->id}" style="margin-top:5px" type="button" class="btn btn-danger">Quitar
                        permisos
                    </a>
                    <br>
                {/if}
                ¿Eliminar Usuario?:
                <button class="btn btn-danger mt-2" data-bs-toggle="modal" data-bs-target="#deleteUser" name="btnBorrarUser"
                    data-id="{$user->id}"  data-nombre="{$user->nick}">
                    Eliminar
                </button>
                <br>
            </li>

        {/foreach}

    </ul>
</div>
{include file="templates/deleteUser.tpl"}