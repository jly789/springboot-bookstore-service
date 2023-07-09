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
        <span>Login</span>
        <p>Enter Login details to get access</p>
      </div>
      <form action="/login" method="post">
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

        <div class="single-input-fields login-check">
          <input type="checkbox" id="fruit1" name="keep-log">
          <label for="fruit1">Keep me logged in</label>
          <a href="#" class="f-right">Forgot Password?</a>
        </div>
      </div>


      <!-- form Footer -->
      <div class="login-footer">
        <p>Don’t have an account? <a href="/register">Sign Up</a>  here</p>
        <button class="submit-btn3">Login</button>
      </div>
      </form>

    </div>
  </div>
  <!-- login Area End -->
</main>
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>