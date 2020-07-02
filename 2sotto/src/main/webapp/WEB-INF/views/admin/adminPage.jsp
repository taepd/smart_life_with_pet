<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<title>2sotto</title>

<!-- Favicon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/images/icons8-cat-footprint-48.png">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/images/icons8-cat-footprint-48.png"
	type="image/x-icon">

</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<!-- header -->



	<div class="section">
		<div class="container tim-container">
			<!--     	        typography -->
			<div id="typography" class="col text-left">
				<div class="tim-typo ">
					<h4>오늘의 산책 지수</h4>
				</div>

				<div>
					<p>
						<span class="tim-note">오늘의 산책지수</span> 😛<br> 온도:20 습도:?
				</div>
			</div>
		</div>
		<!-- 후원 게시판 시작 -->
		<div class="col mainEatingList">
			<h5>
				<!-- <i class="fas fa-star" style="color: #ffc107;"></i> -->
				&nbsp;&nbsp;&nbsp;후원 게시판&nbsp;&nbsp;<b style="color: #ffc107">Bo_castle</b>
			</h5>
			<div class="row">
				<c:forEach items="${eatStoreList}" var="el">
					<div class="col-md-3">
						<div class="imgThumnail">
							<a
								href="${pageContext.request.contextPath}/eating/eatingView?eId=${el.eId}&eThema=${el.eThema}"><img
								class="img-thumbnail" alt="eatImg"
								src="${pageContext.request.contextPath}/img/eating/thumnail/eat_Thumnail${el.eId}.jpg"
								style="width: 100%; height: auto; margin-bottom: 10px;"></a>
							<div class="imgText">
								<p>
									<img alt="good"
										src="${pageContext.request.contextPath}/img/main/eat_good.png"
										style="max-width: 15%;">
								</p>
							</div>
						</div>

						<p class="eTitle">
							<a
								href="${pageContext.request.contextPath}/eating/eatingView?eId=${el.eId}&eThema=${el.eThema}">${el.eTitle}&nbsp;&nbsp;<b
								style="color: #e7438b;">${el.rvAVG}</b></a>
						</p>

						<p class="eThema">
							<c:choose>
								<c:when test="${el.eThema == 'thema_1'}">
									<p style="color: #868e96; font-size: 85%;">후원게시글 - ${el.eKeyword_food}</p>
								</c:when>
								<c:when test="${el.eThema == 'thema_2'}">
									<p style="color: #868e96; font-size: 85%;">후원게시글 - ${el.eKeyword_food}</p>
								</c:when>
								<c:when test="${el.eThema == 'thema_3'}">
									<p style="color: #868e96; font-size: 85%;">후원게시글 -${el.eKeyword_food}</p>
								</c:when>
								<c:when test="${el.eThema == 'thema_4'}">
									<p style="color: #868e96; font-size: 85%;">후원게시글 - ${el.eKeyword_food}</p>
								</c:when>
								<c:when test="${el.eThema == 'thema_5'}">
									<p style="color: #868e96; font-size: 85%;">후원게시글 - ${el.eKeyword_food}</p>
								</c:when>
								<c:when test="${el.eThema == 'thema_6'}">
									<p style="color: #868e96; font-size: 85%;">후원게시글 - ${el.eKeyword_food}</p>
								</c:when>
							</c:choose>
						</p>
					</div>
				</c:forEach>
			</div>
		</div>
		<br>
		<br>
		<!-- 후원 게시판 시작 -->
		<!-- <button class="btn btn-default" type="button" onclick="location.href='${pageContext.request.contextPath}/class/classView?cId=${cl.cId}&cCategory=${cl.cCategory}'">상 세 보 기</button> -->

		<!-- 이번주 인기글 시작 -->
		<div class="col mainEatingList">
			<h5>
				<!-- <i class="fas fa-star" style="color: #ffc107;"></i> -->
				&nbsp;&nbsp;&nbsp;이번주의 인기글&nbsp;&nbsp;<b style="color: #ffc107">Best</b>
			</h5>
			<div class="row">
				<c:forEach items="${eatStoreList}" var="el">
					<div class="col-md-3">
						<div class="imgThumnail">
							<a href="${pageContext.request.contextPath}/eating/eatingView?eId=${el.eId}&eThema=${el.eThema}">
								<img class="img-thumbnail" alt="eatImg" src="${pageContext.request.contextPath}/img/eating/thumnail/eat_Thumnail${el.eId}.jpg"
								style="width: 100%; height: auto; margin-bottom: 10px;"></a>
							<div class="imgText">
								<p>
									<img alt="good" src="${pageContext.request.contextPath}/img/main/eat_good.png"
										style="max-width: 15%;">
								</p>
							</div>
						</div>

						<p class="eTitle">
							<a href="${pageContext.request.contextPath}/eating/eatingView?eId=${el.eId}&eThema=${el.eThema}">${el.eTitle}&nbsp;&nbsp;<b
								style="color: #e7438b;">${el.rvAVG}</b></a>
						</p>

						<p class="eThema">
							<c:choose>
								<c:when test="${el.eThema == 'thema_1'}">
									<p style="color: #868e96; font-size: 85%;">이번주 인기글 - ${el.eKeyword_food}</p>
								</c:when>
								<c:when test="${el.eThema == 'thema_2'}">
									<p style="color: #868e96; font-size: 85%;">이번주 인기글 - ${el.eKeyword_food}</p>
								</c:when>
								<c:when test="${el.eThema == 'thema_3'}">
									<p style="color: #868e96; font-size: 85%;">이번주 인기글 - ${el.eKeyword_food}</p>
								</c:when>
								<c:when test="${el.eThema == 'thema_4'}">
									<p style="color: #868e96; font-size: 85%;">이번주 인기글 - ${el.eKeyword_food}</p>
								</c:when>
								<c:when test="${el.eThema == 'thema_5'}">
									<p style="color: #868e96; font-size: 85%;">이번주 인기글 - ${el.eKeyword_food}</p>
								</c:when>
								<c:when test="${el.eThema == 'thema_6'}">
									<p style="color: #868e96; font-size: 85%;">이번주 인기글 - ${el.eKeyword_food}</p>
								</c:when>
							</c:choose>
						</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

</body>
</html>