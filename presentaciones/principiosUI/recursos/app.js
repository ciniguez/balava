var dirImages = "recursos";
var numeroSlides = document.querySelector("#num_slides").value;
var nameImg = "Diapositiva";
var extensionImg = ".png";
var cuadroImagen = document.querySelector("#container img");
var btnAvanzar = document.querySelector("#btnAvanzar");
var btnRetroceder = document.querySelector("#btnRetroceder");
var listaSlidesSelectorArray = document.querySelectorAll("#lista ul li");
var contador = 1;

// Carga Inicial
cuadroImagen.setAttribute("src",dirImages + "/" + nameImg + contador + extensionImg);

document.getElementById("totalSlides").textContent = numeroSlides;
actualizarEstadoInfo();

//Boton Avanzar
btnAvanzar.addEventListener("click", function(){
    if(contador < numeroSlides){
        contador ++;
        cuadroImagen.setAttribute("src",dirImages + "/" + nameImg + contador + extensionImg);
        actualizarEstadoInfo();
    }
});
//Boton Avanzar
btnRetroceder.addEventListener("click", function(){
    if(contador > 1){
        contador --;
        cuadroImagen.setAttribute("src",dirImages + "/" + nameImg + contador + extensionImg);
        actualizarEstadoInfo();
    }
});
//Seleccion de Slide
listaSlidesSelectorArray.forEach((element, indice) => {
    element.addEventListener("click",function(){
        contador = indice+1;
        cuadroImagen.setAttribute("src",dirImages + "/" + nameImg + contador + extensionImg);
        actualizarEstadoInfo();
        console.log(contador);
    })
});
//Actualizacion de estado de botones
function actualizarEstadoInfo(){
    document.getElementById("slideActual").textContent = contador;
    if(contador == numeroSlides){
        btnAvanzar.disabled = true;
        if(btnRetroceder.hasAttribute("disabled"))
            btnRetroceder.removeAttribute("disabled");
    }
    if(contador ==1){
        btnRetroceder.disabled = true;
        if(btnAvanzar.hasAttribute("disabled"))
            btnAvanzar.removeAttribute("disabled");
    }
    if(contador>1 && contador <numeroSlides){
        if(btnAvanzar.hasAttribute("disabled"))
            btnAvanzar.removeAttribute("disabled");
        if(btnRetroceder.hasAttribute("disabled"))
            btnRetroceder.removeAttribute("disabled");
    }
}
const hamburguesa = document.querySelector(".toggle-btn");
//Ocultar o mostrar la barra lateral
hamburguesa.addEventListener("click", function(){
    document.querySelector("#lista").classList.toggle("active");
});