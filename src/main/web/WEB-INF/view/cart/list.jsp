<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/base.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/mdb.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>">
</head>
<body>
<%@include file="../partial/header.jsp"%>
<%@include file="../partial/menubar.jsp"%>
<section class="section-content bg padding-y">
    <div class="container minimum-height">
        <h2>장바구니</h2>
        <div class="row">
            <main class="col-sm-12">
                <form action="/order" method="get">
                    <div class="card">
                        <table class="table table-hover">
                            <thead class="text-muted">
                                <tr>
                                    <th scope="col">상품명</th>
                                    <th scope="col">가격</th>
                                    <th scope="col">수량</th>
                                    <th scope="col">삭제</th>
                                    <th scope="col"><input id="total_check" type="checkbox" onclick="toggleAll()"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${carts}" var="cart">
                                <tr id="${cart.id}_tr">
                                    <input type="hidden" id="${cart.id}_productId" value="${cart.productId}" />
                                    <td>
                                        <figure class="media">
                                            <div class="img-wrap">
                                                <img src="" class="">
                                            </div>
                                            <figcaption class="media-body">
                                                <h6 class="title text-truncate">
                                                    <img style="width: 100px" src="/displayImage?fileName=${cart.randName}&directory=product">
                                                        ${cart.name}
                                                </h6>
                                            </figcaption>
                                        </figure>
                                    </td>
                                    <td>
                                        <div class="">
                                            <input type="hidden" id="cart_${cart.id}" value="${cart.price}" />
                                            <var class="" id="${cart.id}_price">${cart.price}</var>
                                            <var>원</var>
                                        </div>
                                    </td>
                                    <td>
                                        <input type="text" readonly="readonly" id="${cart.id}_quantity" value="${cart.quantity}" />
                                        <input type="button" value="-" id="${cart.id}_minus" />
                                        <input type="button" value="+" id="${cart.id}_plus" />
                                    </td>
                                    <td>
                                        <input type="button" id="${cart.id}_delete" class="btn btn-sm btn-danger" value="삭제">
                                    </td>
                                    <td>
                                        <input type="checkbox" name="cartId" value="${cart.id}" id="${cart.id}_checkbox" onclick="checkboxToggle(this, ${cart.id})">
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="card mt-3 p-3 text-center">
                        <h5>예상 주문금액 :</h5><h6 id="totalPrice"></h6>
                    </div>
                    <div class="card mt-3">
                        <input type="submit" id="submit_btn" class="btn btn-sm btn-blue" value="선택상품 주문하기" disabled>
                    </div>
                </form>
            </main>
        </div>
    </div>
