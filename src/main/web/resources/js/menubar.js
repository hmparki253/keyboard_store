window.addEventListener("DOMContentLoaded", function() {
    menubar_init();
});

function menubar_init() {
    let currentUrl = window.location.href;
    let splitedArr = currentUrl.split("/");

    if(splitedArr[3].length !== 0) {
        let rootUrl = splitedArr[3];
        if(rootUrl.startsWith("shop")) {
            let shop = document.getElementById("menubar_shop");
            setBold(shop);
        } else if(rootUrl.startsWith("order")) {
            if(splitedArr[4].length !== 0 && splitedArr[4].startsWith("list")) {
                let purchaseHistory = document.getElementById("menubar_purchase_history");
                setBold(purchaseHistory);
            } else {
                let payment = document.getElementById("menubar_payment");
                setBold(payment);
            }
        } else if(rootUrl.startsWith("cart")) {
            let payment = document.getElementById("menubar_payment");
            setBold(payment);
        }
    } else {
        let main = document.getElementById("menubar_main");
        setBold(main);
    }
}

function setBold(dom) {
    dom.classList.add("font-weight-bold");
}