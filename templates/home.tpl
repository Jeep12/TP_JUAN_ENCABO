{include file="templates/header.tpl"}
<div class="row">
    <div class="col-sm-7">
        <h1>Ultimas Noticias</h1>
        <hr>
        <div class="containerNotiticas">
            {foreach from=$news item=$new}
                <h5 style="text-align: center;">{$new->titulo}</h5>
                <p style="padding: 10px;">{$new->mensaje}</p>
                <p class="text-muted">Publicado el dia: {$new->fecha}</p>
                <hr>
            {/foreach}
        </div>
        <nav aria-label="Page navigation example" class="pagination">
            <ul class="pagination" style="margin:auto;">
                {if $pagina neq 1 }
                <li class="page-item"><a style="text-decoration: none;color:black" class="page-link"
                        href="home?pagina={$pagina-1}">Atras</a>
                </li>
                {/if}
                {for $foo=1 to $cantPaginas}
                
                <li class="page-item"><a style="text-decoration: none;color:black" class="page-link"
                        href="home?pagina={$foo}">{$foo}</a>
                </li>
                {/for}
                {if $pagina neq $cantPaginas }
                <li class="page-item"><a style="text-decoration: none;color:black" class="page-link"
                        href="home?pagina={$pagina+1}">Siguiente</a>
                </li>
                {/if}


            </ul>
        </nav>


    </div>
    <div class="col-sm-5">
        <img src="images/imagenInicio.jpg" alt="imagen publicidad " class="img-fluid">
       
        <h1>Su mejor alternativa </h1>
        <p>Ofrecemos un servicio de delivery único puesto que trabajamos de manera rapida, efica y segura. </p>
        <p> Nustros platillos son preparados por nosotros mismos con ingredientes frescos y de máxima calidad.
            De igual manera no solo ofrecemos comida como delivery, mucho mas! en productos puede encontrar todo.</p>
        <p> Además, tenemos un grupo de empleados que se destacan por su buena actitud, amabilidad y eficiencia para
            hacer de su visita la más agradable.</p>

    </div>
</div>
{include file="templates/footer.tpl"}