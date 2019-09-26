<%@ page contentType="text/html; charset=utf-8"%>

<footer class="bg-cgray">
    <div class="container">
        <section class="footer-top pt-5">
            <div class="row">
                <aside class="col-sm-3 col-md-3 text-white">
                    <h5 class="title">고객서비스</h5>
                    <ul class="list-unstyled">
                        <li>Q&amp;A</li>
                    </ul>
                </aside>
                <aside class="col-sm-3 col-md-3 text-white">
                    <h5 class="title">나의 계정</h5>
                    <ul class="list-unstyled">
                        <sec:authorize access="!isAuthenticated()">
                        <li>로그인</li>
                        <li>회원가입</li>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                            <li>주문내역</li>
                        </sec:authorize>
                        <li>찜목록</li>
                    </ul>
                </aside>
                <aside class="col-sm-3 col-md-3 text-white">
                    <h5 class="title">Keyboard Store란</h5>
                    <ul class="list-unstyled">
                        <li>배송과 지불</li>
                        <li>파트너쉽</li>
                    </ul>
                </aside>
                <aside class="col-sm-3 col-md-3 text-white">
                    <h5 class="title">Contacts</h5>
                    <p>
                        <strong>Phone: 02-222-5555 </strong>
                        <br>
                        <strong>Fax: 02-222-5556 </strong>
                    </p>
                    <div class="btn-group text-white">
                        <%--<a class="btn btn-instagram" title="instagram" target="_blank" href="http://www.instagram.com"></a>--%>
                        <a class="text-primary" href="http://www.facebook.com"><i class="fa fa-facebook icon-sm"></i></a>
                        <a class="text-danger" href="http://www.instagram.com"><i class="fa fa-instagram icon-sm"></i></a>
                    </div>
                </aside>
            </div>
        </section>
        <section class="footer-bottom row border-top-white">
            <div class="col-sm-12 pt-3">
                <p class="text-md-right text-white-50">
                    Copyright&copy;2019
                    <br>
                    Keyboard Store
                </p>
            </div>
        </section>
    </div>
</footer>
