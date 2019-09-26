<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>주문완료</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/base.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/mdb.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>">
</head>
<body>
<%@include file="../partial/header.jsp"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-cgray">
    <div class="container">
        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#main_nav" aria-controls="main_nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse" id="main_nav" style="">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link pl-0" href="<c:url value="/"/>">메인</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold" href="<c:url value="/shop/list"/>">상점</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">INFO</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Q&amp;A</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">결제</a>
                </li>
            </ul>
        </div> <!-- collapse .// -->
    </div> <!-- container .// -->
</nav>
<section class="section-content bg padding-y">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 mb-3">
                <h2><strong>주문이 확인되었습니다.</strong></h2>
                <p>주문번호 ${orderVO.id}</p>
                <p>주문서에 명시된 계좌로 입금해 주셔야 주문이 완료됩니다.</p>
            </div>
            <div class="col-sm-9 mb-3">
                <div class="card p-3 mb-3">
                    <h5><strong>주문상품내역</strong></h5><hr>
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
                        <c:forEach items="${orderedProductVOS}" var="products">
                            <tr>
                                <td>
                                    <figure class="media">
                                        <div class="img-wrap">
                                            <img src="" class="">
                                        </div>
                                        <figcaption class="media-body">
                                            <h6 class="title text-truncate">
                                                <img style="width: 100px" src="/displayImage?fileName=${products.randName}&directory=product">
                                                    ${products.name}
                                            </h6>
                                        </figcaption>
                                    </figure>
                                </td>
                                <td>
                                    <div class="">
                                        <var class="" id="${products.id}_price">${products.price}</var>
                                        <var>원</var>
                                    </div>
                                </td>
                                <td>
                                    <input type="text" readonly="readonly" id="${products.id}_quantity" value="${products.quantity}">
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="card p-3 mb-3">
                    <h5><strong>배송지정보</strong></h5><hr>
                    <div class="row pl-3 mb-3">
                        <div class="col-sm-2"><span>수취인성명</span></div>
                        <div class="col-sm-10">${orderVO.orderer}</div>
                    </div>
                    <div class="row pl-3 mb-3">
                        <div class="col-sm-2"><span>연락처</span></div>
                        <div class="col-sm-10">${orderVO.phone}</div>
                    </div>
                    <div class="row pl-3 mb-3">
                        <div class="col-sm-2"><span>배송지 주소</span></div>
                        <div class="col-sm-10">(${orderVO.postalCode})${orderVO.addr1} ${orderVO.addr2}</div>
                    </div>
                    <div class="row pl-3 mb-3">
                        <div class="col-sm-2"><span>요청사항</span></div>
                        <div class="col-sm-10">${orderVO.requirements}</div>
                    </div>
                </div>
                <div class="card p-3 mb-3">
                    <h5><strong>입금계좌안내</strong></h5><hr>
                    <div class="row pl-3 mb-3">
                        <div class="col-sm-2"><span>은행명</span></div>
                        <div class="col-sm-10">우리은행</div>
                    </div>
                    <div class="row pl-3 mb-3">
                        <div class="col-sm-2"><span>예금주</span></div>
                        <div class="col-sm-10">박현민</div>
                    </div>
                    <div class="row pl-3 mb-3">
                        <div class="col-sm-2"><span>계좌번호</span></div>
                        <div class="col-sm-10">123-45-6789012</div>
                    </div>
                    <div class="row pl-3 mb-3">
                        <div class="col-sm-2"><span>입금자명</span></div>
                        <div class="col-sm-10">${orderVO.orderer}</div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card p-3 text-center">
                    <div class="row pl-3">
                        <strong>최종결제금액</strong>
                    </div>
                    <div class="row pl-3">
                        <h5 name="totalPrice" id="totalPrice">${orderVO.totalPrice}</h5><h5>원</h5>
                    </div>
                    <div class="row pl-3">
                        <span class="text-muted"><small>배송비: (+)2,500원</small></span>
                    </div>
                    <hr>
                    <div class="row pl-3">
                        <a href="/" class="btn btn-primary ml-0">메인으로</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="../partial/footer.jsp" %>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/popper.min.js" />"></script>
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

            if(inputCheck(doms)) {
                $('#submit_btn').prop("disabled", false);
            } else {
                $('#submit_btn').prop("disabled", true);
            }

        });

        $('#empty_check').on("click", function(e) {
            console.log(inputCheck());
        });

        function inputCheck(doms) {
            let flag = 0;

            doms.forEach(function(item) {
                // 이 구문에서 Object object로 받아들임
                if(item.val().replace(/\s/g,"").length == 0)
                    flag += 1;
            });

            if(flag == 0) {
                return true;
            } else {
                return false;
            }
        }
    });
</script>
</body>
</html>