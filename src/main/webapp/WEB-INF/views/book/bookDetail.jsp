<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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


<style>
    a:link {
        color: red;
        text-decoration: none;
    }

    a:visited {
        color: black;
        text-decoration: none;
    }

    /* paginate */
    .paginate {
        padding: 0;
        line-height: normal;
        text-align: center;
        position: relative;
        margin: 20px 0 20px 0;
        z-index: 1;
    }

    .paginate .paging {
        text-align: center;
    }

    .paginate .paging a, .paginate .paging strong {
        margin: 0;
        padding: 0;
        width: 20px;
        height: 24px;
        line-height: 24px;
        text-align: center;
        color: #848484;
        display: inline-block;
        vertical-align: middle;
        text-align: center;
        font-size: 12px;
    }

    .paginate .paging a:hover, .paginate .paging strong {
        color: #DAA520;
        font-weight: 600;
        font-weight: normal;
    }

    .paginate .paging .direction {
        z-index: 3;
        vertical-align: middle;
        background-color: none;
        margin: 0 2px;
        border: 1px solid #777;
        border-radius: 2px;
        width: 28px;
    }

    .paginate .paging .direction:hover {
        border: 1px solid #C40639;
    }

    .paginate .paging .direction.prev {
        margin-right: 4px;
    }

    .paginate .paging .direction.next {
        margin-left: 4px;
        cursor: pointer;
    }

    .paginate .paging img {
        vertical-align: middle;
    }

    .paginate .right {
        position: absolute;
        top: 0;
        right: 0;
    }

    .bottom-left, .bottom-right {
        position: relative;
        z-index: 5;
    }

    .paginate ~ .bottom {
        margin-top: -50px;
    }


    .bottom select {
        background: transparent;
        color: #aaa;
        cursor: pointer;
    }


    /* paginate */
    .paginate {
        padding: 0;
        line-height: normal;
        text-align: center;
        position: relative;
        margin: 20px 0 20px 0;
    }

    .paginate .paging {
        text-align: center;
    }

    .paginate .paging a, .paginate .paging strong {
        margin: 0;
        padding: 0;
        width: 20px;
        height: 28px;
        line-height: 28px;
        text-align: center;
        color: #999;
        display: inline-block;
        vertical-align: middle;
        text-align: center;
        font-size: 14px;
    }

    .paginate .paging a:hover, .paginate .paging strong {
        color: #C40639;
        font-weight: 600;
        font-weight: normal;
    }

    .paginate .paging .direction {
        z-index: 3;
        vertical-align: middle;
        background-color: none;
        margin: 0 2px;
    }

    .paginate .paging .direction:hover {
        background-color: transparent;
    }

    .paginate .paging .direction.prev {
        margin-right: 4px;
    }

    .paginate .paging .direction.next {
        margin-left: 4px;
    }

    .paginate .paging img {
        vertical-align: middle;
    }

    .paginate .right {
        position: absolute;
        top: 0;
        right: 0;
    }
</style>
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


                                    <div class="single-services d-flex align-items-center mb-0"
                                         style="background-color: #FEF4F4;">
                                        <div class="features-img">
                                            <img src="files/${bookList.fileName}" alt="" style="height: 500px; object-fit: cover;" >
                                        </div>
                                        <div class="features-caption">
                                            <h3 style="color: black;">${bookList.bookName}</h3>
                                            <p style="color: black; text-align: left;">(${bookList.author})</p>
                                            <input type="hidden" id="bookId" name="bookId" value="${bookList.bookId}">
                                            <input type="hidden" name="amount" value="${bookList.price}">
                                            <div class="price">
                                                <h4 style="color: red;">${bookList.price}원</h4>
                                            </div>
                                            <div class="review">
                                                <c:if test="${bookList.grade==0}">


                                                </c:if>

                                                <c:if test="${bookList.grade==1}">

                                                    <i class="fas fa-star" style="color: gold;"></i>

                                                </c:if>

                                                <c:if test="${bookList.grade==2}">

                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>

                                                </c:if>

                                                <c:if test="${bookList.grade==3}">

                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>

                                                </c:if>

                                                <c:if test="${bookList.grade==4}">

                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>

                                                </c:if>


                                                    <%--                                                        <c:forEach var="reviewGrade" items="${reviewGrade}"></c:forEach>--%>
                                                <c:if test="${bookList.grade==5}">
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                </c:if>

                                                <p style="color: black;">(${bookList.reviewId} Review)</p>
                                            </div>

                                            <button type="submit" class="white-btn mr-10">장바구니</button>


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
                        <c:if test="${userId!=null}">
                            <nav>
                                <div class="nav nav-tabs " id="nav-tab" role="tablist">

                                    <a class="nav-link active" id="nav-one-tab" data-bs-toggle="tab" href="#nav-one"
                                       role="tab" aria-controls="nav-one" aria-selected="true">책소개</a>

                                    <a class="nav-link" id="nav-two-tab" data-bs-toggle="tab" href="#nav-two"
                                       role="tab" aria-controls="nav-two" aria-selected="false">댓글작성</a>

                                    <a class="nav-link" id="nav-three-tab" data-bs-toggle="tab" href="#nav-three" role="tab" aria-controls="nav-three" aria-selected="false">리뷰</a>

                                </div>
                            </nav>
                        </c:if>
                        <c:if test="${userId==null}">
                            <nav>
                                <div class="nav nav-tabs " id="nav-tab" role="tablist">

                                    <a class="nav-link active" id="nav-one-tab" data-bs-toggle="tab" href="#nav-one"
                                       role="tab" aria-controls="nav-one" aria-selected="true">책소개</a>


                                    <a class="nav-link" id="nav-three-tab" data-bs-toggle="tab" href="#nav-three" role="tab" aria-controls="nav-three" aria-selected="false">리뷰</a>
                                </div>
                            </nav>




                        </c:if>
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

                            <br/>



                            <button type="submit" id="comment" class="white-btn mr-10">댓글on</button>

                            <div id="result"></div>
                            <br/>



                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="nav-two" role="tabpanel" aria-labelledby="nav-two-tab">
                        <!-- Tab 1 -->
                        <div class="row">
                            <div class="offset-xl-1 col-lg-9">


                                <c:if test="${userId!=null}">
                                <div class="comment-form">
                                    <h4>Comment
                                        <h4>

                                            <form class="form-contact comment_form" action="/commentAdd" method="get"
                                                  id="commentForm">
                                                <c:forEach var="bookList" items="${bookList}">
                                                <input type="hidden" name="bookId" value="${bookList.bookId}"/>

                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="form-group">

                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <input class="form-control" name="commentContent"
                                                                           type="text" value="" placeholder="Comment">
                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <button type="submit"
                                                                        class="button button-contactForm btn_1 boxed-btn">
                                                                    작성하기
                                                                </button>
                                                            </div>
                                                            </c:forEach>
                                            </form>
                                </div>
                            </div>



                        </div>

                        </div>

