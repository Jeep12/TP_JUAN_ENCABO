
const url = "http://localhost/proyectos/TP_ESPECIAL_JUAN_ENCABO/";
document.querySelector(".btn_menu").addEventListener("click", toggleMenu);
function toggleMenu() {
    document.querySelector(".navigation").classList.toggle("show");
}

let boxProductos = document.getElementById("productos");
const vueProducts = new Vue(
    {
        el: "#productos",
        data: {
            products: [],
            totalPaginas: 1,
            mensaje: " "

        }
    })

//Esta funcion calcula la cantidad de paginas necesarias para la paginacion
let jsonProducts = getAllProducts();
async function getAllProducts() {
    try {
        let res = await fetch(url + "/api/getProducts");
        let ProductsJson = await res.json();
        let totalArticulos, articulosPorPagina, totalPaginas;

        articulosPorPagina = 4;
        totalArticulos = ProductsJson.length;
        totalPaginas = Math.ceil(totalArticulos / articulosPorPagina);

        vueProducts.totalPaginas = totalPaginas;

        return ProductsJson;
    } catch (error) {
        console.log(error);
    }
}

jsonProducts.then(response => {
    let posicion = document.querySelectorAll(".posicion");
    let posicionData, urlPosicion;

    for (let i = 0; i < posicion.length; i++) {
        posicion[i].addEventListener("click", event => {
            posicionData = posicionData = posicion[i].getAttribute("data-posicion");
            urlPosicion = url + "/api/paginacion?page=" + posicionData;
            showPagination(urlPosicion);
        })

    }

})
async function showPagination(position) {
    vueProducts.products = [];
    let res = await fetch(position);
    let jsonLimit = await res.json();
    vueProducts.products = jsonLimit;
}
//Esta funcion es para que carguen los productos al entrar en productos
showProducts();
async function showProducts() {
    vueProducts.products = [];
    let res = await fetch(url + "api/paginacion?page=1");
    let products = await res.json();
    vueProducts.products = products;
}
let btnShowAll = document.getElementById("mostrarTodo");
if (btnShowAll) {

    btnShowAll.addEventListener("click", function (e) {
        e.preventDefault();
        vueProducts.mensaje = " ";
        showProducts();

    })
}
let btnSearch = document.getElementById("busqueda");
if (btnSearch) {

    btnSearch.addEventListener("click", getSearch);
    async function getSearch(e) {
        e.preventDefault();
        vueProducts.products = [];
        let textSearch = document.getElementById("textSearch").value;

        let res = await fetch(url + "api/getSearch/" + textSearch);
        let search = await res.json();
        if (res.status == 200) {
            vueProducts.products = search;
            vueProducts.totalPaginas = 0;
        } else {
            vueProducts.mensaje = "No se encontro ningun producto";
            vueProducts.totalPaginas = 0;

        }
    }

}



