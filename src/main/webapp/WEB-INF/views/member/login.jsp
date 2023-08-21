<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

  <!-- login Area Start -->
  <div class="login-form-area">
    <div class="login-form">
      <!-- Login Heading -->
      <div class="login-heading">
        <span>로그인</span>

      </div>
      <form action="/login" method="post">
      <!-- Single Input Fields -->
      <div class="input-box">
        <div class="single-input-fields">
          <label>아이디</label>
          <input type="text" name="userId" placeholder="userId">
        </div>
        <div class="single-input-fields">
          <label>비밀번호</label>
          <input type="password" name="pwd" placeholder="Enter Password">
        </div>


        <div class="single-input-fields login-check">

          <a href="/idFind" style="margin-left: 600px;" class="f-right">아이디찾기</a>

        </div>



        <div class="single-input-fields login-check">


          <a href="/pwdFind" style="margin-left: 600px;" >비밀번호 찾기</a>

        </div>

      </div>


      <!-- form Footer -->
      <div class="login-footer">

        <p>아이디가 없으세요? <a href="/register">가입하기</a>Click</p>
        <button class="submit-btn3" style="background-color: #FEF4F4; color: red; ">로그인</button>
      </div>
      </form>

    </div>
  </div>
  <!-- login Area End -->
</main>
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>