</div>

                    </div>
                </div>

        </c:if>


        <div class="tab-pane fade" id="nav-three" role="tabpanel" aria-labelledby="nav-three-tab">
            <!-- Tab 1 -->
            <div class="row">

                <c:if test="${reviewAllList !=null}">
                <div class="best-selling p-0">
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
                                                    <c:if test="${reviewAllList.userId==checkId}">
                                                    <h6 style="color: red; text-align: right;">My Review</h6>
                                                    </c:if>

                                                    <c:if test="${reviewAllList.userId!=checkId}">
                                                        <h6 style="color: black; text-align: right;">  (${reviewAllList.userId})</h6>
                                                    </c:if>
                                                    <div class="properties-footer d-flex justify-content-between align-items-center">
                                                        <div class="review">
                                                            <div class="rating">
                                                                <c:if test="${reviewAllList.grade==1}">
                                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                                </c:if>

                                                                <c:if test="${reviewAllList.grade==2}">

                                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                                </c:if>

                                                                <c:if test="${reviewAllList.grade==3}">

                                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                                </c:if>

                                                                <c:if test="${reviewAllList.grade==4}">
                                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                                </c:if>

                                                                <c:if test="${reviewAllList.grade==5}">

                                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                                </c:if>



                                                            </div>
<%--                                                            <p>(<span>${reviewAllList.reviewIdCount}</span> Review)</p>--%>
                                                        </div>
                                                        <div class="price">
                                                            <span>${reviewAllList.price}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </c:forEach>


                        </c:if>



                    </div>
                </div>
            </div>


        </div>


    </section>


    <!-- Subscribe Area End -->
</main>


<jsp:include page="../main/footer.jsp"></jsp:include>


<script>

    function history_back() {
        history.back();
    }

        $('#comment').click(function () {


            if($("#comment").html()=='댓글off') {


                $("#result").hide();
                $("#comment").html('댓글on');
                return true;

            }


            if($("#comment").html()=='댓글on') {

                $("#result").show();
            // 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
            $.ajax({

                type: 'POST',
                url: '/commentCheck',
                data: {
                    "bookId": $('#bookId').val(),

                },
                dataType: 'JSON',

                success: function (commentFindDTOList) {

                    $('#result').empty();
                    for (let i = 0; i < commentFindDTOList.length; i++) {
                        let subCategoryDTO = commentFindDTOList[i]

                        let option = $('<p/>')
                        let br = +$('<br/>')
                        let img = $('<img style="  height: 100px; margin-right: 400px; " src="' + '/profileImg/'+subCategoryDTO.fileName+'" />')
                        let writer = $('<h6  style="color: black; font-weight: 900;"> ' + '작성자:' + subCategoryDTO.userId + '</h6>')
                        let content = $('<strong>' + '내용:' + subCategoryDTO.commentContent + '</strong>')
                        // let img = $('<img src="' + "/profileImg/"+'subCategoryDTO.fileName'+'"/>')
                        // let img = $('<img src="' + "/profileImg/안유진.jpg" + '"/>')

                        $("#result").append(option)
                        $("#result").append(br)
                        $("#result").append(img)

                        $("#result").append(writer)
                        $("#result").append(content)

                        $("#comment").html('댓글off');



                    }


                },
                error: function (a, b, c) {
                    alert('ㅇㅇㄴ');
                    console.log(a, b, c);
                }

            });
            return  true;
            }
        return true;
        });



</script>


<!-- Scroll Up -->
<div id="back-top">
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