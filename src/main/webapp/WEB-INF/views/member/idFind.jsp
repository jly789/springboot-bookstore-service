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

<!-- header end -->
<main class="login-bg">
  <!-- Register Area Start -->
  <div class="register-form-area">
    <div class="register-form text-center">
      <!-- Login Heading -->

      <div class="register-heading">
        <span>아이디 찾기</span>
        <p>Create your account to get full access</p>
      </div>

      <!-- Single Input Fields -->

      <div class="input-box">

        <span style="font-size: 25px;" id="result"> </span>

        <div class="single-input-fields">
          <label>이름</label>
          <input type="text" name="name"  id="name"  placeholder="이름 입력!"/>

        </div>





        <div class="single-input-fields">
          <label>이메일</label>
          <input type="text" name="email" id="email"  placeholder="이메일을 입력!">

        </div>


<%--        ${searchId}--%>

<%--        <input type="button" id="btnCheck"  class="btn btn-default" value="아이디 찾기"/>--%>

      <!-- form Footer -->
      <div class="register-footer">
        <p> Already have an account? <a href="/login"> Login</a> here</p>

        <button class="submit-btn3" id="btnCheck">아이디찾기</button>

      </div>

      </input>

  </div>


  <!-- Register Area End -->


  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

  <script>


    $('#btnCheck').click(function () {

      if ($('#name').val() != '') {
        let email = $('#email').val();

        // 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
        $.ajax({

          type: 'POST',
          url: '/idFind',
          data: {"name": $('#name').val(),
            "email": $('#email').val(),
          },
          dataType: 'text',

          success: function(result) {

            $("#result").text('아이디:'+' '+result+''+'입니다');

            document.getElementById('result').style.color ="red"










          },
          error: function(a, b, c) {
            alert('ㅇㅇㄴ');
            console.log(a, b, c);
          }

        });

      }

    });









  </script>
</main>

</body>
</html>