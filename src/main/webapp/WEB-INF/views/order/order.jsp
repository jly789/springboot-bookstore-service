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
  <!-- jQuery -->
  <script
          type="text/javascript"
          src="https://code.jquery.com/jquery-1.12.4.min.js"
  ></script>
  <!-- iamport.payment.js -->
  <script
          type="text/javascript"
          src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"
  ></script>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>

<main>



  <input type="hidden" id="memberId" name="memberId" value="${memberId}"/>
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
          <c:if test="${memberId ==null}">
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
            <a   style="height: 20px; width: 40px;">포인트 확인</a>
          </h2>
        </div>
        <input type="text" placeholder="" />
      </div>
      </c:if>



      <div class="billing_details">
        <div class="row">
          <div class="col-lg-8">
            <h3>delivery</h3>




              <div class="col-md-6 form-group p_star">

                <input type="hidden" id="orderNum" name="orderNum" value="">

                <input type="text" class="form-control" id="name" name="name"  value=""/>
                <span id="name1" class="placeholder" data-placeholder="이름을 입력하시오!"></span>
              </div>



              <div class="col-md-12 form-group">
                <input type="text" class="form-control" id="recipient" name="recipient" placeholder="배송지명" />
              </div>
              <div class="col-md-6 form-group p_star">
                <input type="text" class="form-control" id="tel" name="deliveryTel" value="" />
                <span id="tels" class="placeholder" data-placeholder="핸드폰 번호"></span>
              </div>
              <div class="col-md-6 form-group p_star">
                <input type="text" class="form-control" id="email" name="email" value="" />
                <span id="emails" class="placeholder" data-placeholder="이메일 주소입력"></span>
              </div>

              <div class="col-md-12 form-group">
                <input type="text" class="form-control" id="postcode" name="postcode" placeholder="우편번호" />
                <span id="postcodes" class="placeholder" data-placeholder="우편번호 입력"></span>
              </div>


              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="address" name="address" />
                <span id="addresss" class="placeholder" data-placeholder="주소"></span>
              </div>
              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="detailAddress" name="detailAddress" />
                <span id="detailAddresss"  class="placeholder" data-placeholder="상세주소"></span>
              </div>







                <textarea class="form-control" name="extraAddress" id="extraAddress" rows="1" placeholder="참고사항"></textarea>
                <span id="extraAddresss"  class="placeholder" data-placeholder="참고사항"></span>
            <br/>
              <div class="cupon_area">
                <div class="check_title">
                  <h2 id="have">you Have a point
                    <a id="pointCheck" style="height: 20px; width: 40px;"  href="#">포인트 확인</a>
                  </h2>
                </div>

                <input id="point" name="point" type="text" placeholder="" readonly
                       value=""/>

                <%--        <a id="delivery" class="btn">기본 배송지적용</a>--%>
                <a  id="pointApply" class="btn">포인트적용</a>


                <a id="delivery" class="btn">기존 배송지 적용</a>
                <a id="reset"   href="/order" style="width: 90px; height: 30px; background-color: red" >reset</a>
              </div>


          </div>



         <input type="hidden" id="totalPriceEx" value="${totalPrice}"/>
          <input type="hidden" id="totalPriceEx2" value="${totalPrice+5000}"/>





          <div class="col-lg-4">
            <div class="order_box">
              <h2>구매 도서</h2>
              <ul class="list">
                <li>
                  <a href="#" style="color: red;">
                    <c:forEach var="orderBookCartList" items="${orderBookCartList}" varStatus="status">
                      <input type="hidden" id="test"  name="name=currentbook${status.index}" value="${orderBookCartList.cartId}">

                      <input type="hidden" id="purchaseBook"  value=" ${orderBookCartList.bookName}"/>
                      구매도서: ${orderBookCartList.bookName} X ${orderBookCartList.wishQuantity}권<br/>
                      <input type="hidden" id="wishQuantity"  value=" ${orderBookCartList.wishQuantity}"/>
                    </c:forEach>
                    <span>Total</span>
                  </a>
                </li>



              </ul>
              <ul class="list list_2">
                <li>
                  <span></span>    <a href="#"> Total:${totalPrice}원</a>
                </li>
                <li>
                  <a href="#">배송비
                    <span>5000원</span>
                    <input type="hidden" id="delivaryAccount" value="5000">
                    <input type="hidden" id="basePrice" value="${totalPrice}">
                  </a>


                </li>

                <li>
                  <a href="#">총 금액
                    <span style="color: red;"  id="totalPrice">${totalPrice+5000}</span>

                  </a>


                </li>

                <li>
                  <input type="hidden" id="finaltotalPrice" value="${totalPrice+5000}"/>




                    <span></span>
                  </input>
                </li>
              </ul>


              <div class="creat_account checkout-cap">
                <input type="checkbox" id="f-option8" name="selector" />
                <label for="f-option8">I’ve read and accept the  <a href="#">terms & conditions*</a> </label>
              </div>

<%--              <form class="row contact_form" action="/payment" method="post" novalidate="novalidate">--%>
              <button class="btn w-100" id="payment">결제하기</button>
<%--              </form>--%>
            </div>
          </div>
        </div>
      </div>
    </div>

  </section>

  <!--End Checkout Area -->
</main>

