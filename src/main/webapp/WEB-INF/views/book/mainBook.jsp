<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

    table, td, th {
        border : 1px solid black;
    }
    th {
        background : #F3F5F5;
    }

    table {
        margin-top : 5%;
        margin-left : auto;
        margin-right: auto;
        text-align: center;
        width: 80%;
    }

    a:link { color: red; text-decoration: none;}
    a:visited { color: black; text-decoration: none;}

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




<body>
<div>
    <table>
        <thead>
        <tr>
            <th>bookId</th>
            <th>bookName</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${fn:length(Alllist) > 0}">
                <c:forEach items="${Alllist}" var="Alllist">
                    <tr>
                        <td>${Alllist.bookId}</td>
                        <td>${Alllist.bookName}</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4">조회된 결과가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>

<!--paginate -->
<div class="paginate">
    <div class="paging">
        <a class="direction prev" href="javascript:void(0);"
           onclick="movePage(1,${pagination.cntPerPage},${pagination.pageSize});">
            &lt;&lt; </a> <a class="direction prev" href="javascript:void(0);"
                             onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
        &lt; </a>

        <c:forEach begin="${pagination.firstPage}"
                   end="${pagination.lastPage}" var="idx">
            <a
                    style="color:<c:out value="${pagination.currentPage == idx ? '#cc0000; font-weight:700; margin-bottom: 2px;' : ''}"/> "
                    href="javascript:void(0);"
                    onclick="movePage(${idx},${pagination.cntPerPage},${pagination.pageSize});"><c:out
                    value="${idx}" /></a>
        </c:forEach>
        <a class="direction next" href="javascript:void(0);"
           onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
            &gt; </a> <a class="direction next" href="javascript:void(0);"
                         onclick="movePage(${pagination.totalRecordCount},${pagination.cntPerPage},${pagination.pageSize});">
        &gt;&gt; </a>
    </div>
</div>
<!-- /paginate -->






</body>

<script>
    //10,20,30개씩 selectBox 클릭 이벤트
    function changeSelectBox(currentPage, cntPerPage, pageSize){
        var selectValue = $("#cntSelectBox").children("option:selected").val();
        movePage(currentPage, selectValue, pageSize);

    }

    //페이지 이동
    function movePage(currentPage, cntPerPage, pageSize){

        var url = "${pageContext.request.contextPath}/bookMain";
        url = url + "?currentPage="+currentPage;
        url = url + "&cntPerPage="+cntPerPage;
        url = url + "&pageSize="+pageSize;

        location.href=url;
    }

</script>




<jsp:include page="../main/footer.jsp"></jsp:include>
<!-- Scroll Up -->
<div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<script>


    var slider = document.getElementById("myRange");
    var output = document.getElementById("value");
    output.innerHTML = slider.value;

    slider.oninput = function() {
        output.innerHTML = this.value;
    }


    $('#myRange').change(function () {

        $.ajax({

            type: 'POST',
            url: '/priceRange',
            data: {"price": $('#myRange').val(),


            },
            dataType: 'text',

            success: function(price) {







            },
            error: function(a, b, c) {
                alert('실패');
                console.log(a, b, c);
            }

        });


    });


    $('#genre').change(function () {

        $.ajax({

            type: 'POST',
            url: '/genreChoice',
            data: {"choice": $('#genre').val(),


            },
            dataType: 'text',

            success: function(choice) {


                    if(choice =='전체'){

                        location.href='/bookMain';


                    }


                if(choice =='수필'){

                    location.href='/genre?choice=' + '수필';


                }
                if(choice =='공포'){



                    location.href='/genre?choice=' + '공포';



                }

                if(choice =='연애'){


                    location.href='/genre?choice=' + '연애';



                }

                if(choice =='코미디'){


                    location.href='/genre?choice=' + '코미디';



                }

                if(choice =='소설'){


                    location.href='/genre?choice=' + '소설';



                }

            },
            error: function(a, b, c) {
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