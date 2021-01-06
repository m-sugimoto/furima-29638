window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1 )); 
      console.log(addTaxDom);

      const profitNumber = document.getElementById("profit")
      const value_result = (Math.floor(inputValue * 0.1));
      console.log(value_result)
      profitNumber.innerHTML = (Math.floor(inputValue - value_result));
        console.log(profitNumber);
 })
 
});

    //const profitNumber = document.getElementById("profit")
    //profitNumber.innerHTML = (Math.floor(inputValue - addTaxDom));
      //console.log(profitNumber);