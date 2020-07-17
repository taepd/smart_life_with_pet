<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>

		<!-- pageContext.request.userPrincipal.name -->
		<se:authentication property="name" var="userid" />
		<c:set var="user" value="${sessionScope.user}" />
	<!-- header -->
	<!-- <nav class="navbar navbar-default fixed-top" role="navigation-demo"> -->
	<nav class="navbar navbar-transparent fixed-top" role="navigation-demo" style="color: #000000;">
		<a class="toggle-btn"><span class="toggle-btn"><i class="fas fa-bars"></i></span></a>
		<span id="header-title"><a href="${pageContext.request.contextPath}/index.jsp">슬기로운 반려생활</a></span>
		<ul class="navbar-nav ml-auto">
			<se:authorize access="!hasRole('ROLE_USER')">
					<li class="nav-item" id="item01">
						<a href="${pageContext.request.contextPath}/login/login.bit" class="nav-link">로그인</a>
		            </li>
				            
		            <li class="nav-item" id="item02">
		                <a href="${pageContext.request.contextPath}/join/register.bit" class="btn btn-rose btn-raised btn-round">
		                	시작하기
		                </a>
					</li>
		</se:authorize>	
		<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">			
					<li class="nav-item" id="item01">
						<a href="${pageContext.request.contextPath}/mypage/main.bit" class="nav-link">마이 페이지</a>
		            </li>
		            <li class="nav-item" id="item02">
		                <a href="${pageContext.request.contextPath}/logout" class="btn btn-rose btn-raised btn-round">
		                	로그아웃
		                </a>
					</li>
		</se:authorize>
		</ul>
	</nav>
	

<!-- navi -->
<div id="wrapSideMenu" class="sidenav">
	<div id="sideMenu">
		<span class="sideMenu-close-icon"><i class="fas fa-times"></i></span>
		<div class="user-pic-wrapper">
		
        	<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
			<span class="user-pic"><i class="far fa-user-circle"></i></span>
				<div class="nickname">
					${user.nick}<br>(${userid }) <br> ${user.point}포인트 <br> ${user.uimg}
					<button class="btn btn-primary btn-sm" onclick="location.href='logout'">Logout</button>
				</div>
			</se:authorize>
				
        	<se:authorize access="!hasRole('ROLE_USER')">	
        		<!-- 뭔가 멘트가 구린데... 생각나는 게 없넴 -->
					내 반려동물을
					<br>
					더 사랑하는 방법,
					<br>
					ㅡ
					<br>
					슬기로운 반려생활
					<br>
				<div class="nickname">
					<button class="btn btn-primary btn-sm" onclick="location.href='join/register.bit'">시작하기</button>
					<!-- <button class="btn btn-primary btn-sm" onclick="location.href='mainTest2.bit'">테스트</button> -->
				</div>
			</se:authorize>
			<br>	
			<br>	
			<div class="menuList">
				<ul class="navbar-nav ml-auto">
				<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
					<li><a href="${pageContext.request.contextPath}/management/main.bit">반려동물관리</a></li>
					<li><a href="${pageContext.request.contextPath}/blog/myMain.bit">내 블로그</a></li>
					<li><a href="${pageContext.request.contextPath}/blog/favorite.bit">즐겨찾기한 글</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/main.bit">마이페이지</a></li>
				</se:authorize>
					<li><a href="${pageContext.request.contextPath}/blog/main.bit">모두의 블로그</a></li>	
					<li><a href="${pageContext.request.contextPath}/donation/main.bit">후원게시판</a></li>
				<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">	
					<li><a href="${pageContext.request.contextPath}/message/main.bit">쪽지함</a></li>
				</se:authorize>	
					<li><a href="${pageContext.request.contextPath}/qna/main.bit">Q&A</a></li>
				<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">	
					<li><a href="${pageContext.request.contextPath}/point/main.bit">포인트관리</a></li>
				</se:authorize>	
				<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
					<li><a href="${pageContext.request.contextPath}/mainTest2.bit">로그인메인테스트</a></li>
				</se:authorize>
				<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
					<li><a href="${pageContext.request.contextPath}/payTest.bit">pay테스트</a></li>
				</se:authorize>
				<se:authorize access="hasAnyRole('ROLE_ADMIN')">
					<li><a href="${pageContext.request.contextPath}/admin/main.bit">관리자 페이지</a></li>
				</se:authorize>	
				</ul>
			</div>
		</div>
	</div>
</div>




