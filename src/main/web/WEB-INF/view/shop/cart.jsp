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
<body onload="side_nav_bold()">
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
                    <a class="nav-link font-weight-bold" href="<c:url value="/shop/list"/>"><strong>상점</strong></a>
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
            <main class="col-sm-12">
                <div class="card">
                    <table class="table table-hover">
                        <thead class="text-muted">
                            <tr>
                                <th scope="col">상품명</th>
                                <th scope="col">가격</th>
                                <th scope="col">수량</th>
                                <th scope="col">삭제</th>
                                <th scope="col"><input id="total_check" type="checkbox" checked="checked"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <figure class="media">
                                        <div class="img-wrap">
                                            <img src="" class="">
                                        </div>
                                        <figcaption class="media-body">
                                            <h6 class="title text-truncate">상품명</h6>
                                        </figcaption>
                                    </figure>
                                </td>
                                <td>
                                    <div class="">
                                        <var class="">100,000원</var>
                                    </div>
                                </td>
                                <td>
                                    <input type="text" readonly="readonly" value="1">
                                    <button value="-" />
                                    <button value="+" />
                                </td>
                                <td>
                                    <input type="button" value="삭제">
                                </td>
                                <td>
                                    <input type="checkbox" >
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <figure class="media">
                                        <div class="img-wrap">
                                            <img src="" class="">
                                        </div>
                                        <figcaption class="media-body">
                                            <h6 class="title text-truncate">상품명</h6>
                                        </figcaption>
                                    </figure>
                                </td>
                                <td>
                                    <div class="">
                                        <var class="">100,000원</var>
                                    </div>
                                </td>
                                <td>
                                    <input type="text" readonly="readonly" value="1">
                                    <button value="-" />
                                    <button value="+" />
                                </td>
                                <td>
                                    <input type="button" value="삭제">
                                </td>
                                <td>
                                    <input type="checkbox" >
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <figure class="media">
                                        <div class="img-wrap">
                                            <img src="" class="">
                                        </div>
                                        <figcaption class="media-body">
                                            <h6 class="title text-truncate">상품명</h6>
                                        </figcaption>
                                    </figure>
                                </td>
                                <td>
                                    <div class="">
                                        <var class="">100,000원</var>
                                    </div>
                                </td>
                                <td>
                                    <input type="text" readonly="readonly" value="1">
                                    <button value="-" />
                                    <button value="+" />
                                </td>
                                <td>
                                    <input type="button" value="삭제">
                                </td>
                                <td>
                                    <input type="checkbox" >
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="card mt-3 p-3 text-center">
                    <h5>예상 주문금액 :</h5><h6>300,000원</h6>
                </div>
                <div class="card mt-3">
                    <input type="button" class="btn btn-sm btn-blue disabled" value="선택상품 주문하기">
                </div>
    </div>
    </main>
    </div>
    </div>
</section>
<%@include file="../partial/footer.jsp" %>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/popper.min.js" />"></script>
<script>

    // row 단위로 컨트롤 되어야하는 것들 세 가지 -> cart의 id 값에 따른 control을 해야 할 것 같다.
    // 수량 + - button -> 재고에 대한 수량 + - 는 확인해서 product 테이블에도 영향을 미칠 수 있다.
    // 삭제 btn
    // checkbox

    // 전체 toggle 해줘야하는 checkbox toggle

</script>
</body>
</html>