<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>키보드스토어</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/base.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/mdb.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>">
</head>
<body>
    <%@include file="partial/header.jsp" %>
    <%@include file="partial/menubar.jsp"%>
    <section class="section-content bg padding-y">
        <div class="carousel border-dark">
            <div class="view blur-div">
                <img src="<c:url value="/resources/img/main_image.jpg"/>" class="img-fluid w-100" style="z-index: -1" alt="main image">
            </div>
            <div class="carousel-caption">
                <h2 class="font-weight-bold">키보드스토어에 오신것을 환영합니다.</h2>
                <h4>다양한 장비들을 좋은 가격에 구입하세요</h4>
            </div>
        </div>

        <div class="container">
            <div class="col-md-12 mt-4 mb-4">
                <div class="heading text-center">
                    <h2 class="h2_underline pb-2">신상품</h2>
                    <div class="card-deck mt-2">
                        <c:forEach items="${productsLate5}" var="late">
                        <div class="card mb-4">
                            <div class="view overlay">
                                <img class="card-img-top" src="/displayImage?fileName=${late.randName}&directory=product" alt="Card image cap">
                                <a href="#!">
                                    <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">${late.name}</h4>
                                <p class="card-text">${late.description}</p>
                                <a href="<c:url value="/shop/description/${late.id}"/>" class="btn btn-light-blue btn-sm">자세히 보기</a>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-md-12 mb-4">
                <div class="heading text-center">
                    <h2 class="h2_underline pb-2 mb-2">인기상품</h2>
                    <div class="card-deck mt-2">
                        <c:forEach items="${productsTop5}" var="top">
                            <div class="card mb-4">
                                <div class="view overlay">
                                    <img class="card-img-top" src="/displayImage?fileName=${top.randName}&directory=product" alt="Card image cap">
                                    <a href="#!">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">${top.name}</h4>
                                    <p class="card-text">${top.description}</p>
                                    <a href="<c:url value="/shop/description/${top.id}"/>" class="btn btn-light-blue btn-sm">자세히 보기</a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="partial/footer.jsp" %>
    <script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/popper.min.js" />"></script>
</body>
</html>