<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <%@ include file="/WEB-INF/include/import.jsp"%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css_2sotto/blog_main.css">
</head>
<body>
<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
<div class="side_overlay">
		<div class="container">
			
			<h3>반반이 주인 갤주의 블로그임</h3><!-- 해당 유저 값 받아와서 출력하시면 됨 -->
			
			<br>
			<br>
			
			<hr>
			<div>
			<!-- 
			<c:forEach var="petInfo" items="${petInfoList}">
							<div class="card col-4" style="width: 20rem;">
								<img class="card-img-top" src="${pageContext.request.contextPath}/images/${petInfo.petimg}" rel="nofollow" alt="card image">
								  <div class="card-body">
									<h4>${petInfo.petname}</h4>
								    <p class="card-text" id="petInfo">
								    	<fmt:parseNumber var="age" value="${petInfo.age/12}" integerOnly="true"/>
								    	 ${petInfo.scaname} 123| 
								    	123${petInfo.size == 'small' ? '소형':petInfo.size == 'medium'? '중형':'대형'}${petInfo.mcategory == '1' ? '견':'묘'} | 
								    	 ${petInfo.weight}kg 123| 
								    	<br>
								    	 ${age}년 ${petInfo.age%12}개월 123| 
								    	 ${petInfo.sex == 'female' ? '암컷':'수컷' } 123| 
								    	 ${petInfo.nstate == 'n' ? '중성화X':'중성화O'} 123|
								    	<br>
								    	 ${petInfo.memo}1234
								    </p>
								    <div>
								    -->
			</div>
			<div class="card col-4" style="width: 20rem;">
								<img class="card-img-top" src="${pageContext.request.contextPath}/images/${petInfo.petimg}" rel="nofollow" alt="card image">
								  <div class="card-body">
									<h4>${petInfo.petname}</h4>
								    <p class="card-text" id="petInfo">
								    	<fmt:parseNumber var="age" value="${petInfo.age/12}" integerOnly="true"/>
								    	<!-- ${petInfo.scaname} -->킁킁이| 
								    	대형<!-- ${petInfo.size == 'small' ? '소형':petInfo.size == 'medium'? '중형':'대형'}${petInfo.mcategory == '1' ? '견':'묘'}--> | 
								    	<!-- ${petInfo.weight}kg -->40kg| 
								    	<br>
								    	<!-- ${age}년 ${petInfo.age%12}개월 -->38개월| 
								    	<!-- ${petInfo.sex == 'female' ? '암컷':'수컷' } -->수컷| 
								    	<!-- ${petInfo.nstate == 'n' ? '중성화X':'중성화O'}--> 중성화 안함|
								    	<br>
								    	<!-- ${petInfo.memo}-->사냥 좀 잘함
								    </p>
								    <div>

									
								    </div>
								  </div>
							</div>
			
			<c:forEach var="post" items="${postList}">
				<div class="row">
					<div class="col-9">
						<div class="contents">
							<h3><a href="detail.bit?bindex=${post.bindex}">${post.title}</a></h3>
							${post.content}
						</div>
						<!-- 하트/코멘트 갯수 영역 -->
						<div class="heart-and-comment">
							<div class="heart-comment-time-area">
								<span class="heart"><i class="fas fa-heart"></i></span>
								<span>${post.blike}</span>
							</div>
							<div class="heart-comment-time-area">
								<span class="icon"><i class="far fa-comment"></i></span>
								<span>20</span>
							</div>
							<div class="heart-comment-time-area">
								<fmt:parseDate var="parseTime" value="${post.rtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate var="rtime" value="${parseTime}" pattern="yyyy-MM-dd hh:mm"/>
								<span>${rtime}</span>
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

			<div>
			<h4>cpage: ${cpage }/ pagesize: ${pageSize }/ pagecount: ${pageCount}/ totalpostcount: ${totalpostcount } </h4>
			</div>

			<!-- 페이징 -->
			<div class="pagination justify-content-center">
			<!-- <nav aria-label="Page navigation example" style="display: none;" id="pagingNav"> -->
					<ul class="pagination" id="pagingview">
						<c:if test="${cpage > 1}">
							<li class="page-item">
								<a class="page-link" href="main.bit?cp=${cpage-1}&ps=${pageSize}" cp="${cpage-1}" ps="${pageSize}" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
								</a>
							</li>
						</c:if>

						<c:forEach var="i" begin="1" end="${pageCount}" step="1">
							<c:choose>
								<c:when test="${cpage==i }">
									<li class="page-item active"><a class="page-link"
										href="main.bit?cp=${i}&ps=${pageSize}" cp="${i}"
										ps="${pageSize}">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="main.bit?cp=${i}&ps=${pageSize}" cp="${i}"
										ps="${pageSize}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${cpage < pageCount}">

							<li class="page-item">
								<a class="page-link" href="main.bit?cp=${cpage+1}&ps=${pageSize}"
									cp="${cpage+1}" ps="${pageSize}" aria-label="Next"> 
									<span aria-hidden="true">&raquo;</span>
									<span class="sr-only">Next</span>
								</a>
							</li>
						</c:if>
					</ul>
			<!-- </nav> -->
			</div>





		</div> <!-- /.container  -->
	</div> <!-- /.side_overlay -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>