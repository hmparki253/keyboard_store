<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>index</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/base.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/mdb.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>">
</head>
<body onload="side_nav_bold()">
    <%@include file="../partial/header.jsp"%>
    <%@include file="../partial/menubar.jsp"%>
    <section class="section-content bg padding-y">
        <div class="container">
            <h2>상점</h2>
            <div class="row">
                <aside class="col-sm-3">
                    <div class="card card-filter">
                        <article class="card-group-item">
                            <header class="card-header">
                                카테고리
                            </header>
                            <div class="">
                                <div class="card-body">
                                    <input type="hidden" id="category" value="${category ? 0 : category}" />
                                    <ul class="list-unstyled list-lg">
                                        <li>
                                            <a id="side_nav_0" class="" href="/shop/list?category=0">
                                                전체
                                                <span class="float-right badge badge-light round">${categorySum}</span>
                                                <input type="hidden" value="0" />
                                            </a>
                                        </li>
                                        <c:forEach items="${categories}" var="item">
                                            <!-- 카테고리 값에 따른 bold font 처리는 이곳에서 해주자 -->
                                            <li>
                                                <a id="side_nav_${item.categoryId}" class="" href="<c:url value="/shop/list?category=${item.categoryId}"/>">
                                                        ${item.name}
                                                    <span class="float-right badge badge-light round">${item.cnt}</span>
                                                    <hidden value="${item.categoryId}"></hidden>
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </article>
                    </div>
                </aside>
                <main class="col-sm-9">
                    <c:forEach items="${products}" var="product">
                        <article class="card card-product">
                            <div class="card-body">
                                <div class="row">
                                    <aside class="col-sm-3">
                                        <div class="img-wrap">
                                                <%--<img src="http://kbdlab.co.kr/files/attach/images/340/557/524/005/7db9c5a4adde42dfb94d973d5eb77bfa.JPG">--%>
                                            <img src="/displayImage?fileName=${product.randName}&directory=product">
                                        </div>
                                    </aside>
                                    <article class="col-sm-6">
                                        <h4 class="title">${product.name}</h4>
                                        <p class="paragraph">${product.description}</p>
                                    </article>
                                    <aside class="col-sm-3 border-left">
                                        <div class="action-wrap">
                                            <div class="price-wrap h4">
                                                <c:set var="totalPrice" value="${product.price * ((100 - product.discount) / 100)}"/>
                                                <fmt:parseNumber var="totalPrice" integerOnly="true" value="${totalPrice}"/>
                                                <span class="price">${totalPrice}원</span><br>
                                                <del class="price-old">${product.price}원</del>
                                            </div>
                                            <p class="text-success">무료배송</p>
                                            <br>
                                            <p>
                                                <a href="<c:url value="/shop/description/${product.id}?category=${product.categoryId}&amp;curPage=${curPage}"/>" class="btn btn-primary ml-0">상세보기</a>
                                                <a href="#" class="btn btn-secondary ml-0">장바구니</a>
                                            </p>
                                            <a class="text-danger" href="#">
                                                <i class="fa fa-heart"></i>
                                                찜하기
                                            </a>
                                        </div>
                                    </aside>
                                </div>
                            </div>
                        </article>
                    </c:forEach>
                    <nav aria-label="...">
                        <ul class="pagination justify-content-center">
                            <c:if test="${isPre eq true}">
                                <li class="page-item">
                                    <a class="page-link" href="#">Previous</a>
                                </li>
                            </c:if>
                            <c:forEach begin="${startPage}" end="${endPage}" varStatus="loop">
                                <c:choose>
                                    <c:when test="${curPage eq loop.current}">
                                        <li class="page-item active">
                                            <a class="page-link" href="<c:url value="/shop/list?category=${category}&amp;curPage=${loop.current}"/>">
                                                    ${loop.current}
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" href="<c:url value="/shop/list?category=${category}&amp;curPage=${loop.current}"/>">
                                                    ${loop.current}
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${isNext eq true}">
                                <li class="page-item">
                                    <a href="#" class="page-link">Next</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </main>
            </div>
        </div>
    </section>
    <%@include file="../partial/footer.jsp" %>
    <script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/popper.min.js" />"></script>
    <script>
        function side_nav_bold() {
            var category = document.getElementById('category').value;
            console.log('side_nav_' + category);
            var side_nav = document.getElementById('side_nav_' + category + '');
            side_nav.classList.add('font-weight-bold');
        }
    </script>
</body>
</html>