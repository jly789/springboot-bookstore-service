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
    <form action="/noticeUpdate" method="post">
    <c:forEach var="noticeDetail" items="${noticeDetail}">
    <div style="text-align: center">
        <div class="comment-form">
            <h3>공지 수정</h3>



            <c:if test="${memberId==0}">
            <select name="noticeType" id="noticeType" class="form-control" style="text-align: center; width: 6%; margin-left: 900px;"   >
                <option value="중요">중요</option>
                <option value="공지">공지</option>

            </select>

            </c:if>





            <br/><br/><br/>

            <div class="row">
                <div class="col-12">
                    <div class="form-group">

                        <div class="col-sm-6">
                            <div class="form-group">

                                <input type="hidden" name="memberId" value="0"/>
                                <input type="hidden" name="noticeId" value="${noticeDetail.noticeId}"/>

                                <input class="form-control" name="noticeSubject" id="noticeSubject"  type="text" placeholder="제목"
                                        value="${noticeDetail.noticeSubject}"
                                       style="width : 500px; height : 40px; margin-left: 539px;" >

                            </div>
                        </div>




                        <textarea  name="noticeContent"  id="noticeContent" cols="100" rows="15" style="text-align: center;"
                                   placeholder=" 내용: ">${noticeDetail.noticeContent}</textarea>
                    </div>
                </div>

                <div style="text-align: center">



                </div>



                <c:if test="${memberId==0}">
                    <div class="form-group">


                            <button type="submit" id="update" class="button button-contactForm btn_1 boxed-btn">공지수정</button>


                        <button type="button" class="button button-contactForm btn_1 boxed-btn" id="historyNotice">뒤로가기</button>



                    </div>
                </c:if>


                <c:if test="${memberId!=0}">
                    <div class="form-group">
                        <button type="submit" class="button button-contactForm btn_1 boxed-btn" onclick="history_back();">뒤로가기</button>

                    </div>
                </c:if>

            </div>


            </c:forEach>
    </form>

            <%--                        </form>--%>
        </div>
    </div>


</div>
<!-- Blog Area End -->
</main>
<%--<jsp:include page="../main/footer.jsp"></jsp:include>--%>

<!-- Scroll Up -->
<div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<script>

    function history_back() {
        history.back();
    }

    $('#historyNotice').click(function (){
        window.location.href = "/notice";
        return true;
    });


    $('#update').click(function (){




            if($('#noticeSubject').val() ==''){
                alert("제목을 입력해주세요!");
                return false;
            }

            if($('#noticeContent').val() ==''){
                alert("내용을 입력해주세요!");
                return false;
            }

            if($('#noticeType').val() ==''){
                alert("공지유형을 입력해주세요!");
                return false;
            }


        if (!confirm("공지사항을 수정 하시겠습니까?")) {

            return false;
        } else {
            alert("수정완료");
            return true;
        }




    });

    $('#delete').click(function (){



        if (!confirm("공지사항을 삭제 하시겠습니까?")) {

            return false;
        } else {
            alert("삭제완료");
            return true;
        }




    });


</script>


<!-- JS here -->
<!-- Jquery, Popper, Bootstrap -->
<%--<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>--%>
<%--<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>--%>
<%--<script src="./assets/js/popper.min.js"></script>--%>
<%--<script src="./assets/js/bootstrap.min.js"></script>--%>

<%--<!-- Slick-slider , Owl-Carousel ,slick-nav -->--%>
<%--<script src="./assets/js/owl.carousel.min.js"></script>--%>
<%--<script src="./assets/js/slick.min.js"></script>--%>
<%--<script src="./assets/js/jquery.slicknav.min.js"></script>--%>

<%--<!--wow , counter , waypoint, Nice-select -->--%>
<%--<script src="./assets/js/wow.min.js"></script>--%>
<%--<script src="./assets/js/jquery.magnific-popup.js"></script>--%>
<%--<script src="./assets/js/jquery.nice-select.min.js"></script>--%>
<%--<script src="./assets/js/jquery.counterup.min.js"></script>--%>
<%--<script src="./assets/js/waypoints.min.js"></script>--%>
<%--<script src="./assets/js/price_rangs.js"></script>--%>

<!-- contact js -->
<%--<script src="./assets/js/contact.js"></script>--%>
<%--<script src="./assets/js/jquery.form.js"></script>--%>
<%--<script src="./assets/js/jquery.validate.min.js"></script>--%>
<%--<script src="./assets/js/mail-script.js"></script>--%>
<%--<script src="./assets/js/jquery.ajaxchimp.min.js"></script>--%>

<%--<!--  Plugins, main-Jquery -->--%>
<%--<script src="./assets/js/plugins.js"></script>--%>
<%--<script src="./assets/js/main.js"></script>--%>
</body>
</html>