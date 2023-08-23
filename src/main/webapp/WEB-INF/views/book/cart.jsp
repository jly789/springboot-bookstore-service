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

  <form action="/order" method="post">

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
              <th scope="col" style="margin-right: 10px;">수량</th>
              <th scope="col">Total</th>
              <th scope="col">수량조절</th>


            </tr>
            </thead>
            <tbody>

            <c:forEach var="bookCartList" items="${bookCartList}">

            <input type="hidden" name="memberId" id="memberId" value="${memberId}"/>
            <tr>
              <td>
                <div class="media">
                  <div class="d-flex">
                    <img src="files/${bookCartList.fileName}" alt="" />
                  </div>
                  <div class="media-body">
                    <p id="bookNames">${bookCartList.bookName}</p>
                    <a href="/cartDelete?cartId=${bookCartList.cartId}" style="color: red">삭제</a>
                  </div>
                </div>
              </td>
              <td>
                <h5 id="price">${bookCartList.price}원</h5>


              </td>

              <td>
                <div class="product_count">

  <table>
    <tr>

      <td><input type="text"  name="wishQuantity" value="${bookCartList.wishQuantity}"
                 readonly style="margin-right: 50px; width: 65px; height: 40px;" /></td>

      <td><input type="hidden" class="price" value="${bookCartList.price}" /></td>
      <td id="totals"></td>

    </tr>

  </table>
                </div>
              </td>

              <td>
                <h5 id="total"></h5>
              ${bookCartList.amount}원
              </td>

                <td>
                    <a href="/cartPlus?cartId=${bookCartList.cartId}&price=${bookCartList.price}" style="color: black">
                        <input type='hidden' class="bb" id="bb" name="bb"
                               onclick='count("plus")'
                               value='${bookCartList.cartId}'>+

                    </a>

                    <br/>
                </td>

              <td>
                <a href="/cartMinus?cartId=${bookCartList.cartId}&price=${bookCartList.price}&
wishQuantity=${bookCartList.wishQuantity}" style="color: black">
                  <input type='hidden' class="minus" id="minus" name="minus"
                         onclick='count("minus")'
                         value='${bookCartList.cartId}'>-

                </a>

                <br/>
              </td>
            <td>
              <input type="hidden" name="cartId" id="" value="${bookCartList.cartId}"/>
            </td>
              </c:forEach>
            <tr>
              <td></td>
              <td></td>
              <td>

                <h4>총 금액:</h4>
              </td>
              <td>
                <h4 style="margin-right: 150px; color: red;">${totalPrice}원</h4>
             <input type="hidden" class=""  name="totalPrice" id="totalPrice" value="${totalPrice}"/>
              </td>
            </tr>

            </tbody>

          </table>
          <div class="checkout_btn_inner float-right">
            <a class="btn" href="/bookMain">계속쇼핑하기</a>
            <button type="submit" class="btn checkout_btn" id="payment">결제하기</button>

          </div>
        </div>
      </div>
    </div>
  </section>
  </form>
  <!--================End Cart Area =================-->
</main>

<script>

  $('#payment').click(function () {

    let bookName =0;
    let firstElement =0;
    // 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
    $.ajax({

      type: 'POST',
      url: '/cartList',
      data: {"memberId": $('#memberId').val(),

      },
      dataType: 'JSON',

      success: function(bookCartList) {

        for(let i = 0; i < bookCartList.length; i++) {
          let subCategoryDTO = bookCartList[i]
          let option = $('<input name="option" value="' + subCategoryDTO.bookName + '">' + subCategoryDTO.bookName + '</input>')

          $('#subCategory').append(option)

        }

        $('#subCategory').niceSelect('update')

      },
      error: function(a, b, c) {
        alert('ㅇㅇㄴ');
        console.log(a, b, c);
      }

    });

  });

  function count(type)  {
    // 결과를 표시할 element
    const resultElement = document.getElementById('result');
    let sum =0;
    let price =0;
    let aa =0;
    // 현재 화면에 표시된 값
    let number = resultElement.innerText;

    // 더하기/빼기
    if(type === 'plus') {
      number = parseInt(number) + 1;
      if (number == 2) {
        price = number * $("#priceId").val();

        resultElement.innerText = number;

        $("#priceId").val(price);


      }
      if (number != 2) {

        aa = 1 * $("#priceId2").val();

        resultElement.innerText = number;
        $("#priceId").val( parseInt($("#priceId").val())+parseInt(aa));
      }
    }
    else if(type === 'minus')  {
      number = parseInt(number) - 1;
    }

  }

  var number = $("#cc").val();

  $('input.qty, input.price,input.bb').click(function(){


    var $t = $(this).parents('tr');
    var val = $t.find('input.qty').val() * $t.find('input.price').val();

   var vv =$t.find('td').last().html(val);



   if(number==1) {

       var cc = $t.find('p').last().html(number);
        number++;
   }

        if(number>1){
            var cc = $t.find('p').last().html(number);
            number++;
        }

      let total =  $("#totalPrice").val();

    $("#totalPrice").val(parseInt(total) + parseInt(vv.html()));

    $.ajax({

      type: 'POST',
      url: '/cartPlus',
      data: {"price":$t.find('input.qty').val() * $t.find('input.price').val(),
      "cartId":$("#cartId").val(),
      },
      dataType: 'text',
      success: function(price) {

        document.getElementById('result').style.color ="black";

      }
      ,
      error: function(a, b, c) {
        console.log(a, b, c);
      }

    });


  });


  <c:forEach var="bookCartList" items="${bookCartList}">

  $('#quantity\\[${bookCartList.price}\\]').mouseleave (function () {

    alert($('#quantity\\[${bookCartList.price}\\]').val());


    if ($('#quantity').val() != '') {



      // 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
      $.ajax({

        type: 'POST',
        url: '/cartPlus',
        data: {"quantity": $('#quantity\\[${bookCartList.price}\\]').val(),
        },
        dataType: 'text',
        success: function(quantity) {

       $('#total').text(quantity * $('#price').text());


            document.getElementById('result').style.color ="black";


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
  </c:forEach>

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

