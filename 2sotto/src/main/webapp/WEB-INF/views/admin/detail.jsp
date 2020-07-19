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


	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>


	<div class="side_overlay">
		<div class="container">


			<button class="btn btn-primary btn-round"
				onclick="location.href='main.bit'">관리자 페이지</button>



			<div class="card card-nav-tabs">
				<div class="card-header card-header-primary">
					<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
					<div class="nav-tabs-navigation">
						<div class="nav-tabs-wrapper">
							<ul class="nav nav-tabs" data-tabs="tabs">
								<li class="nav-item"><a class="nav-link active show"
									href="#adminHome" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
										<i class="material-icons">email</i> 관리홈
										<div class="ripple-container"></div>
								</a></li>
								<li class="nav-item"><a class="nav-link" href="#userAnimal"
									data-toggle="tab"> <!-- <i class="material-icons">chat</i> -->
										<i class="material-icons">email</i> 회원 반려동물
										<div class="ripple-container"></div>
								</a></li>
								<li class="nav-item"><a class="nav-link" href="#userPoint"
									data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
										<i class="material-icons">email</i> 포인트 사용내역
										<div class="ripple-container"></div>
								</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="card-body">
					<div class="tab-content text-center">
						<div class="tab-pane active show" id="adminHome">
							<!---------- 관리홈 ------------------>

							<div class="table-responsive">
								<table class="table">
									<thead class="text">
										<tr>
											<th rowspan="5" style="text-align: center">
												<div class="card" style="width: 20rem;">
													<img class="card-img-top"
														src="${pageContext.request.contextPath}/assets/images/sample_dog.jpg"
														rel="nofollow" alt="card image">
													<h4>보캐슬</h4>
												</div>
											</th>
											<td>보유 포인트</td>
											<td>500p</td>
										</tr>
										<tr>
											<td>이메일</td>
											<td>kbs@mbc.sbs</td>
										</tr>
										<tr>
											<td>회원 지역</td>
											<td>안드로메다</td>
										</tr>
										<tr>
											<td>가입일시</td>
											<td>2020.7.1</td>
										</tr>
										<tr>
											<td>등록 반려동물 수</td>
											<td>1댕이 1냥이</td>
										</tr>
									</thead>
								</table>
							</div>


						</div>
						
						<!---------- 회원 반려동물 ------------------>
						<div class="tab-pane" id="userAnimal">
							
							<div class="table-responsive">
								<table class="table">
									<thead class="text">
										<tr>
											<th rowspan="5" style="text-align: center">
												<div class="card" style="width: 20rem;">
													<img class="card-img-top"
														src="${pageContext.request.contextPath}/images/sample_dog.jpg"
														rel="nofollow" alt="card image">
													<h4>인절미</h4>
												</div>
												
											</th>
											<td>품종</td>
											<td>치와와</td>
										</tr>
										<tr>
											<td>털색</td>
											<td>흰색</td>
										</tr>
										<tr>
											<td>기간</td>
											<td>1년3개월</td>
										</tr>
										<tr>
											<td>몸무게</td>
											<td>2.8Kg</td>
										</tr>
										<tr>
											<td>성격</td>
											<td>순함,겁많은</td>
										</tr>
										<tr>
											<th rowspan="5" style="text-align: center">
												<div class="card" style="width: 20rem;">
													<img class="card-img-top"
														src="${pageContext.request.contextPath}/images/sample_dog.jpg"
														rel="nofollow" alt="card image">
													<h4>인절미</h4>
												</div>
											</th>
											<td>품종</td>
											<td>시고리안</td>
										</tr>
										<tr>
											<td>털색</td>
											<td>흰색</td>
										</tr>
										<tr>
											<td>기간</td>
											<td>3년3개월</td>
										</tr>
										<tr>
											<td>몸무게</td>
											<td>5.8Kg</td>
										</tr>
										<tr>
											<td>성격</td>
											<td>사나움</td>
										</tr>
										<tr>
											<th rowspan="5" style="text-align: center">
												<div class="card" style="width: 20rem;">
													<img class="card-img-top"
														src="${pageContext.request.contextPath}/images/sample_dog.jpg"
														rel="nofollow" alt="card image">
													<h4>인절미</h4>
												</div>
											</th>
											<td>품종</td>
											<td>알수없음</td>
										</tr>
										<tr>
											<td>털색</td>
											<td>흰색</td>
										</tr>
										<tr>
											<td>기간</td>
											<td>5년3개월</td>
										</tr>
										<tr>
											<td>몸무게</td>
											<td>10.8Kg</td>
										</tr>
										<tr>
											<td>성격</td>
											<td>좋음</td>
										</tr>
									</thead>
								</table>
							</div>

						</div>

						<!--포인트 사용내역  -->
						<div class="tab-pane" id="userPoint">
							<div class="table-responsive">
							<table class="table">
								<thead class=" text-primary">
									<tr>
										<th>포인트 내역 번호</th>
										<th>사용 내역</th>
										<th>사용자</th>
										<th>내역시간</th>
										<th>변동포인트</th>
										<th>기타</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td style="cursor:pointer;color:#blue;" onclick="location.href='../point/detail.bit'">포인트 사용</td>
										<!-- 포인트 상세내역까지 보여줄건가용?? 혹시몰라서 연결해용 -->
										<td>보캐슬</td>
										<td>2020.7.5 23:20</td>
										<td>-20 p</td>
										<td>후원 1번글에 후원</td>
									</tr>
									<tr>
										<td>2</td>
										<td>포인트 구매</td>
										<td>보캐슬</td>
										<td>2020.7.5 23:40</td>
										<td>20000 p</td>
										<td></td>
									</tr>
									<tr>
										<td>3</td>
										<td>포인트 획득</td>
										<td>보캐슬</td>
										<td>2020.7.5 23:45</td>
										<td>10</td>
										<td></td>
									</tr>
							</table>
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
						</div>
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-end ">
								<li class="page-item disabled"><a class="page-link"
									href="javascript:;" tabindex="-1">Previous</a></li>
								<li class="page-item"><a class="page-link"
									href="javascript:;">1</a></li>
								<li class="page-item"><a class="page-link"
									href="javascript:;">2</a></li>
								<li class="page-item"><a class="page-link"
									href="javascript:;">3</a></li>
								<li class="page-item"><a class="page-link"
									href="javascript:;">Next</a></li>
							</ul>
						</nav>
							
							
							
							
							

						</div>



						</div>

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