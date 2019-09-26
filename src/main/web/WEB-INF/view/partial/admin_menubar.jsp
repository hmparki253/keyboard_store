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
                    <a id="admin_menubar_main" class="nav-link pl-0" href="<c:url value="/admin"/>">메인</a>
                </li>
                <li class="nav-item">
                    <a id="admin_menubar_product" class="nav-link" href="<c:url value="/admin/product"/>">상품관리</a>
                </li>
                <li class="nav-item">
                    <a id="admin_menubar_order" class="nav-link" href="<c:url value="/admin/order"/>">주문관리</a>
                </li>
                <%--<li class="nav-item">--%>
                    <%--<a id="admin_menubar_user" class="nav-link" href="<c:url value="/admin/user"/>">회원관리</a>--%>
                <%--</li>--%>
            </ul>
        </div> <!-- collapse .// -->
    </div> <!-- container .// -->
</nav>
<script src="<c:url value="/resources/js/admin_menubar.js" />"></script>