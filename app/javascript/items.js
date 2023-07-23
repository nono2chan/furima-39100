function calculate(){
  const  itemPrice = document.getElementById("item-price");
  
  itemPrice.addEventListener("keyup", (e) => {

    const price = document.getElementById("item-price").value;

    const addTaxPrice = document.getElementById("add-tax-price");

    const profit = document.getElementById("profit");
      
    if(300 <= price && price <= 9999999) {

      const fee = Math.floor(price / 10);
      const rest = (price - fee);
      
      addTaxPrice.innerHTML = fee;
      profit.innerHTML = rest;
    
    }else{
      addTaxPrice.innerHTML = 0;
      profit.innerHTML = 0;
    }
     });
}

window.addEventListener("load",calculate);