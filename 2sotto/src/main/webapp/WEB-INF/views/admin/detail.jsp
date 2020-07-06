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
				onclick="location.href='main.bit'">관리자 페이지</button>

			

			<div class="card  card-nav-tabs ">

				<div class="card-body">
					<div class="tab-content text-center">

						<!---------- Point 내용  ------------------>

						<div class="table-responsive">
							<table class="table">
								<thead class=" text">
								
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