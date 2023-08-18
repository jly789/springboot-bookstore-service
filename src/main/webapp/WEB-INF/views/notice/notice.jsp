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

                  <a class="nav-link active" id="nav-one-tab" data-bs-toggle="tab" href="#nav-one"
                     role="tab" aria-controls="nav-one" aria-selected="true">공지사항</a>

                  <a class="nav-link" id="nav-three-tab" data-bs-toggle="tab" href="#nav-three" role="tab" aria-controls="nav-three" aria-selected="false">리뷰</a>

                  <a class="nav-link" href="/noticeAdd">공지등록</a>

                </div>
              </nav>
            </c:if>

            <c:if test="${userId !='admin'}">
              <nav>
                <div class="nav nav-tabs " id="nav-tab" role="tablist">

                  <a class="nav-link active" id="nav-one-tab" data-bs-toggle="tab" href="#nav-one"
                     role="tab" aria-controls="nav-one" aria-selected="true">공지사항</a>

                  <a class="nav-link" id="nav-three-tab" data-bs-toggle="tab" href="#nav-three" role="tab" aria-controls="nav-three" aria-selected="false">리뷰</a>



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
          <div class="container">
            <div class="cart_inner">
              <div class="table-responsive">
                <table class="table">
                  <thead>
                  <tr>
                    <th scope="col">공지번호</th>
                    <th scope="col">공지상태</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성날짜</th>
                  </tr>
                  </thead>
                  <tbody>

                  <c:if test="${noticeList !=null}">
                  <c:forEach var="noticeList" items="${noticeList}">

                  <tr>
                    <td>
                      <div class="media">

                        <div class="media-body">
                         ${noticeList.noticeId}

                        </div>
                      </div>
                    </td>

                    <c:if test="${noticeList.noticeType=='중요'}">
                    <td>
                      <h5 style="color: red;"><strong>${noticeList.noticeType}</strong></h5>

                    </td>
                    </c:if>

                    <c:if test="${noticeList.noticeType=='공지'}">
                    <td>
                      <h5 style="color: black;"><strong>${noticeList.noticeType}</strong></h5>

                    </td>
                    </c:if>

                    <td>
                     <strong><a style="color: black" href="/noticeDetail?noticeId=${noticeList.noticeId}">${noticeList.noticeSubject}</a></strong>

                    </td>


                    <td style="color:black">


                     ${noticeList.userId}<br/>


                    </td>

                    <td style="">


                        ${noticeList.noticeWriterDate}<br/>


                    </td>



                    </c:forEach>

                    </c:if>


                  </tr>
                  </tbody>

                </table>














  </section>



        <!-- Hero area Start-->




    <!--  Hero area End -->
    <!--================Cart Area =================-->

  <!--================End Cart Area =================-->
</main>

<script>


  $("#nav-one-tab").click(function (){
    location.href = '/notice';
    return;
  });

  $("#nav-three-tab").click(function (){
    location.href = '/noticeReview';
    return;
  });



</script>



<jsp:include page="../main/footer.jsp"></jsp:include>
<!-- Scroll Up -->
<div id="back-top" >
  <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<!-- JS here -->
<!-- Jquery, Popper, Bootstrap -->


</body>
</html>

