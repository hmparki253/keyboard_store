<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>주문내역</title>
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
        <h2><strong>주문내역</strong></h2>
        <div class="row">
            <div class="col-sm-3">
                <div class="card">
                    <div class="card-body">
                        <h4>${username} 님의 주문내역입니다.</h4>
                    </div>
                </div>
            </div>
            <div class="col-sm-9">
                <c:forEach items="${orderInfos}" var="orderInfo">
                    <article class="card card-product">
                        <div class="card-body">
                            <div class="row">
                                <aside class="col-sm-3">
                                    <div class="img-wrap">
                                        <img src="/displayImage?fileName=${orderInfo.randName}&directory=product">
                                    </div>
                                </aside>
                                <article class="col-sm-6">
                                    <h4 class="title">${orderInfo.name}</h4>
                                    <p class="paragraph">수량 : ${orderInfo.quantity}개 |
                                        <fmt:formatDate value="${orderInfo.regDate}" pattern="yyyy-MM-dd"/>
                                    </p>
                                    <c:set var="eachTotalPrice" value="${orderInfo.price * orderInfo.quantity}" />
                                    <h5>${eachTotalPrice} 원</h5>
                                    <c:choose>
                                        <c:when test="${orderInfo.paymentStatus == 0}">
                                            <p class="text-success">입금대기중</p>
                                        </c:when>
                                        <c:when test="${orderInfo.shippingStatus == 0}">
                                            <p class="text-success">배송준비중</p>
                                        </c:when>
                                        <c:when test="${orderInfo.shippingStatus == 1}">
                                            <p class="text-success">배송중</p>
                                            <p class="text-dark">배송번호: ${orderInfo.shippingNo}</p>
                                        </c:when>
                                        <c:when test="${orderInfo.shippingStatus == 2}">
                                            <p class="text-success">배송완료</p>
                                        </c:when>
                                    </c:choose>
                                </article>
                                <aside class="col-sm-3 border-left">
                                    <div class="action-wrap">
                                        <c:choose>
                                            <c:when test="${orderInfo.shippingStatus == 2}">
                                                <p>구매가 완료되었습니다.</p>
                                            </c:when>
<%--                                            <c:when test="${orderInfo.shippingStatus == 1 || orderInfo.shippingStatus == 2}">--%>
<%--                                                <p>--%>
<%--                                                    <a href="#" class="btn btn-secondary ml-0">배송조회</a>--%>
<%--                                                </p>--%>
<%--                                            </c:when>--%>
<%--                                            <c:when test="${orderInfo.shippingStatus == 2}">--%>
<%--                                                <p>--%>
<%--                                                    <a href="#" class="btn btn-secondary ml-0">리뷰작성</a>--%>
<%--                                                </p>--%>
<%--                                            </c:when>--%>
                                        </c:choose>
                                    </div>
                                </aside>
                            </div>
                        </div>
                    </article>
                </c:forEach>
                    <nav aria-label="...">
                        <ul class="pagination justify-content-center">
                            <c:if test="${startPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="<c:url value="/order/list?curPage=1"/>">처음</a>
                                </li>
                            </c:if>
                            <c:if test="${curPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="<c:url value="/order/list?curPage=${curPage - 1}"/>">이전</a>
                                </li>
                            </c:if>
                            <c:forEach begin="${startPage}" end="${endPage}" varStatus="loop">
                                <c:choose>
                                    <c:when test="${curPage eq loop.current}">
                                        <li class="page-item active">
                                            <a class="page-link" href="<c:url value="/order/list?curPage=${loop.current}"/>">
                                                    ${loop.current}
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" href="<c:url value="/order/list?curPage=${loop.current}"/>">
                                                    ${loop.current}
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${curPage < totalPageCount}">
                                <li class="page-item">
                                    <a class="page-link" href="<c:url value="/order/list?curPage=${curPage + 1}"/>">다음</a>
                                </li>
                            </c:if>
                            <c:if test="${endPage < totalPageCount}">
                                <li class="page-item">
                                    <a class="page-link" href="<c:url value="/order/list?curPage=${totalPageCount}"/>">끝</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
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