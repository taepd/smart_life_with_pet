<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>

<title>슬기로운 반려생활</title>

<%@ include file="/WEB-INF/include/import.jsp"%>


</head>

<body>

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>


	<div class="side_overlay">
		<div class="container">


			<button class="btn btn-primary btn-round"
				onclick="location.href='main.bit'">쪽지</button>



			<div class="card card-nav-tabs">
				<div class="card-header card-header-primary">
					<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
					<div class="nav-tabs-navigation">
						<div class="nav-tabs-wrapper">
							<ul class="nav nav-tabs" data-tabs="tabs">
								<li class="nav-item"><a class="nav-link active show"
									href="#Receive" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
										<i class="material-icons">email</i> 받은 쪽지함
										<div class="ripple-container"></div></a></li>
								<li class="nav-item"><a class="nav-link" href="#give"
									data-toggle="tab"> <!-- <i class="material-icons">chat</i> -->
										<i class="material-icons">email</i> 보낸 쪽지함
										<div class="ripple-container"></div></a></li>
								<li class="nav-item"><a class="nav-link" href="#note"
									data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
										<i class="material-icons">email</i> 쪽지 쓰기
										<div class="ripple-container"></div></a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="card-body">
					<div class="tab-content text-center">
						<div class="tab-pane active show" id="Receive">
							<!---------- 받은쪽지함 ------------------>

							<div class="table-responsive">
								<table class="table">
									<thead class=" text-primary">
										<tr>
											<th>보낸사람</th>
											<th>내용</th>
											<th class="text-right">받은 날짜</th>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td>로봇이 아닙니다</td>
											<td>쪽지 내용이 들어갑니다.</td>
											<td class="text-right">2020.7.4</td>
										</tr>
										<tr>
											<td>보캐슬</td>
											<td>오늘도 하자!!</td>
											<td class="text-right">2020.7.4</td>
										</tr>
										<tr>
											<td>김건휘</td>
											<td>빛과소금</td>
											<td class="text-right">2020.7.4</td>
										</tr>
										<tr>
											<td>쿼리안</td>
											<td>켈리포니아 매콤주먹</td>
											<td class="text-right">2020.7.4</td>
										</tr>
								</table>
							</div>


						</div>



						<div class="tab-pane" id="give">
							<!---------- 보낸쪽지함 ------------------>

							<div class="table-responsive">
								<table class="table">
									<thead class=" text-primary">
										<tr>

											<th>받은사람</th>
											<th>내용</th>
											<th>보낸 날짜</th>
											<th>읽음 여부</th>
											<th>읽은 날짜</th>


										</tr>
									</thead>
									<tbody>
										<tr>
											<td>로봇이 아닙니다</td>
											<td>쪽지 내용이 들어갑니다.</td>
											<td>2020.7.4</td>
											<td>읽지 않음</td>
											<td></td>
										</tr>
										<tr>
											<td>보캐슬</td>
											<td>오늘도 하자!!</td>
											<td>2020.7.4</td>
											<td>읽음</td>
											<td>2020.7.4</td>
										</tr>
										<tr>
											<td>김건휘</td>
											<td>빛과소금</td>
											<td>2020.7.4</td>
											<td>읽지 않음</td>
											<td></td>
										</tr>
										<tr>
											<td>쿼리안</td>
											<td>켈리포니아 매콤주먹</td>
											<td>2020.7.4</td>
											<td>읽지 않음</td>
											<td></td>
										</tr>
								</table>
							</div>

						</div>

						<!---------- 쪽지쓰기 ------------------>
						<div class="tab-pane" id="note">

							<form>
								<div class="form-group">
									<label for="user">받는 사람</label> 
									<input type="email" class="form-control" id="user"
										aria-describedby="emailHelp" placeholder="받는사람 닉네임">

								</div>
								<div class="form-group">
									<label for="Contents">내용</label> 
									  <label for="exampleFormControlTextarea1">내용</label>
									   <textarea class="form-control" id="Contents" rows="10" placeholder="여기에 쪽지 내용을 입력합니다"></textarea>
								
								</div>
								
								<button type="submit" class="btn btn-primary">쪽지보내기</button>
								<button type="submit" class="btn btn-primary">취소</button>
							</form>



						</div>


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

