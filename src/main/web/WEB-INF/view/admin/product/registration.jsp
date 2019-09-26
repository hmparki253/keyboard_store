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
                <form action="<c:url value="/admin/product/registration"/>" method="post" class="form" id="registrationForm" enctype="multipart/form-data">
                    <div class="card p-3 mb-3">
                        <div class="row pl-3 mb-3">
                            <div class="col-sm-2"><span>카테고리(*)</span></div>
                            <div class="col-sm-10">
                                <select id="category" name="categoryId">
                                    <c:forEach items="${categories}" var="category">
                                        <option value="${category.categoryId}">${category.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row pl-3 mb-3">
                            <div class="col-sm-2"><span>상품명(*)</span></div>
                            <div class="col-sm-10">
                                <input type="text" class="w-100" name="name" id="name">
                                <small id="pn_label" class="text-warning" style="display: none">상품명은 2에서 40자 아내로 작성해주세요</small>
                            </div>
                        </div>
                        <div class="row pl-3 mb-3">
                            <div class="col-sm-2"><span>상품설명(*)</span></div>
                            <div class="col-sm-10">
                                <textarea class="minimum-height w-100" name="description" id="description"></textarea>
                                <small id="description_label" class="text-warning" style="display: none">상품설명은 2에서 2000자 아내로 작성해주세요</small>
                            </div>
                        </div>
                        <div class="row pl-3 mb-3">
                            <div class="col-sm-2"><span>가격(*)</span></div>
                            <div class="col-sm-10">
                                <input type="text" name="price" id="price">
                                <span>원</span>
                                <small id="price_label" class="text-warning" style="display: none">가격은 99원에서 1억원 아내로 작성해주세요</small>
                            </div>
                        </div>
                        <div class="row pl-3 mb-3">
                            <div class="col-sm-2"><span>재고수량(*)</span></div>
                            <div class="col-sm-10">
                                <input type="text" name="inventory" id="inventory">
                                <span>개</span>
                                <small id="inventory_label" class="text-warning" style="display: none">재고수량은 1개에서 1000개 아내로 작성해주세요</small>
                            </div>
                        </div>
                        <div class="row pl-3 mb-3">
                            <div class="col-sm-2"><span>할인률</span></div>
                            <div class="col-sm-10">
                                <input type="text" name="discount" id="discount">
                                <span>%</span>
                                <small id="discount_label" class="text-warning" style="display: none">할인률은 최대 90퍼센트까지입니다.</small>
                            </div>
                        </div>
                        <div class="row pl-3 mb-3">
                            <div class="col-sm-2"><span>상품사진(*)</span></div>
                            <div class="col-sm-10">
                                <input type="file" name="photoFile" id="photoFile">
                                <small id="image_ext_label" class="text-warning" style="display: none">파일 확장자는 jpg, png, gif만 가능합니다.</small>
                                <small id="image_size_label" class="text-warning" style="display: none">파일 첨부는 최대 50mb까지만 가능합니다. </small>
                            </div>
                        </div>
                        <div class="row pl-3 mb-3">
                            <div class="col-sm-2"><span>사진미리보기</span></div>
                            <div class="col-sm-10"><img id="temporal_image" src="#" style="display: none; width: 300px" /></div>
                        </div>
                        <div class="row pl-3 mb-3">
                            <div class="col-sm-12 text-center">
                                <input type="submit" id="submit_btn" class="btn btn-success" value="상품등록하기" disabled>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<%@include file="../../partial/footer.jsp" %>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/popper.min.js" />"></script>
<script src="<c:url value="/resources/js/admin_sidebar.js" />"></script>
<script>
    $(document).ready(function() {
        let doms = [ $('#name'), $('#price'), $('#description'), $('#inventory'), $('#discount')];
        function readURL(input) {
            if (input.files && input.files[0]) {
                let reader = new FileReader();

                reader.onload = function (e) {
                    $('#temporal_image').attr('src', e.target.result);
                    console.log("너비는?" + e);
                    $('#temporal_image').css('display', 'block');
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#photoFile").change(function(){
            totalCheck();
            readURL(this);
        });

        $(doms).each(function(_, item) {
            item.on("keyup", function() {
                totalCheck();
            });
            item.on("focusout", function() {
               totalCheck();
            });
        });

        function productNameCheck(productName) {
            let flag = false;
            if(productName.length >= 2 && productName.length <= 40) {
                flag = true;
                $('#pn_label').css('display', 'none');
            } else {
                $('#pn_label').css('display', 'block');
            }
            return flag;
        }

        function priceCheck(price) {
            let flag = false;
            if(price > 99 && price <= 100000000) {
                flag = true;
                $('#price_label').css('display', 'none');
            } else {
                $('#price_label').css('display', 'block');
            }
            return flag;
        }

        function descriptionCheck(description) {
            let flag = false;
            if(description.length >= 2 && description.length <= 2000) {
                flag = true;
                $('#description_label').css('display', 'none');
            } else {
                $('#description_label').css('display', 'block');
            }
            return flag;
        }

        function inventoryCheck(inventory) {
            let flag = false;
            if(inventory >= 1 && inventory <= 1000) {
                flag = true;
                $('#inventory_label').css('display', 'none');
            } else {
                $('#inventory_label').css('display', 'block');
            }
            return flag;
        }

        function discountCheck(discount) {
            let flag = false;
            if(discount >= 0 && discount <= 90) {
                flag = true;
                $('#discount_label').css('display', 'none');
            } else {
                $('#discount_label').css('display', 'block');
            }
            return flag;
        }

        function imageExtCheck(ext) {
            let flag = false;
            if(ext === 'jpg' || ext === 'jpeg' || ext === 'png' || ext === 'gif') {
                flag = true;
                $('#image_ext_label').css('display', 'none');
            } else {
                $('#image_ext_label').css('display', 'block');
            }
            return flag;
        }

        function imageSizeCheck(size) {
            let flag = false;
            if(size <= parseInt(52428800)) {
                flag = true;
                $('#image_size_label').css('display', 'none');
            } else {
                $('#image_size_label').css('display', 'block');
            }
            return flag;
        }

        function totalCheck() {
            let nameVal = $('#name').val();
            let desVal = $('#description').val();
            let priceVal = $('#price').val();
            let invenVal = $('#inventory').val();
            let disVal = $('#discount').val().length === 0 ? 0 : $('#discount').val();

            let fileObj;
            let imgFullName;
            let ext;
            let size;
            let extFlag = false;
            let sizeFlag = false;
            if($('#photoFile').get(0).files.length !== 0) {
                fileObj = $('#photoFile').get(0).files[0];
                imgFullName = fileObj['name'].split('.');
                ext = imgFullName[1].toLowerCase();
                size = fileObj['size'];
                extFlag = imageExtCheck(ext);
                sizeFlag = imageSizeCheck(size);
            }

            let nameFlag = productNameCheck(nameVal);
            let desFlag = descriptionCheck(desVal);
            let priceFlag = priceCheck(parseInt(priceVal));
            let invenFlag = inventoryCheck(invenVal);
            let disFlag = discountCheck(disVal);

            let totalFlag = nameFlag && desFlag && priceFlag && invenFlag && disFlag && extFlag && sizeFlag;

            if(!totalFlag) {
                submitToggle(true);
            } else {
                submitToggle(false);
            }
        }

        function submitToggle(flag) {
            $('#submit_btn').prop('disabled', flag);
        }
    });

    // 상품사진 jpg, png, gif까지 허용 -> 용량 100mb 미만

    // button disabled로 마무리하기
</script>
</body>
</html>