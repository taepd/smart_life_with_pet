<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	          
	     <!-- 이번 주의 인기글 -->    
	     <div class="row">
				<div class="col-lg-12">
					<div class="main-card">
			        	<h3 class="h3-korean">이번주의 인기글</h3>
							<c:forEach var="post" items="${postList}" varStatus="status">
								<div class="card col-4">
					        		<div class="card-body text-center">
									<a href="${pageContext.request.contextPath}/blog/detail.bit?bindex=${post.bindex}">
					        		<img class="card-img-top" id="p${status.index}" src="${pageContext.request.contextPath}/assets/images/pet_profile.jpg" 
					        					style="width:200px;height:200px" alt="card image">
					        					<hr>
												<strong>${post.title}</strong>
												<br>
												<span id="contentp${status.index}">${post.content}</span>
									</a>
									</div>
								</div>
							</c:forEach>
					</div>
				</div>
			</div>

	        <!-- 후원글 -->
	       	<div class="row">
	       		<div class="col-12">
		       		<div class="main-card">
		        		<h3 class="h3-korean">도움이 필요해요</h3>
						<c:forEach var="donation" items="${donationList}" varStatus="status">
							<div class="card col-4">
				        		<div class="card-body text-center">
									<a href="${pageContext.request.contextPath}/donation/detail.bit?dindex=${donation.dindex}">
					        		<img class="card-img-top" id="d${status.index}" src="${pageContext.request.contextPath}/assets/images/pet_profile.jpg" 
					        					style="width:200px;height:200px" alt="card image">
					        					<hr>
												<strong>${donation.title}</strong>
												<br>
												<span id="contentd${status.index}">${donation.content}</span>
									</a>
									</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

      
    	</div> <!-- side_overlay end -->
    </div> <!-- container end -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>
<script>
$(function () {

		//블로그 이미지 위치 조정 함수
		replaceImg_post('p');
		replaceImg_donation('d');
		shortContent();	
});

/**
* @함수명 : replaceImg()
* @작성일 : 2020. 7. 17.
* @작성자 : 태영돈
* @설명 :이미지 위치 디자인(조정/삭제)을 위한 함수
* @param void
**/

function replaceImg_post(list){ 
	for(var i =0; i<${fn:length(postList)}; i++){ //현재 페이지 포스팅 갯수만큼 for문
	    var imgs = $('#content'+list+i+' img'); //포스팅 내용 중 img 태그를 찾아서 배열로 저장
	    var imgSrcs = [];
	    for (var j = 0; j < imgs.length; j++) { //img 개수만큼 for문
	        imgSrcs.push(imgs[j].src); //src값 즉, 이미지 경로를 imgSrcs배열에 저장
			console.log(imgs[j]);    
			imgs[j].parentNode.removeChild(imgs[j]);//기존 내용 중 img태그들은 미리보기시 지저분하므로 삭제
			  
	    }
		console.log("imgSrcs: "+ imgSrcs[0]);
		$('#'+list+i+'').attr("src", imgSrcs[0]); //블로그 리스트 오른쪽 썸네일 영역에 올린 이미지 중 첫 번째 사진 표시
	}
} 

function replaceImg_donation(list){ 
	for(var i =0; i<${fn:length(postList)}; i++){ //현재 페이지 포스팅 갯수만큼 for문
	    var imgs = $('#content'+list+i+' img'); //포스팅 내용 중 img 태그를 찾아서 배열로 저장
	    var imgSrcs = [];
	    for (var j = 0; j < imgs.length; j++) { //img 개수만큼 for문
	        imgSrcs.push(imgs[j].src); //src값 즉, 이미지 경로를 imgSrcs배열에 저장
			console.log(imgs[j]);    
			imgs[j].parentNode.removeChild(imgs[j]);//기존 내용 중 img태그들은 미리보기시 지저분하므로 삭제
			  
	    }
		console.log("imgSrcs: "+ imgSrcs[0]);
		$('#'+list+i+'').attr("src", imgSrcs[0]); //블로그 리스트 오른쪽 썸네일 영역에 올린 이미지 중 첫 번째 사진 표시
	}
} 

//포스팅 내용의 일부만 노출시키는 함수
function shortContent(){
	for(var i =0; i<${fn:length(postList)}; i++){ 
		$('#content'+i+'').text($('#content'+i+'').text().substring(0,30));
	}
}



</script>
</html>