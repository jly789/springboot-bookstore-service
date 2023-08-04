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
      <span>회원 탈퇴</span>
      <p>아이디,비밀번호를 다시한번 입력해주세요</p>
    </div>
    <form action="/" method="post">
      <!-- Single Input Fields -->
      <div class="input-box">
        <div class="single-input-fields">
          <label>userId</label>
          <input type="text" name="userId" placeholder="userId">
        </div>
        <div class="single-input-fields">
          <label>Password</label>
          <input type="password" name="pwd" placeholder="Enter Password">
        </div>








      </div>


      <!-- form Footer -->
      <div class="login-footer">

        <p>생각이 바뀌셨으면<a href="/">뒤로가기</a>  here</p>
        <button class="submit-btn3" id="remove">탈퇴하기</button>
      </div>
    </form>

  </div>
</div>
<!-- login Area End -->
</main>
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>