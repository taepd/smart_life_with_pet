<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>	

    <title>슬기로운 반려생활</title>
    
    <%@ include file="/WEB-INF/include/import.jsp"%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css_2sotto/blog_main.css">
    
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
			
			<c:forEach var="post" items="${postList}">
				<div class="row">
					<div class="col-9">
						<div class="contents">
						<h3><a href="blog/detail.bit?bdindex=${post.bdindex}">${post.title}</a></h3>
						${post.content}
						</div>
						<!-- 하트/코멘트/날짜 영역 -->
						<div class="heart-and-comment">
							<div id="time-area">
								<fmt:parseDate var="parseTime" value="${post.rtime}" pattern="yyyy-MM-dd hh:mm"/>
								<fmt:formatDate var="rtime" value="${parseTime}" pattern="yyyy-MM-dd hh:mm"/>
								<span>${rtime}</span>
								<%-- <span>${post.rtime}</span> --%>
							</div>
							<div id="like-area">
								<span class="heart"><i class="fas fa-heart"></i></span>
								<span>${post.blike}</span>
							</div>
							<div id="comment-area">
								<span class="icon"><i class="far fa-comment"></i></span>
								<span>임시</span>
							</div>
						</div>
					</div>	
					<!-- 게시글 이미지 영역 -->
					<div class="col-3 test">
						<div class="wrapper">
							<img src="${pageContext.request.contextPath}/images/sample_boon.jpg" alt="게시물 이미지">
						</div>
					</div>
				</div>
			</c:forEach>
        
        	<%-- <c:if test="${cpage < pageCount}">

							<li class="page-item"><a class="page-link"
								href="BitBoardList.bit?cp=${cpage+1}&ps=${pageSize}"
								cp="${cpage+1}" ps="${pageSize}" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>
			</c:if> --%>
        
        
		</div> <!-- /.container  -->
	</div> <!-- /.side_overlay -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>

<script>


</script>
</html>