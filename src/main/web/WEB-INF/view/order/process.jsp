<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>주문</title>
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
    <div class="container">
        <div class="row">
            <form action="/order/placeOrder" method="post" class="form-row">
                <div class="col-sm-12 mb-3">
                    <h2><strong>주문/결제</strong></h2>

                    <div class="card mt-3">
                        <table class="table table-hover">
                            <thead class="text-muted">
                            <tr>
                                <th scope="col">상품명</th>
                                <th scope="col">가격</th>
                                <th scope="col">수량</th>
                                <%--<th scope="col">할인</th>--%>
                                <%--<th scope="col">주문금액</th>--%>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var="totalPrice" value="${0}" />
                            <c:forEach items="${orders}" var="order">
                                <c:set var="totalPrice" value="${totalPrice + order.price * order.quantity}" />
                                <tr>
                                    <td>
                                        <input type="hidden" name="cartId" value="${order.id}" />
                                        <figure class="media">
                                            <div class="img-wrap">
                                                <img src="" class="">
                                            </div>
                                            <figcaption class="media-body">
                                                <h6 class="title text-truncate">
                                                    <img style="width: 100px" src="/displayImage?fileName=${order.randName}&directory=product">
                                                        ${order.name}
                                                </h6>
                                            </figcaption>
                                        </figure>
                                    </td>
                                    <td>
                                        <div class="">
                                            <input type="hidden" id="hidden_price_${order.id}" value="${order.price}" />
                                            <var class="" id="${order.id}_price">${order.price}</var>
                                            <var>원</var>
                                        </div>
                                    </td>
                                    <td>
                                        <input type="text" readonly="readonly" id="${order.id}_quantity" value="${order.quantity}">
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:set var="totalPrice" value="${totalPrice + 2500}" />
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-sm-9">
                    <div class="card p-3 mb-3">
                        <h5><strong>배송지정보</strong></h5><hr>
                        <div class="row pl-3 mb-3">
                            <div class="col-sm-12">
                                <input id="auto_input" class="mr-1" type="checkbox">회원정보에 입력된 정보로 배송합니다.
                            </div>
                        </div>
                        <div class="row pl-3 mb-3">
                            <div class="col-sm-2"><span>성명(*)</span></div>
                            <div class="col-sm-10">
                                <input type="text" id="orderer" name="orderer" placeholder="">
                                <small id="orderer_label" class="text-warning" style="display: none">성명은 2 ~ 12자 이내로 적어주세요</small>
                            </div>
                        </div>
                        <div class="row pl-3 mb-3">
                            <div class="col-sm-2"><span>연락처(*)</span></div>
                            <div class="col-sm-10">
                                <input type="text" id="phone" name="phone">
                                <small id="phone_label" class="text-warning" style="display: none">특수기호를 뺀 순수 숫자 11자리만 입력해주세요</small>
                            </div>
                        </div>
                        <div class="row pl-3 mb-3">
                            <div class="col-sm-2"><span>배송지 주소(*)</span></div>
                            <div class="col-sm-10">
                                <input id="postalCode" name="postalCode" class="mr-3" type="text" readonly>
                                <input type="button" value="우편번호" onclick="execDaumPostcode()">
                                <div id="addr_wrap" class=""></div>
                            </div>
                        </div>
                        <div class="row pl-3 mb-3">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">
                                <input id="addr1" name="addr1" class="mr-3" type="text" readonly>
                                <input id="addr2" name="addr2" type="text">
                                <small id="addr1_label" class="text-warning" style="display: none">주소검색을 눌러 주소를 입력해주세요</small>
                                <small id="addr2_label" class="text-warning" style="display: none">상세주소는 0에서 100자 이내로 입력해주세요</small>
                            </div>
                        </div>
                        <div class="row pl-3 mb-3">
                            <div class="col-sm-2"><span>요청사항</span></div>
                            <div class="col-sm-10">
                                <input id="requirements" name="requirements" type="text">
                                <small id="require_label" class="text-warning" style="display: none">요청사항은 0애서 80자 이내로 입력해주세요</small>
                            </div>
                        </div>
                    </div>
                    <div class="card p-3">
                        <h5><strong>결제정보</strong></h5><hr>
                        <div class="row pl-3">
                            <div class="col-sm-12">
                                <span class="mr-1"><input type="radio" name="paymentMethod" checked="checked" value="0"></span>
                                <span>무통장입금 / 계좌이체</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="card p-3 text-center">
                        <div class="row pl-3">
                            <strong>결제금액</strong>
                        </div>
                        <div class="row pl-3">
                            <input type="hidden" name="totalPrice" value="${totalPrice}">
                            <h5>${totalPrice}</h5><h5>원</h5>
                        </div>
                        <hr>
                        <div class="row pl-3">
                            <span class="text-muted"><small>배송비: (+)2,500원</small></span>
                        </div>
                        <input type="submit" id="submit_btn" class="btn btn-sm btn-blue" value="결제하기" disabled>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<%@include file="../partial/footer.jsp" %>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/popper.min.js" />"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    $(document).ready(function() {
        let doms = [ $('#orderer'), $('#phone'), $('#postalCode'), $('#addr1'), $('#addr2') ];

        $('#auto_input').on("click", function(e) {
            if(e.currentTarget.checked) {
                $.ajax({
                    type:'GET',
                    async: false,
                    url:'<c:url value="/getUserInfo"/>'
                }).done(function(data) {
                    $('#orderer').val(data.name);
                    $('#phone').val(data.phone);
                    $('#postalCode').val(data.postalCode);
                    $('#addr1').val(data.addr1);
                    $('#addr2').val(data.addr2);
                }).fail(function(xhr, status, err) {
                    console.log('에러 발생 ' + err);
                });
            } else {
                $('#orderer').val('');
                $('#phone').val('');
                $('#postalCode').val('');
                $('#addr1').val('');
                $('#addr2').val('');
            }

            totalCheck();

        });

        // doms.forEach(function(item) {
        //     item.keyup(function() {
        //         totalCheck();
        //     });
        //
        //     item.focusout(function() {
        //         totalCheck();
        //     });
        // });
        $(doms).each(function(_, item) {
            item.on("keyup", function () {
               totalCheck();
            });
            item.on("focusout", function() {
               totalCheck();
            });
        });

        function submitToggle(flag) {
            $('#submit_btn').prop("disabled", flag);
        }

        // 수신자
        function checkOrderer(orderer) {
            let flag = false;
            const ordererRegex = new RegExp(/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,12}/gi);
            flag = ordererRegex.test(orderer);
            console.log("수신자 성명 테스트 결과 : " + orderer + "_" + flag);
            if(flag) {
                $('#orderer_label').css('display', 'none');
            } else {
                $('#orderer_label').css('display', 'block');
            }
            return flag;
        }

        // 핸드폰
        function checkPhone(phone) {
            let flag = false;
            const phoneRegex = new RegExp(/^[0-9]{11}/gi);
            flag = phoneRegex.test(phone);
            console.log("폰번호 테스트 결과 : " + phone + "_" + flag);
            if(flag) {
                $('#phone_label').css('display', 'none');
            } else {
                $('#phone_label').css('display', 'block');
            }
            return flag;
        }

        // 주소체크
        function checkAddr1(postalCode, addr1) {
            let flag = false;
            if((postalCode.length && addr1.length) !== 0) {
                flag = true;
                $('#addr1_label').css('display', 'none');
            } else {
                $('#addr1_label').css('display', 'block');
            }
            console.log("주소1 테스트 결과 : " + postalCode + "_" + addr1 + "_" + flag);
            return flag;
        }

        function checkAddr2(addr2) {
            let flag = false;
            if((addr2.length >= 0 && addr2.length <= 100)) {
                flag = true;
                $('#addr2_label').css('display', 'none');
            } else {
                $('#addr2_label').css('display', 'block');
            }
            console.log("주소2 테스트 결과 : " + addr2 + "_" + flag);
            return flag;
        }

        // 0이거나 80자 안으로
        function checkRequire(requirements) {
            let flag = false;
            if(requirements.length >= 0 && requirements.length <= 80) {
                flag = true;
                $('#require_label').css('display', 'none');
            } else {
                $('#require_label').css('display', 'block');
            }
            console.log("요구 테스트 결과 : " + requirements + "_" + flag);
            return flag;
        }

        function totalCheck() {
            // 성명
            let ordererVal = $('#orderer').val();
            // 연락처
            let phoneVal = $('#phone').val();
            // 우편번호, 주소1 길이 0 아닌지
            let postalCodeVal = $('#postalCode').val();
            let addr1Val = $('#addr1').val();
            // 주소2 길이 0부터 100자까지
            let addr2Val = $('#addr2').val();
            // 요구사항 길이 0부터 90까지
            let requireVal = $('#requirements').val();

            let ordererFlag = checkOrderer(ordererVal);
            let phoneFlag = checkPhone(phoneVal);
            let addr1Flag = checkAddr1(postalCodeVal, addr1Val);
            let addr2Flag = checkAddr2(addr2Val);
            let requireFlag = checkRequire(requireVal);
            // 왜 함수안에서 function으로 && 묶여있을때는 처리가 덜되었는지 다시 확인필요 
            let totalFlag = ordererFlag && phoneFlag && addr1Flag && addr2Flag && requireFlag;

            console.log("최종 flag 뭔데 : " + totalFlag);
            if(!totalFlag) {
                submitToggle(true);
            } else {
                submitToggle(false);
            }
        }
    });

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        let element_wrap = document.getElementById("addr_wrap");
        element_wrap.style.display = 'none';
    }

    function execDaumPostcode() {
        let element_wrap = document.getElementById("addr_wrap");

        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    // document.getElementById("sample3_extraAddress").value = extraAddr;

                } else {
                    // document.getElementById("sample3_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postalCode').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
</body>
</html>