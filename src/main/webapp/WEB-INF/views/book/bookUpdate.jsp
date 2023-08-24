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
                    <div class="slider-height2 slider-bg5 d-flex align-items-center justify-content-center " style="height: 450px;">
                        <div class="hero-caption hero-caption2">

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

            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-8">
                        <h3 style="margin-left: 30px;">책 수정</h3>
                        <form class="row contact_form" action="/bookUpdate" method="post" novalidate="novalidate"
                        enctype="multipart/form-data">
                            <c:forEach var="bookList" items="${bookList}">
                           <div class="col-md-12 form-group p_star">
                                <input type="hidden" class="form-control"  placeholder="" id="bookId" name="bookId" value="${bookList.bookId}" />

                            </div>



                            <div class="col-md-12 form-group p_star">
                                <p style="color: red; margin-left: -25px;">제목</p><input type="text" value="${bookList.bookName}" class="form-control" id="bookName" name="bookName" />

                            </div>


                            <div class="col-md-12 form-group">
                                <p style="color: red; margin-left: -25px;">내용</p>
                                <textarea class="form-control" value="${bookList.bookContent}" name="bookContent" id="bookContent" rows="1">${bookList.bookContent}
                                </textarea>
                            </div>

                            <div class="col-md-12 form-group p_star">
                                <p style="color: red; margin-left: -25px;">저자</p>
                                <input type="text" value="${bookList.author}" class="form-control" id="author" name="author" />

                            </div>

                            <div class="col-md-12 form-group p_star">
                                <p style="color: red;  margin-left: -25px;">출판사</p>
                                <input type="text" value="${bookList.publisher}" class="form-control" id="publisher" name="publisher" />
                            </div>

                            <div class="col-md-12 form-group p_star">
                                <p style="color: red;  margin-left: -25px;">장르</p>
                                <input type="text" class="form-control"value="${bookList.genre}" id="genre" name="genre" />
                            </div>


                            <div class="col-md-12 form-group p_star">
                                <p style="color: red;  margin-left: -25px;">가격</p>
                                <input type="text" class="form-control" value="${bookList.price}" id="price" name="price"  />
                            </div>

                            <div class="col-md-12 form-group p_star">
                                <p style="color: red;  margin-left: -25px;">판매수량</p>
                                <input type="text" class="form-control" value="${bookList.salesQuantity}" id="salesQuantity" name="salesQuantity" />
                            </div>

                            <div class="col-md-12 form-group p_star">
                                <p style="color: red; margin-left: -25px;">출판년도</p>
                                <input type="date" class="form-control" placeholder="" id="publicationYear" name="publicationYear" />
                            </div>
                            </div>

                            <div class="col-md-12 form-group p_star">
                                <input type="file" class="form-control" id="file" name="file" value="" style="width:712px;"/>
                                <button type="submit" class="form-control" style="width: 200px; background-color: white; color: black;" id="update"  >수정하기</button>

                            </div>


                            </c:forEach>
                        </form>
                    </div>
                </div>
            </div>
                </div>
            </div>
        </div>

    </section>
    <!--End Checkout Area -->

</main>
<footer>
    <div class="footer-wrappper section-bg">
     <div class="footer-area footer-padding">
         <div class="container">
             <div class="row justify-content-between">
                 <div class="col-xl-3 col-lg-5 col-md-4 col-sm-6">
                     <div class="single-footer-caption mb-50">
                         <div class="single-footer-caption mb-30">
                             <!-- logo -->
                             <div class="footer-logo mb-25">
                                 <a href="index.html"><img src="assets/img/logo/logo2_footer.png" alt=""></a>
                             </div>
                             <div class="footer-tittle">
                                 <div class="footer-pera">
                                     <p>Get the breathing space now, and we’ll extend your term at the other end year for go.</p>
                                 </div>
                             </div>
                             <!-- social -->
                             <div class="footer-social">
                                <a href="https://bit.ly/sai4ull"><i class="fab fa-facebook"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                <a href="#"><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-2 col-lg-3 col-md-4 col-sm-5">
                 <div class="single-footer-caption mb-50">
                     <div class="footer-tittle">
                         <h4>Book Category</h4>
                         <ul>  
                             <li><a href="#">History</a></li>
                             <li><a href="#">Horror - Thriller</a></li>
                             <li><a href="#">Love Stories</a></li>
                             <li><a href="#">Science Fiction</a></li>
                             <li><a href="#">Business</a></li>
                         </ul>
                     </div>
                 </div>
             </div>
             <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                 <div class="single-footer-caption mb-50">
                     <div class="footer-tittle">
                         <h4>&nbsp;</h4>
                         <ul>
                            <li><a href="#">Biography</a></li>
                            <li><a href="#">Astrology</a></li>
                            <li><a href="#">Digital Marketing</a></li>
                            <li><a href="#">Software Development</a></li>
                            <li><a href="#">Ecommerce</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6">
             <div class="single-footer-caption mb-50">
                 <div class="footer-tittle">
                     <h4>Site Map</h4>
                     <ul class="mb-20">
                         <li><a href="#">Home</a></li>
                         <li><a href="#">About Us</a></li>
                         <li><a href="#">FAQs</a></li>
                         <li><a href="#">Blog</a></li>
                         <li><a href="#">Contact</a></li>
                     </ul>
                 </div>
             </div>
         </div>
     </div>
 </div> 
</div>
        <jsp:include page="../main/footer.jsp"></jsp:include>
<!-- Scroll Up -->
<div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

        <script>



            if($('#update').click (function (){

                if($('#bookName').val()==''){
                    alert("책 제목을 입력하세요");
                    return   false;
                }
                if($('#bookContent').val()==''){
                    alert("책 내용을 입력하세요");
                    return   false;
                }

                if($('#author').val()==''){
                    alert("저자를 입력하세요");
                    return   false;
                }

                if($('#publisher').val()==''){
                    alert("출판사를 입력하세요");
                    return   false;
                }

                if($('#genre').val()==''){
                    alert("장르를 입력하세요");
                    return   false;
                }

                if($('#price').val()==''){
                    alert("가격 입력하세요");
                    return   false;
                }

                if($('#salesQuantity').val()==''){
                    alert("판매수량을 입력하세요");
                    return   false;
                }

                if($('#publicationYear').val()==''){
                    alert("출판년도를 입력하세요");
                    return   false;
                }



                return   true;

            }));




        </script>
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