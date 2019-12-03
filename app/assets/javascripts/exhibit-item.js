$(document).on("turbolinks:load", function() {

  // DOMを取得して変数に代入
  let inputPrice =  $("#item_price");
  let sellCommission = $("#sell-commission");
  let sellProfit = $("#seles-profit");

  // 手数料計算(四捨五入可)
  let clacCommission = (sellPrice) => {
    let finishedToCalc = Math.round(sellPrice * 0.1);
    return finishedToCalc;
  }


  // 販売利益の計算
  let calcSelesProfit = (sellPrice, Commission) => {
    let finishedCalc = sellPrice - Commission
    return finishedCalc;
  }

  // ユーザーが価格を入力するたびに発動するイベント
  inputPrice.on("keyup", function() {

    if (inputPrice.val() >= 300 && inputPrice.val() <= 9999999) {

      sellCommission.empty();
      sellProfit.empty();
      let Commission = clacCommission(inputPrice.val());
      let showSelesProfit = calcSelesProfit(inputPrice.val(), Commission);
      sellCommission.text("¥" + Commission);
      sellProfit.text("¥" + showSelesProfit);

    } else {

      sellCommission.text("ー");
      sellProfit.text("ー");

    }

  });


}); 