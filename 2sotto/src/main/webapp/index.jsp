<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
    
</head>

<body>

    <%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
       
    	<div class="container">
    	 <div class="side_overlay">
	        <div class="section" id="carousel">
	            <div class="row">
	              <div class="col-md-10 mr-auto ml-auto">
	                <!-- Carousel Card -->
	                <div class="card card-raised card-carousel">
	                  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="3000">
	                    <ol class="carousel-indicators">
	                      <li data-target="#carouselExampleIndicators" data-slide-to="0" class=""></li>
	                      <li data-target="#carouselExampleIndicators" data-slide-to="1" class="active"></li>
	                      <li data-target="#carouselExampleIndicators" data-slide-to="2" class=""></li>
	                    </ol>
	                    <div class="carousel-inner">
	                      <div class="carousel-item">
	                        <img class="d-block w-100" src="./assets/img/bg2.jpg" alt="First slide">
	                        <div class="carousel-caption d-none d-md-block">
	                          <!-- <h4>
	                            <i class="material-icons">location_on</i>
	                            Yellowstone National Park, United States
	                          </h4> -->
	                        </div>
	                      </div>
	                      <div class="carousel-item active">
	                        <img class="d-block w-100" src="./assets/img/bg3.jpg" alt="Second slide">
	                        <div class="carousel-caption d-none d-md-block">
	                          <!-- <h4>
	                            <i class="material-icons">location_on</i>
	                            Somewhere Beyond, United States
	                          </h4> -->
	                        </div>
	                      </div>
	                      <div class="carousel-item">
	                        <img class="d-block w-100" src="./assets/img/bg.jpg" alt="Third slide">
	                        <div class="carousel-caption d-none d-md-block">
	                         <!--  <h4>
	                            <i class="material-icons">location_on</i>
	                            Yellowstone National Park, United States
	                          </h4> -->
	                        </div>
	                      </div>
	                    </div>
	                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	                      <i class="material-icons">keyboard_arrow_left</i>
	                      <span class="sr-only">Previous</span>
	                    </a>
	                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	                      <i class="material-icons">keyboard_arrow_right</i>
	                      <span class="sr-only">Next</span>
	                    </a>
	                  </div>
	                </div>
	                <!-- End Carousel Card -->
	              </div>
	            </div>
	          </div> <!-- section end  -->
            <div class="row">
                text area 여기는 인덱스 화면
            </div>
            <div align="center">
				<button type="button" onclick="location.href='login.bit'">로그인 화면 가기</button>
				<button type="button" onclick="location.href='register.bit'">회원가입 화면 가기</button>
				<button type="button" onclick="location.href='adminMain.bit'">어드민보러가기</button>
	</div>
        </div> <!-- carousel end -->
    </div> <!-- side_overlay end -->
    
</body>

</html>