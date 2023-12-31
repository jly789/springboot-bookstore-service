<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="cp" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
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
<style>
.navbar {
display: flex;
justify-content: space-between;
align-items: center;

padding: 8px 12px;
}
</style>
<body>

<header>
    <div class="header-area">
        <div class="main-header ">
            <div class="header-top ">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="d-flex justify-content-between align-items-center flex-sm">
                                <div class="header-info-left d-flex align-items-center">
                                    <!-- logo -->
                                    <div class="logo">
                                        <a href="/"><img src="img/로고최종.jpg" alt="" ></a>
                                    </div>
                                    <!-- Search Box -->
                                    <form action="/searchBook" method="get" class="form-box">
                                        <input type="text" name="searchBookName" placeholder="검색 하세요">
                                        <div class="search-icon">
                                            <i class="ti-search"></i>
                                        </div>
                                    </form>
                                </div>
                                <div class="header-info-right d-flex align-items-center">
                                    <ul>
                                            <c:if test="${userId =='admin'}" >
                                        <li><a href="/bookAdd">BookAdd</a></li>
                                            </c:if>
                                        <li><a href="/notice">Notice</a></li>
                                        <c:if test="${userId !=null}" >

                                        <c:if test="${userId !='admin'}" >
                                            <li><a href="/myPage">My Page</a></li>
                                                <li><a href="/myOrder">Order</a></li>
                                        </c:if>

                                            <c:if test="${userId =='admin'}" >
                                                <li><a href="/myPage">My Page</a></li>

                                            </c:if>



                                        </c:if>
                                        <c:if test="${userId !=null && userId!='admin'}" >
                                        <li class="">
                                            <a href="/cart"><img src="assets/img/icon/cart.svg" alt="">
                                                <strong> 장바구니</strong> </a>
                                        </li>
                                        </c:if>


                                        <c:if test="${userId ==null}">
                                        <li><a href="/login">Login</a></li>
                                        </c:if>



                                        <c:if test="${userId !=null}">
                                            <li><a href="/logout">Logout</a></li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="header-bottom  header-sticky">
                <div class="container">
                    <if class="row align-items-center">
                        <div class="col-xl-12">
                            <!-- logo 2 -->
                            <div class="logo2">
                                <a href="index.html"><img src="assets/img/logo/logo.png" alt=""></a>
                            </div>
                            <!-- Main-menu -->
                            <div class="main-menu text-center d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                        <c:if test="${userId ==null}">
                                        <li><a href="/">Home</a></li>
                                        <li><a href="/bookMain">Book</a></li>
                                        <li><a href="#">Notice</a>
                                            <ul class="submenu">
                                                <li><a href="/notice">Notice</a></li>
                                                <li><a href="/noticeReview">Review</a></li>

                                            </ul>
                                        </li>


                                        </c:if>

                                        <c:if test="${userId !=null}">
                                            <li><a href="/">Home</a></li>
                                            <li><a href="/bookMain">Book</a></li>
                                            <li><a href="#">Notice</a>
                                                <ul class="submenu">
                                                    <li><a href="/notice">Notice</a></li>
                                                    <li><a href="/noticeReview">Review</a></li>

                                                </ul>
                                            </li>


                                        </c:if>
                                    </ul>
                                </nav>
                            </div>

                        </div>

                        <!-- Mobile Menu -->
                        <div class="col-xl-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>




                    </div>

                </div>
            </div>
        </div>

    </div>

</header>







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