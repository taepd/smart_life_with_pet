<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
    <style>
    	
    	.heart {
    		color: #F35454;
    		font-size: 16px;
    	}
    	
    	.wrapper {
    		text-align: center;
    		margin: 0 auto;
    		line-height: 100px;
    		
    	}
    	
    	.test {
    		margin-top: 3px; /* h3 margin-bottom과 동일한 값 유지할 것 */
    	}
    	
    	.wrapper img {
    		width: 180px;
    		height: auto;
    		position: absolute;
    		top: 50%;
    		left: 50%;
    		transform: translate(-50%, -50%);
    		
    	}
    	
    	/* .bookmark-area {
    		position: absolute;
    		top: 50%;
    		left: 50%;
    		transform: translate(-50%, -50%);
    		
    	} */
    	
    	h3 {
    		margin-top: 0;
    		margin-bottom: 3px;
    	}
    	
    	.row {
    		margin-top: 100px;
    		margin-bottom: 100px;
    	}
    	
    	.contents {
    		overflow: hidden;
    		height: 108px;
    	}
    	
    	.icon {
    		color: #000000;
    	}
    	
    	.heart-and-comment {
    		height: 17px;
    	}
    	
    	#like-area, #comment-area {
    		display: inline-block;
    		margin-right: 10px;
    		margin-top: 10px;
    	}
    	
    	a:visited, a:link {
	 		color: #000000;
		}
		
		.bookmark {
			color: #FFA200;
			font-size: 30px;
		}
    	
    </style>
</head>
<body>
    
    <%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<div class="side_overlay">
		<div class="container">
			<h3>블로그 즐겨찾기 페이지</h3>
			<a href="#">
				<div class="row">
					<div class="col-1 bookmark-area">
						<span class="bookmark" ><i class="fas fa-bookmark" id="bm1"></i></span>
					</div>
					<div class="col-8">
						<div class="contents">
						<h3>여기는 row - boot 이용 제목 자리</h3>
						포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
							포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
							포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
							여긴 네줄	 
						포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
							포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
							포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
							여긴 네줄	 
						</div>
						<div class="heart-and-comment">
							<div id="like-area">
								<span class="heart"><i class="fas fa-heart"></i></span>
								<span>20</span>
							</div>
							<div id="comment-area">
								<span class="icon"><i class="far fa-comment"></i></span>
								<span>20</span>
							</div>
						</div>
					</div>	
					
					<div class="col-3 test">
						<div class="wrapper">
							<img src="${pageContext.request.contextPath}/images/sample_boon.jpg" alt="">
						</div>
					</div>
				</div>
			</a>
			
			<hr>
			<a href="#">
				<div class="row">
					<div class="col-1 bookmark-area">
						<span class="bookmark" ><i class="fas fa-bookmark" id="bm2"></i></span>
					</div>
					<div class="col-8">
						<div class="contents">
						<h3>여기는 row - boot 이용 제목 자리</h3>
						포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
							포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
							포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
							여긴 네줄	 
						포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
							포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
							포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
							여긴 네줄	 
						</div>
						<div class="heart-and-comment">
							<div id="like-area">
								<span class="heart"><i class="fas fa-heart"></i></span>
								<span>20</span>
							</div>
							<div id="comment-area">
								<span class="icon"><i class="far fa-comment"></i></span>
								<span>20</span>
							</div>
						</div>
					</div>	
					
					<div class="col-3 test">
						<div class="wrapper">
							<img src="${pageContext.request.contextPath}/images/sample_boon.jpg" alt="">
						</div>
					</div>
				</div>
			</a>
			
			
		</div>
	</div>
	
	<%@ include file="/WEB-INF/include/footer.jsp"%>	
</body>
<script>

	$(document).ready(function(){

		 $(".bookmark > i").on('click', function() {

			 /* s=채운거, r=빈거 */
			   if( $(this).hasClass("fas fa-bookmark") ) {
				   $(this).removeClass("fas fa-bookmark").addClass("far fa-bookmark");
				   /* $('a').attr('style', 'display: none'); */

				} else if( $(this).hasClass("far fa-bookmark")) {
					   $(this).removeClass("far fa-bookmark").addClass("fas fa-bookmark");
				}

				return false;
		 });

		 /* 
		 	앞으로 할일
		 	1. <i> 태그에 동적으로 id 부여하기
		 	2. 북마크 풀었을 때 display none + 애니메이션 설정
		 
		  */
			    
	});




	
		
		
		
	



</script>
</html>