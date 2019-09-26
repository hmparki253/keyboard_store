<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>상품관리</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/base.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/mdb.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>">
</head>
<body>
<%@include file="../../partial/header.jsp" %>
<%@include file="../../partial/admin_menubar.jsp"%>
<section class="section-content bg padding-y">
    <div class="container">
        <h2>주문관리</h2>
        <div class="row pt-2">
            <div class="col-sm-3">
                <div class="card">
                    <article class="card-group-item">
                        <div class="">
                            <div class="card-body">
                                <ul class="list-unstyled list-lg">
                                    <li>
                                        <a id="product_list" href="<c:url value=""/>">
                                            주문목록
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
            <div class="col-sm-9">
                <article class="card card-product p-3">
                    <div class="card-body">
                        <div class="row minimum-height">
                            <table class="table-bordered table-hover w-100">
                                <thead class="font-weight-bold">
                                    <tr>
<%--                                        <th>--%>
<%--                                            <input type="checkbox" id="total_checkbox">--%>
<%--                                        </th>--%>
                                        <th>주문자계정</th>
                                        <th>주문자명</th>
                                        <th>상품명</th>
                                        <th>총구매금액</th>
                                        <th>결제방식</th>
                                        <th>입금상태</th>
                                        <th>배송상태</th>
                                        <th>송장번호</th>
                                        <th>업데이트</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${orders}" var="order">
                                    <tr>
<%--                                        <td>--%>
<%--                                            <input type="checkbox" id="${order.id}_checkbox">--%>
<%--                                        </td>--%>
                                        <td>${order.username}</td>
                                        <td>${order.orderer}</td>
                                        <td>${order.productName}
                                            <c:if test="${order.orderCount != 0}">
                                                외 ${order.orderCount - 1}개
                                            </c:if>
                                        </td>
                                        <td>${order.totalPrice}</td>
                                        <c:if test="${order.paymentMethod == 0}">
                                            <td>무통장입금</td>
                                        </c:if>
                                        <c:choose>
                                            <c:when test="${order.paymentStatus == 0}">
                                                <td>
                                                    <select id="${order.id}_payment">
                                                        <option value="0" selected>입금미확인</option>
                                                        <option value="1">입금확인</option>
                                                    </select>
                                                </td>
                                            </c:when>
                                            <c:when test="${order.paymentStatus == 1}">
                                                <td>
                                                    <select id="${order.id}_payment" readonly="true">
                                                        <option value="0">입금미확인</option>
                                                        <option value="1" selected>입금확인</option>
                                                    </select>
                                                </td>
                                            </c:when>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${order.shippingStatus == 0}">
                                                <td>
                                                    <select id="${order.id}_shipping">
                                                        <option value="0" selected>배송대기</option>
                                                        <option value="1">배송중</option>
                                                        <option value="2">배송완료</option>
                                                    </select>
                                                </td>
                                            </c:when>
                                            <c:when test="${order.shippingStatus == 1}">
                                                <td>
                                                    <select id="${order.id}_shipping">
                                                        <option value="0">배송대기</option>
                                                        <option value="1" selected>배송중</option>
                                                        <option value="2">배송완료</option>
                                                    </select>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td>
                                                    <select id="${order.id}_shipping" readonly="true">
                                                        <option value="0">배송대기</option>
                                                        <option value="1">배송중</option>
                                                        <option value="2" selected>배송완료</option>
                                                    </select>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                        <td>
                                            <input type="text" id="${order.id}_shippingNo" value="${order.shippingNo}"/>
                                        </td>
                                        <td>
                                            <input type="button" id="${order.id}_update" class="btn btn-primary" value="수정" />
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
<%--                    <div class="text-right">--%>
<%--                        <input type="button" id="checked_update" class="btn btn-sm btn-primary" value="선택항목수정" readonly="readonly">--%>
<%--                    </div>--%>
                    <nav aria-label="...">
                        <ul class="pagination justify-content-center">
                            <c:if test="${startPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="<c:url value="/admin/order?curPage=1"/>">처음</a>
                                </li>
                            </c:if>
                            <c:if test="${curPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="<c:url value="/admin/order?curPage=${curPage - 1}"/>">이전</a>
                                </li>
                            </c:if>
                            <c:forEach begin="${startPage}" end="${endPage}" varStatus="loop">
                                <c:choose>
                                    <c:when test="${curPage eq loop.current}">
                                        <li class="page-item active">
                                            <a class="page-link" href="<c:url value="/admin/order?curPage=${loop.current}"/>">
                                                    ${loop.current}
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" href="<c:url value="/admin/order?curPage=${loop.current}"/>">
                                                    ${loop.current}
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${curPage < totalPageCount}">
                                <li class="page-item">
                                    <a class="page-link" href="<c:url value="/admin/order?curPage=${curPage + 1}"/>">다음</a>
                                </li>
                            </c:if>
                            <c:if test="${endPage < totalPageCount}">
                                <li class="page-item">
                                    <a class="page-link" href="<c:url value="/admin/order?curPage=${totalPageCount}"/>">끝</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </article>
            </div>
        </div>
    </div>
</section>
<%@include file="../../partial/footer.jsp" %>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/popper.min.js" />"></script>
<script src="<c:url value="/resources/js/admin_sidebar.js" />"></script>
<script>
    $(document).ready(function() {
        let curPage = 0;
        let pageParameter = new URLSearchParams(window.location.search);
        if(pageParameter.has("curPage")) {
            curPage = pageParameter.get("curPage");
        } else {
            curPage = 1;
        }

        $("input[id$='_update']").each(function () {
            $(this).on("click", function() {
                let orderId = this.id.split("_")[0];
                let paymentStatus = $("#"+orderId+"_payment").val();
                let shippingStatus = $("#"+orderId+"_shipping").val();
                let shippingNo = $("#"+orderId+"_shippingNo").val();

                let orderVO = { "id": orderId,
                    "paymentStatus": paymentStatus,
                    "shippingStatus": shippingStatus,
                    "shippingNo": shippingNo };

                console.log("아이디값" + orderVO.id);
                console.log("지불정보값" + orderVO.paymentStatus);
                console.log("배송정보값" + orderVO.shippingStatus);
                console.log("송장번호값" + orderVO.shippingNo);

                updateOrder(orderVO);
                window.location.replace('<c:url value="/admin/order"/>' + '?curPage=' + curPage);
            });
        });

        let updateOrder = function(orderVO) {
            // 해당하는 controller에 object만 제대로 실리지 않읆뿐 동작은 제대로한다
            $.ajax({
              type: 'PUT',
              url: '<c:url value="/admin/order" />',
                data: JSON.stringify(orderVO),
                contentType: "application/json; charset=utf-8",
                async: false,
              success: function(data) {
                  console.log("성공했는지?" + data.success);
              },
              error: function(e) {
                  console.log("패치에서 에러발생 " + e);
              }
            });
        };
    });
</script>
</body>
</html>