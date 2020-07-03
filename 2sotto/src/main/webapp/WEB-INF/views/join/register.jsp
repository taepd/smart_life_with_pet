<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
    
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/include/headerAndNavi.jsp"%>
	<!-- header -->

	<div class="section">
		<div class="container tim-container">
			<!--     	        typography -->
			<div id="typography" class="col text-center">
				<div class="tim-typo ">
					<h2>Sotto</h2>
				</div>

				<div>
					<p>
						<span class="tim-note">Sotto:</span> 대한민국 sotto을 위한 커뮤니티입니다.<br>
						계정 생성 후 모든 기능을 이용하실 수 있습니다.
				</div>
			</div>
		</div>


		<div class="container col-md-4 normalBtnWrap">
			<div class="normal_join">

				<div align="center">
					<a href="joinForm.bit">
					<button type="submit" class="btn btn-primary">
					일반회원가입
					</button>
					</a>
				</div>

			</div>
		</div>

		<div class="col-md-5 ml-auto mr-auto">


			<div id="images">
				<div class="title text-center">
					<h2>sns회원가입</h2>
				</div>

				<div class="row">

					<div class="col-sm-2 ml-auto ">
						<img
							src="${pageContext.request.contextPath}/images/naver_account_login_small.PNG"
							alt="Rounded Image" class="img-raised rounded img-fluid"
							onclick="location.href='${naver_url}'">
					</div>
					<div class="col-sm-2 ml-auto">
						<img
							src="${pageContext.request.contextPath}/images/google_account_login_small.png"
							alt="Circle Image" class="img-raised rounded img-fluid"
							onclick="location.href='${google_url}'">
					</div>
					<div class="col-sm-2 ml-auto">
						<img
							src="${pageContext.request.contextPath}/images/kakao_account_login_small.png"
							alt="Raised Image" class="img-raised rounded img-fluid"
							onclick="location.href='${kakao_url}'">
					</div>

				</div>

			</div>

		</div>
		<br> <br>
		<div align="center">
			<a href="login.bit">
			<button type="submit" class="btn btn-primary">
			이미 계정이 있으신가요?
			</button>
			</a>

		</div>
	</div>


</body>
</html>