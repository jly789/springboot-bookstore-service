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

<style>

  input{

  ;

  }

</style>

<body>
<jsp:include page="../main/header.jsp"></jsp:include>



<main>
  <!-- Hero area Start-->
  <div class="container">
    <div class="row">
      <div class="col-xl-12">
        <div class="slider-area">
          <div class="slider-height2 slider-bg5 d-flex align-items-center justify-content-center">
            <div class="hero-caption hero-caption2">
              <h2>my Page</h2>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--  Hero area End -->

  <!--? Checkout Area Start-->
  <section class="checkout_area section-padding">
    <div class="container">
      <div class="returning_customer">

        <form action="/myPageUpdate" method="get">

          <c:forEach var="memberDTOList" items="${memberDTOList}">



          <div class="billing_details">
            <div class="row">
              <div class="col-lg-8" >
                <h3>배송지 주소

                  <button type="submit" value="" style="margin-left: 525px; color: black; border-color: ghostwhite; background-color: white"/>수정하기</h3>
                <br/>

                <a  style="color: red;" href="/myPageUpdate">프로필변경</a> <br/>
               <img src="profileImg/${memberDTOList.fileName}" alt=""
                     style="   height: 100px; margin-right: 400px; object-fit: cover;"/><br/><br/>
                <form class="row contact_form" action="#" method="post" novalidate="novalidate">
                  <div class="col-md-6 form-group p_star">
                    <h6 style="color: red"> 아이디 </h6>  <input type="text" class="form-control" id="first" name="userId" value="${memberDTOList.userId}" />
                    <h6 style="color: red">  이름</h6>  <input type="text" class="form-control" id="first" name="name" value="${memberDTOList.name}" />
                      <%--                <span class="placeholder" data-placeholder="이름입력!" ></span>--%>

                  </div>

                  <div class="col-md-12 form-group">
                    <h6 style="color: red">    배송지명 </h6> <input type="text" class="form-control" id="company" name="company" placeholder="배송지명" />
                  </div>
                  <div class="col-md-6 form-group p_star">
                    <h6 style="color: red">   전화번호</h6>  <input type="text" class="form-control" id="number" name="number" value="${memberDTOList.tel}" />

                  </div>
                  <div class="col-md-6 form-group p_star">
                    <h6 style="color: red">    이메일</h6>  <input type="text" class="form-control" id="email" name="compemailany" value="${memberDTOList.email}"/>

                  </div>

                  <div class="col-md-12 form-group">
                    <h6 style="color: red">     우편번호</h6> <input type="text" class="form-control" id="zip" name="zip" value="${memberDTOList.postcode}" />
                  </div>


                  <div class="col-md-12 form-group p_star">
                    <h6 style="color: red">    주소</h6>  <input type="text" class="form-control" id="add1" name="add1" value="${memberDTOList.address}" />

                  </div>
                  <div class="col-md-12 form-group p_star">
                    <h6 style="color: red">    상세주소</h6> <input type="text" class="form-control" id="detailAddress" name="detailAddress" value="${memberDTOList.detailAddress}" />

                  </div>

                  <div class="col-md-12 form-group p_star">
                    <h6 style="color: red">    포인트</h6> <input type="text" class="form-control" id="point" name="add2" value="${memberDTOList.point}" />
                  </div>

                  </c:forEach>



                  <div class="col-md-12 form-group">
                    <div class="creat_account">
                      <h3>참고사항</h3>

                    </div>
                    <textarea class="form-control" name="message" id="message" rows="1" placeholder="Order Notes"></textarea>
                  </div>
                </form>
              </div>

            </div>
          </div>
        </form>
      </div>
    </div>
  </section>
  <!--End Checkout Area -->



</main>

<script>


  // $('#alert').click(function () {
  //
  //   if (confirm("정말 탈퇴하시겠습니까?")) {
  //
  //
  //     location.href='/myPage';
  //   } else {
  //
  //   }
  //
  //
  //
  // });
</script>

<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>