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
  <link rel="shortcut icon" type="image/x-icon" href="assets/img/icon/favicon.png">

  <!-- CSS here -->
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
  <link rel="stylesheet" href="assets/css/slicknav.css">
  <link rel="stylesheet" href="assets/css/animate.min.css">
  <link rel="stylesheet" href="assets/css/price_rangs.css">
  <link rel="stylesheet" href="assets/css/magnific-popup.css">
  <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
  <link rel="stylesheet" href="assets/css/themify-icons.css">
  <link rel="stylesheet" href="assets/css/slick.css">
  <link rel="stylesheet" href="assets/css/nice-select.css">
  <link rel="stylesheet" href="assets/css/style.css">
</head>
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
              <h2>Cart</h2>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--  Hero area End -->
  <!--================Cart Area =================-->
  <section class="cart_area section-padding">
    <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
            <tr>
              <th scope="col">Product</th>
              <th scope="col">Price</th>
              <th scope="col">Quantity</th>
              <th scope="col">Total</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="bookCartList" items="${bookCartList}">
            <tr>
              <td>
                <div class="media">
                  <div class="d-flex">
                    <img src="files/${bookCartList.fileName}" alt="" />
                  </div>
                  <div class="media-body">
                    <p>${bookCartList.bookName}</p>
                  </div>
                </div>
              </td>
              <td>
                <h5 id="price">${bookCartList.price}</h5>
               <input type="hidden" id="priceId" value="${bookCartList.price}">
              </td>

              <td>
                <div class="product_count">
<%--                  <span class="input-number-decrement"> <i class="ti-minus" id="minus" ></i></span>--%>
                  <input class="input-number" type="text" id =quantity name="quantity"  value="1" min="0" max="10"/>
  <input type="text" id =aa name="aa"  value=""/>
<%--                  <span class="input-number-increment"> <i class="ti-plus" id="plus"></i></span>--%>
                </div>
              </td>

              <td>
                <h5 id="total">${bookCartList.price}</h5>
              </td>
              </c:forEach>
            </tr>

            <tr class="bottom_button">
              <td>
                <a class="btn" href="#">Update Cart</a>
              </td>
              <td></td>
              <td></td>
              <td>
                <div class="cupon_text float-right">
                  <a class="btn" href="#">Close Coupon</a>
                </div>
              </td>
            </tr>
            <tr>
              <td></td>
              <td></td>
              <td>
                <h5>Subtotal</h5>
              </td>
              <td>
                <h5>$${totalPrice}</h5>
              </td>
            </tr>
            <tr class="shipping_area">
              <td></td>
              <td></td>
              <td>
                <h5>Shipping</h5>
              </td>
              <td>
                <div class="shipping_box">
                  <ul class="list">
                    <li>
                      Flat Rate: $5.00
                      <input type="radio" aria-label="Radio button for following text input">
                    </li>
                    <li>
                      Free Shipping
                      <input type="radio" aria-label="Radio button for following text input">
                    </li>
                    <li>
                      Flat Rate: $10.00
                      <input type="radio" aria-label="Radio button for following text input">
                    </li>
                    <li class="active">
                      Local Delivery: $2.00
                      <input type="radio" aria-label="Radio button for following text input">
                    </li>
                  </ul>
                  <h6>
                    Calculate Shipping
                    <i class="fa fa-caret-down" aria-hidden="true"></i>
                  </h6>
                  <select class="shipping_select">
                    <option value="1">Bangladesh</option>
                    <option value="2">India</option>
                    <option value="4">Pakistan</option>
                  </select>
                  <select class="shipping_select section_bg">
                    <option value="1">Select a State</option>
                    <option value="2">Select a State</option>
                    <option value="4">Select a State</option>
                  </select>
                  <input class="post_code" type="text" placeholder="Postcode/Zipcode" />
                  <a class="btn" href="#">Update Details</a>
                </div>
              </td>
            </tr>
            </tbody>
          </table>
          <div class="checkout_btn_inner float-right">
            <a class="btn" href="#">Continue Shopping</a>
            <a class="btn checkout_btn" href="#">Proceed to checkout</a>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--================End Cart Area =================-->
</main>

