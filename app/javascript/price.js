function price () {
  const item_price = document.getElementById("item-price");
  item_price.addEventListener("keyup",() => {
    //販売手数料
    const add_tax_price = document.getElementById("add-tax-price"); 
    int_add_tax_price = Math.floor(item_price.value*0.1);
    add_tax_price.innerHTML = `${int_add_tax_price}`; 
    //販売利益
    const profit = document.getElementById("profit");
    int_profit = item_price.value-Math.floor(item_price.value*0.1);
    profit.innerHTML = `${int_profit}`;
  });
};

window.addEventListener('load',price);