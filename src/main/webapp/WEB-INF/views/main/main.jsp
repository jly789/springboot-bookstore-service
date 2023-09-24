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


<jsp:include page="header.jsp"></jsp:include>

<main>
    <!-- slider Area Start-->
    <div class="slider-area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="slider-active dot-style">
                        <!-- Single Slider -->
                        <div class="single-slider slider-height slider-bg1 d-flex align-items-center">
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-xxl-4 col-xl-4 col-lg-5 col-md-6 col-sm-7">
                                        <div class="hero-caption text-center">

                                            <h1 data-animation="fadeInUp" data-delay=".4s"><br><br></h1>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Single Slider -->
                        <div class="single-slider slider-height slider-bg2 d-flex align-items-center">
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-xxl-4 col-xl-4 col-lg-5 col-md-6 col-sm-7">
                                        <div class="hero-caption text-center">

                                            <h1 data-animation="fadeInUp" data-delay=".4s"><br><br</h1>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Single Slider -->
                        <div class="single-slider slider-height slider-bg3 d-flex align-items-center">
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-xxl-4 col-xl-4 col-lg-5 col-md-6 col-sm-7">
                                        <div class="hero-caption text-center">

                                            <h1 data-animation="fadeInUp" data-delay=".4s"><br><br></h1>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->
    <!-- Best Selling start -->
    <div class="best-selling section-bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-7 col-lg-8">
                    <div class="section-tittle text-center mb-55">
                        <h2>베스트셀러(주문많은순)</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <div class="selling-active">

                        <c:forEach var="bestSellerList" items="${bestSellerList}">

                        <!-- Single -->
                        <div class="properties pb-20">
                            <div class="properties-card">
                                <div class="properties-img">
                                    <a href="/${bestSellerList.bookId}"><img
                                            src="files/${bestSellerList.fileName}"
                                            alt=""
                                            style=" height: 320px; object-fit: cover;"></a>
                                </div>
                                <div class="properties-caption">
                                    <strong>${bestSellerList.bookName}</strong>
                                    <p>${bestSellerList.author}</p>
                                    <div class="properties-footer d-flex justify-content-between align-items-center">
                                        <div class="review">
                                            <div class="rating">
                                                <c:if test="${bestSellerList.grade==0}">


                                                </c:if>

                                                <c:if test="${bestSellerList.grade==1}">

                                                    <i class="fas fa-star" style="color: gold;"></i>

                                                </c:if>

                                                <c:if test="${bestSellerList.grade==2}">

                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>

                                                </c:if>

                                                <c:if test="${bestSellerList.grade==3}">

                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>

                                                </c:if>

                                                <c:if test="${bestSellerList.grade==4}">

                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>

                                                </c:if>


                                                    <%--                                                        <c:forEach var="reviewGrade" items="${reviewGrade}"></c:forEach>--%>
                                                <c:if test="${bestSellerList.grade==5}">
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                </c:if>
                                            </div>
                                            <p style="color: black;">(${bestSellerList.reviewId} Review)</p>
                                        </div>
                                        <br/><br/>

                                            <span style="color: red;">${bestSellerList.price}원</span>

                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Best Selling End -->
    <!--  services-area start-->
    <div class="services-area2 top-padding">
        <div class="container">
            <div class="row">
                <div class="col-xl-9 col-lg-9 col-md-8">
                    <div class="row" >
                        <!-- tittle -->
                        <div class="col-xl-12">
                            <div class="section-tittle d-flex justify-content-between align-items-center mb-40">
                                <h2 class="mb-0">Top5 이주의 도서</h2>

                            </div>
                        </div>
                    </div>
                    <div class="row" style="width: 80%;">
                        <div class="col-xl-12">
                            <div class="services-active">
                                <c:forEach var="weekBook" items="${weekBook}">
                                <!-- Single -->
