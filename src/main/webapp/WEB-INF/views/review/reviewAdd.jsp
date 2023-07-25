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
    <style>

        #myform fieldset{
            display: inline-block;
            direction: rtl;
            border:0;
        }
        #myform fieldset legend{
            text-align: right;
        }
        #myform input[type=radio]{
            display: none;
        }
        #myform label{
            font-size: 3em;
            color: transparent;
            text-shadow: 0 0 0 #f0f0f0;
        }
        #myform label:hover{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
        #myform label:hover ~ label{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
        #myform input[type=radio]:checked ~ label{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
        #reviewContents {
            width: 100%;
            height: 150px;
            padding: 10px;
            box-sizing: border-box;
            border: solid 1.5px #D3D3D3;
            border-radius: 5px;
            font-size: 16px;
            resize: none;
        }
    </style>
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>

<div>
    <!-- Hero area Start-->
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="slider-area">
                    <div class="slider-height2 slider-bg5 d-flex align-items-center justify-content-center">
                        <div class="hero-caption hero-caption2">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--  Hero area End -->
    <!-- Blog Area Start -->
    <form class="mb-3" name="myform" action="/review" id="myform" method="post" novalidate="novalidate"
          enctype="multipart/form-data">
                    <div style="text-align: center">
                    <div class="comment-form">
                        <h4>Review</h4>
<%--                        <form class="form-contact comment_form" action="/review" method="post" id="commentForm">--%>
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">

                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <input type="hidden" name="memberId" value="${memberId}"/>
                                                <input type="hidden" name="bookId" value="${bookId}"/>

                                                <input class="form-control" name="reviewSubject"  type="text" placeholder="제목"
                                                style="width : 500px; height : 40px; margin-left: 539px;" >

                                        </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <input  name="name" type="button" placeholder="평점"  value="평점"
                                                style="margin-left: 450px;"/>



                                            <fieldset>
                                                <span class="text-bold"></span>
                                                <input type="radio" name="grade" value="5" id="rate1"><label
                                                    for="rate1">★</label>
                                                <input type="radio" name="grade" value="4" id="rate2"><label
                                                    for="rate2">★</label>
                                                <input type="radio" name="grade" value="3" id="rate3"><label
                                                    for="rate3">★</label>
                                                <input type="radio" name="grade" value="2" id="rate4"><label
                                                    for="rate4">★</label>
                                                <input type="radio" name="grade" value="1" id="rate5"><label
                                                    for="rate5">★</label>
                                            </fieldset>

                                            </div>
                                        </div>



                                        <textarea  name="reviewContent" id="comment" cols="100" rows="15"
               placeholder=" 내용: "></textarea>
                                    </div>
                                </div>

                                <div style="text-align: center">

                                    <input type="file" class="form-control" name="file"
                                           style="width : 250px; height : 30px; margin-left: 550px;"/>

<%--                                <input type="file" class="form-control" name="file2"--%>
<%--                                       style="width : 250px; height : 30px; margin-left: 550px;"/>--%>

<%--                                <input type="file" class="form-control" name="reviewFileName"--%>
<%--                                       style="width : 250px; height : 30px; margin-left: 550px;"/>--%>

<%--                                <input type="file" class="form-control" name="reviewFileName"--%>
<%--                                       style="width : 250px; height : 30px; margin-left: 550px;"/>--%>

<%--                                    <input type="file" class="form-control" name="reviewFileName"--%>
<%--                                           style="width : 250px; height : 30px; margin-left: 550px;"/>--%>


                                </div>



                            <div class="form-group">
                                <button type="submit" class="button button-contactForm btn_1 boxed-btn">작성하기</button>
                            </div>
                            </div>
<%--                        </form>--%>
                    </div>
                </div>
    </form>
</div>
    <!-- Blog Area End -->
</main>
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