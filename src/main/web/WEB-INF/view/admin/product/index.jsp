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
        <h2>상품관리</h2>
        <div class="row pt-2">
            <div class="col-sm-3">
                <div class="card">
                    <article class="card-group-item">
                        <div class="">
                            <div class="card-body">
                                <ul class="list-unstyled list-lg">
                                    <li>
                                        <a id="product_list" href="<c:url value="/admin/product"/>">
                                            상품목록
                                        </a>
                                    </li>
                                    <li>
                                        <a id="product_registration" href="<c:url value="/admin/product/registration"/>">
                                            상품등록
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
                                        <th>상품명</th>
                                        <th>가격</th>
                                        <th>재고</th>
                                        <th>상품등록일</th>
                                        <th>카테고리</th>
                                        <th>할인율(%)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${products}" var="product">
                                    <tr>
                                        <td>${product.name}</td>
                                        <td>${product.price}</td>
                                        <td>${product.inventory}</td>
                                        <td><fmt:formatDate value="${product.regDate}" pattern="yyyy-MM-dd"/></td>
                                        <td>${product.categoryName}</td>
                                        <td>${product.discount} %</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <nav aria-label="...">
                        <ul class="pagination justify-content-center">
                            <c:if test="${startPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="<c:url value="/admin/product?curPage=1"/>">처음</a>
                                </li>
                            </c:if>
                            <c:if test="${curPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="<c:url value="/admin/product?curPage=${curPage - 1}"/>">이전</a>
                                </li>
                            </c:if>
                            <c:forEach begin="${startPage}" end="${endPage}" varStatus="loop">
                                <c:choose>
                                    <c:when test="${curPage eq loop.current}">
                                        <li class="page-item active">
                                            <a class="page-link" href="<c:url value="/admin/product?curPage=${loop.current}"/>">
                                                    ${loop.current}
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" href="<c:url value="/admin/product?curPage=${loop.current}"/>">
                                                    ${loop.current}
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${curPage < totalPageCount}">
                                <li class="page-item">
                                    <a class="page-link" href="<c:url value="/admin/product?curPage=${curPage + 1}"/>">다음</a>
                                </li>
                            </c:if>
                            <c:if test="${endPage < totalPageCount}">
                                <li class="page-item">
                                    <a class="page-link" href="<c:url value="/admin/product?curPage=${totalPageCount}"/>">끝</a>
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
</body>
</html>