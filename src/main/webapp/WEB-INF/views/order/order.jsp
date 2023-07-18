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

<main>


  <input type="text" id="memberId" name="memberId" value="${memberId}"/>
  <!-- Hero area Start-->
  <div class="container">
    <div class="row">
      <div class="col-xl-12">
        <div class="slider-area">
          <div class="slider-height2 slider-bg5 d-flex align-items-center justify-content-center">
            <div class="hero-caption hero-caption2">
              <h2>Order</h2>
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
        <div class="check_title">
          <h2>
            Returning Customer?

            <a href="login.html">Click here to login</a>
          </h2>
        </div>
        <p>
          If you have shopped with us before, please enter your details in the
          boxes below. If you are a new customer, please proceed to the
          Billing & Shipping section.
        </p>

        <form class="row contact_form" action="#" method="post" novalidate="novalidate">
          <div class="col-md-6 form-group p_star">
            <input type="text" class="form-control" id="names" name="name" value="" />
            <span class="placeholder" data-placeholder="Username or Email"></span>
          </div>
          <div class="col-md-6 form-group p_star">
            <input type="password" class="form-control" id="password" name="password" value="" />
            <span class="placeholder" data-placeholder="Password"></span>
          </div>
          <div class="col-md-12 form-group d-flex flex-wrap">
            <a href="login.html" value="submit" class="btn" > log in</a>
            <div class="checkout-cap ml-5">
              <input type="checkbox" id="fruit01" name="keep-log">
              <label for="fruit01">Create an account?</label>
            </div>
          </div>
        </form>
      </div>
      <div class="cupon_area">
        <div class="check_title">
          <h2> Have a point?
            <a style="height: 20px; width: 40px;"  href="#">포인트 확인</a>
          </h2>
        </div>
        <input type="text" placeholder="" />
        <a id="point" class="btn">포인트 사용하기</a>
        <a id="delivery" class="btn">기본 배송지적용</a>
      </div>


      <div class="billing_details">
        <div class="row">
          <div class="col-lg-8">
            <h3>Billing Details</h3>
            <form class="row contact_form" action="#" method="post" novalidate="novalidate">
              <div class="col-md-6 form-group p_star">



                <input type="text" class="form-control" id="name" name="name"  value=""/>
                <span id="abc" class="placeholder" data-placeholder="이름을 입력하시오!"></span>
              </div>



              <div class="col-md-12 form-group">
                <input type="text" class="form-control" id="company" name="company" placeholder="배송지명" />
              </div>
              <div class="col-md-6 form-group p_star">
                <input type="text" class="form-control" id="tel" name="tel" value="" />
                <span class="placeholder" data-placeholder="핸드폰 번호"></span>
              </div>
              <div class="col-md-6 form-group p_star">
                <input type="text" class="form-control" id="email" name="email" value="" />
                <span class="placeholder" data-placeholder="이메일 주소입력"></span>
              </div>

              <div class="col-md-12 form-group">
                <input type="text" class="form-control" id="zip" name="zip" placeholder="우편번호" />
              </div>


              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="add1" name="add1" />
                <span class="placeholder" data-placeholder="주소"></span>
              </div>
              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="add2" name="add2" />
                <span class="placeholder" data-placeholder="상세주소"></span>
              </div>




              <div class="col-md-12 form-group">
                <div class="creat_account">
                  <h3>Shipping Details</h3>
                  <div class="checkout-cap">
                    <input type="checkbox" id="f-option3" name="selector" />
                    <label for="f-option3">Ship to a different address?</label>
                  </div>
                </div>
                <textarea class="form-control" name="message" id="message" rows="1" placeholder="Order Notes"></textarea>
              </div>
            </form>
          </div>










          <div class="col-lg-4">
            <div class="order_box">
              <h2>Your Order</h2>
              <ul class="list">
                <li>
                  <a href="#">Product<span>Total</span>
                  </a>
                </li>
                <li>
                  <a href="#">Fresh Blackberry
                    <span class="middle">x 02</span>
                    <span class="last">$720.00</span>
                  </a>
                </li>

              </ul>
              <ul class="list list_2">
                <li>
                  <a href="#">Subtotal <span>$2160.00</span></a>
                </li>
                <li>
                  <a href="#">배송비
                    <span>$5000</span>
                  </a>
                </li>
                <li>
                  <a href="#">Total<span>$2210.00</span>
                  </a>
                </li>
              </ul>
              <div class="payment_item">
                <div class="radion_btn">
                  <input type="radio" id="f-option5" name="selector" />
                  <label for="f-option5">Check payments</label>
                  <div class="check"></div>
                </div>
                <p> Please send a check to Store Name, Store Street, Store Town, Store State / County, Store Postcode. </p>
              </div>
              <div class="payment_item active">
                <div class="radion_btn">
                  <input type="radio" id="f-option6" name="selector" />
                  <label for="f-option6">Paypal </label>
                  <img src="assets/img/gallery/card.jpg" alt="" />
                  <div class="check"></div>
                </div>
                <p> Please send a check to Store Name, Store Street, Store Town, Store State / County, Store Postcode. </p>
              </div>
              <div class="creat_account checkout-cap">
                <input type="checkbox" id="f-option8" name="selector" />
                <label for="f-option8">I’ve read and accept the  <a href="#">terms & conditions*</a> </label>
              </div>
              <a class="btn w-100" href="#">Proceed to Paypal</a>
            </div>
          </div>
        </div>
      </div>
    </div>

  </section>

  <!--End Checkout Area -->
</main>






<script>

$('#delivery').click(function () {

if ($('#memberId').val() != '') {
let memberId = $('#memberId').val();

// 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
$.ajax({

  type: 'POST',
  url: '/AddressFind',
  data: {
    "memberId": $('#memberId').val(),

  },
  dataType: 'text',

  success: function (aa) {

    if(aa !=null){

      $("#abc").hide();


    var reg = /[`~!#$%^&*()_|+\=?;:'"<>\{\}\[\]\\\/ ]/gim;

        for(let i=0; i<aa.length; i++){

        console.log(aa[i].length);

        }




    // $("#name").val(tel.replace(reg , ''));
      // $("#tel").val(tel.replace(reg , ''));
    }








  <%--  <c:forEach var="memberDTOList" items="${memberDTOList}">--%>


// $("#result").text('비밀번호는:'+' '+result+''+'입니다');
//
// document.getElementById('result').style.color ="red"

},
error: function(a, b, c) {
alert('실패');
console.log(a, b, c);
}

});

}

});

</script>

<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>
