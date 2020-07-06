<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>	

    <title>슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
    <style>
    
    	
    	/* .img_thumb {
    		position: absolute;
    		overflow: hidden;
    		right: 0;
    		/* float: right; */
    		/* top: 0;
    	}
    	
    	.wrap_sub_content {
    		width: 80%;
    		overflow: hidden;
    		height: 120px;
    	}
    	
    	.article_list_wrapper {
    	
    	}
    	
    	.article_list {
    		position: relative;
    		margin: 0 auto;
    		box-sizing: border-box;
    		list-style: none;
    		padding-left: 0;
    	}
    	
    	
    	
    	.each_article {
    		position: relative;
    	} */
    	.heart {
    		color: #F35454;
    		font-size: 27px;
    	}
    	
    	table, tbody, thead, tr, td {
    		border-collapse: collapse;
    		border: 1px solid black;
    	}
    	
    	.wrapper {
    		text-align: center;
    		margin: 0 auto;
    		line-height: 100px;
    		
    	}
    	
    	.test {
    		margin-top: 3px; /* h3 margin-bottom과 동일한 값 유지할 것 */
    	}
    	
    	.wrapper img, .wrapper .heart {
    		width: 200px;
    		height: auto;
    		/* vertical-align: middle; */
    		position: absolute;
    		top: 50%;
    		left: 50%;
    		transform: translate(-50%, -50%);
    		
    	}
    	
    	h3 {
    		margin-top: 0;
    		margin-bottom: 3px;
    	}
    	
    	.row {
    		margin-top: 100px;
    		margin-bottom: 100px;
    	}
    	
    	
    	
    	
    	
    </style>
</head>
<body>
    
    <%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<div class="side_overlay">
		<div class="container">
			
			<h3>블로그  페이지</h3>
			<button type="button" onclick="location.href='detail.bit'">블로그 상세 페이지</button>
			<button type="button" onclick="location.href='write.bit'">블로그 글쓰기</button>
			<button type="button" onclick="location.href='favorite.bit'">블로그 즐겨찾기</button>
			<br>
			<br>
			
			<hr>
			<!-- <span class="heart"><i class="fas fa-heart"></i></span> 채운 하트 -->
			<div class="row">
				<div class="col-1">
					<div class="wrapper">
					<span class="heart"><i class="far fa-heart"></i></span> <!-- 빈 하트 -->
					</div>
				</div>
				<div class="col-8">
					<h3>여기는 row - boot 이용 제목 자리</h3>
					포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
						포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
						포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
						여긴 네줄	 
				</div>
				<div class="col-3 test">
					<div class="wrapper">
						<img src="${pageContext.request.contextPath}/images/sample_boon.jpg" alt="">
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-1">
					<div class="wrapper">
					<span class="heart"><i class="far fa-heart"></i></span> <!-- 빈 하트 -->
					</div>
				</div>
				<div class="col-8">
					<h3>여기는 row - boot 이용 제목 자리</h3>
					포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
						포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
						포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 포스트 내용 
						여긴 네줄	 
				</div>
				<div class="col-3 test">
					<div class="wrapper">
						<img src="${pageContext.request.contextPath}/images/sample_boon.jpg" alt="">
					</div>
				</div>
			</div>
			
        
        
        
        
		</div> <!-- /.container  -->
	</div> <!-- /.side_overlay -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>

<script>

	
	window.addEventListener("load", function() {
		
		var heart = document.querySelector(".heart > i");

		heart.onclick = function() {
			
			$('.heart > i').removeClass("far fa-heart");
			$('.heart > i').addClass("fas fa-heart");

		};
		
		

	});



</script>
</html>