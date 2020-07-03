<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


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

			<div class="col-md-6-center">
				<div class="card card-nav-tabs text-center">
					<div class="card-header card-header-text card-header-primary">
						<div class="card-text">
							<h4 class="card-title">슬기로운 반려생활 시작하기</h4>
						</div>
					</div>
					<div class="card-body">
						<p>슬기로운 반려생활을 위한 커뮤니티입니다.</p>
						<p>계정 생성 후 모든 기능을 이용하실 수 있습니다.</p>
						<a href="joinForm.bit" class="btn btn-lg btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일반회원가입&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> 
						<br>
						<a href="login.bit" class="btn btn-lg btn-primary">이미 계정이 있으신가요?</a>
						<br>
						<h4 class="card-title">SNS 회원가입</h4>
						<button class="btn btn-success">
							<i class="material-icons">favorite</i> 네이버
						</button>
						<br>
						<button class="btn btn-default">
							<i class="material-icons">favorite</i> &nbsp;&nbsp;구 글&nbsp;
						</button>
						<br>
						<button class="btn btn-warning">
							<i class="material-icons">favorite</i> 카카오
						</button>
						
					</div>
				</div>
			</div>
		</div>
	</div>




		


</body>

</html>