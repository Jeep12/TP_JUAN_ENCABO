 </div>
 <!-- Footer -->
 <footer class="page-footer font-small blue pt-4">
     <div class="container-fluid text-center text-md-left">
         <div class="row">
             <div class="col-md-6 mt-md-0 mt-3">
                 <img src="images/logo.gif" alt="">

                 <p>Lo que quieras en un instante.</p>
             </div>
             <hr class="clearfix w-100 d-md-none pb-3">
             <div class="col-md-3 mb-md-0 mb-3">
                 <h5 class="text-uppercase">Navegación</h5>
                 <ul class="list-unstyled">
                     <li>
                         <a href="home">INICIO</a>
                     </li>
                     <li>
                         <a href="nosotros">NOSOTROS</a>
                     </li>
                     <li>
                         <a href="contacto">CONTACTO</a>
                     </li>
                     <li>
                         <a href="productos">PRODUCTOS</a>
                     </li>
                 </ul>
             </div>
             {if $sesion eq false}
                 <div class="col-md-3 mb-md-0 mb-3">
                     <h5 class="text-uppercase"><span class="material-icons-outlined">
                     manage_accounts
                     </span></h5>
                     <ul class="list-unstyled">
                         <li class="login" type="button" data-bs-toggle="modal" data-bs-target="#login">
                             <a class="btn btn-secondary" type="button" data-bs-toggle="modal" data-bs-target="#login">Log In</a>
                         </li>
                         <br>
                         <li>
                             <a class="btn btn-secondary" type="button" data-bs-toggle="modal" data-bs-target="#register">SIG IN</a>
                         </li>

                     </ul>
                 </div>
             {/if}
         </div>
     </div>
     <div class="footer-copyright text-center py-3">© 2021/2022 Copyright / Devoloped by
         <a href="#!"> Jeep</a>
     </div>
 </footer>
 
 <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>

 <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
     crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
     integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
 </script>
 <script src="js/main.js"></script>

 </body>

</html>