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
              <th scope="col">Quantity</th>
              <th scope="col">Total</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="bookCartList" items="${bookCartList}">
<%--           <button type="hi" value="" id="subCategory" name="subCategory"/>--%>
<%--            <input type="text" name="bookName" id="bookName" value=""/>--%>
            <input type="hidden" name="memberId" id="memberId" value="${memberId}"/>
            <tr>
              <td>
                <div class="media">
                  <div class="d-flex">
                    <img src="files/${bookCartList.fileName}" alt="" />
                  </div>
                  <div class="media-body">
                    <p id="bookNames">${bookCartList.bookName}</p>
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
<%--                  <input class="input-number" type="text" id =quantity[${bookCartList.price}] name="quantity"  value="1" min="0" max="10"/>--%>
  <table>
    <tr>
      <td><input type="text" class="qty" id="qty" name="wishQuantity" value="1" /></td>
      <td><input type="hidden" class="price" value="${bookCartList.price}" /></td>
      <td id="totals"></td>

    </tr>

  </table>
<%--                  <span class="input-number-increment"> <i class="ti-plus" id="plus"></i></span>--%>
                </div>
              </td>

              <td>
                <h5 id="total">${bookCartList.price}</h5>
              </td>

              </c:forEach>
            </tr>


            </tr>




            <tr>
              <td></td>
              <td></td>
              <td>


                <h5>Subtotal</h5>
              </td>
              <td>
             <input type="text" class="btn"  name="totalPrice" id="totalPrice" value="${totalPrice}"
             />
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

  // $('#payment').click(function () {
  //
  // alert("aa");
  //   for(let i=0; i<)
  //   $("#bookName").val($("#bookNames").html());
  //   $("#bookPrice").val($("#priceId").val());
  //   $("#wishQuantity").val($("#qty").val());
  //   $("#bookName").val($("#bookNames").html());
  //   $("#bookRealTotal").val($("#totalPrice").val());
  //
  //   console.log($("#bookName"));
  // });


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
       //
       //        // $("#bookName").val($("#subCategory").html());
       //
       //    // bookName =(bookCartList[i].bookName);
       //    console.log(bookName);
       // //   const arrayElements = [bookCartList[i].bookName];
       //      // document.getElementsByName("bookName")[i].value = bookName; //javascritp getElementsByName 사용 시
       //   // firstElement = arrayElements[i];
       //
       //   // $("#bookName\\[text1\\]").val(firstElement);
       //
       //
       //
       //
       //
       //
       //
       //




        //
        // $("#result").text('아이디:'+' '+result+''+'입니다');
        //
        // document.getElementById('result').style.color ="red"



      },
      error: function(a, b, c) {
        alert('ㅇㅇㄴ');
        console.log(a, b, c);
      }

    });



  });




  $('input.qty, input.price').change(function() {
    var $t = $(this).parents('tr');
    var val = $t.find('input.qty').val() * $t.find('input.price').val();
  $t.find('td').last().html(val);





    $.ajax({

      type: 'POST',
      url: '/cartPlus',
      data: {"price":$t.find('input.qty').val() * $t.find('input.price').val()},
      dataType: 'text',
      success: function(price) {

       let  total =  $('#totalPrice').val();

      total = Number(total) + Number(price);

      $('#totalPrice').val(total);




        document.getElementById('result').style.color ="black";
        // $("#result").attr('color','green');


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

