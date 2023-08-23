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

<br/> <br/>
<!-- login Area Start -->
<div class="login-form-area">
  <div class="login-form">
    <!-- Login Heading -->
    <div class="login-heading" style="text-align: center;">
      <h3>배송지 등록</h3>

    </div>
    <form action="/deliveryNameCheck" method="post">
      <!-- Single Input Fields -->
      <div class="input-box">
        <div class="single-input-fields" style="text-align: center;">
          <label style="text-align: center;">배송지:</label>
          <input type="text" id="deliveryName" name="deliveryName" style="text-align: center;" value=""/>
  <input type="submit" value="확인"/>
<%--          <a  onClick="self.close() ; javascript:parent.opener.location.href='/deliveryNameUpdate?deliveryName='+$('#deliveryName').value();'">등록하기</a>--%>
        </div>

      </div>
    </form>

    <!-- login Area End -->
    </main>
  </div>
</div>
<script>

  function viewInMain(url) {
    var str = url ;
    var rr = $('#deliveryName').val();
    alert(rr);
    self.close() ;
    // location.href="str"+rr;
    window.opener.location.href = str+rr ;
  }


</script>


</body>



</html>