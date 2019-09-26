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
                    <div class="card">
                        <div class="row no-gutters">
                            <aside class="col-sm-6 border-right">
                                <article class="gallery-wrap">
                                    <div class="img-big-wrap">
                                        <div class="pt-3 text-center">
                                            <%--<a href="images/items/1.jpg" data-fancybox=""><img src=""></a>--%>
                                            <img class="description-image" src="<c:url value="/displayImage?fileName=${productPhoto.randName}&directory=product"/>">
                                            <a href="<c:url value="/displayImage?fileName=${productPhoto.randName}&directory=product"/>"></a>
                                        </div>
                                    </div> <!-- slider-product.// -->
                                    <div class="img-small-wrap">
                                        <div class="item-gallery"> <img src="<c:url value="/displayImage?fileName=${productPhoto.randName}&directory=product"/>"></div>
                                        <div class="item-gallery"> <img src=""></div>
                                        <div class="item-gallery"> <img src=""></div>
                                        <div class="item-gallery"> <img src=""></div>
                                    </div> <!-- slider-nav.// -->
                                </article> <!-- gallery-wrap .end// -->
                            </aside>
                            <aside class="col-sm-6">
                                <article class="card-body">
                                    <!-- short-info-wrap -->
                                    <h3 class="title mb-3">${product.name}</h3>
                                    <input type="hidden" id="productId" value="${product.id}">
                                    <div class="mb-3">
                                        <var class="price h3 text-warning">
                                            <span class="currency">₩</span><span class="num">${product.price}</span>
                                        </var>
                                    </div>
                                    <dl>
                                        <dt>상품설명</dt>
                                        <dd><p>${product.description} </p></dd>
                                    </dl>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <dl class="dlist-inline">
                                                <dt>수량: </dt>
                                                <dd>
                                                    <input id="quantity" name="quantity" type="text" value="1" readonly="readonly"/>
                                                    <input id="plus_btn" type="button" value="+" />
                                                    <input id="minus_btn" type="button" value="-" />
                                                    <small id="quantity_db_label" class="text-warning" style="display: none">현재 재고 내에서 최대 구입가능한 수량입니다.</small>
                                                    <small id="quantity_max_label" class="text-warning" style="display: none">한 번 구매시 최대 수량은 5개입니다.</small>
                                                    <small id="quantity_min_label" class="text-warning" style="display: none">수량은 1보다 작을 수 없습니다.</small>
                                                </dd>
                                            </dl>
                                        </div>
                                    </div>
                                    <hr>
                                    <a href="#" id="cart_btn" class="btn btn-warning"> <i class="fa fa-cart-plus"></i>장바구니에 추가</a>
                                    <a href="#" class="btn btn-outline-warning">구입하기</a>
                                    <!-- short-info-wrap .// -->
                                </article> <!-- card-body.// -->
                            </aside> <!-- col.// -->
                        </div> <!-- row.// -->
                    </div>
                </main>
            </div>
        </div>
    </section>
    <%@include file="../partial/footer.jsp"%>
    <!-- Modal -->
    <div class="modal fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">상품등록 성공</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    장바구니에 상품이 담겼습니다.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/popper.min.js" />"></script>
    <script>
        $(document).ready(function() {
           $('#plus_btn').click(function() {

               //
               // 던질 값 (현재 quantity + 1)
               // 만약 현재 quantity가 5와 같다면 던지지 못함 -> quantity < 5 이여야 던질 수 있다
               // rest에 quantity + 1을 던져서 okay라면 +1을 증가해준다
               // 받을 값 boolean
               let quantityObj = $('#quantity');
               let quantity = quantityObj.val();
               let plussedQuantity = parseInt(quantity) + 1;
               let quantityFlag = false;
               let productId = $('#productId').val();
               let param = "productId=" + productId + "&quantity=" + plussedQuantity;

               $.ajax({
                   type: 'GET',
                   url: '<c:url value="/quantityCheck"/>',
                   data: param,
                   async: false,
                   success: function(args) {
                       quantityFlag = args.quantityFlag;
                       console.log("넘어온 수량 체커 : " + quantityFlag);
                       console.log("더해진 수량 : " + plussedQuantity);
                   },
                   error: function(e) {
                       console.log(e);
                   }
               });

               if(quantityFlag) {
                   quantity++;
                   quantityObj.val(quantity);
                   $('#quantity_db_label').css('display','none');
                   $('#quantity_max_label').css('display','none');
               } else {
                   // 더 할 수 없는 상황
                   if(quantityFlag === false) {
                       // 재고가 넘어
                       $('#quantity_db_label').css('display','block');
                   }
                   if(quantity === 5) {
                       // 5개 이상 구매하려함
                       $('#quantity_max_label').css('display','block');
                   }
               }
           });

           $('#minus_btn').click(function () {
               console.log('backpack here!');
               let quantityObj = $('#quantity');
               let quantity = quantityObj.val();

               if(quantity - 1 > 0) {
                   quantity--;
                   quantityObj.val(quantity);
                   $('#quantity_min_label').css('display','none');
               } else {
                   $('#quantity_min_label').css('display','block');
               }
           });

           $('#cart_btn').click(function() {
               let cartVO = {"productId":parseInt($('#productId').val().toString()),
                   "quantity":parseInt($('#quantity').val().toString())};
               $.ajax({
                   type: 'POST',
                   url: '<c:url value="/addCart"/>',
                   data: cartVO,
                   async: false,
                   success: function(args) {
                       console.log("성공했고 돌아온 값은? : " + args);
                       if(args) {
                           cartCountInit();
                           $('#cartModal').modal('show');
                       } else {

                       }
                   },
                   error: function(e) {
                       console.log("카트에 더하기에서 에러발생 : " + e.toString());
                   }
               })
           });


           function cartCountInit() {
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
           }
        });

        function btn_common() {
            // css를 지우기위해 해당하는 조건들을 모두 섭렵해야함 ㅡㅡ;;
        }

        function side_nav_bold() {
            var category = document.getElementById('category').value;
            console.log('side_nav_' + category);
            var side_nav = document.getElementById('side_nav_' + category + '');
            side_nav.classList.add('font-weight-bold');
        }
    </script>
</body>
</html>