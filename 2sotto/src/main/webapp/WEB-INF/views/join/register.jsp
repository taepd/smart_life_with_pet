<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>

<head>

	<title>홈_슬기로운 반려생활</title>
	<%@ include file="/WEB-INF/include/import.jsp"%>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
	<style type="text/css">
		
		
		#area {
			box-shadow: rgba(0, 0, 0, 0.08) 0px 20px 40px 0px;
			padding-top: 50px;
			padding-bottom: 40px;
			text-align: center;
			background-color: #fafafa;
		}
		 
		#title-area {
			text-align: center;
			margin-bottom: 80px;
		}
		
		ul {
			list-style: none;
			padding: 0;
		}
		
		#signUpList li {
			width: 300px;
			height: 50px;
			margin-bottom: 6px;
			border: 1px solid #e0e0e0;
			border-radius: 3px;
			font-size: 14px;
		}
		
		.span {
			box-sizing: border-box;
			width: 200px;
			height: 40px;
			padding-top: 3px;
			display: inline-block;
			padding-top: 13px;
		}
		
		#signUpList-wrapper {
			/* margin: 0 auto; */
			display: inline-block;
		}
		
		.h3-korean {
			font-family: 'Poor Story', cursive;
			/* font-family: 'Nanum Myeongjo', serif; */
		}
		
	</style>

</head>

<body>
	
	<!-- header -->
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	
	<div class="container">
		<div class="side_overlay">
			<div class="row">
				<div class="col-12" id="title-area">
					<h1 class="title">Love your pet more</h1>
					<h3 class="h3-korean">슬기로운 반려생활 시작하기</h3>
				</div>
				<div class="col-2"></div>
				<div id="area" class="col-8">
					<div id="signUpList-wrapper">
						<ul id="signUpList">
							<a href="joinForm.bit"><li><span class="span">일반 회원가입하기</span></li></a>
							<a href="${naver_url}"><li style="border: 1px solid #19ce60"><span class="span">네이버로 가입하기</span></li></a>
							<a href="${kakao_url}"><li style="border: 1px solid #ffe500"><span class="span">카카오로 가입하기</span></li></a>
							<a href="${google_url}"><li style="border: 1px solid #2962ff"><span class="span">구글로 가입하기</span></li></a>
						</ul>
						<br>
						<a href="../login/login.bit" style="font-size: 13px;">이미 계정이 있으신가요?</a>
					</div>
				</div>
				<div class="col-2"></div>
				<br><br><br><br><br><br><br>
			</div> <!-- /.row -->
		</div> <!-- /.side_overlay -->
	</div> <!-- /.container  -->

	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>

</html>