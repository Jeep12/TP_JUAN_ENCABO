<div class="modal fade" id="register" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Crear Cuenta</h5>
            </div>
            <form action="crearCuenta" method="POST">
                <div class="modal-body">
                    <div class="row">
                        <div class="col">
                            *Obligatorio*
                            <input name="nick" type="text" class="form-control" placeholder="Nombre de cuenta">
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col">
                            *Obligatorio*
                            <input name="nombre" type="text" class="form-control" placeholder="Nombre">
                        </div>
                        <div class="col">
                            *Obligatorio*
                            <input name="apellido" type="text" class="form-control" placeholder="Apellido">
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col">
                            *Opcional*
                            <input name="email" type="email" class="form-control" placeholder="Email">
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col">
                            *Obligatorio*
                            <input name="telefono" type="number" class="form-control" placeholder="Numero de telefono">
                        </div>
                        <div class="col">
                            *Opcional*
                            <input name="direccion" type="text" class="form-control" placeholder="Direccion">
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col">
                            *Obligatorio*
                            <input name="password" type="password" class="form-control" placeholder="Contraseña">
                        </div>
                        <div class="col">
                            *Obligatorio*
                            <input name="passwordConfirmation" type="password" class="form-control" placeholder="Confirmar contraseña">
                        </div>
                    </div>
                </div>
           
                <div class="modal-footer">
                    <button type="button" class="btn " style="background-color: #292929;color: white;"
                        data-bs-dismiss="modal">Cerrar</button>
                    <button id="btn-register" type="submite" class="btn " style="background-color: #212529;color: white;">Crear
                        Cuenta</button>
                </div>
            </form>
        </div>
    </div>
</div>