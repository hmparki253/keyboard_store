window.addEventListener("DOMContentLoaded", function() {
    sidebar_init();
});

function sidebar_init() {
    let currentUrl = window.location.href;
    let splitedArr = currentUrl.split("/");

    if(splitedArr[4].length !== 0) {
        let rootUrl = splitedArr[4];
        if(rootUrl.startsWith("product")) {
            let scndUrl = splitedArr[5];
            if (scndUrl !== undefined) {
                if(scndUrl.startsWith("registration")) {
                    let registration = document.getElementById("product_registration");
                    setBold(registration);
                }
            } else {
                let index = document.getElementById("product_list");
                setBold(index);
            }
        }
    }
}

function setBold(dom) {
    dom.classList.add("font-weight-bold");
}