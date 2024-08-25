const price = () => {
    // 金額を入力する場所の要素を取得
    const priceInput = document.getElementById("item-price");
  
    // 金額入力欄が存在しないページでは何もしない
    if (!priceInput) return;
  
    // 販売手数料を表示する場所の要素を取得
    const addTaxDom = document.getElementById("add-tax-price");
  
    // 販売利益を表示する場所の要素を取得
    const profitDom = document.getElementById("profit");
  
    // 金額が入力されたときに販売手数料と販売利益を計算して表示
    priceInput.addEventListener("input", () => {
      // 入力された金額を数値に変換して取得
      const inputValue = parseFloat(priceInput.value);
  
      // 入力値が数字でない場合は計算を行わない
      if (isNaN(inputValue)) {
        addTaxDom.innerHTML = "0";
        profitDom.innerHTML = "0";
        return;
      }
  
      // 販売手数料の計算（10%）
      const tax = Math.floor(inputValue * 0.1);
  
      // 販売利益の計算
      const profit = Math.floor(inputValue - tax);

    // カンマ区切りのフォーマット
    const formattedTax = tax.toLocaleString();
    const formattedProfit = profit.toLocaleString();

    // 計算結果を画面に表示
    addTaxDom.innerHTML = formattedTax;
    profitDom.innerHTML = formattedProfit;
  });
};
  
  // ページの読み込み時とレンダリング時にprice関数を実行
  window.addEventListener("turbo:load", price);
  window.addEventListener("turbo:render", price);