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
                    <div class="slider-height2 slider-bg4 d-flex align-items-center justify-content-center">
                        <div class="hero-caption hero-caption2">
                            <h2>Book Category</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--  Hero area End -->
    <!-- listing Area Start -->
    <div class="listing-area pt-50 pb-50">
        <div class="container">
            <div class="row">
                <!--? Left content -->
                <div class="col-xl-4 col-lg-4 col-md-6">
                    <!-- Job Category Listing start -->
                    <div class="category-listing mb-50">
                        <!-- single one -->
                        <div class="single-listing">
                            <!-- select-Categories  -->
                            <div class="select-Categories pb-30">
                                <div class="small-tittle mb-20">
                                    <h4>Filter by Genres</h4>
                                </div>
                                <label class="container">History
                                    <input type="checkbox">
                                    <span class="checkmark"></span>
                                </label>
                                <label class="container">Horror - Thriller
                                    <input type="checkbox" checked="checked active">
                                    <span class="checkmark"></span>
                                </label>
                                <label class="container">Love Stories
                                    <input type="checkbox">
                                    <span class="checkmark"></span>
                                </label>
                                <label class="container">Science Fiction
                                    <input type="checkbox">
                                    <span class="checkmark"></span>
                                </label>
                                <label class="container">Biography
                                    <input type="checkbox">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <!-- select-Categories End -->

                            <!-- Range Slider Start -->
                            <aside class="left_widgets p_filter_widgets price_rangs_aside sidebar_box_shadow mb-40">
                                <div class="small-tittle">
                                    <h4>Filter by Price</h4>
                                </div>
                                <div class="widgets_inner">
                                    <div class="range_item">
                                        <input type="text" class="js-range-slider" value="" />
                                        <div class="d-flex align-items-center">

                                            <div class="price_value d-flex justify-content-center">
                                                <input type="text" class="js-input-from" id="amount" readonly />
                                                <span>to</span>
                                                <input type="text" class="js-input-to" id="amount" readonly />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </aside>
                            <!-- range end -->

                            <!-- Select City items start -->
                            <div class="select-job-items2 mb-30">
                                <div class="col-xl-12">
                                    <select name="select2">
                                        <option value="">Filter by Rating</option>
                                        <option value="">5 Star Rating</option>
                                        <option value="">4 Star Rating</option>
                                        <option value="">3 Star Rating</option>
                                        <option value="">2 Star Rating</option>
                                        <option value="">1 Star Rating</option>
                                    </select>
                                </div>
                            </div>
                            <!--  Select City items End-->

                            <!-- select-Categories start -->
                            <div class="select-Categories pt-100 pb-60">
                                <div class="small-tittle mb-20">
                                    <h4>Filter by Publisher</h4>
                                </div>
                                <label class="container">Green Publications
                                    <input type="checkbox">
                                    <span class="checkmark"></span>
                                </label>
                                <label class="container">Anondo Publications
                                    <input type="checkbox" checked="checked active">
                                    <span class="checkmark"></span>
                                </label>
                                <label class="container">Rinku Publications
                                    <input type="checkbox">
                                    <span class="checkmark"></span>
                                </label>
                                <label class="container">Sheba Publications
                                    <input type="checkbox">
                                    <span class="checkmark"></span>
                                </label>
                                <label class="container">Red Publications
                                    <input type="checkbox">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <!-- select-Categories End -->
                            <!-- select-Categories start -->
                            <div class="select-Categories">
                                <div class="small-tittle mb-20">
                                    <h4>Filter by Author Name</h4>
                                </div>
                                <label class="container">Buster Hyman
                                    <input type="checkbox">
                                    <span class="checkmark"></span>
                                </label>
                                <label class="container">Phil Harmonic
                                    <input type="checkbox" checked="checked active">
                                    <span class="checkmark"></span>
                                </label>
                                <label class="container">Cam L. Toe
                                    <input type="checkbox">
                                    <span class="checkmark"></span>
                                </label>
                                <label class="container">Otto Matic
                                    <input type="checkbox">
                                    <span class="checkmark"></span>
                                </label>
                                <label class="container">Juan Annatoo
                                    <input type="checkbox">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
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
                    <div class="best-selling p-0">
                        <div class="row">
                            <c:if test="${bookAndReview !=null}">

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
                                            <h6><a href="/${bookList.bookId}">${bookList.bookName}</a></h6>
                                            <p>${bookList.author}</p>
                                            <div class="properties-footer d-flex justify-content-between align-items-center">
                                                <div class="review">
                                                    <div class="rating">

                                                        <c:if test="${bookList.grade==1}">
                                                            <i class="fas fa-star"></i>
                                                        </c:if>

                                                        <c:if test="${bookList.grade==2}">

                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                        </c:if>

                                                        <c:if test="${bookList.grade==3}">

                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                        </c:if>

                                                        <c:if test="${bookList.grade==4}">

                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                        </c:if>

                                                        <c:if test="${bookList.grade==5}">

                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                        </c:if>

                                                    </div>
                                                    <p>(<span>${bookList.reviewId}</span> Review)</p>
                                                </div>
                                                <div class="price">
                                                    <span id="price">${bookList.price}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>


                            </c:if>

                            <c:if test="${bookAndReviewHighPrice !=null}">
                                <c:forEach var="bookList" items="${bookAndReviewHighPrice}">
                                    <input type="hidden" name="bookId" id="bookId" value="${bookList.bookId}">
                                    <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-12 col-sm-6">
                                        <div class="properties pb-30">
                                            <div class="properties-card">
                                                <div class="properties-img">
                                                    <a href="/${bookList.bookId}"><img src="files/${bookList.fileName}" alt=""
                                                                                       style="    height: 180px; object-fit: cover;"></a>
                                                </div>
                                                <div class="properties-caption properties-caption2">
                                                    <h3><a href="/${bookList.bookId}">${bookList.bookName}</a></h3>
                                                    <p>${bookList.author}</p>
                                                    <div class="properties-footer d-flex justify-content-between align-items-center">
                                                        <div class="review">
                                                            <div class="rating">
                                                                <c:if test="${bookList.grade==1}">
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>

                                                                <c:if test="${bookList.grade==2}">

                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>

                                                                <c:if test="${bookList.grade==3}">

                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>

                                                                <c:if test="${bookList.grade==4}">

                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>

                                                                <c:if test="${bookList.grade==5}">

                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>
                                                            </div>
                                                            <p>(<span>${bookList.reviewId}</span> Review)</p>
                                                        </div>
                                                        <div class="price">
                                                            <span id="price">${bookList.price}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>


                            </c:if>


                            <c:if test="${bookAndReviewLowPrice !=null}">
                                <c:forEach var="bookList" items="${bookAndReviewLowPrice}">
                                    <input type="hidden" name="bookId" id="bookId" value="${bookList.bookId}">
                                    <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-12 col-sm-6">
                                        <div class="properties pb-30">
                                            <div class="properties-card">
                                                <div class="properties-img">
                                                    <a href="/${bookList.bookId}"><img src="files/${bookList.fileName}" alt=""
                                                                                       style="    height: 180px; object-fit: cover;"></a>
                                                </div>
                                                <div class="properties-caption properties-caption2">
                                                    <h3><a href="/${bookList.bookId}">${bookList.bookName}</a></h3>
                                                    <p>${bookList.author}</p>
                                                    <div class="properties-footer d-flex justify-content-between align-items-center">
                                                        <div class="review">
                                                            <div class="rating">
                                                                <c:if test="${bookList.grade==1}">
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>

                                                                <c:if test="${bookList.grade==2}">

                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>

                                                                <c:if test="${bookList.grade==3}">

                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>

                                                                <c:if test="${bookList.grade==4}">

                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>

                                                                <c:if test="${bookList.grade==5}">

                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>
                                                            </div>
                                                            <p>(<span>${bookList.reviewId}</span> Review)</p>
                                                        </div>
                                                        <div class="price">
                                                            <span id="price">${bookList.price}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>


                            </c:if>



                            <c:if test="${bookManyOrder !=null}">
                                <c:forEach var="bookList" items="${bookManyOrder}">
                                    <input type="hidden" name="bookId" id="bookId" value="${bookList.bookId}">
                                    <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-12 col-sm-6">
                                        <div class="properties pb-30">
                                            <div class="properties-card">
                                                <div class="properties-img">
                                                    <a href="/${bookList.bookId}"><img src="files/${bookList.fileName}" alt=""
                                                                                       style="    height: 180px; object-fit: cover;"></a>
                                                </div>
                                                <div class="properties-caption properties-caption2">
                                                    <h3><a href="/${bookList.bookId}">${bookList.bookName}</a></h3>
                                                    <p>${bookList.author}</p>
                                                    <div class="properties-footer d-flex justify-content-between align-items-center">
                                                        <div class="review">
                                                            <div class="rating">
                                                                <c:if test="${bookList.grade==1}">
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>

                                                                <c:if test="${bookList.grade==2}">

                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>

                                                                <c:if test="${bookList.grade==3}">

                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>

                                                                <c:if test="${bookList.grade==4}">

                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>

                                                                <c:if test="${bookList.grade==5}">

                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>
                                                            </div>
