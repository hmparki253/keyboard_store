<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/base.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/mdb.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>">
</head>
<body>
    <%@include file="partial/header.jsp"%>
    <nav class="navbar navbar-expand-lg navbar-dark bg-cgray">
        <div class="container">
            <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#main_nav" aria-controls="main_nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse collapse" id="main_nav" style="">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link font-weight-bold pl-0" href="<c:url value="/"/>">메인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/shop/list"/>"><strong>상점</strong></a>
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
            <div class="col-md-12 mb-4">
                <div class="heading text-center">
                    <h2 class="h2_underline pb-2">로그인</h2>
                </div>
            </div>
            <div class="row justify-content-center">
                <c:url var="auth_url" value="/authenticate" />
                <form:form action="${auth_url}" method="post">
                    <div class="container mt-5" style="max-width: 420px; min-height: 350px;">
                        <c:if test="${param.error != null}">
                            <div class="from-group text-warning">
                                <label for="">
                                    이런! 일치하는 아이디와 비밀번호가 아닙니다.
                                </label>
                            </div>
                        </c:if>
                        <div class="from-group">
                            <label for="">아이디</label>
                            <input type="text" name="username" id="username" class="form-control">
                        </div>
                        <div class="from-group mt-3">
                            <label for="">비밀번호</label>
                            <input type="password" name="password" id="password" class="form-control">
                        </div>
                        <div class="form-group text-center mt-3">
                            <button type="submit" class="btn btn-primary mt-3">로그인</button>
                        </div>
                        <div class="form-group text-center">
                            <a href="#">
                                <small>회원가입</small>
                            </a>
                        </div>
                        <div class="form-group text-center">
                            <a href="#">
                                <small>로그인 정보를 잊으셨나요?</small>
                            </a>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </section>
    <%@include file="partial/footer.jsp"%>
    <script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/popper.min.js" />"></script>
</body>
</html>