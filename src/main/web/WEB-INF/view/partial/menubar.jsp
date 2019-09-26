<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=utf-8"%>

<nav id="menubar" class="navbar navbar-expand-lg navbar-dark bg-cgray">
    <div class="container">
        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#main_nav" aria-controls="main_nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse" id="main_nav" style="">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a id="menubar_main" class="nav-link pl-0" href="<c:url value="/"/>">메인</a>
                </li>
                <li class="nav-item">
                    <a id="menubar_shop" class="nav-link" href="<c:url value="/shop/list"/>">상점</a>
                </li>
                <li class="nav-item">
                    <a id="menubar_info" class="nav-link" href="#">INFO</a>
                </li>
                <li class="nav-item">
                    <a id="menubar_qna" class="nav-link" href="#">Q&amp;A</a>
                </li>
                <li class="nav-item">
                    <a id="menubar_payment" class="nav-link" href="<c:url value="/cart"/>">결제</a>
                </li>
                <li class="nav-item">
                    <a id="menubar_purchase_history" class="nav-link" href="<c:url value="/order/list"/>">주문내역</a>
                </li>
            </ul>
        </div> <!-- collapse .// -->
    </div> <!-- container .// -->
</nav>
<script src="<c:url value="/resources/js/menubar.js" />"></script>