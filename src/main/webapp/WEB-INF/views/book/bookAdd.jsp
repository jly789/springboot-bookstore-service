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
                    <div class="slider-height2 slider-bg5 d-flex align-items-center justify-content-center" style="height: 450px;>
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
                        <h3 style="margin-left: 30px;">책 등록</h3>
                        <form class="row contact_form" action="/bookAdd" method="post" novalidate="novalidate"
                        enctype="multipart/form-data">
                            <div class="col-md-12 form-group p_star">
                                <input type="hidden" class="form-control"  placeholder="" id="bookId" name="bookId" value="0" />

                            </div>



                            <div class="col-md-12 form-group p_star">
                                <p style="color: red; margin-left: -25px;">제목</p>
                                <input type="text" placeholder="책 제목" class="form-control" id="bookName" name="bookName" />

                            </div>


                            <div class="col-md-12 form-group">
                                <p style="color: red; margin-left: -25px;">내용</p>
                                <textarea class="form-control" placeholder="책 내용" name="bookContent" id="bookContent" rows="1" ></textarea>
                            </div>

                            <div class="col-md-12 form-group p_star">
                                <p style="color: red; margin-left: -25px;">저자</p>
                                <input type="text" placeholder="저자" class="form-control" id="author" name="author" />

                            </div>

                            <div class="col-md-12 form-group p_star">
                                <p style="color: red; margin-left: -25px;">출판사</p>
                                <input type="text" placeholder="출판사" class="form-control" id="publisher" name="publisher" />
                            </div>

                            <div class="col-md-12 form-group p_star">
                                <p style="color: red; margin-left: -25px;">장르</p>
                                <input type="text" class="form-control" placeholder="장르" id="genre" name="genre" />
                            </div>


                            <div class="col-md-12 form-group p_star">
                                <p style="color: red; margin-left: -25px;">가격</p>
                                <input type="text" class="form-control" placeholder="가격" id="price" name="price"  />
                            </div>

                            <div class="col-md-12 form-group p_star">
                                <p style="color: red; margin-left: -25px;">판매수량</p>
                                <input type="text" class="form-control"placeholder="판매수량" id="salesQuantity" name="salesQuantity" />
                            </div>

                            <div class="col-md-12 form-group p_star">
                                <p style="color: red; margin-left: -25px;">출판년도</p>
                                <input type="date" class="form-control" placeholder="출판연도" id="publicationYear" name="publicationYear" />
                            </div>

                            <div class="col-md-12 form-group p_star">
                                <input type="file" class="form-control" id="file" name="file" /><br/>
                                <button type="submit" id="insert" class="btn" style="color: red">등록하기</button>
                            </div>


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

        <jsp:include page="../main/footer.jsp"></jsp:include>
<!-- Scroll Up -->
<div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<script>

    if($('#insert').click (function (){

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

        if($('#file').val()==''){
            alert("책  사진을 넣으세요");
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