window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const addProfit = document.getElementById("profit");

    // 入力した金額の10%を計算する
    const tax = inputValue * 0.1;

    addTaxDom.innerHTML = tax;
    
    // item-priceの入力された値からadd-tax-priceを引いた値を計算する
    const profit = inputValue - tax;
    addProfit.innerHTML = profit;
  })
})