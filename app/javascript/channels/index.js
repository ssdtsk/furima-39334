window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const addProfit = document.getElementById("profit");

    const tax = Math.round(inputValue * 0.1);

    addTaxDom.innerHTML = tax;
    
    const profit = Math.round(inputValue - tax);
    addProfit.innerHTML = profit;
  })
})