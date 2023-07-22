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


                <c:forEach var="bookList" items="${bookList}">
                   책번호 ${bookList.bookId}<br/>
                    책이름:${bookList.bookName}<br/>
                </c:forEach>



                <%--           <button type="hi" value="" id="subCategory" name="subCategory"/>--%>
                <%--            <input type="text" name="bookName" id="bookName" value=""/>--%>

              <tr>
                <td>
                  <div class="media">
                    <div class="d-flex">
<%--                      <img src="files/${bookCartList.fileName}" alt="" />--%>
                    </div>
                    <div class="media-body">
<%--                      <p id="bookNames">${bookCartList.bookName}</p>--%>
                    </div>
                  </div>
                </td>
                <td>
<%--                  <h5 id="price">${bookCartList.price}</h5>--%>
<%--                  <input type="hidden" id="priceId" value="${bookCartList.price}">--%>
<%--                </td>--%>

                <td>
                  <div class="product_count">
                      <%--                  <span class="input-number-decrement"> <i class="ti-minus" id="minus" ></i></span>--%>
                      <%--                  <input class="input-number" type="text" id =quantity[${bookCartList.price}] name="quantity"  value="1" min="0" max="10"/>--%>
                    <table>
                      <tr>
                        <td><input type="text" class="qty" id="qty" name="wishQuantity" value="1" /></td>
<%--                        <td><input type="hidden" class="price" value="${bookCartList.price}" /></td>--%>
                        <td id="totals"></td>

                      </tr>

                    </table>
                      <%--                  <span class="input-number-increment"> <i class="ti-plus" id="plus"></i></span>--%>
                  </div>
                </td>

                <td>
<%--                  <h5 id="total">${bookCartList.price}</h5>--%>
                </td>


              </tr>


              </tr>




              <tr>
                <td></td>
                <td></td>
                <td>


                  <h5>Subtotal</h5>
                </td>
                <td>

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




<jsp:include page="../main/footer.jsp"></jsp:include>
<!-- Scroll Up -->
<div id="back-top" >
  <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<!-- JS here -->
<!-- Jquery, Popper, Bootstrap -->


</body>
</html>

