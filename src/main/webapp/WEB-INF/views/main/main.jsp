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
                                            <span data-animation="fadeInUp" data-delay=".2s">Science Fiction</span>
                                            <h1 data-animation="fadeInUp" data-delay=".4s">The History<br> of Phipino</h1>
                                            <a href="#" class="btn hero-btn"  data-animation="bounceIn" data-delay=".8s">Browse Store</a>
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
                                            <span data-animation="fadeInUp" data-delay=".2s">Science Fiction</span>
                                            <h1 data-animation="fadeInUp" data-delay=".4s">The History<br> of Phipino</h1>
                                            <a href="#" class="btn hero-btn"  data-animation="bounceIn" data-delay=".8s">Browse Store</a>
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
                                            <span data-animation="fadeInUp" data-delay=".2s">Science Fiction</span>
                                            <h1 data-animation="fadeInUp" data-delay=".4s">The History<br> of Phipino</h1>
                                            <a href="#" class="btn hero-btn"  data-animation="bounceIn" data-delay=".8s">Browse Store</a>
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
                                    <h3>${bestSellerList.bookName}</h3>
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
                                        <div class="price">
                                            <span>${bestSellerList.price}</span>
                                        </div>
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
                    <div class="row">
                        <!-- tittle -->
                        <div class="col-xl-12">
                            <div class="section-tittle d-flex justify-content-between align-items-center mb-40">
                                <h2 class="mb-0">Top5 이주의 도서</h2>

                            </div>
                        </div>
                    </div>
                    <div class="row">
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

                                        <h3 style="color: black;">${weekBook.bookName}</h3>
                                        <p style="color: black;">${weekBook.author}</p>
                                        <div class="price">
                                            <span style="color: black;">${weekBook.price}원</span>
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
                    <div class="google-add">
                        <img src="assets/img/gallery/ad.jpg" alt="" class="w-100">
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
                        <h2>장르별 Top6 도서</h2>
                    </div>
                </div>
                <div class="col-xl-7 col-lg-7 col-md-12">
                    <div class="nav-button mb-40">
                        <!--Nav Button  -->
                        <nav>
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <a class="nav-link active" id="nav-one-tab" data-bs-toggle="tab" href="#nav-one" role="tab" aria-controls="nav-one" aria-selected="true">All</a>
                                <a class="nav-link" id="nav-two-tab" data-bs-toggle="tab" href="#nav-two" role="tab" aria-controls="nav-two" aria-selected="false">공포</a>
                                <a class="nav-link" id="nav-three-tab" data-bs-toggle="tab" href="#nav-three" role="tab" aria-controls="nav-three" aria-selected="false">Thriller</a>
                                <a class="nav-link" id="nav-four-tab" data-bs-toggle="tab" href="#nav-four" role="tab" aria-controls="nav-four" aria-selected="false">Science Fiction</a>
                                <a class="nav-link" id="nav-five-tab" data-bs-toggle="tab" href="#nav-five" role="tab" aria-controls="nav-five" aria-selected="false">History</a>
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
                        <c:forEach var="top5Genre" items="${top5Genre}">
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">

                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling7.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">${top5Genre.bookName}</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
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
                        <c:forEach var="top5Genre" items="${top5Genre}">
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling4.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">${top5Genre.bookName}</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>

                    </div>
                </div>
                <div class="tab-pane fade" id="nav-three" role="tabpanel" aria-labelledby="nav-three-tab">
                    <!-- Tab 3 -->
                    <div class="row">
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling7.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling8.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling6.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling4.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling9.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling2.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="nav-four" role="tabpanel" aria-labelledby="nav-four-tab">
                    <!-- Tab 4 -->
                    <div class="row">
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling9.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling2.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling7.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling8.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling6.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling4.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="nav-five" role="tabpanel" aria-labelledby="nav-five-tab">
                    <!-- Tab 5 -->
                    <div class="row">
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling7.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling8.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling6.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling4.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling9.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="properties pb-30">
                                <div class="properties-card">
                                    <div class="properties-img">
                                        <a href="book-details.html"><img src="assets/img/gallery/best_selling2.jpg" alt=""></a>
                                    </div>
                                    <div class="properties-caption properties-caption2">
                                        <h3><a href="book-details.html">Moon Dance</a></h3>
                                        <p>J. R Rain</p>
                                        <div class="properties-footer d-flex justify-content-between align-items-center">
                                            <div class="review">
                                                <div class="rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <p>(<span>120</span> Review)</p>
                                            </div>
                                            <div class="price">
                                                <span>$50</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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