function calculate() {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemPrice.addEventListener("input", (e) =>{
    const inputValue = itemPrice.value;
    addTaxPrice.innerHTML = Math.floor(inputValue / 10)
    profit.innerHTML = Math.ceil(inputValue * 9 / 10)
    });
};

window.addEventListener("load", calculate);