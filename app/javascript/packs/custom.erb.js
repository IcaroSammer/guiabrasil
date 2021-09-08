// javascript/packs/custom.js
function dosmth() { 
  var  teste = document.getElementById("establishment_cep").value; 
  alert(teste.value);
}

document.addEventListener('turbolinks:load', () => {  
  const clickButton = document.getElementById("button-click");  
	clickButton.addEventListener("click", dosmth); 
});