<script>
  $('#price').text($('#priceId').val());

  $('#quantity').mouseleave (function () {



    if ($('#quantity').val() != '') {


      var objParams = {
        "price"      : $('#price').text(), //유저 저장
        "fruitList" : fruitArray        //과일배열 저장
      };
      // 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
      $.ajax({

        type: 'POST',
        url: '/cartPlus',
        data: {"plus": $('#quantity').val(),"aa":objParams,
          "price": $('#price').text(),
        },
        dataType: 'text',
        success: function(result) {

       $('#total').text(result * $('#price').text());





            document.getElementById('result').style.color ="black";
            // $("#result").attr('color','green');


          }
        ,
        error: function(a, b, c) {
          console.log(a, b, c);
        }

      });

    } else {
      alert('아이디를 입력하세요.');
      $('#userd').focus();
    }

  });


  $('#minus').click(function () {


    if ($('#quantity').val() != '') {

      // 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
      $.ajax({

        type: 'POST',
        url: '/cartMinus',
        data: 'minus=' + $('#quantity').val(),
        dataType: 'json',
        success: function(result) {

          $('#total').text(result);




            document.getElementById('result').style.color ="black";
            // $("#result").attr('color','green');



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
  // $('#quantity').click(function (){
  //
  //   alert('dsfsdfsd');
  //
  //
  //     $.ajax({
  //
  //       type: 'POST',
  //       url: '/cart',
  //       data: 'quantity='+$('#quantity').val(),
  //       dataType: 'json',
  //
  //       success: function (result){
  //         alert(result);
  //         $("#result").text('사용 가능한 아이디입니다.');
  //
  //       },
  //       error: function (a,b,c){
  //         console.log(a,b,c);
  //       }
  //
  //
  //     });
  //
  // });




</script>


<jsp:include page="../main/footer.jsp"></jsp:include>
<!-- Scroll Up -->
<div id="back-top" >
  <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<!-- JS here -->
<!-- Jquery, Popper, Bootstrap -->


</body>
</html>


<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%--<c:set var="cp" value="<%=request.getContextPath()%>"/>--%>
<%--<!doctype html>--%>
<%--<html class="no-js" lang="zxx">--%>
<%--<head>--%>
<%--  <meta charset="utf-8">--%>
<%--  <meta http-equiv="x-ua-compatible" content="ie=edge">--%>
<%--  <title>Book Shop</title>--%>
<%--  <meta name="description" content="">--%>
<%--  <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--  <link rel="shortcut icon" type="image/x-icon" href="assets/img/icon/favicon.png">--%>

<%--  <!-- CSS here -->--%>
<%--  <link rel="stylesheet" href="assets/css/bootstrap.min.css">--%>
<%--  <link rel="stylesheet" href="assets/css/owl.carousel.min.css">--%>
<%--  <link rel="stylesheet" href="assets/css/slicknav.css">--%>
<%--  <link rel="stylesheet" href="assets/css/animate.min.css">--%>
<%--  <link rel="stylesheet" href="assets/css/price_rangs.css">--%>
<%--  <link rel="stylesheet" href="assets/css/magnific-popup.css">--%>
<%--  <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">--%>
<%--  <link rel="stylesheet" href="assets/css/themify-icons.css">--%>
<%--  <link rel="stylesheet" href="assets/css/slick.css">--%>
<%--  <link rel="stylesheet" href="assets/css/nice-select.css">--%>
<%--  <link rel="stylesheet" href="assets/css/style.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<jsp:include page="../main/header.jsp"></jsp:include>--%>
<%--<main>--%>
<%--  <!-- Hero area Start-->--%>
<%--  <div class="container">--%>
<%--    <div class="row">--%>
<%--      <div class="col-xl-12">--%>
<%--        <div class="slider-area">--%>
<%--          <div class="slider-height2 slider-bg5 d-flex align-items-center justify-content-center">--%>
<%--            <div class="hero-caption hero-caption2">--%>
<%--              <h2>Cart</h2>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--  <!--  Hero area End -->--%>
<%--  <!--================Cart Area =================-->--%>
<%--  <section class="cart_area section-padding">--%>
<%--    <div class="container">--%>
<%--      <div class="cart_inner">--%>
<%--        <div class="table-responsive">--%>
<%--          <table class="table">--%>
<%--            <thead>--%>
<%--            <tr>--%>
<%--              <th scope="col">Product</th>--%>
<%--              <th scope="col">Price</th>--%>
<%--              <th scope="col">Quantity</th>--%>
<%--              <th scope="col">Total</th>--%>
<%--            </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <c:forEach var="bookCartList" items="${bookCartList}">--%>
<%--            <tr>--%>
<%--              <td>--%>
<%--                <div class="media">--%>
<%--                  <div class="d-flex">--%>

<%--                    <img src="files/${bookCartList.fileName}" alt="" />--%>
<%--                  </div>--%>
<%--                  <div class="media-body">--%>
<%--                    <p>${bookCartList.bookName}</p>--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--              </td>--%>
<%--              <td>--%>
<%--                <h5>--%>
<%--                  $${bookCartList.price}--%>
<%--                </h5>--%>
<%--              </td>--%>
<%--              <td>--%>
<%--                <div class="product_count">--%>
<%--                  <span class="input-number-decrement"> <i class="ti-minus"></i></span>--%>
<%--                  <input class="input-number" type="text" value="1" >--%>
<%--                  <span class="input-number-increment"> <i class="ti-plus"></i></span>--%>
<%--                </div>--%>
<%--              </td>--%>
<%--              <td>--%>
<%--                <h5>  $${bookCartList.price}</h5>--%>
<%--              </td>--%>
<%--            </tr>--%>

<%--            </c:forEach>--%>
<%--            <tr class="bottom_button">--%>
<%--              <td>--%>
<%--                <a class="btn" href="#">Update Cart</a>--%>
<%--              </td>--%>
<%--              <td></td>--%>
<%--              <td></td>--%>
<%--              <td>--%>
<%--                <div class="cupon_text float-right">--%>
<%--                  <a class="btn" href="#">Close Coupon</a>--%>
<%--                </div>--%>
<%--              </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--              <td></td>--%>
<%--              <td></td>--%>
<%--              <td>--%>
<%--                <h5>Subtotal</h5>--%>
<%--              </td>--%>
<%--              <td>--%>
<%--                <h5>$${totalPrice}</h5>--%>
<%--              </td>--%>
<%--            </tr>--%>
<%--            <tr class="shipping_area">--%>
<%--              <td></td>--%>
<%--              <td></td>--%>
<%--              <td>--%>
<%--                <h5>Shipping</h5>--%>
<%--              </td>--%>
<%--              <td>--%>
<%--                <div class="shipping_box">--%>
<%--                  <ul class="list">--%>
<%--                    <li>--%>
<%--                      Flat Rate: $5.00--%>
<%--                      <input type="radio" aria-label="Radio button for following text input">--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                      Free Shipping--%>
<%--                      <input type="radio" aria-label="Radio button for following text input">--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                      Flat Rate: $10.00--%>
<%--                      <input type="radio" aria-label="Radio button for following text input">--%>
<%--                    </li>--%>
<%--                    <li class="active">--%>
<%--                      Local Delivery: $2.00--%>
<%--                      <input type="radio" aria-label="Radio button for following text input">--%>
<%--                    </li>--%>
<%--                  </ul>--%>
<%--                  <h6>--%>
<%--                    Calculate Shipping--%>
<%--                    <i class="fa fa-caret-down" aria-hidden="true"></i>--%>
<%--                  </h6>--%>
<%--                  <select class="shipping_select">--%>
<%--                    <option value="1">Bangladesh</option>--%>
<%--                    <option value="2">India</option>--%>
<%--                    <option value="4">Pakistan</option>--%>
<%--                  </select>--%>
<%--                  <select class="shipping_select section_bg">--%>
<%--                    <option value="1">Select a State</option>--%>
<%--                    <option value="2">Select a State</option>--%>
<%--                    <option value="4">Select a State</option>--%>
<%--                  </select>--%>
<%--                  <input class="post_code" type="text" placeholder="Postcode/Zipcode" />--%>
<%--                  <a class="btn" href="#">Update Details</a>--%>
<%--                </div>--%>
<%--              </td>--%>
<%--            </tr>--%>
<%--            </tbody>--%>
<%--          </table>--%>
<%--          <div class="checkout_btn_inner float-right">--%>
<%--            <a class="btn" href="#">Continue Shopping</a>--%>
<%--            <a class="btn checkout_btn" href="#">Proceed to checkout</a>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </section>--%>
<%--  <!--================End Cart Area =================-->--%>
<%--</main>--%>
<%--<jsp:include page="../main/footer.jsp"></jsp:include>--%>
<%--    <div class="footer-bottom-area">--%>
<%--      <div class="container">--%>
<%--        <div class="footer-border">--%>
<%--          <div class="row d-flex align-items-center">--%>
<%--            <div class="col-xl-12 ">--%>
<%--              <div class="footer-copy-right text-center">--%>
<%--                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" style="color: black"target="_blank" rel="nofollow noopener">Colorlib</a>--%>

<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</footer>--%>
<%--<!-- Scroll Up -->--%>
<%--<div id="back-top" >--%>
<%--  <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>--%>
<%--</div>--%>

<%--<!-- JS here -->--%>
<%--<!-- Jquery, Popper, Bootstrap -->--%>
<%--<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>--%>
<%--<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>--%>
<%--<script src="./assets/js/popper.min.js"></script>--%>
<%--<script src="./assets/js/bootstrap.min.js"></script>--%>

<%--<!-- Slick-slider , Owl-Carousel ,slick-nav -->--%>
<%--<script src="./assets/js/owl.carousel.min.js"></script>--%>
<%--<script src="./assets/js/slick.min.js"></script>--%>
<%--<script src="./assets/js/jquery.slicknav.min.js"></script>--%>

<%--<!--wow , counter , waypoint, Nice-select -->--%>
<%--<script src="./assets/js/wow.min.js"></script>--%>
<%--<script src="./assets/js/jquery.magnific-popup.js"></script>--%>
<%--<script src="./assets/js/jquery.nice-select.min.js"></script>--%>
<%--<script src="./assets/js/jquery.counterup.min.js"></script>--%>
<%--<script src="./assets/js/waypoints.min.js"></script>--%>
<%--<script src="./assets/js/price_rangs.js"></script>--%>

<%--<!-- contact js -->--%>
<%--<script src="./assets/js/contact.js"></script>--%>
<%--<script src="./assets/js/jquery.form.js"></script>--%>
<%--<script src="./assets/js/jquery.validate.min.js"></script>--%>
<%--<script src="./assets/js/mail-script.js"></script>--%>
<%--<script src="./assets/js/jquery.ajaxchimp.min.js"></script>--%>

<%--<!--  Plugins, main-Jquery -->--%>
<%--<script src="./assets/js/plugins.js"></script>--%>
<%--<script src="./assets/js/main.js"></script>--%>
<%--</body>--%>
<%--</html>--%>