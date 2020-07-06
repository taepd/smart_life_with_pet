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
			<div class="row">
				<div class="card card-nav-tabs col-xs-3" style="width: 20rem;">
					<div class="card-header card-header-rose">오늘의 산책 지수😛</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">온도: 20</li>
						<li class="list-group-item">미세먼지: 좋음</li>
						<li class="list-group-item">습도: 40</li>
					</ul>
				</div>
				<div class="card card-nav-tabs col-xs-6" style="width: 20rem;">
					<div class="card-header card-header-rose">최신 Q&A</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">빛과 소금</li>
						<li class="list-group-item">금요일 저녁 에러</li>
						<li class="list-group-item">칼퇴는 언제할까요?</li>
					</ul>
				</div>
			</div>
			<!-- 후원 게시판 시작 -->
			<div class="container">
				<h5>후원 게시판</h5>
				<div class="row">

					<div class="card card-nav-tabs col-xs-3" style="width: 20rem;">
						<div class="card-body">
							<h4 class="card-title">후원 게시글1</h4>
							<p class="card-text">관심과 사랑을 주세요.</p>
						</div>
						<button class="btn btn-rose btn-sm" onclick="javascript:;" >후원하기😛</button>
					</div>
					
					<div class="card card-nav-tabs col-xs-3" style="width: 20rem;">
						<div class="card-body">
							<h4 class="card-title">후원 게시글2</h4>
							<p class="card-text">관심과 사랑을 주세요.</p>
						</div>
						<button class="btn btn-rose btn-sm" onclick="javascript:;" >후원하기😛</button>
					</div>
					<div class="card card-nav-tabs col-xs-3" style="width: 20rem;">
						<div class="card-body">
							<h4 class="card-title">후원 게시글3</h4>
							<p class="card-text">관심과 사랑을 주세요.</p>
						</div>
						<button class="btn btn-rose btn-sm" onclick="javascript:;" >후원하기😛</button>
					</div>
				</div>
			</div>
			<!-- 이번주 인기글 시작 -->
			<div class="container">
				<h5>이번주 인기글</h5>
				<div class="row">

					<div class="card card-nav-tabs col" style="width: 20rem;">
						<div class="card-body">
							<h4 class="card-title">이번주 인기글1</h4>
							<p class="card-text">배고프다.</p>
						</div>
					</div>
					<div class="card card-nav-tabs col" style="width: 20rem;">
						<div class="card-body">
							<h4 class="card-title">이번주 인기글2</h4>
							<p class="card-text">배고프다.</p>
						</div>
					</div>
					<div class="card card-nav-tabs col" style="width: 20rem;">
						<div class="card-body">
							<h4 class="card-title">이번주 인기글3</h4>
							<p class="card-text">배고프다.</p>
						</div>
					</div>
					<div class="card card-nav-tabs col" style="width: 20rem;">
						<div class="card-body">
							<h4 class="card-title">이번주 인기글4</h4>
							<p class="card-text">배고프다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div align="center">
		<button type="button" onclick="location.href='adminQaView.bit'">어드민QaView</button>
		<button type="button" onclick="location.href='adminQa.bit'">어드민Qa</button>
		<button type="button" onclick="location.href='adminWrite.bit'">어드민
			글쓰기</button>
		<button type="button" onclick="location.href='donationPage.bit'">도네이션페이지</button>
		<button type="button" onclick="location.href='donationWrite.bit'">도네이션
			글쓰기</button>
		<button type="button" onclick="location.href='donationQaView.bit'">도네이션QaView</button>
		<button type="button" onclick="location.href='noteWrite.bit'">쪽지보내기</button>
		<button type="button" onclick="location.href='notePage.bit'">받은
			쪽지함</button>
	</div>




</body>
</html>