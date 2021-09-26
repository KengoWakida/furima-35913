const pay = () => {
  Payjp.setPublicKey("pk_test_b0c942412ebcb27275d749e4");  //PAY.JPテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click",(e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    //カード情報の取得
    const card = {
      number: formData.get("order_shipping[number]"),
      cvc: formData.get("order_shipping[cvc]"),
      exp_month: formData.get("order_shipping[exp_month]"),
      exp_year: `20${formData.get("order_shipping[exp_year]")}`,
    };

    //トークンの作成
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend",tokenObj);
      }
     
      //カード情報の削除
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load",pay);