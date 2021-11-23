<div class="modal fade" id="login" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Iniciar Sesion</h5>
      </div>
      <form action="InicSesion" method="POST" style="width: 250px; margin: auto; text-align: center;">
      <div class="modal-body">
            <label for="">
                Ingrese su nombre de cuenta
                <input name="nick" class="form-control"  type="text" placeholder="Username">
            </label>
            <label for="" style="margin-top: 10px;">
                Ingrese su contraseña
                <input name="password" class="form-control"  type="password" name="" placeholder="Password">
            </label>
            <div class="alert alert-dark mt-2" role="alert">
                ¿Olvidaste tu contraseña? Click <a href="#">Aquí</a>
              </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn " style="background-color: #292929;color: white;"data-bs-dismiss="modal">Cerrar</button>
            <button type="submite" class="btn " style="background-color: #212529;color: white;">Iniciar Sesion</button>
        </div>
    </form>
    </div>
  </div>
</div>