//----------------------PARTE COMENTARIOS ------------------------
//Esta funcion hace el request con los comentarios donde coincidan con el id del producto
let showComment = showComments();
async function showComments() {
    let boxComentario, dataId, dataAdmin;
    boxComentario = document.getElementById("boxComentarios");
    dataId = boxComentario.getAttribute("data-id");
    dataAdmin = boxComentario.getAttribute("data-admin");
    let listComentario = document.getElementById("listComentario");
    try {
        let res = await fetch(url + "/api/comments/" + dataId);
        let response = await res.json();
        if (res.status == 200) {
            for (let i = 0; i < response.length; i++) {
                listComentario.innerHTML += "<li>";
                listComentario.innerHTML += "<h5 class='text-muted'>Publicado por " + response[i].usuario + "</h5>";
                listComentario.innerHTML += "<p>" + response[i].comentario + "</p>";
                listComentario.innerHTML += "<p class='text-muted'> Puntación:" + response[i].valoracion + "</p>";
                listComentario.innerHTML += "<p style=''> Fecha de publicación " + response[i].fecha + "</p>";
                if (dataAdmin == true) {
                    listComentario.innerHTML += "<button name='deleteComment' data-idComment=" + response[i].id + ">Borrar</button>";
                }
                listComentario.innerHTML += "</li>"
                listComentario.innerHTML += "<hr>";
            }
        } else {
            listComentario.innerHTML = "Aun no existen comentarios";
        }
    } catch (error) {
        console.log(error);
    }
}
showComment.then(response => {
    let btnBorrarComment = document.getElementsByName("deleteComment");
    for (let i = 0; i < btnBorrarComment.length; i++) {
        btnBorrarComment[i].addEventListener("click", e => {
            let idComment = btnBorrarComment[i].getAttribute("data-idComment");
            deleteComment(idComment);
        });
    }
})
async function deleteComment(id) {
    console.log("URL REQUEST: " + url + "api/deleteComment/" + id);
    try {
        let res = await fetch(url + "api/deleteComment/" + id, {
            "method": "DELETE",
            "headers": { "Content-type": "application/json" }
        });
        if(res.status ===200){
            console.log("borrado");
        }
    } catch (error) {
        console.log(error);
    }
}
let btnSendComment = document.getElementById("sendComment");
if (btnSendComment) {
    btnSendComment.addEventListener("click", SendComment);
    async function SendComment(e) {
        e.preventDefault();
        let valueUser, commentUser, idProduct_fk, boxComentario, dataNombre;
        boxComentario = document.getElementById("boxComentarios");
        dataNombre = boxComentario.getAttribute("data-nombre");
        idProduct_fk = boxComentario.getAttribute("data-id");
        let listComentario = document.getElementById("listComentario");
        listComentario.innerHTML = " ";
        valueUser = document.getElementById("selectValue").value;
        commentUser = document.getElementById("commentUser").value;

        let today = new Date();
        let day = today.getDate();
        let month = today.getMonth() + 1;
        let yer = today.getFullYear();
        today = day + '/' + month + '/' + yer;

        let comment = {
            "id_comida_fk": idProduct_fk,
            "usuario": dataNombre,
            "comentario": commentUser,
            "valoracion": valueUser,
            "fecha": today
        }
        try {
            let res = await fetch(url + "/api/addComment", {
                "method": "POST",
                "headers": { "Content-type": "application/json" },
                "body": JSON.stringify(comment)
            });

            showComments();
        } catch (error) {
            console.log(error);
        }
    }
}


//Esta parte configura los href de los botones de los modal que se abren al clickar un boton 
//para eliminar producto, categoria o usuario
let botonEliminarProducto = document.getElementById("btnEliminar");
if (botonEliminarProducto) {
    botonEliminarProducto.addEventListener("click", e => {
        let productoSeleccionada = document.getElementById("selectProduct").value;
        botonEliminarProducto.setAttribute("href", "deleteProduct/" + productoSeleccionada);
    })
}

let botonEliminarCategoria = document.getElementById("btnEliminarCategory");
if (botonEliminarCategoria) {
    botonEliminarCategoria.addEventListener("click", e => {
        let categoriaSeleccionada = document.getElementById("selectCategory").value;
        botonEliminarCategoria.setAttribute("href", "deleteCategory/" + categoriaSeleccionada);

    })
}

let btnBorrarUser = document.getElementsByName("btnBorrarUser");
let bodyModal = document.getElementById("bodyModal");
let btn_confirmar = document.getElementById("confirmar");
btnBorrarUser.forEach(btn => {
    btn.addEventListener("click", event => {
        let atributoID, atributoNombre;

        atributoID = btn.getAttribute("data-id");
        atributoNombre = btn.getAttribute("data-nombre");
        bodyModal.innerHTML = "Usted esta por borrar la cuenta: " + atributoNombre;

        btn_confirmar.setAttribute("href", "eliminarUsuario/" + atributoID);
    });
});




