<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>

<title>홈_슬기로운 반려생활</title>

<%@ include file="/WEB-INF/include/import.jsp"%>

</head>
<body>

	<!-- header -->
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<!-- header -->

	<div class="side_overlay">

		<div class="container">


			<button class="btn btn-primary btn-round"
				onclick="location.href='view.bit'">Q&A내용</button>



			<div class="card  card-nav-tabs ">

				<div class="card-body">
					<div class="tab-content text-center">

						<!---------- Q&A 내용  ------------------>

						<div class="table-responsive">
						
							<table class="table">
							<c:forEach var="qna" items="${qnaList}" >
								<thead class=" text">
									
									<tr>
										<th>작성자</th>
										<td>${qna.userid}</td>
										<th>작성일</th>
										<td>${qna.qatime}</td>
									</tr>
									<tr>
										<th>조회수</th>
										<td>${qna.count}</td>
										<th>첨부파일명</th>
										<td>${qna.filename}</td>
									</tr>
									<tr>
										<th>글번호</th>
										<td>${qna.qaindex}</td>
										<th>제목</th>
										<td>${qna.title}</td>
									</tr>
								</thead>
									</c:forEach> 
									<c:forEach var="qna" items="${qnaList}" >
								<tbody>
									<tr>
										<td valign=top style="font-family: 돋음; font-size: 12;">
											<div style="margin: 40px 40px 80px 40px;">답글내용</div>
										</td>
									</tr>
									<tr>
										<td valign=top style="font-family: 돋음; font-size: 12;">
											<div style="margin: 40px 40px 80px 40px;">${qna.content}글내용</div>
										</td>
									</tr>


									<tr align="center" valign="middle">
										<td colspan="5"><c:if
												test="${currentPost.user_id == user_id }">
												<a class="btn btn btn-round" href="javascript:history.back();"> &nbsp;이전&nbsp; </a>
												<a class="btn btn-rose btn-round" href="">
													&nbsp;수정&nbsp; </a>
												<a id="confirmDelete" class="btn btn-white btn-round"
													href=""> &nbsp;삭제&nbsp; </a>
											</c:if></td>

									</tr>
									</tbody>
									
									</c:forEach> 
							</table>

						</div>



					</div>

				</div>
			</div>
		</div>

	</div>

	<script>
		$('#confirmDelete').click(function() {
			/* var result = confirm('정말로 삭제하시겠습니까?'); 
			if(result) { //yes 
				location.replace('./Delete.post?post_seq='+${currentPost.post_seq}); 
			} else {
				//no 
			}  */
		});
	</script>
	
		<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>