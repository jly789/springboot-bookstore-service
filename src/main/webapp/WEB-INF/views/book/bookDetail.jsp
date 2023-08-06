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
  <form action="/cartAdd" method="post">
  <!--  services-area start-->
  <div class="services-area2">
    <div class="container">
      <div class="row">
        <div class="col-xl-12">
          <div class="row">
            <div class="col-xl-12">
              <!-- Single -->

            <c:forEach var="bookList" items="${bookList}">


              <div class="single-services d-flex align-items-center mb-0">
                <div class="features-img">
                  <img src="files/${bookList.fileName}" alt="">
                </div>
                <div class="features-caption">
                  <h3>${bookList.bookName}</h3>
                  <p>${bookList.author}</p>
                  <input type="hidden" name="bookId" value="${bookList.bookId}">
                  <input type="hidden" name="amount" value="${bookList.price}">
                  <div class="price">
                    <span>$${bookList.price}</span>
                  </div>
                  <div class="review">
                    <div class="rating">
                      <i class="fas fa-star"></i>
                      <i class="fas fa-star"></i>
                      <i class="fas fa-star"></i>
                      <i class="fas fa-star"></i>
                      <i class="fas fa-star-half-alt"></i>
                    </div>
                    <p>(120 Review)</p>
                  </div>

                    <button type="submit" class="white-btn mr-10">Add to Cart</button>

                  <a href="#" class="border-btn share-btn"><i class="fas fa-share-alt"></i></a>
                </div>
              </div>
            </c:forEach>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </form>
  <!-- services-area End-->
  <!--Books review Start -->
  <section class="our-client section-padding best-selling">
    <div class="container">
      <div class="row">
        <div class="offset-xl-1 col-xl-10">
          <div class="nav-button f-left">
            <!--Nav Button  -->
            <nav>
              <div class="nav nav-tabs " id="nav-tab" role="tablist">
                <a class="nav-link active" id="nav-one-tab" data-bs-toggle="tab" href="#nav-one" role="tab" aria-controls="nav-one" aria-selected="true">Description</a>
                <a class="nav-link" id="nav-three-tab" data-bs-toggle="tab" href="#nav-three" role="tab" aria-controls="nav-three" aria-selected="false">Comments</a>
                <a class="nav-link" id="nav-four-tab" data-bs-toggle="tab" href="#nav-four" role="tab" aria-controls="nav-four" aria-selected="false">Review</a>
              </div>
            </nav>
            <!--End Nav Button  -->
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <!-- Nav Card -->
      <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-one" role="tabpanel" aria-labelledby="nav-one-tab">
          <!-- Tab 1 -->
          <div class="row">
            <div class="offset-xl-1 col-lg-9">
              <c:forEach var="bookList" items="${bookList}">
                <p>${bookList.bookContent}</p>
              </c:forEach>
            </div>
          </div>
        </div>

        <c:forEach var="commentFindDTOList" items="${commentFindDTOList}">
        <div class="tab-pane fade" id="nav-three" role="tabpanel" aria-labelledby="nav-three-tab">
          <!-- Tab 3 -->
          <div class="row">
            <div class="offset-xl-1 col-lg-9">
              <h4>${commentFindDTOList.commentId}</h4>
              <div class="comment-list">
                <div class="single-comment justify-content-between d-flex">
                  <div class="user justify-content-between d-flex">
                    <div class="thumb">
                      <img src="assets/img/blog/comment_1.png" alt="">
                    </div>
                    <div class="desc">
                      <p class="comment">


                          ${commentFindDTOList.commentContent}

                      </p>
                      <div class="d-flex justify-content-between">
                        <div class="d-flex align-items-center">
                          <h5>
                            <a href="#">${commentFindDTOList.name}</a>
                          </h5>
                          <p class="date">  ${commentFindDTOList.commentDate}</p>

                        </div>

                        <div class="reply-btn">
                          <a href="#" class="btn-reply text-uppercase">reply</a>

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>

        <div class="tab-pane fade" id="nav-four" role="tabpanel" aria-labelledby="nav-four-tab">
          <!-- Tab 4 -->
          <div class="row">
            <div class="offset-xl-1 col-lg-9">
              <h4>05 Comments</h4>
              <div class="comment-list">
                <div class="single-comment justify-content-between d-flex">
                  <div class="user justify-content-between d-flex">
                    <div class="thumb">
                      <img src="assets/img/blog/comment_1.png" alt="">
                    </div>
                    <div class="desc">
                      <p class="comment">
                        Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
                        Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                      </p>
                      <div class="d-flex justify-content-between">
                        <div class="d-flex align-items-center">
                          <h5>
                            <a href="#">Emilly Blunt</a>
                          </h5>
                          <p class="date">December 4, 2017 at 3:12 pm </p>
                        </div>
                        <div class="reply-btn">
                          <a href="#" class="btn-reply text-uppercase">reply</a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
          </div>
        </div>





      </div>
    </div>
  </section>

  <div class="comment-form">
    <h4>Comment<h4>

    <form class="form-contact comment_form" action="/commentAdd" method="get" id="commentForm">
      <c:forEach var="bookList" items="${bookList}">
      <input type="hidden" name="bookId" value="${bookList.bookId}"/>

      <div class="row">
        <div class="col-12">
          <div class="form-group">

        <div class="col-sm-6">
          <div class="form-group">
            <input class="form-control" name="commentContent"  type="text" value="" placeholder="Comment">
          </div>
        </div>

      <div class="form-group">
        <button type="submit" class="button button-contactForm btn_1 boxed-btn">작성하기</button>
      </div>
            </c:forEach>
    </form>
  </div>
  </div>





  <!-- Subscribe Area End -->
</main>




<jsp:include page="../main/footer.jsp"></jsp:include>


<script>


</script>


<!-- Scroll Up -->
<div id="back-top" >
  <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<!-- JS here -->
<!-- Jquery, Popper, Bootstrap -->
<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="./assets/js/popper.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>

<!-- Slick-slider , Owl-Carousel ,slick-nav -->
<script src="./assets/js/owl.carousel.min.js"></script>
<script src="./assets/js/slick.min.js"></script>
<script src="./assets/js/jquery.slicknav.min.js"></script>

<!--wow , counter , waypoint, Nice-select -->
<script src="./assets/js/wow.min.js"></script>
<script src="./assets/js/jquery.magnific-popup.js"></script>
<script src="./assets/js/jquery.nice-select.min.js"></script>
<script src="./assets/js/jquery.counterup.min.js"></script>
<script src="./assets/js/waypoints.min.js"></script>
<script src="./assets/js/price_rangs.js"></script>

<!-- contact js -->
<script src="./assets/js/contact.js"></script>
<script src="./assets/js/jquery.form.js"></script>
<script src="./assets/js/jquery.validate.min.js"></script>
<script src="./assets/js/mail-script.js"></script>
<script src="./assets/js/jquery.ajaxchimp.min.js"></script>

<!--  Plugins, main-Jquery -->
<script src="./assets/js/plugins.js"></script>
<script src="./assets/js/main.js"></script>
</body>
</html>