<%--                                <div class="single-services" style="background-color: lightgrey; "> 이놈 색상--%>
                                    <div class="single-services" style="background-color: #FEF4F4;">
                                    <div class="features-img">
                                        <a href="/${weekBook.bookId}"><img
                                                src="files/${weekBook.fileName}"
                                                alt=""
                                                style="    height: 200px; object-fit: cover;"></a>
                                    </div>
                                    <div class="features-caption">

                                      <h4>  <strong style="color: black;">${weekBook.bookName}</strong></h4>
                                        <p style="color: black;">${weekBook.author}</p>
                                        <div class="price">
                                            <strong style="color: red;">${weekBook.price}원</strong>
                                        </div>
                                        <div class="review">
                                            <div class="rating">
                                                <c:if test="${weekBook.grade==0}">


                                                </c:if>

                                                <c:if test="${weekBook.grade==1}">

                                                    <i class="fas fa-star" style="color: gold;"></i>

                                                </c:if>

                                                <c:if test="${weekBook.grade==2}">

                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>

                                                </c:if>

                                                <c:if test="${weekBook.grade==3}">

                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>

                                                </c:if>

                                                <c:if test="${weekBook.grade==4}">

                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>

                                                </c:if>


                                                    <%--                                                        <c:forEach var="reviewGrade" items="${reviewGrade}"></c:forEach>--%>
                                                <c:if test="${weekBook.grade==5}">
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                    <i class="fas fa-star" style="color: gold;"></i>
                                                </c:if>
                                            </div>
                                            <p style="color: black;">(${weekBook.reviewId} Review)</p>
                                        </div>

                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-9">
                    <!-- Google Addd -->
                    <div class="google-add" style="text-align: center;">
                        <div class="container"  style="width: 800px;">

                                <div class="col-xl-9 col-lg-9 col-md-8">
                                    <div class="row">
                                        <!-- tittle -->
                                        <div class="col-xl-12">
                                            <div class="section-tittle d-flex justify-content-between align-items-center mb-40">
                                                <strong class="mb-0">사서가 추천하는 도서</strong>


                                        </div>
                                    </div>
                                    <div class="row" style="background-color:  #FEF4F4; width: 40%;" >
                                        <div class="col-xl-12">
                                            <div class="services-active">
                                                <c:forEach var="weekBook" items="${recommendedBook}">
                                                    <!-- Single -->
                                                    <%--                                <div class="single-services" style="background-color: lightgrey; "> 이놈 색상--%>
                                                    <div class="features-img">
                                                        <a href="/${weekBook.bookId}"><img
                                                                src="files/${weekBook.fileName}"
                                                                alt=""
                                                                style="    height: 200px; object-fit: cover;"></a>
                                                    </div>

                                                </c:forEach>

                                            </div>
                                        </div>

                                    </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- services-area End-->
    <!-- Latest-items Start -->
    <section class="our-client section-padding best-selling">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-xl-5 col-lg-5 col-md-12">
                    <!-- Section Tittle -->
                    <div class="section-tittle  mb-40">
                        <h2>장르별 도서</h2>
                    </div>
                </div>
                <div class="col-xl-7 col-lg-7 col-md-12">
                    <div class="nav-button mb-40">
                        <!--Nav Button  -->
                        <nav>
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <a class="nav-link active" id="nav-one-tab" data-bs-toggle="tab" href="#nav-one" role="tab" aria-controls="nav-one" aria-selected="true">Top10</a>
                                <a class="nav-link" id="nav-two-tab" data-bs-toggle="tab" href="#nav-two" role="tab" aria-controls="nav-two" aria-selected="false">소설</a>
                                <a class="nav-link" id="nav-three-tab" data-bs-toggle="tab" href="#nav-three" role="tab" aria-controls="nav-three" aria-selected="false">수필</a>
                                <a class="nav-link" id="nav-four-tab" data-bs-toggle="tab" href="#nav-four" role="tab" aria-controls="nav-four" aria-selected="false">코미디</a>
                                <a class="nav-link" id="nav-five-tab" data-bs-toggle="tab" href="#nav-five" role="tab" aria-controls="nav-five" aria-selected="false">연애</a>
                                <a class="nav-link" id="nav-6-tab" data-bs-toggle="tab" href="#nav-6" role="tab" aria-controls="nav-6" aria-selected="false">공포</a>
                                <a class="nav-link" id="nav-7-tab" data-bs-toggle="tab" href="#nav-7" role="tab" aria-controls="nav-7" aria-selected="false">인문학</a>
                                <a class="nav-link" id="nav-8-tab" data-bs-toggle="tab" href="#nav-8" role="tab" aria-controls="nav-8" aria-selected="false">어린이</a>
                                <a class="nav-link" id="nav-9-tab" data-bs-toggle="tab" href="#nav-9" role="tab" aria-controls="nav-9" aria-selected="false">자서전</a>
                                <a class="nav-link" id="nav-10-tab" data-bs-toggle="tab" href="#nav-10" role="tab" aria-controls="nav-10" aria-selected="false">잡지</a>
                                <a class="nav-link" id="nav-11-tab" data-bs-toggle="tab" href="#nav-11" role="tab" aria-controls="nav-11" aria-selected="false">과학</a>
                                <a class="nav-link" id="nav-14-tab" data-bs-toggle="tab" href="#nav-12" role="tab" aria-controls="nav-14" aria-selected="false">수학</a>
                                <a class="nav-link" id="nav-12-tab" data-bs-toggle="tab" href="#nav-13" role="tab" aria-controls="nav-12" aria-selected="false">역사</a>
                                <a class="nav-link" id="nav-13-tab" data-bs-toggle="tab" href="#nav-14" role="tab" aria-controls="nav-13" aria-selected="false">에세이</a>



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
                        <c:forEach var="top10Genre" items="${top10Genre}">



                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6" style="width: 18%;">

                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="/${top10Genre.bookId}"><img
                                                src="files/${top10Genre.fileName}"
                                                alt=""
                                                style="    height: 200px; object-fit: cover;"></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h6><strong><a href="book-details.html">${top10Genre.bookName}</a></strong></h6>
                                        <p>${top10Genre.author}</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <c:if test="${top10Genre.grade==0}">


                                                    </c:if>

                                                    <c:if test="${top10Genre.grade==1}">

                                                        <i class="fas fa-star" style="color: gold;"></i>

                                                    </c:if>

                                                    <c:if test="${top10Genre.grade==2}">

                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>

                                                    </c:if>

                                                    <c:if test="${top10Genre.grade==3}">

                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>

                                                    </c:if>

                                                    <c:if test="${top10Genre.grade==4}">

                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>

                                                    </c:if>


                                                        <%--                                                        <c:forEach var="reviewGrade" items="${reviewGrade}"></c:forEach>--%>
                                                    <c:if test="${top10Genre.grade==5}">
                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                    </c:if>
                                                </div>
                                                <p style="color: black;">(${top10Genre.reviewId} Review)</p>

                                            </div>
                                                <div class="price">
                                                    <strong style="color: red;">${top10Genre.price}원</strong>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        </c:forEach>

                    </div>
                </div>



                <div class="tab-pane fade" id="nav-two" role="tabpanel" aria-labelledby="nav-two-tab">
                    <!-- Tab 2 -->
                    <div class="row">
                        <c:forEach var="genreList" items="${genreList}">
                            <c:if test="${genreList.genre=='소설'}">
                                <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6" style="width: 18%;">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="/${genreList.bookId}"><img
                                                src="files/${genreList.fileName}"
                                                alt=""
                                                style="    height: 200px; object-fit: cover;"></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h6><strong><a href="book-details.html">${genreList.bookName}</a></strong></h6>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <c:if test="${genreList.grade==0}">


                                                    </c:if>

                                                    <c:if test="${genreList.grade==1}">

                                                        <i class="fas fa-star" style="color: gold;"></i>

                                                    </c:if>

                                                    <c:if test="${genreList.grade==2}">

                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>

                                                    </c:if>

                                                    <c:if test="${genreList.grade==3}">

                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>

                                                    </c:if>

                                                    <c:if test="${genreList.grade==4}">

                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>

                                                    </c:if>


                                                        <%--                                                        <c:forEach var="reviewGrade" items="${reviewGrade}"></c:forEach>--%>
                                                    <c:if test="${genreList.grade==5}">
                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                        <i class="fas fa-star" style="color: gold;"></i>
                                                    </c:if>
                                                </div>

                                                <p style="color: black;">(${genreList.reviewId} Review)</p>


                                                <div class="price">
                                                    <strong style="color: red;">${genreList.price}원</strong>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>

                            </c:if>
                        </c:forEach>


                                </div>
                            </div>


                <div class="tab-pane fade" id="nav-three" role="tabpanel" aria-labelledby="nav-three-tab">
                    <!-- Tab 2 -->
                    <div class="row">
                        <c:forEach var="genreList" items="${genreList}">
                            <c:if test="${genreList.genre=='수필'}">
                                <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6" style="width: 18%;">

                                <div class="properties pb-30">
                                        <div class="properties-card">
                                            <div class="properties-img">
                                                <a href="/${genreList.bookId}"><img
                                                        src="files/${genreList.fileName}"
                                                        alt=""
                                                        style="    height: 200px; object-fit: cover;"></a>
                                            </div>
                                            <div class="properties-caption properties-caption2">
                                                <h6><strong><a href="book-details.html">${genreList.bookName}</a></strong></h6>
                                                <p>J. R Rain</p>
                                                <div class="properties-footer d-flex justify-content-between align-items-center">
                                                    <div class="review">
                                                        <div class="rating">
                                                            <c:if test="${genreList.grade==0}">


                                                            </c:if>

                                                            <c:if test="${genreList.grade==1}">

                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==2}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==3}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==4}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>


                                                                <%--                                                        <c:forEach var="reviewGrade" items="${reviewGrade}"></c:forEach>--%>
                                                            <c:if test="${genreList.grade==5}">
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                            </c:if>
                                                        </div>
                                                        <div>
                                                            <p style="color: black;">(${genreList.reviewId} Review)</p>
                                                        </div>
                                                        <div class="price">
                                                            <strong style="color: red;">${genreList.price}원</strong>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:if>
                        </c:forEach>


                    </div>
                </div>



                <div class="tab-pane fade" id="nav-four" role="tabpanel" aria-labelledby="nav-four-tab">
                    <!-- Tab 2 -->
                    <div class="row">
                        <c:forEach var="genreList" items="${genreList}">
                            <c:if test="${genreList.genre=='코미디'}">
                                <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6" style="width: 18%;">
                                    <div class="properties pb-30">
                                        <div class="properties-card">
                                            <div class="properties-img">
                                                <a href="/${genreList.bookId}"><img
                                                        src="files/${genreList.fileName}"
                                                        alt=""
                                                        style="    height: 200px; object-fit: cover;"></a>
                                            </div>
                                            <div class="properties-caption properties-caption2">
                                                <h6><strong><a href="book-details.html">${genreList.bookName}</a></strong></h6>
                                                <p>J. R Rain</p>
                                                <div class="properties-footer d-flex justify-content-between align-items-center">
                                                    <div class="review">
                                                        <div class="rating">
                                                            <c:if test="${genreList.grade==0}">


                                                            </c:if>

                                                            <c:if test="${genreList.grade==1}">

                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==2}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==3}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==4}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>


                                                                <%--                                                        <c:forEach var="reviewGrade" items="${reviewGrade}"></c:forEach>--%>
                                                            <c:if test="${genreList.grade==5}">
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                            </c:if>
                                                        </div>
                                                        <div>
                                                            <p style="color: black;">(${genreList.reviewId} Review)</p>
                                                        </div>
                                                        <div class="price">
                                                            <strong style="color: red;">${genreList.price}원</strong>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:if>
                        </c:forEach>


                    </div>
                </div>
                <div class="tab-pane fade" id="nav-five" role="tabpanel" aria-labelledby="nav-five-tab">
                    <!-- Tab 2 -->
                    <div class="row">
                        <c:forEach var="genreList" items="${genreList}">
                            <c:if test="${genreList.genre=='연애'}">
                                <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6" style="width: 18%;">
                                    <div class="properties pb-30">
                                        <div class="properties-card">
                                            <div class="properties-img">
                                                <a href="/${genreList.bookId}"><img
                                                        src="files/${genreList.fileName}"
                                                        alt=""
                                                        style="    height: 200px; object-fit: cover;"></a>
                                            </div>
                                            <div class="properties-caption properties-caption2">
                                                <h6><strong><a href="book-details.html">${genreList.bookName}</a></strong></h6>

                                                <p>J. R Rain</p>
                                                <div class="properties-footer d-flex justify-content-between align-items-center">
                                                    <div class="review">
                                                        <div class="rating">
                                                            <c:if test="${genreList.grade==0}">


                                                            </c:if>

                                                            <c:if test="${genreList.grade==1}">

                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==2}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==3}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==4}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>


                                                                <%--                                                        <c:forEach var="reviewGrade" items="${reviewGrade}"></c:forEach>--%>
                                                            <c:if test="${genreList.grade==5}">
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                            </c:if>
                                                        </div>
                                                        <div>
                                                            <p style="color: black;">(${genreList.reviewId} Review)</p>
                                                        </div>
                                                        <div class="price">
                                                            <strong style="color: red;">${genreList.price}원</strong>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:if>
                        </c:forEach>


                    </div>
                </div>


                <div class="tab-pane fade" id="nav-6" role="tabpanel" aria-labelledby="nav-6-tab">
                    <!-- Tab 2 -->
                    <div class="row">
                        <c:forEach var="genreList" items="${genreList}">
                            <c:if test="${genreList.genre=='공포'}">
                                <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6" style="width: 18%;">
                                    <div class="properties pb-30">
                                        <div class="properties-card">
                                            <div class="properties-img">
                                                <a href="/${genreList.bookId}"><img
                                                        src="files/${genreList.fileName}"
                                                        alt=""
                                                        style="    height: 200px; object-fit: cover;"></a>
                                            </div>
                                            <div class="properties-caption properties-caption2">
                                                <h6><strong><a href="book-details.html">${genreList.bookName}</a></strong></h6>

                                                <p>J. R Rain</p>
                                                <div class="properties-footer d-flex justify-content-between align-items-center">
                                                    <div class="review">
                                                        <div class="rating">
                                                            <c:if test="${genreList.grade==0}">


                                                            </c:if>

                                                            <c:if test="${genreList.grade==1}">

                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==2}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==3}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==4}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>


                                                                <%--                                                        <c:forEach var="reviewGrade" items="${reviewGrade}"></c:forEach>--%>
                                                            <c:if test="${genreList.grade==5}">
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                            </c:if>
                                                        </div>
                                                        <div>
                                                            <p style="color: black;">(${genreList.reviewId} Review)</p>
                                                        </div>
                                                        <div class="price">
                                                            <strong style="color: red;">${genreList.price}원</strong>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:if>
                        </c:forEach>


                    </div>
                </div>



                <div class="tab-pane fade" id="nav-7" role="tabpanel" aria-labelledby="nav-7-tab">
                    <!-- Tab 2 -->
                    <div class="row">
                        <c:forEach var="genreList" items="${genreList}">
                            <c:if test="${genreList.genre=='인문학'}">
                                <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6" style="width: 18%;">

                                <div class="properties pb-30">
                                        <div class="properties-card">
                                            <div class="properties-img">
                                                <a href="/${genreList.bookId}"><img
                                                        src="files/${genreList.fileName}"
                                                        alt=""
                                                        style="    height: 200px; object-fit: cover;"></a>
                                            </div>
                                            <div class="properties-caption properties-caption2">
                                                <h6><strong><a href="book-details.html">${genreList.bookName}</a></strong></h6>
                                                <p>J. R Rain</p>
                                                <div class="properties-footer d-flex justify-content-between align-items-center">
                                                    <div class="review">
                                                        <div class="rating">
                                                            <c:if test="${genreList.grade==0}">


                                                            </c:if>

                                                            <c:if test="${genreList.grade==1}">

                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==2}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==3}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==4}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>


                                                                <%--                                                        <c:forEach var="reviewGrade" items="${reviewGrade}"></c:forEach>--%>
                                                            <c:if test="${genreList.grade==5}">
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                            </c:if>
                                                        </div>
                                                        <div>
                                                            <p style="color: black;">(${genreList.reviewId} Review)</p>
                                                        </div>
                                                        <div class="price">
                                                            <strong style="color: red;">${genreList.price}원</strong>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:if>
                        </c:forEach>


                    </div>
                </div>



                <div class="tab-pane fade" id="nav-8" role="tabpanel" aria-labelledby="nav-8-tab">
                    <!-- Tab 2 -->
                    <div class="row">
                        <c:forEach var="genreList" items="${genreList}">
                            <c:if test="${genreList.genre=='어린이'}">
                                <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6" style="width: 18%;">
                                    <div class="properties pb-30">
                                        <div class="properties-card">
                                            <div class="properties-img">
                                                <a href="/${genreList.bookId}"><img
                                                        src="files/${genreList.fileName}"
                                                        alt=""
                                                        style="    height: 200px; object-fit: cover;"></a>
                                            </div>
                                            <div class="properties-caption properties-caption2">

                                                <h6><strong><a href="book-details.html">${genreList.bookName}</a></strong></h6>
                                                <p>J. R Rain</p>
                                                <div class="properties-footer d-flex justify-content-between align-items-center">
                                                    <div class="review">
                                                        <div class="rating">
                                                            <c:if test="${genreList.grade==0}">


                                                            </c:if>

                                                            <c:if test="${genreList.grade==1}">

                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==2}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==3}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==4}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>


                                                                <%--                                                        <c:forEach var="reviewGrade" items="${reviewGrade}"></c:forEach>--%>
                                                            <c:if test="${genreList.grade==5}">
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                            </c:if>
                                                        </div>

                                                        <p style="color: black;">(${genreList.reviewId} Review)</p>


                                                        <div class="price">
                                                            <strong style="color: red;">${genreList.price}원</strong>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:if>
                        </c:forEach>


                    </div>
                </div>


                <div class="tab-pane fade" id="nav-9" role="tabpanel" aria-labelledby="nav-9-tab">
                    <!-- Tab 2 -->
                    <div class="row">
                        <c:forEach var="genreList" items="${genreList}">
                            <c:if test="${genreList.genre=='자서전'}">
                                <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6" style="width: 18%;">

                                <div class="properties pb-30">
                                        <div class="properties-card">
                                            <div class="properties-img">
                                                <a href="/${genreList.bookId}"><img
                                                        src="files/${genreList.fileName}"
                                                        alt=""
                                                        style="    height: 200px; object-fit: cover;"></a>
                                            </div>
                                            <div class="properties-caption properties-caption2">
                                                <h6><strong><a href="book-details.html">${genreList.bookName}</a></strong></h6>
                                                <p>J. R Rain</p>
                                                <div class="properties-footer d-flex justify-content-between align-items-center">
                                                    <div class="review">
                                                        <div class="rating">
                                                            <c:if test="${genreList.grade==0}">


                                                            </c:if>

                                                            <c:if test="${genreList.grade==1}">

                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==2}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==3}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==4}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>


                                                                <%--                                                        <c:forEach var="reviewGrade" items="${reviewGrade}"></c:forEach>--%>
                                                            <c:if test="${genreList.grade==5}">
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                            </c:if>
                                                        </div>

                                                        <p style="color: black;">(${genreList.reviewId} Review)</p>


                                                        <div class="price">
                                                            <strong style="color: red;">${genreList.price}원</strong>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:if>
                        </c:forEach>


                    </div>
                </div>


                <div class="tab-pane fade" id="nav-10" role="tabpanel" aria-labelledby="nav-10-tab">
                    <!-- Tab 2 -->
                    <div class="row">
                        <c:forEach var="genreList" items="${genreList}">
                            <c:if test="${genreList.genre=='잡지'}">
                                <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6" style="width: 18%;">
                                    <div class="properties pb-30">
                                        <div class="properties-card">
                                            <div class="properties-img">
                                                <a href="/${genreList.bookId}"><img
                                                        src="files/${genreList.fileName}"
                                                        alt=""
                                                        style="    height: 200px; object-fit: cover;"></a>
                                            </div>
                                            <div class="properties-caption properties-caption2">
                                                <h6><strong><a href="book-details.html">${genreList.bookName}</a></strong></h6>
                                                <p>J. R Rain</p>
                                                <div class="properties-footer d-flex justify-content-between align-items-center">
                                                    <div class="review">
                                                        <div class="rating">
                                                            <c:if test="${genreList.grade==0}">


                                                            </c:if>

                                                            <c:if test="${genreList.grade==1}">

                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==2}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==3}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==4}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>


                                                                <%--                                                        <c:forEach var="reviewGrade" items="${reviewGrade}"></c:forEach>--%>
                                                            <c:if test="${genreList.grade==5}">
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                            </c:if>
                                                        </div>

                                                        <p style="color: black;">(${genreList.reviewId} Review)</p>


                                                        <div class="price">
                                                            <strong style="color: red;">${genreList.price}원</strong>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:if>
                        </c:forEach>


                    </div>
                </div>


                <div class="tab-pane fade" id="nav-11" role="tabpanel" aria-labelledby="nav-11-tab">
                    <!-- Tab 2 -->
                    <div class="row">
                        <c:forEach var="genreList" items="${genreList}">
                            <c:if test="${genreList.genre=='과학'}">
                                <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6" style="width: 18%;">

                                <div class="properties pb-30">
                                        <div class="properties-card">
                                            <div class="properties-img">
                                                <a href="/${genreList.bookId}"><img
                                                        src="files/${genreList.fileName}"
                                                        alt=""
                                                        style="    height: 200px; object-fit: cover;"></a>
                                            </div>
                                            <div class="properties-caption properties-caption2">
                                                <h6><strong><a href="book-details.html">${genreList.bookName}</a></strong></h6>
                                                <p>J. R Rain</p>
                                                <div class="properties-footer d-flex justify-content-between align-items-center">
                                                    <div class="review">
                                                        <div class="rating">
                                                            <c:if test="${genreList.grade==0}">


                                                            </c:if>

                                                            <c:if test="${genreList.grade==1}">

                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==2}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==3}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==4}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>


                                                                <%--                                                        <c:forEach var="reviewGrade" items="${reviewGrade}"></c:forEach>--%>
                                                            <c:if test="${genreList.grade==5}">
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                            </c:if>
                                                        </div>

                                                        <p style="color: black;">(${genreList.reviewId} Review)</p>


                                                        <div class="price">
                                                            <strong style="color: red;">${genreList.price}원</strong>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:if>
                        </c:forEach>


                    </div>
                </div>


                <div class="tab-pane fade" id="nav-12" role="tabpanel" aria-labelledby="nav-12-tab">
                    <!-- Tab 2 -->
                    <div class="row">
                        <c:forEach var="genreList" items="${genreList}">
                            <c:if test="${genreList.genre=='수학'}">
                                <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6" style="width: 18%;">

                                <div class="properties pb-30">
                                        <div class="properties-card">
                                            <div class="properties-img">
                                                <a href="/${genreList.bookId}"><img
                                                        src="files/${genreList.fileName}"
                                                        alt=""
                                                        style="    height: 200px; object-fit: cover;"></a>
                                            </div>
                                            <div class="properties-caption properties-caption2">
                                                <h6><strong><a href="book-details.html">${genreList.bookName}</a></strong></h6>

                                                <p>J. R Rain</p>
                                                <div class="properties-footer d-flex justify-content-between align-items-center">
                                                    <div class="review">
                                                        <div class="rating">
                                                            <c:if test="${genreList.grade==0}">


                                                            </c:if>

                                                            <c:if test="${genreList.grade==1}">

                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==2}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==3}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==4}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>


                                                                <%--                                                        <c:forEach var="reviewGrade" items="${reviewGrade}"></c:forEach>--%>
                                                            <c:if test="${genreList.grade==5}">
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                            </c:if>
                                                        </div>

                                                        <p style="color: black;">(${genreList.reviewId} Review)</p>


                                                        <div class="price">
                                                            <strong style="color: red;">${genreList.price}원</strong>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:if>
                        </c:forEach>


                    </div>
                </div>


                <div class="tab-pane fade" id="nav-13" role="tabpanel" aria-labelledby="nav-13-tab">
                    <!-- Tab 2 -->
                    <div class="row">
                        <c:forEach var="genreList" items="${genreList}">
                            <c:if test="${genreList.genre=='역사'}">
                                <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6" style="width: 18%;">

                                    <div class="properties pb-30">
                                        <div class="properties-card">
                                            <div class="properties-img">
                                                <a href="/${genreList.bookId}"><img
                                                        src="files/${genreList.fileName}"
                                                        alt=""
                                                        style="    height: 200px; object-fit: cover;"></a>
                                            </div>
                                            <div class="properties-caption properties-caption2">
                                                <h6><strong><a href="book-details.html">${genreList.bookName}</a></strong></h6>

                                                <p>J. R Rain</p>
                                                <div class="properties-footer d-flex justify-content-between align-items-center">
                                                    <div class="review">
                                                        <div class="rating">
                                                            <c:if test="${genreList.grade==0}">


                                                            </c:if>

                                                            <c:if test="${genreList.grade==1}">

                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==2}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==3}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==4}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>


                                                                <%--                                                        <c:forEach var="reviewGrade" items="${reviewGrade}"></c:forEach>--%>
                                                            <c:if test="${genreList.grade==5}">
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                            </c:if>
                                                        </div>

                                                        <p style="color: black;">(${genreList.reviewId} Review)</p>


                                                        <div class="price">
                                                            <strong style="color: red;">${genreList.price}원</strong>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:if>
                        </c:forEach>


                    </div>
                </div>

                <div class="tab-pane fade" id="nav-14" role="tabpanel" aria-labelledby="nav-14-tab">
                    <!-- Tab 2 -->
                    <div class="row">
                        <c:forEach var="genreList" items="${genreList}">
                            <c:if test="${genreList.genre=='에세이'}">
                                <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6" style="width: 18%;">

                                <div class="properties pb-30">
                                        <div class="properties-card">
                                            <div class="properties-img">
                                                <a href="/${genreList.bookId}"><img
                                                        src="files/${genreList.fileName}"
                                                        alt=""
                                                        style="    height: 200px; object-fit: cover;"></a>
                                            </div>
                                            <div class="properties-caption properties-caption2">
                                                <h6><strong><a href="book-details.html">${genreList.bookName}</a></strong></h6>
                                                <p>J. R Rain</p>
                                                <div class="properties-footer d-flex justify-content-between align-items-center">
                                                    <div class="review">
                                                        <div class="rating">
                                                            <c:if test="${genreList.grade==0}">


                                                            </c:if>

                                                            <c:if test="${genreList.grade==1}">

                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==2}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==3}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>

                                                            <c:if test="${genreList.grade==4}">

                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>

                                                            </c:if>


                                                                <%--                                                        <c:forEach var="reviewGrade" items="${reviewGrade}"></c:forEach>--%>
                                                            <c:if test="${genreList.grade==5}">
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                                <i class="fas fa-star" style="color: gold;"></i>
                                                            </c:if>
                                                        </div>

                                                        <p style="color: black;">(${genreList.reviewId} Review)</p>


                                                        <div class="price">
                                                            <strong style="color: red;">${genreList.price}원</strong>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:if>
                        </c:forEach>


                    </div>
                </div>

            <div class="row">
                <div class="col-xl-12">
                    <div class="more-btn text-center mt-15">
                        <a href="#" class="border-btn border-btn2 more-btn2">맨위로</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest-items End -->
    <!-- Want To work -->

</main>

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
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>