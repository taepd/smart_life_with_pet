<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>	

    <title>슬기로운 반려생활</title>
    
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
    	
    </style>
</head>
<body>
    
    <%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<div class="side_overlay">
		<div class="container">
			
			<h3>블로그  페이지</h3>
			<button type="button" onclick="location.href='detail.bit'">블로그 상세 페이지</button>
			<button type="button" class="btn btn-warning" onclick="location.href='write.bit'">블로그 글쓰기</button>
			<br>
			<br>
			
			<hr>
			
			
			<div class="row">
				<c:forEach var="post" items="${postList}">
					<div class="col-9">
						<div class="contents">
						<h3><a href="blog/detail.bit?bdindex=${post.bdindex}">${post.title}</a></h3>
						${post.content} 
						</div>
						<!-- 하트/코멘트 갯수 영역 -->
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
					<!-- 게시글 이미지 영역 -->
					<div class="col-3 test">
						<div class="wrapper">
							<img src="${pageContext.request.contextPath}/images/sample_boon.jpg" alt="게시물 이미지">
						</div>
					</div>
				</c:forEach>
			</div>

			
    
        
        
		</div> <!-- /.container  -->
	</div> <!-- /.side_overlay -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>

<script>


</script>
</html>