<%--                                                            <p>(<span>${bookList.reviewId}</span> Review)</p>--%>
                                                        </div>
                                                        <div class="price">
                                                            <span id="price">${bookList.price}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>


                            </c:if>

                            <c:if test="${bookManyReview !=null}">
                                <c:forEach var="bookList" items="${bookManyReview}">
                                    <input type="hidden" name="bookId" id="bookId" value="${bookList.bookId}">
                                    <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-12 col-sm-6">
                                        <div class="properties pb-30">
                                            <div class="properties-card">
                                                <div class="properties-img">
                                                    <a href="/${bookList.bookId}"><img src="files/${bookList.fileName}" alt=""
                                                                                       style="    height: 180px; object-fit: cover;"></a>
                                                </div>
                                                <div class="properties-caption properties-caption2">
                                                    <h3><a href="/${bookList.bookId}">${bookList.bookName}</a></h3>
                                                    <p>${bookList.author}</p>
                                                    <div class="properties-footer d-flex justify-content-between align-items-center">
                                                        <div class="review">
                                                            <div class="rating">
                                                                <c:if test="${bookList.grade==1}">
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>

                                                                <c:if test="${bookList.grade==2}">

                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>

                                                                <c:if test="${bookList.grade==3}">

                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>

                                                                <c:if test="${bookList.grade==4}">

                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>

                                                                <c:if test="${bookList.grade==5}">

                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </c:if>
                                                            </div>
                                                            <p>(<span>${bookList.reviewId}</span> Review)</p>
                                                        </div>
                                                        <div class="price">
                                                            <span id="price">${bookList.price}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>


                            </c:if>



                            <!-- button -->
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="more-btn text-center mt-15">
                                <a href="#" class="border-btn border-btn2 more-btn2">Browse More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- listing-area Area End -->

    <!-- Subscribe Area Start -->
    <section class="subscribe-area" >
        <div class="container">
            <div class="subscribe-caption text-center  subscribe-padding section-img2-bg" data-background="assets/img/gallery/section-bg1.jpg">
                <div class="row justify-content-center">

                    <div class="col-xl-6 col-lg-8 col-md-9">
                        <h3>Join Newsletter</h3>
                        <p>Lorem started its journey with cast iron (CI) products in 1980. The initial main objective was to ensure pure water and affordable irrigation.</p>
                        <form action="#">
                            <input type="text" placeholder="Enter your email">
                            <button class="subscribe-btn">Subscribe</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Subscribe Area End -->
</main>
<jsp:include page="../main/footer.jsp"></jsp:include>
<!-- Scroll Up -->
<div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<script>

    $('#choice').change(function () {
        let price = 0;
        let url = "";
        $.ajax({

            type: 'POST',
            url: '/choiceResult',
            data: {"choice": $('#choice').val(),

            },
            dataType: 'text',

            success: function(choice) {

                if(choice =='all'){


                    location.href='/sort?abc=' + 0;



                }


                if(choice =='highPrice'){


                    location.href='/sort?abc=' + 1;



                }
                if(choice =='lowPrice'){

                    location.href='/sort?abc=' + 2;
                }

                if(choice =='manyOrders'){

                    location.href='/sort?abc=' + 3;
                }

                if(choice =='manyReview'){

                    location.href='/sort?abc=' + 4;
                }


            },
            error: function(a, b, c) {
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