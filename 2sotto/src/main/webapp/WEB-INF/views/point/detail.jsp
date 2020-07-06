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
				onclick="history.go(-1)">포인트 변동 내역</button>

			

			<div class="card  card-nav-tabs ">

				<div class="card-body">
					<div class="tab-content text-center">

						<!---------- Point 내용  ------------------>

						<div class="table-responsive">
							<table class="table">
								<thead class=" text">
									<tr>
										<th>사용자</th>
										<td>포청천</td>
										<th>포인트 내역 일시</th>
										<td>2020.7.5 10:32</td>
									</tr>
									
								</thead>
								<tbody>
									<tr>
										<th>내영 유형</th>
										<td>구매</td>
										<th>변동 포인트</th>
										<td>2000 p</td>
									</tr>
									<tr>
										<th>포인트 내역 번호</th>
										<td>1</td>
										<th>잔여 포인트</th>
										<td>-20000 p</td>
									</tr>

									<tr align="center" valign="middle">
										<td colspan="4"><c:if
												test="${currentPost.user_id == user_id }">
												<a class="btn btn btn-round" href="javascript:history.back();"> &nbsp;뒤로가기&nbsp; </a>

											</c:if></td>

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

	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>