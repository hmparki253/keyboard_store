<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/base.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/mdb.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>">
</head>
<body>
    <%@include file="partial/header.jsp" %>
    <%@include file="partial/menubar.jsp" %>
    <section class="section-content bg padding-y">
    <div class="container">
        <div class="col-md-12 mb-4">
            <div class="heading text-center">
                <h2 class="h2_underline pb-2">회원가입</h2>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="container mt-5" style="max-width: 420px; min-height: 460px;">
                <c:url var="userRegistration" value="/userRegistration"/>
                <form:form modelAttribute="user" action="${userRegistration}" method="post" onsubmit="return submitCheck();">
                    <div class="from-group">
                        <label for="username">아이디</label>
                        <form:input path="username" cssClass="form-control"/>
                        <small id="username_label" class="text-warning" style="display: none">아이디는 6 ~ 20자 이내의 영문과 숫자 조합으로 입력해주세요</small>
                        <small id="username_dup_label" class="text-warning" style="display: none">이미 존재하는 아이디입니다.</small>
                    </div>
                    <div class="from-group mt-3">
                        <label for="password">비밀번호</label>
                        <form:password path="password" cssClass="form-control"/>
                        <small id="password_label" class="text-warning" style="display: none">비밀번호는 숫자와 특수문자를 한 개씩 포함하는 8자 이상의 조합으로 입력해주세요</small>
                    </div>
                    <div class="from-group mt-3">
                        <label for="name">성명</label>
                        <form:input path="name" cssClass="form-control"/>
                        <small id="name_label" class="text-warning" style="display: none">성명을 한글 2자 이상 10자 이하로 입력해주세요</small>
                    </div>
                    <div class="from-group mt-3">
                        <label for="email">이메일</label>
                        <form:input path="email" cssClass="form-control" />
                        <small id="email_label" class="text-warning" style="display: none">이메일 형식에 맞게 입력해주세요</small>
                        <small id="email_dup_label" class="text-warning" style="display: none">이미 존재하는 이메일입니다.</small>
                    </div>
                    <div class="from-group mt-3">
                        <label for="postalCode">주소</label>
                        <input type="button" class="float-right btn-sm btn-black" value="주소검색" onclick="execDaumPostcode()">
                        <div id="addr_wrap" class="">
                        </div>
                        <form:input path="postalCode" cssClass="form-control" readonly="true" placeholder="우편번호"/>
                        <form:input path="addr1" cssClass="mt-1 form-control" readonly="true" placeholder="주소"/>
                        <form:input path="addr2" cssClass="mt-1 form-control"  placeholder="상세주소"/>
                        <small id="addr_label" class="text-warning" style="display: none">주소검색 버튼을 눌러 주소 형식에 맞게 입력해주세요</small>
                    </div>
                    <div class="from-group mt-3">
                        <label for="phone">핸드폰 번호</label>
                        <form:input path="phone" cssClass="form-control" />
                        <small id="phone_label" class="text-warning" style="display: none">특수기호를 뺀 순수 숫자 11자리만 입력해주세요</small>
                    </div>
                    <div class="form-group text-center mt-3">
                        <button type="submit" class="btn btn-primary mt-3">가입하기</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</section>
    <%@include file="partial/footer.jsp" %>
    <script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/popper.min.js" />"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
        $(document).ready(function(){

            // id validation
            $('#username').keyup(function(){
                let userVal = $(this).val();

                if(checkUsername(userVal)) {
                    $('#username_label').css('display','none');
                } else {
                    $('#username_label').css('display','block');
                }

                if(checkUsernameDb(userVal)) {
                    $('#username_dup_label').css('display', 'block');
                } else {
                    $('#username_dup_label').css('display', 'none');
                }
            });

            $('#password').keyup(function() {
               let passwordVal = $(this).val();
               if(checkPassword(passwordVal)) {
                    $('#password_label').css('display', 'none');
               } else {
                   $('#password_label').css('display', 'block');
               }
            });

            $('#name').keyup(function() {
                let nameVal = $(this).val();
                if(checkName(nameVal)) {
                    $('#name_label').css('display', 'none');
                } else {
                    $('#name_label').css('display', 'block');
                }
            });

            $('#email').keyup(function() {
                let emailVal = $(this).val();

                if(checkEmail(emailVal)) {
                    $('#email_label').css('display', 'none');
                } else {
                    $('#email_label').css('display', 'block');
                }

                if(checkEmailDb(emailVal)) {
                    $('#email_dup_label').css('display', 'block');
                } else {
                    $('#email_dup_label').css('display', 'none');
                }
            });

            $('#phone').keyup(function() {
                let phoneVal = $(this).val();
                if(checkPhone(phoneVal)) {
                    $('#phone_label').css('display', 'none');
                } else {
                    $('#phone_label').css('display', 'block');
                }
            });

            $('#addr2').focus(function() {
                let postalLength = ($('#postalCode').val()).length;
                let addr1Length = ($('#addr1').val()).length;

                if(checkAddr(postalLength, addr1Length)) {
                    $('#addr_label').css('display', 'none');
                } else {
                    $('#addr_label').css('display', 'block');
                }
            });
        });

        function checkUsername(username) {
            let flag = false;
            const idRegex = new RegExp(/^[A-Za-z0-9]{6,20}$/gi); // 6 ~ 20자 이내의 영문 숫자 조합
            flag = idRegex.test(username);
            return flag;
        }

        function checkUsernameDb(username) {
            let param = "username=" + username;
            let usernameFlag = false;
                $.ajax({
                    type: 'GET',
                    url: '<c:url value="/usernameDup"/>',
                    data: param,
                    async: false,
                    success: function(args) {
                        usernameFlag = args.usernameFlag;
                    },
                    error: function(e) {
                        console.log(e);
                    }
                });
            return usernameFlag;
        }

        function checkPassword(password) {
            let flag = false;
            const passRegex = new RegExp(/(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/gi); // 숫자, 특수문자를 하나씩 포함하는 8자 이상의 조합
            flag = passRegex.test(password);
            return flag;
        }

        function checkEmail(email) {
            let flag = false;
            const emailRegex = new RegExp(/(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/gi); // 이메일 형식에 맞는 최소 10자 이상
            flag = emailRegex.test(email);
            return flag;
        }

        function checkEmailDb(email) {
            let param = "email=" + email;
            let emailFlag = false;
            $.ajax({
                type: 'GET',
                url: '<c:url value="/emailDup"/>',
                data: param,
                async: false,
                success: function(args) {
                    console.log("그 이메일 중복인가? : " + args.emailFlag);
                    emailFlag = args.emailFlag;
                },
                error: function(e) {
                    console.log(e);
                }
            });
            return emailFlag;
        }

        function checkName(name) {
            let flag = false;
            const nameRegex = new RegExp(/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,12}/gi);
            flag = nameRegex.test(name);
            return flag;
        }

        function checkPhone(phone) {
            let flag = false;
            const phoneRegex = new RegExp(/^[0-9]{11}/gi);
            flag = phoneRegex.test(phone);
            return flag;
        }

        function checkAddr(postalCodeLength, addr1Length) {
            let flag = false;
            if((postalCodeLength && addr1Length) !== 0) {
                flag = true;
            }
            return flag;
        }

        function submitCheck() {
            let submitFlag = false;

            let username = $('#username').val();
            let password = $('#password').val();
            let email = $('#email').val();
            let postalLength = ($('#postalCode').val()).length;
            let addr1Length = ($('#addr1').val()).length;

            if(checkUsername(username) &&
                !(checkUsernameDb(username)) &&
                checkPassword(password) &&
                checkEmail(email) &&
                !(checkEmailDb(email)) &&
                checkAddr(postalLength, addr1Length)) {
                submitFlag = true;
            }

            console.log('최종적인 결과는 다음과 같다 : ' + submitFlag);
            return submitFlag;
        }

        function foldDaumPostcode() {
            // iframe을 넣은 element를 안보이게 한다.
            let element_wrap = document.getElementById("addr_wrap");
            element_wrap.style.display = 'none';
        }

        function execDaumPostcode() {
            let element_wrap = document.getElementById("addr_wrap");

            // 현재 scroll 위치를 저장해놓는다.
            var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
            new daum.Postcode({
                oncomplete: function(data) {
                    // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        // document.getElementById("sample3_extraAddress").value = extraAddr;

                    } else {
                        // document.getElementById("sample3_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postalCode').value = data.zonecode;
                    document.getElementById("addr1").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("addr2").focus();

                    // iframe을 넣은 element를 안보이게 한다.
                    // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                    element_wrap.style.display = 'none';

                    // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                    document.body.scrollTop = currentScroll;
                },
                // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                onresize : function(size) {
                    element_wrap.style.height = size.height+'px';
                },
                width : '100%',
                height : '100%'
            }).embed(element_wrap);

            // iframe을 넣은 element를 보이게 한다.
            element_wrap.style.display = 'block';
        }
    </script>
</body>
</html>