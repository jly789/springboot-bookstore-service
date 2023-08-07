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

       <c:forEach var="reviewDetail" items="${reviewDetail}">
                    <div style="text-align: center">
                    <div class="comment-form">
                        <c:if test="${loginId!=null}">
                        <h4>My Review</h4>
                        </c:if>

                        <c:if test="${loginId==null}">
                            <h4>Review</h4>
                        </c:if>
<%--                        <form class="form-contact comment_form" action="/review" method="post" id="commentForm">--%>
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">

                                        <div class="col-sm-6" style="text-align: center;" >
                                            <div class="form-group">
                                                <input type="hidden" name="reviewId" value="${reviewDetail.reviewId}"/>
                                                <input type="hidden" name="memberId" value="${reviewDetail.memberId}"/>
                                                <input type="hidden" name="bookId" value="${reviewDetail.bookId}"/>
                                                <input type="hidden" name="orderId" value="${reviewDetail.orderId}"/>


                                                <div style="text-align: center">




                                                    <div class="col-sm-6" style="text-align: center; margin-left: 620px;" >
                                                        <fieldset style="margin-left: 70px;">
                                                            <span class="text-bold"></span>

                                                            <c:if test="${reviewDetail.grade==1}">
                                                                <h6 > <strong>(기존 평점)</strong></h6>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${reviewDetail.grade==2}">

                                                                <h6 > <strong>(기존 평점)</strong></h6>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${reviewDetail.grade==3}">

                                                                <h6 > <strong>(기존 평점)</strong></h6>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${reviewDetail.grade==4}">

                                                                <h6 > <strong>(기존 평점)</strong></h6>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${reviewDetail.grade==5}">

                                                                <h6 > <strong>(기존 평점)</strong></h6>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                            </c:if>
                                                        </fieldset>
                                                    구매도서   <a href="/${reviewDetail.bookId}"><img src="files/${reviewDetail.fileName}" alt=""
                                                                                                    style="    height: 100px; object-fit: cover;"></a>


                                                    </div>



                                                </div>
                                             <input class="form-control" name="reviewSubject"  type="text" placeholder="제목"
                                                       value="작성자: ${reviewWriter}"
                                                       style="width : 500px; height : 40px; margin-left: 539px;" >

                                                <input class="form-control" name="reviewSubject"  type="text" placeholder="제목"
                                                       value="구매도서: ${reviewDetail.bookName}"
                                                       style="width : 500px; height : 40px; margin-left: 539px;" >


                                                <input class="form-control" name="reviewSubject"  type="text" placeholder="제목"
                                                       value="제목:${reviewDetail.reviewSubject}"
                                                style="width : 500px; height : 40px; margin-left: 539px;" >


                                        </div>
                                        </div>
                                        <div class="col-sm-6" style="text-align: right;">
                                            <div class="form-group">
<%--                                                <input  name="name" type="button" placeholder="평점"  value="평점"--%>
<%--                                                style="margin-left: 450px;"/>--%>


    리뷰사진   <a href="/${reviewDetail.bookId}"><img src="reviewImg/${reviewDetail.reviewFileName}" alt=""
                                                    style="    height: 180px; object-fit: cover;"></a>


                                            </div>
                                        </div>



                                        <textarea  name="reviewContent" id="comment" cols="100" rows="15"
               placeholder=" 내용: " >${reviewDetail.reviewContent}</textarea>

                                    </div>
                                </div>




                            <c:if test="${loginId!=null}">
                            <div class="form-group">
                                <a href="/reviewUpdate?reviewId=${reviewDetail.reviewId}&userId=${loginId}">   <button type="submit" class="button button-contactForm btn_1 boxed-btn">리뷰수정</button></a>
                                <a href="/reviewDelete?reviewId=${reviewDetail.reviewId}">   <button type="submit" class="button button-contactForm btn_1 boxed-btn">리뷰삭제</button></a>
                                <a href="/review">   <button type="submit" class="button button-contactForm btn_1 boxed-btn">뒤로가기</button></a>

                            </div>
                            </c:if>



                                <c:if test="${loginId==null}">
                                <div class="form-group">

                                    <a href="/review">   <button type="submit" class="button button-contactForm btn_1 boxed-btn">뒤로가기</button></a>
                                </div>
                            </div>
                        </c:if>




<%--                        </form>--%>
                    </div>
                </div>

</div>
</c:forEach>
    <!-- Blog Area End -->
</main>
<jsp:include page="../main/footer.jsp"></jsp:include>

<!-- Scroll Up -->
<div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>
<script>
$('#delete').click(function (){



    if (!confirm("리뷰를 삭제 하시겠습니까?")) {

        return false;
    } else {
        alert("삭제완료");
        return true;
    }




});
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