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
              <h2>주문 내역</h2>
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
                <th scope="col">도서명</th>
                <th scope="col">가격</th>
                <th scope="col">수량</th>
                  <th scope="col">구매금액</th>
                <th scope="col">주문상태</th>
              </tr>
              </thead>
              <tbody>




                <c:forEach var="bookList" items="${bookList}">



              <tr>
                <td>
                  <div class="media">
                    <div class="d-flex">
                      <img src="files/${bookList.fileName}" alt="" />
                    </div>
                    <div class="media-body">
                      <p id="bookNames">${bookList.bookName}</p>
                      <a href="/reviewAdd?bookId=${bookList.bookId}&orderId=${bookList.orderId}"><p  id="review" style="color: red" >리뷰쓰기</p></a>
                    </div>
                  </div>
                </td>
                <td>
                  <h5 id="price">${bookList.price}</h5>
                  <input type="hidden" id="priceId" value="${bookList.price}">
                </td>

                  <td>
                      <h5 >1</h5>
                      <input type="hidden" id="qty1" value="1">
                  </td>

                  <td>
                      <h5 >${bookList.price}</h5>
                      <input type="hidden" id="qty13" value="1">
                  </td>


                  <td style="color: red">

                      <c:forEach var="orderStateList" items="${orderStateList}">
                          ${orderStateList.orderState}
                      </c:forEach>
                  </td>





                </c:forEach>
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

