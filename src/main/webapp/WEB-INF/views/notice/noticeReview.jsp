<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

<!-- services-area End-->
<!--Books review Start -->
<section class="our-client section-padding best-selling">
    <div class="container">
        <div class="row">
            <div class="offset-xl-1 col-xl-10">
                <div class="nav-button f-left">

                    <!--Nav Button  -->
                    <c:if test="${userId=='admin'}">
                        <nav>
                            <div class="nav nav-tabs " id="nav-tab" role="tablist">

                                <a class="nav-link " id="nav-one-tab" data-bs-toggle="tab" href="#nav-one"
                                   role="tab" aria-controls="nav-one" aria-selected="true">공지사항</a>

                                <a class="nav-link active" id="nav-three-tab" data-bs-toggle="tab" href="#nav-three" role="tab" aria-controls="nav-three" aria-selected="false">리뷰</a>

                                <a class="nav-link" href="/noticeAdd">공지등록</a>

                            </div>
                        </nav>
                    </c:if>

                    <c:if test="${userId !='admin'}">
                        <nav>
                            <div class="nav nav-tabs " id="nav-tab" role="tablist">

                                <a class="nav-link " id="nav-one-tab" data-bs-toggle="tab" href="#nav-one"
                                   role="tab" aria-controls="nav-one" aria-selected="true">공지사항</a>

                                <a class="nav-link active" id="nav-three-tab" data-bs-toggle="tab" href="#nav-three" role="tab" aria-controls="nav-three" aria-selected="false">리뷰</a>



                            </div>
                        </nav>
                    </c:if>



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

                    <c:if test="${reviewAllList !=null}">
                    <div class="best-selling p-0">
                        <div class="row">

                            <c:choose>


                                <c:when test="${fn:length(reviewAllList) > 0}">

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
                                                        <p  style="color: red;  font-weight: 900;"  >(${reviewAllList.bookName}) </p>


                                                        <c:if test="${reviewAllList.userId==checkId}">
                                                            <h6 style="color: red; text-align: right;">  My Review</h6>
                                                        </c:if>

                                                        <c:if test="${checkId=='admin'}">
                                                            <a style="color: red;" href="/reviewDetail?reviewId=${reviewAllList.reviewId}&userId=${reviewAllList.userId}">리뷰수정</a>
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
                                                                    <%--                                                                                <p>(<span>${reviewAllList.reviewIdCount}</span> Review)</p>--%>
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
                                </c:when>


                                <c:otherwise>

                                </c:otherwise>


                            </c:choose>

                            <!--paginate -->
                            <div class="paginate">
                                <div class="paging">
                                    <a class="direction prev" href="javascript:void(0);" style="color: black;"
                                       onclick="movePage(1,${pagination.cntPerPage},${pagination.pageSize});">
                                        &lt;&lt; </a> <a class="direction prev" href="javascript:void(0);"
                                                         style="color: black;"
                                                         onclick="movePage(${pagination.currentPage}<c:if
                                                                 test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                                    &lt; </a>

                                    <c:forEach begin="${pagination.firstPage}"
                                               end="${pagination.lastPage}" var="idx">
                                        <a
                                                style="color: black;
                                                    <c:out value="${pagination.currentPage == idx ? 'black; font-weight:700; margin-bottom: 2px;' : ''}"/> "
                                                href="javascript:void(0);"
                                                onclick="movePage(${idx},${pagination.cntPerPage},${pagination.pageSize});"><c:out
                                                value="${idx}"/></a>
                                    </c:forEach>
                                    <a class="direction next" href="javascript:void(0);" style="color: black;"
                                       onclick="movePage(${pagination.currentPage}<c:if
                                               test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                                        &gt; </a> <a class="direction next" href="javascript:void(0);"
                                                     style="color: black;"
                                                     onclick="movePage(${pagination.totalRecordCount},${pagination.cntPerPage},${pagination.pageSize});">
                                    &gt;&gt; </a>
                                </div>
                            </div>
                            <!-- /paginate -->

                            </c:if>















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


<script>



    $("#nav-one-tab").click(function (){
        location.href = '/notice';
        return;
    });

    $("#nav-three-tab").click(function (){
        location.href = '/noticeReview';
        return;
    });

    //페이지 이동
    function movePage(currentPage, cntPerPage, pageSize) {

        var url = "${pageContext.request.contextPath}/review";
        url = url + "?currentPage=" + currentPage;
        url = url + "&cntPerPage=" + cntPerPage;
        url = url + "&pageSize=" + pageSize;

        location.href = url;
    }
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