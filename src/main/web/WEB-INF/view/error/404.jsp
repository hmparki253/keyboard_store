<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ERROR</title>
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
        <div class="col-md-12">
            <div class="error-template">
                <img src="/resources/img/frown.svg">
                <h1>404</h1>
                <h2>찾을 수 없는 페이지 입니다.</h2>
                <div class="error-details">
                    요청하신 페이지가 사라졌거나, 잘못된 경로를 이용하셨어요 :)
                </div>
                <div class="error-actions">
                    <a href="/" class="btn btn-md btn-outline-black">홈으로 이동</a>
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="../partial/footer.jsp" %>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/popper.min.js" />"></script>
</body>
</html>