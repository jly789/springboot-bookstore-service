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


    .slidecontainer {
        width: 300px;
        margin-top: 100px;
    }

    .slider {
        -webkit-appearance: none; /* 기본 CSS 스타일을 적용하지 않기 위해서 */
        width: 170px; /* 슬라이더 길이 */
        height: 8px; /* 슬라이더 두께 */
        border-radius: 1px; /* 슬라이더 모서리를 약간 둥글게 */
        background: #ccc; /* 슬라이더 색상 */
        outline: none; /* 슬라이더 테두리 없이 */
    }

    /* 슬라이더 핸들(클릭해서 드래그하는 부분) 커스텀
    (Chrome, Opera, Safari, Edge 브라우저를 위해서는 -webkit-을,
    Firefox 브라우저를 위해서는 -moz- 를 사용하세요 */
    .slider::-webkit-slider-thumb {
        -webkit-appearance: none; /* 기본 CSS 스타일을 적용하지 않기 위해서 */
        appearance: none; /* 기본 CSS 스타일을 적용하지 않기 위해서 */
        width: 25px; /* 슬라이더 핸들 길이 */
        height: 25px; /* 슬라이더 핸들 높이 */
        border-radius: 50%; /* 핸들 모양을 원모양으로 만들기 위함 */
        background: gray; /* 슬라이더 핸들 색상 */
        cursor: pointer; /* 슬라이더 핸들에 마우스를 갖다대면 포인터로 변경 */
    }

    .slider::-moz-range-thumb {
        width: 100px; /* 슬라이더 핸들 길이 */
        height: 25px; /* 슬라이더 핸들 높이 */
        border-radius: 50%; /* 핸들 모양을 원모양으로 만들기 위함 */
        background: #00f; /* 슬라이더 핸들 색상 */
        cursor: pointer; /* 슬라이더 핸들에 마우스를 갖다대면 포인터로 변경 */
    }
</style>

<body>

<jsp:include page="../main/header.jsp"></jsp:include>

