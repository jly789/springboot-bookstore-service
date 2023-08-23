<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<c:set var="cp" value="<%=request.getContextPath()%>"/>



<!doctype html>
<html class="no-js" lang="zxx">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Book Shop</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
<form:form action="/register" method="post"  modelAttribute="memberJoinDTO" novalidate="novalidate"
           enctype="multipart/form-data">
<!-- header end -->
<main class="login-bg">
  <!-- Register Area Start -->
  <div class="register-form-area">
    <div class="register-form text-center">
      <!-- Login Heading -->
      <div class="register-heading">
        <span>회원가입</span>

      </div>

      <!-- Single Input Fields -->

      <div class="input-box">

        <div class="single-input-fields">

          <input type="hidden" name="memberId" value="0" placeholder="이름 입력">
        </div>

        <div class="single-input-fields">
          <label>아이디</label>

          <input type="text" name="userId" value="${memberJoinDTO.userId}" id="userId" placeholder="아이디 입력"/>
        <form:errors path="userId" cssStyle="font-weight: bold; color: #e95050"/>
          <input type="button" id="btnCheck"  class="btn btn-default" value="중복검사"/>
          <span id="result"></span>

          <input type="hidden" id="checkId"  value=""/>


<%--          <input type="text" id="idCheck" name="idCheck"/>--%>

<%--          <form:input type="text" path="userId" placeholder="제목을 입력해주세요" cssStyle="height: 42px"/>--%>
        </div>

        <div class="single-input-fields">
          <label>비밀번호</label>
          <input type="password" name="pwd" value="${memberJoinDTO.pwd}"  placeholder="비밀번호 입력"/>
          <form:errors path="pwd" cssStyle="font-weight: bold; color: #e95050"/>
        </div>

        <div class="single-input-fields">
          <label>이름</label>
          <input type="text" name="name" value="${memberJoinDTO.name}" placeholder="이름 입력">
          <form:errors path="name" cssStyle="font-weight: bold; color: #e95050"/>
        </div>





<%--          <input type="text" name="gender" placeholder="Enter email address">--%>

        <div class="single-input-fields">
          <label>닉네임</label>
          <input type="text"name="nikname" value="${memberJoinDTO.name}" placeholder="닉네임 입력">
          <form:errors path="nikname" cssStyle="font-weight: bold; color: #e95050"/>
<%--        </div>--%>

        <div class="single-input-fields">
          <label>생일</label>
          <input type="date" name="birth" value="${memberJoinDTO.birth}" placeholder="birth day">
          <form:errors path="birth" cssStyle="font-weight: bold; color: #e95050"/>
        </div>

        <div class="single-input-fields">
          <label>전화번호</label>
          <input type="tel" name="tel"value="${memberJoinDTO.tel}" placeholder="전화번호 입력">
          <form:errors path="tel" cssStyle="font-weight: bold; color: #e95050"/>
        </div>

        <input type="text" name="postcode" value="${memberJoinDTO.postcode}" id="sample6_postcode" placeholder="우편번호">
          <form:errors path="postcode" cssStyle="font-weight: bold; color: #e95050"/>
        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
        <input type="text" name="address" value="${memberJoinDTO.address}" id="sample6_address" placeholder="주소"><br>
          <form:errors path="address" cssStyle="font-weight: bold; color: #e95050"/>
        <input type="text"name="detailAddress" value="${memberJoinDTO.detailAddress}" id="sample6_detailAddress" placeholder="상세주소">
          <form:errors path="detailAddress" cssStyle="font-weight: bold; color: #e95050"/>
        <input type="text"name="extraAddress" value="${memberJoinDTO.extraAddress}" id="sample6_extraAddress" placeholder="참고항목">


        <div class="single-input-fields">
          <label>이메일</label>
          <input type="email" name="email" value="${memberJoinDTO.email}" placeholder="이메일을 입력하시오">
          <form:errors path="email" cssStyle="font-weight: bold; color: #e95050"/>
        </div>

        <div class="single-input-fields">
          <label>좋아하는 장르</label>
          <input type="text" name="favoriteGenre" value="${memberJoinDTO.favoriteGenre}" placeholder="좋아하는 장르 입력">
          <form:errors path="favoriteGenre" cssStyle="font-weight: bold; color: #e95050"/>
        </div>
          <div class="single-input-fields">
          <input type="file" class="form-control" name="file"
                 style="width : 280px; height : 30px; "/>
          </div>
          <div class="single-input-fields">
          <label>성별</label>
          <select name="gender" value="${memberJoinDTO.gender}" style="margin-right: 550px;">


              <option value="남자">남자</option>
              <option value="여자">여자</option>

          </select>


          </div>
      </div>

      <!-- form Footer -->
      <div class="register-footer">
        <p> 이미 아이디를 가지고 계신가요? <a href="/login"> 로그인 </a> here</p>

        <button class="submit-btn3" type="submit" id="check">가입하기</button>

      </div>

    </div>

  </div>
    </form:form>
  <!-- Register Area End -->


  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

  <script>



    $('#check').click(function (){
      if ($('#checkId').val() !=1) {
        alert('중복확인누르세요');
        return false;
      }
      if( $('#result').text()=='이미 사용중인 아이디입니다.') {
        alert('이미사용중인 아이디!');
      return false;
      }





      });

    $('#btnCheck').click(function () {

      if ($('#userId').val() != '') {

        // 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
        $.ajax({

          type: 'POST',
          url: '/idCheck',
          data: 'id=' + $('#userId').val(),
          dataType: 'json',
          success: function(result) {
            if (result == '1') {
              $("#result").text('사용 가능한 아이디입니다.');

             $('#checkId').val(1);


             document.getElementById('result').style.color ="black";
              // $("#result").attr('color','green');


            } else {
              $('#result').text('이미 사용중인 아이디입니다.');
              $('#checkId').val(1);
              document.getElementById('result').style.color ="red";

            }
          },
          error: function(a, b, c) {
            console.log(a, b, c);
          }

        });

      } else {
        alert('아이디를 입력하세요.');
        $('#userOd').focus();
      }

    });






    function sample6_execDaumPostcode() {
      new daum.Postcode({
        oncomplete: function(data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
            document.getElementById("sample6_extraAddress").value = extraAddr;

          } else {
            document.getElementById("sample6_extraAddress").value = '';
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('sample6_postcode').value = data.zonecode;
          document.getElementById("sample6_address").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("sample6_detailAddress").focus();
        }
      }).open();
    }


  </script>
</main>

</body>
</html>