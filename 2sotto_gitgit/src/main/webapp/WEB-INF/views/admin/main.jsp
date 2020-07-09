<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<title>슬기로운 반려생활</title>

<%@ include file="/WEB-INF/include/import.jsp"%>

</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<!-- header -->


	<div class="side_overlay">
		<div class="container">


			<button class="btn btn-primary btn-round"
				onclick="location.href='../index.jsp'">홈</button>
				
			<button class="btn btn-primary btn-round"
				onclick="location.href='list.bit'">회원 관리</button>


			<div class="card  card-nav-tabs ">

				<div class="card-body">
					<div class="tab-content text-center">

						<!---------- 후원게시판 내용  ------------------>

						<div class="table-responsive">
							<table class="table">
								<thead class=" text">
									<tr>
										<td colspan="1" valign=top
											style="font-family: 돋음; font-size: 30;">
											<div class="card card-nav-tabs col-xs-3"
												style="width: 20rem;">
												<div class="card-header card-header-rose">오늘의 산책 지수😛</div>
												<ul class="list-group list-group-flush">
													<li class="list-group-item">온도: 20</li>
													<li class="list-group-item">미세먼지: 좋음</li>
													<li class="list-group-item">습도: 40</li>
												</ul>
											</div>
										</td>
										<td colspan="1" valign=top
											style="font-family: 돋음; font-size: 30;">
											<div class="card card-nav-tabs col-xs-6"
												style="width: 20rem;">
												<div class="card-header card-header-rose">최신 Q&A</div>
												<ul class="list-group list-group-flush">
													<li class="list-group-item">빛과 소금</li>
													<li class="list-group-item">금요일 저녁 에러</li>
													<li class="list-group-item">칼퇴는 언제할까요?</li>
												</ul>
											</div>
										</td>

									</tr>
									<tr>
									<td colspan="3" style="text-align:left">
										<h4>후원 게시판</h4>
										</td>
									</tr>
									<tr>
										<td>
											<div class="card card-nav-tabs col-xs-3"
												style="width: 20rem;">
												<div class="card-body">
													<h4 class="card-title">후원 게시글1</h4>
													<p class="card-text">관심과 사랑을 주세요.</p>
												</div>
												<button class="btn btn-rose btn-sm" onclick="javascript:;">후원하기😛</button>
											</div>
										</td>
										<td>
											<div class="card card-nav-tabs col-xs-3"
												style="width: 20rem;">
												<div class="card-body">
													<h4 class="card-title">후원 게시글2</h4>
													<p class="card-text">관심과 사랑을 주세요.</p>
												</div>
												<button class="btn btn-rose btn-sm" onclick="javascript:;">후원하기😛</button>
											</div>
										</td>
										<td>
											<div class="card card-nav-tabs col-xs-3"
												style="width: 20rem;">
												<div class="card-body">
													<h4 class="card-title">후원 게시글3</h4>
													<p class="card-text">관심과 사랑을 주세요.</p>
												</div>
												<button class="btn btn-rose btn-sm" onclick="javascript:;">후원하기😛</button>
											</div>
										</td>
									</tr>
										<tr>
									<td colspan="3" style="text-align:left">
										<h4>이번주의 인기글</h4>
										</td>
									</tr>
									<tr>
										<td>
											<div class="card card-nav-tabs col-xs-3"
												style="width: 20rem;">
												<div class="card-body">
													<h4 class="card-title">이번주 인기글1</h4>
													<p class="card-text">배고프다.</p>
												</div>
											</div>
										</td>
										<td>
											<div class="card card-nav-tabs col-xs-3"
												style="width: 20rem;">
												<div class="card-body">
													<h4 class="card-title">이번주 인기글2</h4>
													<p class="card-text">배고프다.</p>
												</div>
											</div>
										</td>
										<td>
											<div class="card card-nav-tabs col-xs-3"
												style="width: 20rem;">
												<div class="card-body">
													<h4 class="card-title">이번주 인기글3</h4>
													<p class="card-text">배고프다.</p>
												</div>
											</div>
										</td>
									</tr>

								</thead>

							</table>

						</div>



					</div>

				</div>
			</div>
		</div>

	</div>

	<%@ include file="/WEB-INF/include/footer.jsp"%>


</body>
</html>