<main>
    <!-- Hero area Start-->
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="slider-area">
                    <div class="slider-height2 slider-bg4 d-flex align-items-center justify-content-center" style="height: 450px;">
                        <div class="hero-caption hero-caption2">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--  Hero area End -->
    <!-- listing Area Start -->
    <div class="listing-area pt-50 pb-50" style="padding-bottom: 10%; padding-right: 5%;">
        <div class="container">
            <div class="row">
                <!--? Left content -->
                <div class="col-xl-4 col-lg-4 col-md-6" >
                    <!-- Job Category Listing start -->
                    <div class="category-listing mb-50" style="width: 300px; margin-left: 45px; ">
                        <!-- single one -->
                        <div class="single-listing">
                            <!-- select-Categories  -->
                            <div class="select-Categories pb-30">
                                <div class="small-tittle mb-20">
                                    <h4>장르별 검색</h4>
                                </div>

                                <!-- Select City items start -->
                                <div class="select-job-items2 mb-30" style="width: 120px;">
                                    <div class="col-xl-12">
                                        <c:if test="${genreName =='정렬'}">
                                            <select id="genre" name="genre">
                                                <option value="">장르검색</option>

                                                <option value="전체" selected>전체</option>
                                                <option value="소설">소설</option>
                                                <option value="수필"> 수필</option>
                                                <option value="코미디">코미디</option>
                                                <option value="연애">연애</option>
                                                <option value="공포">공포</option>
                                                <option value="인문학">인문학</option>
                                                <option value="어린이">어린이</option>
                                                <option value="자서전">자서전</option>
                                                <option value="잡지">잡지</option>
                                                <option value="과학">과학</option>
                                                <option value="수학">수학</option>
                                                <option value="역사">역사</option>
                                                <option value="에세이">에세이</option>


                                            </select>
                                        </c:if>
                                        <c:if test="${genreName =='전체'}">
                                            <select id="genre" name="genre">
                                                <option value="">장르검색</option>

                                                <option value="전체" selected>전체</option>
                                                <option value="소설">소설</option>
                                                <option value="수필"> 수필</option>
                                                <option value="코미디">코미디</option>
                                                <option value="연애">연애</option>
                                                <option value="공포">공포</option>
                                                <option value="인문학">인문학</option>
                                                <option value="어린이">어린이</option>
                                                <option value="자서전">자서전</option>
                                                <option value="잡지">잡지</option>
                                                <option value="과학">과학</option>
                                                <option value="수학">수학</option>
                                                <option value="역사">역사</option>
                                                <option value="에세이">에세이</option>

                                            </select>
                                        </c:if>

                                        <c:if test="${genreName=='소설'}">
                                            <select id="genre" name="genre">
                                                <option value="">장르검색</option>

                                                <option value="전체">전체</option>
                                                <option value="소설" selected>소설</option>
                                                <option value="수필"> 수필</option>
                                                <option value="코미디">코미디</option>
                                                <option value="연애">연애</option>
                                                <option value="공포">공포</option>
                                                <option value="인문학">인문학</option>
                                                <option value="어린이">어린이</option>
                                                <option value="자서전">자서전</option>
                                                <option value="잡지">잡지</option>
                                                <option value="과학">과학</option>
                                                <option value="수학">수학</option>
                                                <option value="역사">역사</option>
                                                <option value="에세이">에세이</option>

                                            </select>
                                        </c:if>

                                        <c:if test="${genreName=='수필'}">
                                            <select id="genre" name="genre">
                                                <option value="">장르검색</option>

                                                <option value="전체" selected>전체</option>
                                                <option value="소설">소설</option>
                                                <option value="수필"selected> 수필</option>
                                                <option value="코미디">코미디</option>
                                                <option value="연애">연애</option>
                                                <option value="공포">공포</option>
                                                <option value="인문학">인문학</option>
                                                <option value="어린이">어린이</option>
                                                <option value="자서전">자서전</option>
                                                <option value="잡지">잡지</option>
                                                <option value="과학">과학</option>
                                                <option value="수학">수학</option>
                                                <option value="역사">역사</option>
                                                <option value="에세이">에세이</option>

                                            </select>
                                        </c:if>

                                        <c:if test="${genreName=='코미디'}">
                                            <select id="genre" name="genre">
                                                <option value="">장르검색</option>

                                                <option value="전체" selected>전체</option>
                                                <option value="소설">소설</option>
                                                <option value="수필"> 수필</option>
                                                <option value="코미디"selected>코미디</option>
                                                <option value="연애">연애</option>
                                                <option value="공포">공포</option>
                                                <option value="인문학">인문학</option>
                                                <option value="어린이">어린이</option>
                                                <option value="자서전">자서전</option>
                                                <option value="잡지">잡지</option>
                                                <option value="과학">과학</option>
                                                <option value="수학">수학</option>
                                                <option value="역사">역사</option>
                                                <option value="에세이">에세이</option>

                                            </select>
                                        </c:if>

                                        <c:if test="${genreName=='연애'}">
                                            <select id="genre" name="genre">
                                                <option value="">장르검색</option>

                                                <option value="전체" selected>전체</option>
                                                <option value="소설">소설</option>
                                                <option value="수필"> 수필</option>
                                                <option value="코미디">코미디</option>
                                                <option value="연애"selected>연애</option>
                                                <option value="공포">공포</option>
                                                <option value="인문학">인문학</option>
                                                <option value="어린이">어린이</option>
                                                <option value="자서전">자서전</option>
                                                <option value="잡지">잡지</option>
                                                <option value="과학">과학</option>
                                                <option value="수학">수학</option>
                                                <option value="역사">역사</option>
                                                <option value="에세이">에세이</option>

                                            </select>
                                        </c:if>

                                        <c:if test="${genreName=='공포'}">
                                            <select id="genre" name="genre">
                                                <option value="">장르검색</option>

                                                <option value="전체" selected>전체</option>
                                                <option value="소설">소설</option>
                                                <option value="수필"> 수필</option>
                                                <option value="코미디">코미디</option>
                                                <option value="연애">연애</option>
                                                <option value="공포"selected>공포</option>
                                                <option value="인문학">인문학</option>
                                                <option value="어린이">어린이</option>
                                                <option value="자서전">자서전</option>
                                                <option value="잡지">잡지</option>
                                                <option value="과학">과학</option>
                                                <option value="수학">수학</option>
                                                <option value="역사">역사</option>
                                                <option value="에세이">에세이</option>
                                            </select>
                                        </c:if>

                                        <c:if test="${genreName=='인문학'}">
                                            <select id="genre" name="genre">
                                                <option value="">장르검색</option>

                                                <option value="전체" selected>전체</option>
                                                <option value="소설">소설</option>
                                                <option value="수필"> 수필</option>
                                                <option value="코미디">코미디</option>
                                                <option value="연애">연애</option>
                                                <option value="공포">공포</option>
                                                <option value="인문학"selected>인문학</option>
                                                <option value="어린이">어린이</option>
                                                <option value="자서전">자서전</option>
                                                <option value="잡지">잡지</option>
                                                <option value="과학">과학</option>
                                                <option value="수학">수학</option>
                                                <option value="역사">역사</option>
                                                <option value="에세이">에세이</option>

                                            </select>
                                        </c:if>

                                        <c:if test="${genreName=='어린이'}">
                                            <select id="genre" name="genre">
                                                <option value="">장르검색</option>

                                                <option value="전체" selected>전체</option>
                                                <option value="소설">소설</option>
                                                <option value="수필"> 수필</option>
                                                <option value="코미디">코미디</option>
                                                <option value="연애">연애</option>
                                                <option value="공포">공포</option>
                                                <option value="인문학">인문학</option>
                                                <option value="어린이"selected>어린이</option>
                                                <option value="자서전">자서전</option>
                                                <option value="잡지">잡지</option>
                                                <option value="과학">과학</option>
                                                <option value="수학">수학</option>
                                                <option value="역사">역사</option>
                                                <option value="에세이">에세이</option>

                                            </select>
                                        </c:if>

                                        <c:if test="${genreName=='자서전'}">
                                            <select id="genre" name="genre">
                                                <option value="">장르검색</option>

                                                <option value="전체" selected>전체</option>
                                                <option value="소설">소설</option>
                                                <option value="수필"> 수필</option>
                                                <option value="코미디">코미디</option>
                                                <option value="연애">연애</option>
                                                <option value="공포">공포</option>
                                                <option value="인문학">인문학</option>
                                                <option value="어린이">어린이</option>
                                                <option value="자서전"selected>자서전</option>
                                                <option value="잡지">잡지</option>
                                                <option value="과학">과학</option>
                                                <option value="수학">수학</option>
                                                <option value="역사">역사</option>
                                                <option value="에세이">에세이</option>

                                            </select>
                                        </c:if>

                                        <c:if test="${genreName=='잡지'}">
                                            <select id="genre" name="genre">
                                                <option value="">장르검색</option>

                                                <option value="전체" selected>전체</option>
                                                <option value="소설">소설</option>
                                                <option value="수필"> 수필</option>
                                                <option value="코미디">코미디</option>
                                                <option value="연애">연애</option>
                                                <option value="공포">공포</option>
                                                <option value="인문학">인문학</option>
                                                <option value="어린이">어린이</option>
                                                <option value="자서전">자서전</option>
                                                <option value="잡지"selected>잡지</option>
                                                <option value="과학">과학</option>
                                                <option value="수학">수학</option>
                                                <option value="역사">역사</option>
                                                <option value="에세이">에세이</option>

                                            </select>
                                        </c:if>

                                        <c:if test="${genreName=='과학'}">
                                            <select id="genre" name="genre">
                                                <option value="">장르검색</option>

                                                <option value="전체" selected>전체</option>
                                                <option value="소설">소설</option>
                                                <option value="수필"> 수필</option>
                                                <option value="코미디">코미디</option>
                                                <option value="연애">연애</option>
                                                <option value="공포">공포</option>
                                                <option value="인문학">인문학</option>
                                                <option value="어린이">어린이</option>
                                                <option value="자서전">자서전</option>
                                                <option value="잡지">잡지</option>
                                                <option value="과학"selected>과학</option>
                                                <option value="수학">수학</option>
                                                <option value="역사">역사</option>
                                                <option value="에세이">에세이</option>

                                            </select>
                                        </c:if>

                                        <c:if test="${genreName=='수학'}">
                                            <select id="genre" name="genre">
                                                <option value="">장르검색</option>

                                                <option value="전체" selected>전체</option>
                                                <option value="소설">소설</option>
                                                <option value="수필"> 수필</option>
                                                <option value="코미디">코미디</option>
                                                <option value="연애">연애</option>
                                                <option value="공포">공포</option>
                                                <option value="인문학">인문학</option>
                                                <option value="어린이">어린이</option>
                                                <option value="자서전">자서전</option>
                                                <option value="잡지">잡지</option>
                                                <option value="과학">과학</option>
                                                <option value="수학"selected>수학</option>
                                                <option value="역사">역사</option>
                                                <option value="에세이">에세이</option>

                                            </select>
                                        </c:if>

                                        <c:if test="${genreName=='역사'}">
                                            <select id="genre" name="genre">
                                                <option value="">장르검색</option>

                                                <option value="전체" selected>전체</option>
                                                <option value="소설">소설</option>
                                                <option value="수필"> 수필</option>
                                                <option value="코미디">코미디</option>
                                                <option value="연애">연애</option>
                                                <option value="공포">공포</option>
                                                <option value="인문학">인문학</option>
                                                <option value="어린이">어린이</option>
                                                <option value="자서전">자서전</option>
                                                <option value="잡지">잡지</option>
                                                <option value="과학">과학</option>
                                                <option value="수학">수학</option>
                                                <option value="역사"selected>역사</option>
                                                <option value="에세이">에세이</option>
                                            </select>
                                        </c:if>

                                        <c:if test="${genreName=='에세이'}">
                                            <select id="genre" name="genre">
                                                <option value="">장르검색</option>

                                                <option value="전체" selected>전체</option>
                                                <option value="소설">소설</option>
                                                <option value="수필"> 수필</option>
                                                <option value="코미디">코미디</option>
                                                <option value="연애">연애</option>
                                                <option value="공포">공포</option>
                                                <option value="인문학">인문학</option>
                                                <option value="어린이">어린이</option>
                                                <option value="자서전">자서전</option>
                                                <option value="잡지">잡지</option>
                                                <option value="과학">과학</option>
                                                <option value="수학">수학</option>
                                                <option value="역사">역사</option>
                                                <option value="에세이"selected>에세이</option>

                                            </select>
                                        </c:if>


                                    </div>
                                </div>


                            </div>

                            <!-- select-Categories End -->

                            <!-- Range Slider Start -->
                            <aside class="left_widgets p_filter_widgets price_rangs_aside sidebar_box_shadow mb-40">
                                <div class="small-tittle">

                                </div>
                                <div class="widgets_inner">

                                    <div class="range_item">


                                        <div class="slidecontainer">
                                            <h4 style="text-align: left;">가격 범위 설정</h4>
                                            <input type="range" step="5000" min="0" max="50000" name="price" value="${priceRange}"
                                                   class="slider" id="myRange"
                                                   style="text-align: left;"/>
                                            <p>가격: <span id="value"></span>원 이상인 도서
                                                <form action="/bookPrice" method="post">
                                                <input type="submit" id="realPrice" class="btn" value="검색"  /></p>
                                        </form>



                                        </div>

                                    </div>
                                </div>
                            </aside>
                            <!-- range end -->


                            <!--  Select City items End-->

                            <!-- select-Categories start -->

                            <!-- select-Categories End -->
                            <!-- select-Categories start -->

                            <!-- select-Categories End -->
                        </div>
                    </div>
                    <!-- Job Category Listing End -->
                </div>
                <!--?  Right content -->
                <div class="col-xl-8 col-lg-8 col-md-6">
                    <div class="row justify-content-end">
                        <div class="col-xl-4">
                            <div class="product_page_tittle">
                                <div class="short_by">
                                    <select name='choice' id="choice">
                                        <option value='all'>전체</option>
                                        <option value='highPrice' id="highPrice">가격높은순</option>
                                        <option value='lowPrice' id="lowPrice" label='LM'>가격낮은순</option>
                                        <option value='manyOrders' id="manyOrders" label='LM'>주문많은순</option>
                                        <option value='manyReview' id="manyReview" label='LM'>리뷰많은순</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>


                    <c:if test="${bookAndReview !=null}">
                    <div class="best-selling p-0">
                        <div class="row">

                            <c:choose>


                            <c:when test="${fn:length(bookAndReview) > 0}">


                            <c:forEach var="bookList" items="${bookAndReview}">
                            <input type="hidden" name="bookId" id="bookId" value="${bookList.bookId}">
                            <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-12 col-sm-6">
                                <div class="properties pb-30">
                                    <div class="properties-card">
                                        <div class="properties-img">
                                            <a href="/${bookList.bookId}"><img src="files/${bookList.fileName}" alt=""
                                                                               style="    height: 180px; object-fit: cover;"></a>
                                        </div>
                                        <div class="properties-caption properties-caption2">
                                            <strong><a href="/${bookList.bookId}">${bookList.bookName}</a></strong>
                                            <p>${bookList.author}</p>
                                            <span id="price" style="color: red;">${bookList.price}원</span>
                                            <p style="text-align: right; color: gray;">(${bookList.genre})</p>
                                            <div class="properties-footer d-flex justify-content-between align-items-center">
                                                <div class="review">
                                                    <div class="rating">


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


                                                    </div>
                                                    <p>(<span>${bookList.reviewId}</span> Review)</p>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>

                            </c:when>


                            <c:otherwise>
                            <tr>
                                <td colspan="4">조회된 결과가 없습니다.</td>
                            </tr>
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


                            <c:if test="${bookAndReviewHighPrice !=null}">
                            <div class="best-selling p-0">
                                <div class="row">

                                    <c:choose>


                                    <c:when test="${fn:length(bookAndReviewHighPrice) > 0}">


                                    <c:forEach var="bookList" items="${bookAndReviewHighPrice}">
                                    <input type="hidden" name="bookId" id="bookId" value="${bookList.bookId}">
                                    <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-12 col-sm-6">
                                        <div class="properties pb-30">
                                            <div class="properties-card">
                                                <div class="properties-img">
                                                    <a href="/${bookList.bookId}"><img src="files/${bookList.fileName}"
                                                                                       alt=""
                                                                                       style="    height: 180px; object-fit: cover;"></a>
                                                </div>
                                                <div class="properties-caption properties-caption2">
                                                    <strong><a href="/${bookList.bookId}">${bookList.bookName}</a></strong>
                                                    <p>${bookList.author}</p>
                                                    <span id="price" style="color: red;">${bookList.price}원</span>
                                                    <p style="text-align: right; color: gray;">(${bookList.genre})</p>
                                                    <div class="properties-footer d-flex justify-content-between align-items-center">
                                                        <div class="review">
                                                            <div class="rating">


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


                                                            </div>
                                                            <p>(<span>${bookList.reviewId}</span> Review)</p>
                                                        </div>


                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>

                                    </c:when>


                                    <c:otherwise>
                                    <tr>
                                        <td colspan="4">조회된 결과가 없습니다.</td>
                                    </tr>
                                    </c:otherwise>


                                    </c:choose>

                                    <!--paginate -->
                                    <div class="paginate">
                                        <div class="paging">
                                            <a class="direction prev" href="javascript:void(0);" style="color: black;"
                                               onclick="movePageHighPrice(1,${pagination.cntPerPage},${pagination.pageSize});">
                                                &lt;&lt; </a> <a class="direction prev" href="javascript:void(0);"
                                                                 style="color: black;"
                                                                 onclick="movePageHighPrice(${pagination.currentPage}
                                                                 <c:if test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                                            &lt; </a>

                                            <c:forEach begin="${pagination.firstPage}"
                                                       end="${pagination.lastPage}" var="idx">
                                                <a
                                                        style="color: black;
                                                            <c:out value="${pagination.currentPage == idx ? 'black; font-weight:700; margin-bottom: 2px;' : ''}"/> "
                                                        href="javascript:void(0);"
                                                        onclick="movePageHighPrice(${idx},${pagination.cntPerPage},${pagination.pageSize});"><c:out
                                                        value="${idx}"/></a>
                                            </c:forEach>
                                            <a class="direction next" href="javascript:void(0);" style="color: black;"
                                               onclick="movePageHighPrice(${pagination.currentPage}<c:if
                                                       test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                                                &gt; </a> <a class="direction next" href="javascript:void(0);"
                                                             style="color: black;"
                                                             onclick="movePageHighPrice(${pagination.totalRecordCount},${pagination.cntPerPage},${pagination.pageSize});">
                                            &gt;&gt; </a>
                                        </div>
                                    </div>
                                    <!-- /paginate -->

                                    </c:if>


                                    <c:if test="${bookAndReviewLowPrice !=null}">
                                    <div class="best-selling p-0">
                                        <div class="row">

                                            <c:choose>


                                            <c:when test="${fn:length(bookAndReviewLowPrice) > 0}">


                                            <c:forEach var="bookList" items="${bookAndReviewLowPrice}">
                                            <input type="hidden" name="bookId" id="bookId"
                                                   value="${bookList.bookId}">
                                            <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-12 col-sm-6">
                                                <div class="properties pb-30">
                                                    <div class="properties-card">
                                                        <div class="properties-img">
                                                            <a href="/${bookList.bookId}"><img
                                                                    src="files/${bookList.fileName}" alt=""
                                                                    style="    height: 180px; object-fit: cover;"></a>
                                                        </div>
                                                        <div class="properties-caption properties-caption2">
                                                            <strong>
                                                                <a href="/${bookList.bookId}">${bookList.bookName}</a>
                                                            </strong>
                                                            <p>${bookList.author}</p>
                                                            <span id="price"
                                                                  style="color: red;">${bookList.price}원</span>
                                                            <p style="text-align: right; color: gray;">
                                                                (${bookList.genre})</p>
                                                            <div class="properties-footer d-flex justify-content-between align-items-center">
                                                                <div class="review">
                                                                    <div class="rating">


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


                                                                    </div>
                                                                    <p>(<span>${bookList.reviewId}</span>
                                                                        Review)</p>
                                                                </div>


                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:forEach>

                                            </c:when>


                                            <c:otherwise>
                                            <tr>
                                                <td colspan="4">조회된 결과가 없습니다.</td>
                                            </tr>
                                            </c:otherwise>


                                            </c:choose>

                                            <!--paginate -->
                                            <div class="paginate">
                                                <div class="paging">
                                                    <a class="direction prev" href="javascript:void(0);"
                                                       style="color: black;"
                                                       onclick="movePageLowPrice(1,${pagination.cntPerPage},${pagination.pageSize});">
                                                        &lt;&lt; </a> <a class="direction prev"
                                                                         href="javascript:void(0);"
                                                                         style="color: black;"
                                                                         onclick="movePageLowPrice(${pagination.currentPage}
                                                                         <c:if
                                                                                 test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                                                    &lt; </a>

                                                    <c:forEach begin="${pagination.firstPage}"
                                                               end="${pagination.lastPage}" var="idx">
                                                        <a
                                                                style="color: black;
                                                                    <c:out value="${pagination.currentPage == idx ? 'black; font-weight:700; margin-bottom: 2px;' : ''}"/> "
                                                                href="javascript:void(0);"
                                                                onclick="movePageLowPrice(${idx},${pagination.cntPerPage},${pagination.pageSize});"><c:out
                                                                value="${idx}"/></a>
                                                    </c:forEach>
                                                    <a class="direction next" href="javascript:void(0);"
                                                       style="color: black;"
                                                       onclick="movePageLowPrice(${pagination.currentPage}<c:if
                                                               test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                                                        &gt; </a> <a class="direction next" href="javascript:void(0);"
                                                                     style="color: black;"
                                                                     onclick="movePageLowPrice(${pagination.totalRecordCount},${pagination.cntPerPage},${pagination.pageSize});">
                                                    &gt;&gt; </a>
                                                </div>
                                            </div>
                                            <!-- /paginate -->

                                            </c:if>


                                            <c:if test="${bookAndReviewManyOrders !=null}">
                                            <div class="best-selling p-0">
                                                <div class="row">

                                                    <c:choose>


                                                    <c:when test="${fn:length(bookAndReviewManyOrders) > 0}">


                                                    <c:forEach var="bookList"
                                                               items="${bookAndReviewManyOrders}">
                                                    <input type="hidden" name="bookId" id="bookId"
                                                           value="${bookList.bookId}">
                                                    <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-12 col-sm-6">
                                                        <div class="properties pb-30">
                                                            <div class="properties-card">
                                                                <div class="properties-img">
                                                                    <a href="/${bookList.bookId}"><img
                                                                            src="files/${bookList.fileName}"
                                                                            alt=""
                                                                            style="    height: 180px; object-fit: cover;"></a>
                                                                </div>
                                                                <div class="properties-caption properties-caption2">
                                                                    <strong>
                                                                        <a href="/${bookList.bookId}">${bookList.bookName}</a>
                                                                    </strong>
                                                                    <p>${bookList.author}</p>
                                                                    <span id="price"
                                                                          style="color: red;">${bookList.price}원</span>
                                                                    <p style="text-align: right; color: gray;">
                                                                        (${bookList.genre})</p>
                                                                    <div class="properties-footer d-flex justify-content-between align-items-center">
                                                                        <div class="review">
                                                                            <div class="rating">


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


                                                                            </div>


                                                                        </div>


                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </c:forEach>

                                                    </c:when>


                                                    <c:otherwise>
                                                    <tr>
                                                        <td colspan="4">조회된 결과가 없습니다.</td>
                                                    </tr>
                                                    </c:otherwise>


                                                    </c:choose>

                                                    <!--paginate -->
                                                    <div class="paginate">
                                                        <div class="paging">
                                                            <a class="direction prev" href="javascript:void(0);"
                                                               style="color: black;"
                                                               onclick="movePageManyOrders(1,${pagination.cntPerPage},${pagination.pageSize});">
                                                                &lt;&lt; </a> <a class="direction prev"
                                                                                 href="javascript:void(0);"
                                                                                 style="color: black;"
                                                                                 onclick="movePageManyOrders(${pagination.currentPage}
                                                                                 <c:if
                                                                                         test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                                                            &lt; </a>


                                                            <c:forEach begin="${pagination.firstPage}"
                                                                       end="${pagination.lastPage}" var="idx">
                                                                <a
                                                                        style="color: black;
                                                                            <c:out value="${pagination.currentPage == idx ? 'black; font-weight:700; margin-bottom: 2px;' : ''}"/> "
                                                                        href="javascript:void(0);"
                                                                        onclick="movePageManyOrders(${idx},${pagination.cntPerPage},${pagination.pageSize});"><c:out
                                                                        value="${idx}"/></a>
                                                            </c:forEach>
                                                            <a class="direction next" href="javascript:void(0);"
                                                               style="color: black;"
                                                               onclick="movePageManyOrders(${pagination.currentPage}
                                                               <c:if
                                                                       test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                                                                &gt; </a> <a class="direction next"
                                                                             href="javascript:void(0);"
                                                                             style="color: black;"
                                                                             onclick="movePageManyOrders(${pagination.totalRecordCount},${pagination.cntPerPage},${pagination.pageSize});">
                                                            &gt;&gt; </a>
                                                        </div>
                                                    </div>
                                                    <!-- /paginate -->

                                                    </c:if>


                                                    <c:if test="${bookAndReviewManyReview !=null}">
                                                    <div class="best-selling p-0">
                                                        <div class="row">

                                                            <c:choose>


                                                            <c:when test="${fn:length(bookAndReviewManyReview) > 0}">


                                                            <c:forEach var="bookList"
                                                                       items="${bookAndReviewManyReview}">
                                                            <input type="hidden" name="bookId" id="bookId"
                                                                   value="${bookList.bookId}">
                                                            <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-12 col-sm-6">
                                                                <div class="properties pb-30">
                                                                    <div class="properties-card">
                                                                        <div class="properties-img">
                                                                            <a href="/${bookList.bookId}"><img
                                                                                    src="files/${bookList.fileName}"
                                                                                    alt=""
                                                                                    style="    height: 180px; object-fit: cover;"></a>
                                                                        </div>
                                                                        <div class="properties-caption properties-caption2">
                                                                            <strong>
                                                                                <a href="/${bookList.bookId}">${bookList.bookName}</a>
                                                                            </strong>
                                                                            <p>${bookList.author}</p>
                                                                            <span id="price"
                                                                                  style="color: red;">${bookList.price}원</span>
                                                                            <p style="text-align: right; color: gray;">
                                                                                (${bookList.genre})</p>
                                                                            <div class="properties-footer d-flex justify-content-between align-items-center">
                                                                                <div class="review">
                                                                                    <div class="rating">


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


                                                                                    </div>


                                                                                    <p>
                                                                                        (<span>${bookList.reviewId}</span>
                                                                                        Review)</p>


                                                                                </div>


                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            </c:forEach>

                                                            </c:when>


                                                            <c:otherwise>
                                                            <tr>
                                                                <td colspan="4">조회된 결과가 없습니다.</td>
                                                            </tr>
                                                            </c:otherwise>


                                                            </c:choose>

                                                            <!--paginate -->
                                                            <div class="paginate">
                                                                <div class="paging">
                                                                    <a class="direction prev" href="javascript:void(0);"
                                                                       style="color: black;"
                                                                       onclick="movePageManyReview(1,${pagination.cntPerPage},${pagination.pageSize});">
                                                                        &lt;&lt; </a> <a class="direction prev"
                                                                                         href="javascript:void(0);"
                                                                                         style="color: black;"
                                                                                         onclick="movePageManyReview(${pagination.currentPage}
                                                                                         <c:if
                                                                                                 test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                                                                    &lt; </a>


                                                                    <c:forEach begin="${pagination.firstPage}"
                                                                               end="${pagination.lastPage}" var="idx">
                                                                        <a
                                                                                style="color: black;
                                                                                    <c:out value="${pagination.currentPage == idx ? 'black; font-weight:700; margin-bottom: 2px;' : ''}"/> "
                                                                                href="javascript:void(0);"
                                                                                onclick="movePageManyReview(${idx},${pagination.cntPerPage},${pagination.pageSize});"><c:out
                                                                                value="${idx}"/></a>
                                                                    </c:forEach>
                                                                    <a class="direction next" href="javascript:void(0);"
                                                                       style="color: black;"
                                                                       onclick="movePageManyReview(${pagination.currentPage}
                                                                       <c:if
                                                                               test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                                                                        &gt; </a> <a class="direction next"
                                                                                     href="javascript:void(0);"
                                                                                     style="color: black;"
                                                                                     onclick="movePageManyReview(${pagination.totalRecordCount},${pagination.cntPerPage},${pagination.pageSize});">
                                                                    &gt;&gt; </a>
                                                                </div>
                                                            </div>
                                                            <!-- /paginate -->

                                                            </c:if>

                                                            <c:if test="${genreSearch !=null}">
                                                            <div class="best-selling p-0">
                                                                <div class="row">

                                                                    <c:choose>


                                                                        <c:when test="${fn:length(genreSearch) > 0}">


                                                                            <c:forEach var="bookList"
                                                                                       items="${genreSearch}">
                                                                                <input type="hidden" name="bookId"
                                                                                       id="bookId"
                                                                                       value="${bookList.bookId}">
                                                                                <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-12 col-sm-6">
                                                                                    <div class="properties pb-30">
                                                                                        <div class="properties-card">
                                                                                            <div class="properties-img">
                                                                                                <a href="/${bookList.bookId}"><img
                                                                                                        src="files/${bookList.fileName}"
                                                                                                        alt=""
                                                                                                        style="    height: 180px; object-fit: cover;"></a>
                                                                                            </div>
                                                                                            <div class="properties-caption properties-caption2">
                                                                                                <strong>
                                                                                                    <a href="/${bookList.bookId}">${bookList.bookName}</a>
                                                                                                </strong>
                                                                                                <p>${bookList.author}</p>
                                                                                                <span id="price"
                                                                                                      style="color: red;">${bookList.price}원</span>
                                                                                                <p style="text-align: right; color: gray;">

                                                                                                    (${bookList.genre})</p>
                                                                                                <input type="hidden"
                                                                                                       id="genreName"
                                                                                                       value="${bookList.genre}">
                                                                                                <div class="properties-footer d-flex justify-content-between align-items-center">
                                                                                                    <div class="review">
                                                                                                        <div class="rating">


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


                                                                                                        </div>


                                                                                                        <p>
                                                                                                            (<span>${bookList.reviewId}</span>
                                                                                                            Review)</p>


                                                                                                    </div>


                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </c:forEach>

                                                                        </c:when>


                                                                        <c:otherwise>
                                                                            <tr>
                                                                                <td colspan="4">조회된 결과가 없습니다.</td>
                                                                            </tr>
                                                                        </c:otherwise>


                                                                    </c:choose>

                                                                    <!--paginate -->
                                                                    <div class="paginate">
                                                                        <div class="paging">
                                                                            <a class="direction prev"
                                                                               href="javascript:void(0);"
                                                                               style="color: black;"
                                                                               onclick="genre(1,${pagination.cntPerPage},${pagination.pageSize});">
                                                                                &lt;&lt; </a> <a class="direction prev"
                                                                                                 href="javascript:void(0);"
                                                                                                 style="color: black;"
                                                                                                 onclick="genre(${pagination.currentPage}
                                                                                                 <c:if
                                                                                                         test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                                                                            &lt; </a>

                                                                            <c:forEach begin="${pagination.firstPage}"
                                                                                       end="${pagination.lastPage}"
                                                                                       var="idx">
                                                                                <a
                                                                                        style="color: black;
                                                                                            <c:out value="${pagination.currentPage == idx ? 'black; font-weight:700; margin-bottom: 2px;' : ''}"/> "
                                                                                        href="javascript:void(0);"
                                                                                        onclick="genre(${idx},${pagination.cntPerPage},${pagination.pageSize});"><c:out
                                                                                        value="${idx}"/></a>
                                                                            </c:forEach>
                                                                            <a class="direction next"
                                                                               href="javascript:void(0);"
                                                                               style="color: black;"
                                                                               onclick="genre(${pagination.currentPage}
                                                                               <c:if
                                                                                       test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                                                                                &gt; </a> <a class="direction next"
                                                                                             href="javascript:void(0);"
                                                                                             style="color: black;"
                                                                                             onclick="genre(${pagination.totalRecordCount},${pagination.cntPerPage},${pagination.pageSize});">
                                                                            &gt;&gt; </a>
                                                                        </div>
                                                                    </div>
                                                                    <!-- /paginate -->

                                                                    </c:if>


                                                                    <c:if test="${searchPrice !=null}">
                                                                    <div class="best-selling p-0">
                                                                        <div class="row">

                                                                            <c:choose>


                                                                                <c:when test="${fn:length(searchPrice) > 0}">


                                                                                    <c:forEach var="bookList"
                                                                                               items="${searchPrice}">
                                                                                        <input type="hidden"
                                                                                               name="bookId"
                                                                                               id="bookId"
                                                                                               value="${bookList.bookId}">
                                                                                        <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-12 col-sm-6">
                                                                                            <div class="properties pb-30">
                                                                                                <div class="properties-card">
                                                                                                    <div class="properties-img">
                                                                                                        <a href="/${bookList.bookId}"><img
                                                                                                                src="files/${bookList.fileName}"
                                                                                                                alt=""
                                                                                                                style="    height: 180px; object-fit: cover;"></a>
                                                                                                    </div>
                                                                                                    <div class="properties-caption properties-caption2">
                                                                                                        <strong>
                                                                                                            <a href="/${bookList.bookId}">${bookList.bookName}</a>
                                                                                                        </strong>
                                                                                                        <p>${bookList.author}</p>
                                                                                                        <span id="price"
                                                                                                              style="color: red;">${bookList.price}원</span>
                                                                                                        <p style="text-align: right; color: gray;">

                                                                                                            (${bookList.genre})</p>
                                                                                                        <input type="hidden"
                                                                                                               id="genreName"
                                                                                                               value="${bookList.genre}">
                                                                                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                                                                                            <div class="review">
                                                                                                                <div class="rating">


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


                                                                                                                </div>


                                                                                                                <p>
                                                                                                                    (<span>${bookList.reviewId}</span>
                                                                                                                    Review)
                                                                                                                </p>


                                                                                                            </div>


                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </c:forEach>

                                                                                </c:when>


                                                                                <c:otherwise>
                                                                                    <tr>
                                                                                        <td colspan="4">조회된 결과가 없습니다.

                                                                                        </td>
                                                                                    </tr>
                                                                                </c:otherwise>


                                                                            </c:choose>


                                                                            <!--paginate -->
                                                                            <div class="paginate">
                                                                                <div class="paging">
                                                                                    <a class="direction prev"
                                                                                       href="javascript:void(0);"
                                                                                       style="color: black;"
                                                                                       onclick="movePagePrice(1,${pagination.cntPerPage},${pagination.pageSize});">
                                                                                        &lt;&lt; </a> <a
                                                                                        class="direction prev"
                                                                                        href="javascript:void(0);"
                                                                                        style="color: black;"
                                                                                        onclick="movePagePrice(${pagination.currentPage}
                                                                                        <c:if
                                                                                                test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                                                                                    &lt; </a>

                                                                                    <c:forEach
                                                                                            begin="${pagination.firstPage}"
                                                                                            end="${pagination.lastPage}"
                                                                                            var="idx">
                                                                                        <a
                                                                                                style="color: black;
                                                                                                    <c:out value="${pagination.currentPage == idx ? 'black; font-weight:700; margin-bottom: 2px;' : ''}"/> "
                                                                                                href="javascript:void(0);"
                                                                                                onclick="movePagePrice(${idx},${pagination.cntPerPage},${pagination.pageSize});"><c:out
                                                                                                value="${idx}"/></a>
                                                                                    </c:forEach>
                                                                                    <a class="direction next"
                                                                                       href="javascript:void(0);"
                                                                                       style="color: black;"
                                                                                       onclick="movePagePrice(${pagination.currentPage}
                                                                                       <c:if
                                                                                               test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                                                                                        &gt; </a> <a
                                                                                        class="direction next"
                                                                                        href="javascript:void(0);"
                                                                                        style="color: black;"
                                                                                        onclick="movePagePrice(${pagination.totalRecordCount},${pagination.cntPerPage},${pagination.pageSize});">
                                                                                    &gt;&gt; </a>
                                                                                </div>
                                                                            </div>
                                                                            <!-- /paginate -->

                                                                            </c:if>



                                                                                <c:if test="${searchBook !=null}">
                                                                                <div class="best-selling p-0">
                                                                                    <div class="row">

                                                                                        <c:choose>


                                                                                        <c:when test="${fn:length(searchBook) > 0}">


                                                                                        <c:forEach var="bookList" items="${searchBook}">
                                                                                            <input type="hidden" name="searchBookName" id="searchBookName" value="${searchBookName}">
                                                                                        <input type="hidden" name="bookId" id="bookId" value="${bookList.bookId}">
                                                                                        <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-12 col-sm-6">
                                                                                            <div class="properties pb-30">
                                                                                                <div class="properties-card">
                                                                                                    <div class="properties-img">
                                                                                                        <a href="/${bookList.bookId}"><img src="files/${bookList.fileName}" alt=""
                                                                                                                                           style="    height: 180px; object-fit: cover;"></a>
                                                                                                    </div>
                                                                                                    <div class="properties-caption properties-caption2">
                                                                                                        <strong><a href="/${bookList.bookId}">${bookList.bookName}</a></strong>
                                                                                                        <p>${bookList.author}</p>
                                                                                                        <span id="price" style="color: red;">${bookList.price}원</span>
                                                                                                        <p style="text-align: right; color: gray;">(${bookList.genre})</p>
                                                                                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                                                                                            <div class="review">
                                                                                                                <div class="rating">


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


                                                                                                                </div>
                                                                                                                <p>(<span>${bookList.reviewId}</span> Review)</p>
                                                                                                            </div>


                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        </c:forEach>

                                                                                        </c:when>


                                                                                        <c:otherwise>
                                                                                        <tr>
                                                                                            <td colspan="4">조회된 결과가 없습니다.</td>
                                                                                            <input type="hidden" name="searchBookName" id="searchBookName" value="${searchBookName}">
                                                                                        </tr>
                                                                                        </c:otherwise>


                                                                                        </c:choose>

                                                                                            <!--paginate -->
                                                                                            <div class="paginate">
                                                                                                <div class="paging">
                                                                                                    <a class="direction prev"
                                                                                                       href="javascript:void(0);"
                                                                                                       style="color: black;"
                                                                                                       onclick="moveSearchBookPage(1,${pagination.cntPerPage},${pagination.pageSize});">
                                                                                                        &lt;&lt; </a> <a class="direction prev"
                                                                                                                         href="javascript:void(0);"
                                                                                                                         style="color: black;"
                                                                                                                         onclick="moveSearchBookPage(${pagination.currentPage}
                                                                                                                         <c:if
                                                                                                                                 test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                                                                                                    &lt; </a>

                                                                                                    <c:forEach begin="${pagination.firstPage}"
                                                                                                               end="${pagination.lastPage}"
                                                                                                               var="idx">
                                                                                                        <a
                                                                                                                style="color: black;
                                                                                                                    <c:out value="${pagination.currentPage == idx ? 'black; font-weight:700; margin-bottom: 2px;' : ''}"/> "
                                                                                                                href="javascript:void(0);"
                                                                                                                onclick="moveSearchBookPage(${idx},${pagination.cntPerPage},${pagination.pageSize});"><c:out
                                                                                                                value="${idx}"/></a>
                                                                                                    </c:forEach>
                                                                                                    <a class="direction next"
                                                                                                       href="javascript:void(0);"
                                                                                                       style="color: black;"
                                                                                                       onclick="moveSearchBookPage(${pagination.currentPage}
                                                                                                       <c:if
                                                                                                               test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                                                                                                        &gt; </a> <a class="direction next"
                                                                                                                     href="javascript:void(0);"
                                                                                                                     style="color: black;"
                                                                                                                     onclick="moveSearchBookPage(${pagination.totalRecordCount},${pagination.cntPerPage},${pagination.pageSize});">
                                                                                                    &gt;&gt; </a>
                                                                                                </div>
                                                                                            </div>
                                                                                            <!-- /paginate -->
                                                                                        </c:if>

                                                                                    </div></div></div></div></div>


