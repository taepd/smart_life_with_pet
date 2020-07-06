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
								<tbody>
									<tr>
										<td>1</td>
										<td style="cursor:pointer;color:#blue;" onclick="location.href='view.bit'">농구 좋아하세요?</td>
										<td>슬램덩크</td>
										<td>2020.7.5 23:20</td>
										<td>2</td>
										<td>Y</td>
									</tr>
									<tr>
										<td>2</td>
										<td>야식 좋아하세요?</td>
										<td>보캐슬</td>
										<td>2020.7.5 23:40</td>
										<td>5</td>
										<td>N</td>
									</tr>
									<tr>
										<td>3</td>
										<td>포청천 좋아하세요?</td>
										<td>김건휘</td>
										<td>2020.7.5 23:45</td>
										<td>100</td>
										<td>Y</td>
									</tr>
							</table>

						</div>

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

	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>
</html>