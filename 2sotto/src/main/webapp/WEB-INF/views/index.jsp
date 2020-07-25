<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>	

    <title>슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
     <style>
     
     	h1, h2, h3, h4, h5, h6, #index-paragraph {
     		font-family: 'Noto Serif KR', serif;
     	}
     	
     	#index-paragraph {
     		font-size: 37px;
     		color: #9A9A9A;
     		line-height: 1.4;
     	}
     	
     	#index-title {
     		margin-bottom: 24px;
     	}
     	
     	
     	
     	
     </style>
    
</head>

<body>

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>

	<div class="container">
		<div class="side_overlay">
			<div class="row">
	    	 	<div class="col-lg-9">
					<h1 id="index-title">내 반려동물을 더 사랑하는 방법</h1>
					<p id="index-paragraph">
		    	 		아아아ㅏ 뭐라고 쓰지<br>
		    	 		슬기로운 반려생활이 당신을 도울게요.<br>
					</p>
	    	 	</div>
	    	 	<div class="col"></div>
    	 	</div>
			<div class="row">
	        	<div class="section" id="carousel">
	              <div class="col-md-12 mr-auto ml-auto">
	                <!-- Carousel Card -->
	                <div class="card card-raised card-carousel" style="height: 300px;">
	                  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="3000">
	                    <ol class="carousel-indicators">
	                      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	                      <li data-target="#carouselExampleIndicators" data-slide-to="1" class=""></li>
	                      <!-- <li data-target="#carouselExampleIndicators" data-slide-to="2" class=""></li> -->
	                    </ol>
	                    <div class="carousel-inner">
	                      <div class="carousel-item">
	                        <img class="d-block w-100" src="./assets/img/ca1.png" alt="First slide">
	                        <div class="carousel-caption d-none d-md-block">
	                          <!-- <h4>
	                            <i class="material-icons">location_on</i>
	                            Yellowstone National Park, United States
	                          </h4> -->
	                        </div>
	                      </div>
	                      <div class="carousel-item active">
	                        <img class="d-block w-100" src="./assets/img/ca2.png" alt="Second slide">
	                        <div class="carousel-caption d-none d-md-block">
	                          <!-- <h4>
	                            <i class="material-icons">location_on</i>
	                            Somewhere Beyond, United States
	                          </h4> -->
	                        </div>
	                      </div>
	                      <!--
	                      <div class="carousel-item">
	                        <img class="d-block w-100" src="./assets/img/bg.jpg" alt="Third slide">
	                        <div class="carousel-caption d-none d-md-block">
	                        </div>
	                      </div>
	                        -->
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
	            </div> <!-- row end -->
	          </div> <!-- section end  -->
	          
	          
	          <div class="row">
	            	
	            	이번주의 인기글
	            
	            </div>
	            <div class="row">
	            	
	            	도움이 필요해요
	            
	            </div>
	            
            <div align="center">							
		</div>
      </div> <!-- carousel end -->
    </div> <!-- side_overlay end -->
    
	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>


</html>