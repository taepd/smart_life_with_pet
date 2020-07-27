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
     		margin-bottom: 70px;
     	}
     	
     	#index-title {
     		margin-bottom: 24px;
		 }
		 
		.grid-item img {
			display: block;
			min-width: 100%;
			max-width: 100%;
		}

		.grid-sizer, .grid-item {
			/* width: 200px; */
			width: 32%;
		}

		.grid-item {
			/* margin-bottom: 15px; */
			/* overflow: hidden; */
		}
		
		.card {
			margin-top: 10px;
			margin-bottom: 10px;
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
		    	 		사랑을 기록하세요.<br>
		    	 		슬기로운 반려생활이 당신을 도울게요.<br>
					</p>
	    	 	</div>
	    	 	<div class="col"></div>
    	 	</div>
			
	          
	     <!-- 이번 주의 인기글 -->    
	     <!-- <div class="row"> -->
				<!-- <div class="col-lg-12"> -->
					<!-- <h3 class="h3-korean">이번주의 인기글</h3> -->
					<div class="grid">
							<div class="main-card">
								<div class="grid-sizer"></div>
							<c:forEach var="post" items="${postList}" varStatus="status">
								<div class="grid-item">
								<!-- <div class="card col-4"> -->
								<div class="card">
					        		<div class="card-body" style="padding: 20px;">
									<a href="${pageContext.request.contextPath}/blog/detail.bit?bindex=${post.bindex}">
										<img class="card-img-top" id="p${status.index}" src="${pageContext.request.contextPath}/assets/images/pet_profile.jpg" 
												style="width:200px;height:auto" alt="card image">
					        					<hr>
												<h4 class="text-center">${post.title}</h4>
												<span id="contentp${status.index}">
													${post.content}
												</span>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				<!-- </div> -->
			<!-- </div> -->

	        <!-- 후원글 -->
	       	<!-- <div class="row">
	       		<div class="col-12"> -->
	       		<%-- <div class="grid">
		       		<div class="main-card">
		       		<div class="grid-sizer"></div>
		        		<h3 class="h3-korean">도움이 필요해요</h3>
						<c:forEach var="donation" items="${donationList}" varStatus="status">
						<div class="grid-item">
							<div class="card">
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
							</div>
						</c:forEach>
					</div> --%>
				<!-- </div>
			</div> -->

      
    	</div> <!-- side_overlay end -->
    </div> <!-- container end -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>
<script>
$(function () {

		//블로그 이미지 위치 조정 함수
		replaceImg_post('p');
		replaceImg_donation('d');
		shortContent('p');	
		console.log('test');
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
function shortContent(list){
	for(var i =0; i<${fn:length(postList)}; i++){ 
		$('#content'+list+i+'').text($('#content'+list+i+'').text().substring(0,230)+'...');
	}
}

/**
* @함수명 : masonry
* @작성일 : 2020. 7. 27.
* @작성자 : 채현아
* @설명 : Masonry 라이브러리 생성 함수
**/
var masonry = new Masonry('.grid', {
	itemSelector: '.grid-item',
	columnWidth: '.grid-sizer',
	percentPosition: true,
	gutter: 10
});

imagesLoaded( '.grid' ).on( 'progress', function() {
	masonry.layout();
});




</script>
</html>