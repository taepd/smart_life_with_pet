<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<html>
<head>

<title>홈_슬기로운 반려생활</title>

<%@ include file="/WEB-INF/include/import.jsp"%>

</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<!-- header -->

	<c:set var="user_id" value="${sessionScope.user_id}" />
	<c:set var="currentPost" value="${requestScope.CurrentPost}" />
	<header>
		<c:choose>
			<c:when test="${user_id != null}">
				<c:choose>
					<c:when test="${user_id == 'admin'}">

					</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>

			</c:otherwise>
		</c:choose>
	</header>

	<div class="side_overlay">

		<div class="container">


			<button class="btn btn-primary btn-round"
				onclick="location.href='donationQaView.bit'">후원게시판</button>



			<div class="card  card-nav-tabs ">

				<div class="card-body">
					<div class="tab-content text-center">

						<!---------- 후원게시판 내용  ------------------>

						<div class="table-responsive">
							<table class="table">
								<thead class=" text">
									<tr>
										<td colspan="3" valign=top style="font-family: 돋음; font-size: 30;">
											<div style="margin: 20px 20px 30px 20px;">${currentPost.post_contents}후원글
												제목: 치즈의 눈수술을 도와주세요</div>
										</td>
									</tr>

								</thead>
								<tbody>
									<tr>
										<td valign=top style="font-family: 돋음; font-size: 20;">
											<div class="card" style="width: 20rem;">
												<img class="card-img-top"
													src="${pageContext.request.contextPath}/images/sample_dog.jpg"
													rel="nofollow" alt="card image">
											</div>
										</td>
										<td valign=top style="font-family: 돋음; font-size: 20;">
											<div class="card" style="width: 20rem;">
												<img class="card-img-top"
													src="${pageContext.request.contextPath}/images/sample_dog.jpg"
													rel="nofollow" alt="card image">
											</div>
										</td>
										<td valign=top style="font-family: 돋음; font-size: 20;">
											<div class="card" style="width: 20rem;">
												<img class="card-img-top"
													src="${pageContext.request.contextPath}/images/sample_dog.jpg"
													rel="nofollow" alt="card image">
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3" valign=top style="font-family: 돋음; font-size: 20;">
											<div style="margin: 40px 40px 80px 40px;">${currentPost.post_contents}내용
												: 치즈는 20년 3월 강화도에서 구조되었습니다. 당시 구조자분께서는 강화도 보문사를 방문하였다 우연히 정문
												옆에 있는 눈 다친 고양이를 발견했습니다. 당시 눈 주위가 찢어지듯이 다쳐있던 고양이는 다친 게
												무슨(......)</div>
										</td>
									</tr>

									<tr align="center" valign="middle">
										<td colspan="5"><c:if
												test="${currentPost.user_id == user_id }">
												<a class="btn btn-rose btn-round" href="">
													&nbsp;수정&nbsp; </a>
												<a id="confirmDelete" class="btn btn-white btn-round"
													href=""> &nbsp;삭제&nbsp; </a>
											</c:if></td>
									</tr>
									<tr align="center" valign="middle">
										<td colspan="5"><br> <a
											class="btn btn-block btn-gray btn-round" href="">
												&nbsp;&nbsp;&nbsp;이전 돌아가기&nbsp;&nbsp;&nbsp; </a></td>
									</tr>
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
</body>
</html>

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
</body>
</html>