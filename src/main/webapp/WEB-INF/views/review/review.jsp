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

<section class="our-client section-padding best-selling">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-xl-5 col-lg-5 col-md-12">
                <!-- Section Tittle -->
                <div class="section-tittle  mb-40">
                    <h2>리뷰 모음</h2>
                </div>
            </div>
            <div class="col-xl-7 col-lg-7 col-md-12">
                <div class="nav-button mb-40">
                    <!--Nav Button  -->
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <a class="nav-link active" id="nav-one-tab" data-bs-toggle="tab" href="#nav-one" role="tab" aria-controls="nav-one" aria-selected="true">All</a>
                            <a class="nav-link" id="nav-two-tab" data-bs-toggle="tab" href="#nav-two" role="tab" aria-controls="nav-two" aria-selected="false">Horror</a>
                            <a class="nav-link" id="nav-three-tab" data-bs-toggle="tab" href="#nav-three" role="tab" aria-controls="nav-three" aria-selected="false">Thriller</a>
                            <a class="nav-link" id="nav-four-tab" data-bs-toggle="tab" href="#nav-four" role="tab" aria-controls="nav-four" aria-selected="false">Science Fiction</a>
                            <a class="nav-link" id="nav-five-tab" data-bs-toggle="tab" href="#nav-five" role="tab" aria-controls="nav-five" aria-selected="false">History</a>
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

                    <c:forEach var="reviewAllList" items="${reviewAllList}">
                    <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                        <div class="properties pb-30">
                            <div class="properties-card">
                                <div class="properties-img">
                                    <a href="/reviewDetail?reviewId=${reviewAllList.reviewId}&userId=${reviewAllList.userId}"><img src="reviewImg/${reviewAllList.reviewFileName}" alt=""
                                    style="   height: 300px; object-fit: cover;"></a>
                                </div>
                                <div class="properties-caption properties-caption2">
                                    <h3><a href="/reviewDetail?reviewId=${reviewAllList.reviewId}&userId=${reviewAllList.userId}">${reviewAllList.reviewSubject}  </a></h3>


                                    <p>${reviewAllList.reviewContent} </p>
                                    <h6 style="color: red; text-align: right;">  (${reviewAllList.userId})</h6>
                                    <div class="properties-footer d-flex justify-content-between align-items-center">
                                        <div class="review">
                                            <div class="rating">
                                                <c:if test="${reviewAllList.grade==1}">
                                                <i class="fas fa-star"></i>
                                                </c:if>

                                                <c:if test="${reviewAllList.grade==2}">

                                                    <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                </c:if>

                                                <c:if test="${reviewAllList.grade==3}">

                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                </c:if>

                                                <c:if test="${reviewAllList.grade==4}">

                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                </c:if>

                                                <c:if test="${reviewAllList.grade==5}">

                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                </c:if>



                                            </div>
                                            <p>(<span>120</span> Review)</p>
                                        </div>
                                        <div class="price">
                                            <span>$50</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    </c:forEach>












                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="more-btn text-center mt-15">
                    <a href="#" class="border-btn border-btn2 more-btn2">Browse More</a>
                </div>
            </div>
        </div>
    </div>
</section>


                                <jsp:include page="../main/footer.jsp"></jsp:include>

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