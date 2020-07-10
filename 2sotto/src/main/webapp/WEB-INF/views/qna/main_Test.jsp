<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				onclick="location.href='main.bit'">Q&A게시판</button>
				<button class="btn btn-primary btn-round"
				onclick="location.href='write.bit'">글쓰기</button>



			<div class="card  card-nav-tabs ">


				<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
				<div class="nav-tabs-navigation">
					<div class="nav-tabs-wrapper">
						<ul class="nav nav-tabs" data-tabs="tabs">
						
						
		
							<form class="form-inline">
								<div class="form-inline">
									<span>Show:</span> <label for="selected">&nbsp;&nbsp;&nbsp;<select
										class="custom-select">
											<option>&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;</option>
											<option>&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;</option>
											<option>&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;</option>
									</select>
									</label>
								</div>
							</form>
							<form class="form-inline ml-auto">
							
								<div class="form-group has-primary">
									<input type="text" class="form-control" placeholder="검색가능">
								</div>
								<button type="submit"
									class="btn  btn-white btn-just-icon btn-round">
									<i class="material-icons">search</i>
								</button>
							</form>
						</ul>
					</div>
				</div>


				<div class="card-body">
					<div class="tab-content text-center">

						<!---------- Q&A 게시판  ------------------>

						<div class="table-responsive">
							<table class="table">
								<thead class=" text-primary">
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
											<td style="cursor:pointer;color:#blue;" onclick="location.href='view.bit'">${qna.title}</td>
											<td>${qna.userid}</td>
											<td>${qna.qatime}</td>
											<td>${qna.count}</td>
											<td>${qna.awstate}</td>
									</tr>

									</tbody>
									
									</c:forEach> 
							</table>

						</div>
						<!--  -->
						<div class="table-responsive">
						
							<table class="table" style="text-align: left">
								<thead class="text ">
									<tr>
										<th>총 게시글 :</th>
										<td><input type="text" name="text" size="130"
											style="width: 100%; border: 0;"></td>
									</tr>
								</thead>
							</table>
							
						
							
							
							<div class="pagination justify-content-center">
			<!-- <nav aria-label="Page navigation example" style="display: none;" id="pagingNav"> -->
					<ul class="pagination" id="pagingview">
						<c:if test="${cpage > 1}">
							<li class="page-item"><a class="page-link"
								href="main.bit?cp=${cpage-1}&ps=${pageSize}"
								cp="${cpage-1}" ps="${pageSize}" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
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
			<!-- 여기까지 페이징처리 -->
							
							
						</div>



						

					</div>

				</div>
			</div>
		</div>

	</div>

	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>
</html>