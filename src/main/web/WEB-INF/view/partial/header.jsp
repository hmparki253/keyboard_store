<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=utf-8"%>

<section class="header-main">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-3 col-sm-4">
                <h2 class="store-title"><a class="title-link" href="/">Keyboard Store</a></h2>
            </div>
            <div class="col-lg-4 col-xl-5 col-sm-8">
                <%--<form action="#" class="search-wrap">--%>
                    <%--<div class="input-group w-100">--%>
                        <%--<input type="text" class="form-control" placeholder="search">--%>
                        <%--<div class="input-group-append">--%>
                            <%--<button class="btn btn-primary btn-sm" type="submit">--%>
                                <%--<i class="fa fa-search"></i>--%>
                            <%--</button>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</form>--%>
            </div>
            <div class="col-lg-5 col-xl-4 col-sm-12">
                <div class="widgets-wrap float-right">
                    <a href="/cart" class="widget-header mr-3">
                        <div class="icon-text">
                            <div class="icon-wrap">
                                <i class="icon-sm round border fa fa-shopping-cart"></i>
                            </div>
                            <div class="text-wrap">
                                <sec:authorize access="!isAuthenticated()">
                                    <span class="small badge badge-danger"></span>
                                </sec:authorize>
                                <sec:authorize access="isAuthenticated()">
                                    <span id="cartCount" class="small badge badge-danger"></span>
                                </sec:authorize>
                                <div>Cart</div>
                            </div>
                        </div>
                    </a>
                    <div class="icon-text">
                        <a href="#">
                            <div class="icon-wrap">
                                <i class="icon-sm round border fa fa-user"></i>
                            </div>
                        </a>
                        <div class="text-wrap">
                            <sec:authorize access="!isAuthenticated()">
                                <a href="<c:url value="/join"/>"><small>회원가입</small></a>
                                <a href="<c:url value="/login"/>"><div>로그인</div></a>
                            </sec:authorize>
                            <sec:authorize access="isAuthenticated()">
                                <a href="<c:url value="/logout"/>"><small>로그아웃</small></a>
                                <a href="<c:url value="#"/>">
                                    <div>
                                            ${pageContext.request.userPrincipal.name}님
                                    </div>
                                </a>
                            </sec:authorize>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
<script>
    $(document).ready(function () {
        let cartCount = 0;
        if($('#cartCount')) {
            let cartCountObj = $('#cartCount');
            $.ajax({
                type: 'GET',
                url: '<c:url value="/getCartCount" />',
                async: false,
                success: function(args) {
                    cartCount = args;
                },
                error: function(e) {
                    console.log(e);
                }
            });
            cartCountObj.text(cartCount);
        }
    });
</script>
