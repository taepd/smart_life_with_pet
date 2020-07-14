<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
				onclick="location.href='main.bit'">게시글</button>
			<!-- 탭 아이콘 영역 -->
			<!--  탭영역 음....기다린다 -->
			<div class="card card-nav-tabs">
				<div class="card-header card-header-primary">
				
				
				
					<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
					<div class="nav-tabs-navigation">
						<div class="nav-tabs-wrapper">
							<ul class="nav nav-tabs" data-tabs="tabs">
								<li class="nav-item">
									<a class="nav-link active show" onclick="location.href='main.bit'" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
										<i class="material-icons">favorite</i>후원글 메인
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" onclick="location.href='mainbydate.bit'" data-toggle="tab"> <!-- <i class="material-icons">chat</i> -->
										<i class="material-icons">favorite</i>최신순
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" onclick="location.href='write.bit'" data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
										<i class="material-icons">camera</i>글 작성
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="card-body">
					<div class="tab-content text-center">
						<div class="tab-pane active show" id="donationlist">
							<!---------- 후원게시판 ------------------>

							<div class="table-responsive">
								<table class="table">
									<thead class=" text-primary">
										<tr>
											<th>글번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>등록시간</th>
											<th>완료시간시간</th>
											<th>목표모금액</th>
											<th>현재모금액</th>
											<th>모금률</th>
											<th>모금중</th>
											

										</tr>
									</thead>
									<c:forEach var="donate" items="${donateList}">
										<tbody>
											<tr>
												<td>${donate.dindex}</td>
												<td><a href="detail.bit?dindex=${donate.dindex}&cp=${cpage}&ps=${pageSize}">
															${donate.title}</a></td>
												<td class="text-center">관리자</td>

												<!-- timestamp 날짜시간 표시 포맷 변환 -->
												<fmt:parseDate var="parseTime" value="${donate.rtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
												<fmt:formatDate var="rtime" value="${parseTime}" pattern="yyyy-MM-dd"/>
												<td class="text-center">${rtime}</td>
												<!-- timestamp 날짜시간 표시 포맷 변환 -->
												<fmt:parseDate var="parseTime" value="${donate.ctime}" pattern="yyyy-MM-dd HH:mm:ss"/>
												<fmt:formatDate var="ctime" value="${parseTime}" pattern="yyyy-MM-dd"/>
												<td class="text-center">${ctime}</td>
												<td class="text-center">${donate.gcoll}</td>
												<td class="text-center">${donate.ccoll}</td>
												<td class="text-center">
												<fmt:formatNumber value= "${donate.ccoll/donate.gcoll*100}" pattern="#,###" />%
												</td> 
												<td class="text-center">${donate.dstate}</td><!-- 모금완료 여부 표시 -->																
											</tr>
									
										</tbody>
											
									</c:forEach>
										
								</table>
								 <!-- 페이징  -->
								<div class="pagination justify-content-center">
									<!-- <nav aria-label="Page navigation example" style="display: none;" id="pagingNav"> -->
									<ul class="pagination" id="pagingview">
										<c:if test="${cpage > 1}">
											<li class="page-item"><a class="page-link"
												href="main.bit?cp=${cpage-1}&ps=${pageSize}" 
												cp="${cpage-1}" ps="${pageSize}" aria-label="Previous"> 
												<span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
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
											</a></li>
										</c:if>
									</ul>
									<!-- </nav> -->
								</div>
							</div>
	
						</div>

						

						<!-- <div class="tab-pane" id="reply">
							-------- 댓글많은순 ----------------

							<div class="table-responsive">
								<table class="table">
									<thead class=" text-primary">
										<tr>
											<th>글번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>등록시간</th>
											<th>조회수</th>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td style="cursor:pointer;color:#blue;" onclick="location.href='qaView.bit'">후원이 필요합니다.</td>
											<td>쿼리안</td>
											<td>2020.07.06</td>
											<td>1</td>
										</tr>
										<tr>
											<td>2</td>
											<td>후원이 필요합니다.</td>
											<td>쿼리안</td>
											<td>2020.07.06</td>
											<td>1</td>
										</tr>
										<tr>
											<td>3</td>
											<td>후원이 필요합니다.</td>
											<td>쿼리안</td>
											<td>2020.07.06</td>
											<td>1</td>
										</tr>
										<tr>
											<td>4</td>
											<td>후원이 필요합니다.</td>
											<td>쿼리안</td>
											<td>2020.07.06</td>
											<td>1</td>
										</tr>
								</table>
							</div>



						</div>

						-------- 좋아요 많은순 ----------------
						<div class="tab-pane" id="favorite">

							<div class="table-responsive">
								<table class="table">
									<thead class=" text-primary">
										<tr>
											<th>글번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>등록시간</th>
											<th>조회수</th>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td style="cursor:pointer;color:#blue;" onclick="location.href='qaView.bit'">후원이 필요합니다.</td>
											<td>lim</td>
											<td>2020.07.06</td>
											<td>1</td>
										</tr>
										<tr>
											<td>2</td>
											<td>후원이 필요합니다.</td>
											<td>lim</td>
											<td>2020.07.06</td>
											<td>1</td>
										</tr>
										<tr>
											<td>3</td>
											<td>후원이 필요합니다.</td>
											<td>lim</td>
											<td>2020.07.06</td>
											<td>1</td>
										</tr>
										<tr>
											<td>4</td>
											<td>후원이 필요합니다.</td>
											<td>lim</td>
											<td>2020.07.06</td>
											<td>1</td>
										</tr>
								</table>
							</div>



						</div> -->


						<!-------------- 끝 ---------------->


					</div>
				</div>
			</div>
                
		</div>
		<!-- container end -->
	</div>
	<!-- side_overlay end -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>