</main>
<jsp:include page="../main/footer.jsp"></jsp:include>
<!-- Scroll Up -->
<div id="back-top">
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<script>

    //10,20,30개씩 selectBox 클릭 이벤트
    function changeSelectBox(currentPage, cntPerPage, pageSize) {
        var selectValue = $("#cntSelectBox").children("option:selected").val();
        movePage(currentPage, selectValue, pageSize);

    }

    //페이지 이동
    function movePage(currentPage, cntPerPage, pageSize) {

        var url = "${pageContext.request.contextPath}/bookMain";
        url = url + "?currentPage=" + currentPage;
        url = url + "&cntPerPage=" + cntPerPage;
        url = url + "&pageSize=" + pageSize;

        location.href = url;
    }



    //페이지 이동
    function movePagePrice(currentPage, cntPerPage, pageSize) {

        var price = parseInt($("#myRange").val());


        var url = "${pageContext.request.contextPath}/bookPrice?price=" +30000;
        url = url + "?currentPage=" + currentPage;
        url = url + "&cntPerPage=" + cntPerPage;
        url = url + "&pageSize=" + pageSize;

        location.href = url;
    }

    //페이지 이동
    function movePageRangePrice(currentPage, cntPerPage, pageSize) {

        var range = $('#genreName').val();


        var url = "${pageContext.request.contextPath}/genre?choice=" + genre;


        var url = "${pageContext.request.contextPath}/bookMain";
        url = url + "?currentPage=" + currentPage;
        url = url + "&cntPerPage=" + cntPerPage;
        url = url + "&pageSize=" + pageSize;

        location.href = url;
    }

    //페이지 이동
    function movePageHighPrice(currentPage, cntPerPage, pageSize) {

        var url = "${pageContext.request.contextPath}/sort?abc=" + 1;
        url = url + "&currentPage=" + currentPage;
        url = url + "&cntPerPage=" + cntPerPage;
        url = url + "&pageSize=" + pageSize;

        location.href = url;
    }

    //페이지 이동
    function movePageLowPrice(currentPage, cntPerPage, pageSize) {

        var url = "${pageContext.request.contextPath}/sort?abc=" + 2;
        url = url + "&currentPage=" + currentPage;
        url = url + "&cntPerPage=" + cntPerPage;
        url = url + "&pageSize=" + pageSize;

        location.href = url;
    }

    //페이지 이동
    function movePageManyOrders(currentPage, cntPerPage, pageSize) {

        var url = "${pageContext.request.contextPath}/sort?abc=" + 3;
        url = url + "&currentPage=" + currentPage;
        url = url + "&cntPerPage=" + cntPerPage;
        url = url + "&pageSize=" + pageSize;

        location.href = url;
    }

    //페이지 이동
    function movePageManyReview(currentPage, cntPerPage, pageSize) {

        var url = "${pageContext.request.contextPath}/sort?abc=" + 4;
        url = url + "&currentPage=" + currentPage;
        url = url + "&cntPerPage=" + cntPerPage;
        url = url + "&pageSize=" + pageSize;

        location.href = url;
    }

    //페이지 이동
    function genre(currentPage, cntPerPage, pageSize) {

        var genre = $('#genreName').val();


        var url = "${pageContext.request.contextPath}/genre?choice=" + genre;
        url = url + "&currentPage=" + currentPage;
        url = url + "&cntPerPage=" + cntPerPage;
        url = url + "&pageSize=" + pageSize;

        location.href = url;
    }

    //페이지 이동
    function moveSearchBookPage(currentPage, cntPerPage, pageSize) {

        var searchBookName  = $('#searchBookName').val();

        var url = "${pageContext.request.contextPath}/searchBook?searchBookName=" + searchBookName;


        location.href = url;
    }



    var slider = document.getElementById("myRange");
    var output = document.getElementById("value");
    output.innerHTML = slider.value;

    slider.oninput = function () {
        output.innerHTML = this.value;
    }


    $('#myRange').change(function () {

        $.ajax({

            type: 'POST',
            url: '/priceRange',
            data: {
                "price": $('#myRange').val(),


            },
            dataType: 'text',

            success: function (price) {

                $("#price")


            },
            error: function (a, b, c) {
                alert('실패');
                console.log(a, b, c);
            }

        });


    });


    $('#genre').change(function () {

        $.ajax({

            type: 'POST',
            url: '/genreChoice',
            data: {
                "choice": $('#genre').val(),


            },
            dataType: 'text',

            success: function (choice) {


                if (choice == '전체') {

                    location.href = '/bookMain';


                }
                if (choice == '소설') {


                    location.href = '/genre?choice=' + '소설';


                }

                if (choice == '수필') {

                    location.href = '/genre?choice=' + '수필';


                }


                if (choice == '코미디') {


                    location.href = '/genre?choice=' + '코미디';


                }

                if (choice == '연애') {


                    location.href = '/genre?choice=' + '연애';


                }

                if (choice == '공포') {


                    location.href = '/genre?choice=' + '공포';


                }

                if (choice == '인문학') {


                    location.href = '/genre?choice=' + '인문학';


                }

                if (choice == '어린이') {


                    location.href = '/genre?choice=' + '어린이';


                }

                if (choice == '자서전') {


                    location.href = '/genre?choice=' + '자서전';


                }

                if (choice == '잡지') {


                    location.href = '/genre?choice=' + '잡지';


                }

                if (choice == '과학') {


                    location.href = '/genre?choice=' + '과학';


                }

                if (choice == '수학') {


                    location.href = '/genre?choice=' + '수학';


                }

                if (choice == '역사') {


                    location.href = '/genre?choice=' + '역사';


                }

                if (choice == '에세이') {


                    location.href = '/genre?choice=' + '에세이';


                }


            },
            error: function (a, b, c) {
                alert('실패');
                console.log(a, b, c);
            }

        });


    });


    $('#choice').change(function () {
        let price = 0;
        let url = "";
        $.ajax({

            type: 'POST',
            url: '/choiceResult',
            data: {
                "choice": $('#choice').val(),

            },
            dataType: 'text',

            success: function (choice) {

                if (choice == 'all') {


                    location.href = '/sort?abc=' + 0;


                }


                if (choice == 'highPrice') {


                    location.href = '/sort?abc=' + 1;


                }
                if (choice == 'lowPrice') {

                    location.href = '/sort?abc=' + 2;
                }

                if (choice == 'manyOrders') {

                    location.href = '/sort?abc=' + 3;
                }

                if (choice == 'manyReview') {

                    location.href = '/sort?abc=' + 4;
                }


            },
            error: function (a, b, c) {
                alert('실패');
                console.log(a, b, c);
            }

        });


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
<%--<script src="./assets/js/jquery.nice-select.min.js"></script>--%>
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