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
	                
	                <!--  수정 시작  -->
	                <div class="card-body">
					<div class="tab-content text-center">

						


						<!---------- 테이블 시작  ------------------>

						<div class="table-responsive">
							<table class="table">
								<thead class=" text">
						<!---------- 이번주의 인기글 ------------------>
								<tr>
								<td colspan="3" style="text-align:left">
									<h4>이번주의 인기글</h4>
									</td>
								</tr>
								<tr>
									<td>
										<div class="card card-nav-tabs col-xs-4"
											style="width: 10rem;">
											<div class="card-body">
												<h4 class="card-title">이번주 인기글1</h4>
												<p class="card-text">배고프다.</p>
											</div>
										</div>
									</td>
									<td>
										<div class="card card-nav-tabs col-xs-4"
											style="width: 10rem;">
											<div class="card-body">
												<h4 class="card-title">이번주 인기글2</h4>
												<p class="card-text">배고프다.</p>
											</div>
										</div>
									</td>
									<td>
										<div class="card card-nav-tabs col-xs-4"
											style="width: 10rem;">
											<div class="card-body">
												<h4 class="card-title">이번주 인기글3</h4>
												<p class="card-text">배고프다.</p>
											</div>
										</div>
									</td>
									<td>
										<div class="card card-nav-tabs col-xs-4"
											style="width: 10rem;">
											<div class="card-body">
												<h4 class="card-title">이번주 인기글4</h4>
												<p class="card-text">배고프다.</p>
											</div>
										</div>
									</td>
								</tr>
							<!---------- 이번주의 인기글 끝 ------------------>	
							<!---------- 후원게시판 시작  ------------------>		
									<tr>
									<td colspan="3" style="text-align:left">
										<h4>후원 게시판</h4>
										</td>
									</tr>
									<tr>
										<td>
											<div class="card card-nav-tabs col-xs-4"
												style="width: 10rem;">
												<div class="card-body">
													<h4 class="card-title">후원 게시글1</h4>
													<p class="card-text">관심과 사랑을 주세요.</p>
												</div>
												<button class="btn btn-rose btn-sm" onclick="javascript:;">후원하기😛</button>
											</div>
										</td>
										<td>
											<div class="card card-nav-tabs col-xs-4"
												style="width: 10rem;">
												<div class="card-body">
													<h4 class="card-title">후원 게시글2</h4>
													<p class="card-text">관심과 사랑을 주세요.</p>
												</div>
												<button class="btn btn-rose btn-sm" onclick="javascript:;">후원하기😛</button>
											</div>
										</td>
										<td>
											<div class="card card-nav-tabs col-xs-4"
												style="width: 10rem;">
												<div class="card-body">
													<h4 class="card-title">후원 게시글3</h4>
													<p class="card-text">관심과 사랑을 주세요.</p>
												</div>
												<button class="btn btn-rose btn-sm" onclick="javascript:;">후원하기😛</button>
											</div>
										</td>
										<td>
											<div class="card card-nav-tabs col-xs-4"
												style="width: 10rem;">
												<div class="card-body">
													<h4 class="card-title">후원 게시글4</h4>
													<p class="card-text">관심과 사랑을 주세요.</p>
												</div>
												<button class="btn btn-rose btn-sm" onclick="javascript:;">후원하기😛</button>
											</div>
										</td>
									</tr>
									<!---------- 후원글 끝 	 ------------------>
									
								</thead>

							</table>

						</div>



					</div>

				</div>
				<!-- 수정 끝 -->
	              </div>
	            </div>
	          </div> <!-- section end  -->
            <div align="center">							
		</div>
      </div> <!-- carousel end -->
    </div> <!-- side_overlay end -->
    
	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>


</html>