<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<title>홈_슬기로운 반려생활</title>

     <%@ include file="/WEB-INF/include/import.jsp"%>
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css_2sotto/blog_main.css">


</head>
<body>
   
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<div class="container">
		<div class="side_overlay">
			<div class="row">
				<div class="col"></div>
				<div class="col-11">
					<h2>Q&A 게시판</h2> 
					<button type="button" class="btn btn-primary" onclick="location.href='write.bit'">글쓰기</button>
				</div>
			</div>
			
				<div class="row justify-content-center">
					<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>글번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>등록시간</th>
										<th>조회수</th>
										<th>답변여부</th>
									</tr>
								</thead>
								<c:forEach var="qna" items="${qnaList}" >
								<tbody>
									<tr>    				
											<td>${qna.qaindex}</td>
											<!--  <td style="cursor:pointer;color:#blue;" onclick="location.href='detail.bit'">${qna.title}</td> -->
											<td style="cursor:pointer;color:#blue;" onclick="location.href='detail.bit?qaindex=${qna.qaindex}'">${qna.title}</td>
											<td>${qna.userid}</td>
											<td>${qna.qatime}</td>
											<td>${qna.count}</td>
											<td>${qna.awstate}</td>
									</tr>

									</tbody>
									
									</c:forEach> 
							</table>

						</div>
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
</body>
</html>