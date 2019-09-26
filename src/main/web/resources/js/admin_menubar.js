window.addEventListener("DOMContentLoaded", function() {
    menubar_init();
});

function menubar_init() {
    let currentUrl = window.location.href;
    let splitedArr = currentUrl.split("/");

    if(splitedArr[3].length !== 0) {
        let rootUrl = splitedArr[3];
        if(rootUrl.startsWith("admin")) {
            let scndUrl = splitedArr[4];
            if(scndUrl.startsWith("product")) {
                let shop = document.getElementById("admin_menubar_product");
                setBold(shop);
            }
        } else if(rootUrl.startsWith("order")) {

        }
    } else {
        let main = document.getElementById("admin_menubar_main");
        setBold(main);
    }
}

function setBold(dom) {
    dom.classList.add("font-weight-bold");
}