</section>
<%@include file="../partial/footer.jsp" %>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/popper.min.js" />"></script>
<script>
    $(document).ready(function() {
        totalPriceCalcInit();
        // onload시 checkbox checked 모두 해제해주기 -> 뒤로가기 했을때 문제 발생

        $("input[id$='minus']").each(function () {
            $(this).on("click", function() {
                let cartId = this.id.split("_")[0];
                let quantityObj = $('#' + cartId + "_quantity");
                let quantity = quantityObj.val();

                if(quantity > 1) {
                    let procVal = quantityCheckAjax(cartId, false);
                    if(procVal)
                        quantityObj.val(parseInt(quantity) - 1);
                } else {
                    alert('1개 미만은 구입할 수 없습니다.');
                }
            });
        });
        $("input[id$='plus']").each(function () {
            $(this).on("click", function() {
                let cartId = this.id.split("_")[0];
                let quantityObj = $('#' + cartId + "_quantity");
                let quantity = quantityObj.val();

                if(quantity < 5) {
                    let procVal = quantityCheckAjax(cartId, true);
                    if(procVal) {
                        quantityObj.val(parseInt(quantity) + 1);
                    } else {
                        alert("수량을 더 이상 올릴 수 없습니다.");
                    }
                } else {
                    alert("한 번 주문시 6개 이상을 구입할 수 없습니다.");
                }
            });
        });

        // 해당 카트삭제의 경우 우선 물어봐서 modal을 띄우자
        // modal에 전달된 값으로 원하면 delete
        // 원할경우 해당 cartId로 해당 cart 삭제
        // 해당 cart의 productId를 통해 quantity만큼 재고에 더해주기
        // 성공시
        // 해당 row 삭제
        // 실패시 error modal 띄워주기
        $("input[id$='delete']").each(function () {
            $(this).on("click", function() {
                let cartId = this.id.split("_")[0];
                let productId = $('#'+cartId+"_productId").val();
                let quantity = $('#'+cartId+"_quantity").val().toString();
                let cartVO = { "id": cartId, "productId": productId, "quantity": quantity};

                $.ajax({
                    type: 'DELETE',
                    url: '<c:url value="/deleteCart"/>'+'?'+$.param(cartVO),
                    // async: false,
                    success: function(args) {
                        console.log("성공후 돌아온 값은? : " + args);
                        if(args) {
                            deleteTr(cartId);
                            totalPriceCalcInit();
                            cartCountInit();
                        }
                    },
                    error: function(e) {
                        console.log("카트 빼기에서 문제 발생 : " + e.toString());
                    }
                });
            });
        });

        $('#submit_btn').on("click",function(e) {
            console.log(e);
            // 보낼 값은 checked된 cart의 id값 {1, 2, 3} ->
            let cartIdes = [];
            let checksObj = document.querySelectorAll("[id$='_checkbox']");
            for(let item of checksObj) {
                if(item.checked) {
                    let splited = item.id.split("_");
                    cartIdes.push(splited[0]);
                }
            }
            console.log(cartIdes);
            // 실어보낼 값 세팅 완료

            $.ajax({
                type:'GET',
                url: '<c:url value="/order"/>',
                data: cartIdes
            }).done(function(data) {
                window.location = ''
            }).fail(function(xhr, status, err) {

            });
        });

        function quantityCheckAjax(cartId, procFlag) {
            let quantityFlag = false;
            let param = "cartId="+cartId+"&flag="+procFlag;
            $.ajax({
                type: 'GET',
                async: false,
                url: '<c:url value="/cartQuantityProc"/>',
                data: param
            }).done(function(data) {
                console.log(data);
                quantityFlag = data;
            }).fail(function(xhr, status, err) {
                console.log('에러 발생');
            });
            return quantityFlag;
        }

        function cartCountInit() {
            let cartCount = 0;
            if($('#cartCount')) {
                let cartCountObj = $('#cartCount');
                $.ajax({
                    type: 'GET',
                    url: '<c:url value="/getCartCount" />',
                    // async: false,
                    success: function(args) {
                        cartCount = args;
                    },
                    error: function(e) {
                        console.log(e);
                    }
                });
                cartCountObj.text(cartCount);
            }
        }

        function deleteTr(cartId) {
            $("#"+cartId+"_tr").remove();
        }
    });

    function totalPriceCalcInit() {
        let totalPrice = 0;
        let submitBtn = document.getElementById('submit_btn');
        let totalPriceObj = document.getElementById('totalPrice');
        let checksObj = document.querySelectorAll("[id$='_checkbox']"); // 전체 체크박스 obj
        for(let item of checksObj) { // 순회
            if(item.checked) { // 체크된 행의 금액과 수량을 곱해서 합계에 더하기
                let splited = item.id.split("_");
                let price = document.getElementById(splited[0]+"_price");
                let quantity = document.getElementById(splited[0]+"_quantity");
                totalPrice += parseInt(price.innerText) * quantity.value;
            }
        }
        totalPriceObj.innerText = totalPrice;
        totalPriceToggle(submitBtn, totalPrice);
    }

    // 전체 checkbox toggle function
    function toggleAll() {
        let totalCheckObj = document.getElementById("total_check");
        let checksObj = document.querySelectorAll("[id$='_checkbox']");
        if(totalCheckObj.checked) {
            for(let item of checksObj) {
                // 이미 체크가 되어 있는(item.checked === true) row는 아래 로직을 적용하지 않는다 -> 중복 방지
                if(!item.checked) {
                    let splited = item.id.split("_");
                    item.checked = true;
                    checkboxToggle(item, splited[0]);
                }
            }
        } else {
            for(let item of checksObj) {
                // 이미 체크가 되어있지 않은(item.checked === false) row는 아래 로직을 적용하지 않는다 -> 중복 방지
                if(item.checked) {
                    let splited = item.id.split("_");
                    item.checked = false;
                    checkboxToggle(item, splited[0]);
                }
            }
        }
    }

    // 해당 토글 이벤트의 동작
    // 1. 받은 checkbox를 checked 혹은 checked false로 둔다 -> 실수 : 어짜피 checkbox는 click시 그 checked value가 변한다
    // 2. 해당 상품의 가격만큼을 totalprice에 더해주거나 빼준다
    function checkboxToggle(checkboxObj, index) {
        let pmFlag = true;
        pmFlag = !!checkboxObj.checked;
        let priceObj = document.getElementById(index+"_price");
        let quantityObj = document.getElementById(index+"_quantity");
        changeTotalPrice(priceObj.innerText, quantityObj.value, pmFlag);
    }
    // 받은 가격과, 뺄지 더할지를 필두로
    // 값을 세팅하여 totalprice에 세팅해준다
    function changeTotalPrice(price, quantity, pmFlag) {
        let totalPriceObj = document.getElementById('totalPrice');
        let submitBtn = document.getElementById('submit_btn');
        let totalPrice = 0;
        if(totalPriceObj.innerText.length === 0) {
            totalPrice = 0;
        } else {
            totalPrice = parseInt(totalPriceObj.innerText);
        }

        if(pmFlag) {
            totalPrice += parseInt(price) * quantity;
        } else {
            totalPrice -= parseInt(price) * quantity;
        }

        totalPriceObj.innerText = totalPrice;

        // totalPrice가 0이 아니면 버튼 disabled 토글하기
        totalPriceToggle(submitBtn, totalPrice);
    }

    function totalPriceToggle(submitBtn, price) {
        if(price !== 0) {
            submitBtn.disabled = false;
        } else {
            submitBtn.disabled = true;
        }
    }

    function btnCheck(btn) {
        if(btn.disabled) {
            return true;
        } else {
            return false;
        }
    }
</script>
</body>
</html>