<script>



  $('#pointCheck').click(function () {

    let point = 0;
    // 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
    $.ajax({

      type: 'POST',
      url: '/pointCheck',
      data: {"memberId": $('#memberId').val(),

      },
      dataType: 'JSON',

      success: function(point) {

        for(let i=0; i<point.length; i++) {

          point =(point[i].point);

        }

        $("#point").val(point);


      },
      error: function(a, b, c) {
        alert('ㅇㅇㄴ');
        console.log(a, b, c);
      }

    });



  });


  $('#pointApply').click(function () {

    if($("#pointApply").text()=='포인트적용' ){
      if($("#point").val()==''){
        alert("포인트 확인을 누르세요!");
        return false;
      }



      $("#have").hide();

      $("#pointCheck").hide();

      let message = "포인트 적용취소";

      let pointapplys =$("#point").val(); //포인틐금액

      let finaltotalPrice =parseInt($("#totalPrice").text())-parseInt($("#point").val()) ; //최종금액= 최종금액-포인트금액

      let totalPrice = parseInt($("#totalPrice").html());


      $("#totalPrice").html(totalPrice + "-" + pointapplys + "=" +  finaltotalPrice+"원");

      $("#finaltotalPrice").val(finaltotalPrice);

      $("#pointApply").html(message);
      document.getElementById('pointApply').style.backgroundColor = "green";

      return true;

      document.getElementById('point').readOnly = true;

    }


    if ($("#pointApply").text() =='포인트 적용취소') {

      $("#have").show();

      $("#pointCheck").show();
      $("#point").val(0);
      $("#point").show();


      let message = "포인트적용";


      let pointapplys =$("#point").val(); //포인틐금액


      let totalPrice = parseInt($("#totalPrice").html());

      $("#finaltotalPrice").val(totalPrice);

      $("#pointApply").html(message);
      document.getElementById('pointApply').style.backgroundColor = "red";
      $("#totalPrice").html(parseInt(totalPrice));

      return false;
    }


  });






  var IMP = window.IMP;
  IMP.init("imp88246600");

  $('#payment').click(function () {

    if($('#recipient').val()==''){
      alert('배송지명을 입력하세요!')
      return false;
    }

    var bookId = [];
    var wishQuantity = [];
    var cartId = [];

    <c:forEach items="${orderBookCartList}" var="item">
    bookId.push(${item.bookId});
    wishQuantity.push(${item.wishQuantity});
    cartId.push(${item.cartId});
    </c:forEach>


    //pg: "html5_inicis"
    // pg : 'kakaopay.TC0ONETIME',
   // pg : 'danal_tpay',
  //  pg : 'kakaopay.TC0ONETIME'

    IMP.request_pay({
      pg : 'kakaopay.TC0ONETIME',
      pay_method: "card", // 결제방식
      merchant_uid : 'merchant_' + new Date().getTime(), // 주문번호
      name: $('#purchaseBook').val(), // 상품명

      amount: $("#finaltotalPrice").val(),
      usePoint: $("#point").val(),
      buyer_name: $('#name').val(), // 주문자명
      buyer_tel: $('#tel').val(), // 주문자 연락처
      buyer_email: $('#email').val(), // 주문자 이메일                    //우편번호
    },function(data){
      if(data.success){
        var msg = "결제 완료";
        msg += '고유ID : ' + data.imp_uid;                //아임포트 uid는 실제 결제 시 결제 고유번호를 서버와 비교해서 결제처리하는데 필요없긴함.
        msg += '// 상점 거래ID : ' + data.merchant_uid; // 주문번호
        msg += '// 결제 금액 : ' + $("#finaltotalPrice").val();
        // msg += '// 포인트 사용 금액 : ' + data.usePoint;
        msg += '// 카드 승인번호 : ' + data.apply_num;

      $("#orderNum").val(data.merchant_uid);

        $.ajax({
          type: 'post',
          url: '/payment',
          data: {
            bookId:   bookId,
            wishQuantity:wishQuantity,
            cartId: cartId,
            bookName: $('#purchaseBook').val(),
            impUid: data.imp_uid, // 결제번호
            orderNum: data.merchant_uid, //주문번호
            // orderNum: rsp.merchant_uid, // 주문번호
            memberId: parseInt($('#memberId').val()), // 회원번호
            // productId:parseInt($('#productId').val()), // 상품번호
            amount: $('#finaltotalPrice').val(), // 주문가격
            usePoint: $('#point').val(), // 주문가격
            deliveryTel:$("#tel").val(),
            postcode: $("#postcode").val(),
            address: $("#address").val(),
            detailAddress: $("#detailAddress").val(),
            extraAddress: $("#extraAddress").val(),
            deliveryCost: $("#delivaryAccount").val(),
            recipient: $("#recipient").val(),
            plusPoint: parseInt($("#basePrice").val()),

          },
          traditional: true,
          dataType: 'JSON',

        });
      }else{
        var msg = "결제 실패"
        msg += "에러 내용" + rsp.error_msg;
      }

      alert("결제성공!");

      window.location.href = "/myOrder";
    });



  });














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
  dataType: 'JSON',

  success: function (list) {

    let name =0;
    let tel=0;
    let email =0;
    let postcode =0;
    let address =0;
    let detailAddress =0;
    let extraAddress =0;


    if(list !=null){
      $("#name1").hide();
      $("#tels").hide();
      $("#emails").hide();
      $("#postcodes").hide();
      $("#addresss").hide();
      $("#detailAddresss").hide();
      $("#extraAddresss").hide();

    }


    // var reg = /[`~!#$%^&*()_|+\=?;:'"<>\{\}\[\]\\\/ ]/gim;


      for(let i=0; i<list.length; i++) {

      name =(list[i].name);
       tel =(list[i].tel);
        email=(list[i].email);
        postcode=(list[i].postcode);
        address=(list[i].address);
        detailAddress=(list[i].detailAddress);
        extraAddress=(list[i].extraAddress);

      }
            // console.log(aa.ind);


    $("#name").val(name);
      $("#tel").val(tel);
      $("#email").val(email);
    $("#postcode").val(postcode);
    $("#address").val(address);
    $("#detailAddress").val(detailAddress);
    $("#extraAddress").val(extraAddress);


      // $("#tel").val(tel.replace(reg , ''));






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
