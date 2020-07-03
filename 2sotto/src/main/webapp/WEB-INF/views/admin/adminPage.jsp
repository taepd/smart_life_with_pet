<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
					<div align="center">
		<button type="button" onclick="location.href='adminQaView.bit'">어드민QaView</button>
		<button type="button" onclick="location.href='adminQa.bit'">어드민Qa</button>
			<button type="button" onclick="location.href='adminWrite.bit'">어드민 글쓰기</button>
			<button type="button" onclick="location.href='donationPage.bit'">도네이션페이지</button>
			<button type="button" onclick="location.href='donationWrite.bit'">도네이션 글쓰기</button>
			<button type="button" onclick="location.href='donationQaView.bit'">도네이션QaView</button>
			<button type="button" onclick="location.href='noteWrite.bit'">쪽지보내기</button>
			<button type="button" onclick="location.href='notePage.bit'">받은 쪽지함</button>
	</div>
			</div>
		</div>
	</div>

</body>
</html>