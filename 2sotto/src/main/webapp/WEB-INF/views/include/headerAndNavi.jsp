<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>  


	<!-- header -->
	<nav class="navbar navbar-default fixed-top" role="navigation-demo">
		<a class="toggle-btn"><span class="toggle-btn"><i class="fas fa-bars"></i></span></a>
		<span id="header-title"><a href="${pageContext.request.contextPath}/index.jsp">슬기로운 반려생활</a></span>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item" id="item01">
				<a href="${pageContext.request.contextPath}/login.bit" class="nav-link">로그인</a>
            </li>
            <li class="nav-item" id="item02">
<<<<<<< HEAD:2sotto/src/main/webapp/WEB-INF/views/include/headerAndNavi.jsp

                <a href="join/joinForm.bit" class="btn btn-rose btn-raised btn-round">

                <a href="joinForm.bit" class="btn btn-rose btn-raised btn-round">

=======
                <a href="${pageContext.request.contextPath}/joinForm.bit" class="btn btn-rose btn-raised btn-round">
>>>>>>> 297c58dda3464560993fe71df00c24bbce3fb2fa:2sotto/src/main/webapp/WEB-INF/include/headerAndNavi.jsp
                	시작하기
                </a>
			</li>
		</ul>
	</nav>
	
	<!-- navi -->
	<div id="wrapSideMenu" class="sidenav">
		<div id="sideMenu">
			<span class="sideMenu-close-icon"><i class="fas fa-times"></i></span>
			<div class="user-pic-wrapper">
				<span class="user-pic"><i class="far fa-user-circle"></i></span>
				<div class="nickname">
					닉네임 자리
					<br>
					포인트 자리
					<br>
					<button class="btn btn-primary btn-sm" onclick="#">Logout</button>
				</div>
				<div class="menuList">
					<ul class="navbar-nav ml-auto">
<<<<<<< HEAD:2sotto/src/main/webapp/WEB-INF/views/include/headerAndNavi.jsp

						<li><a href="management/management.bit">반려동물 관리</a></li>
						<li><a href="management/management.bit">블로그</li>
						<li><a href="blike.bit">즐겨찾기</li>

						<li><a href="management/main.bit">반려동물 관리</a></li>
						<li><a href="blog/main.bit">블로그</li>
						<li><a href="management/management.bit">즐겨찾기</li>

						<li><a href="management/management.bit">마이페이지</li>
						<li><a href="management/management.bit">후원게시판</li>

						<a href="management/main.bit"><li>반려동물 관리</li></a>
						<a href="blog/main.bit"><li>블로그</li></a>
						<a href="blike.bit"><li>즐겨찾기</li></a>
						<a href="management/management.bit"><li>마이페이지</li></a>
						<a href="management/management.bit"><li>후원게시판</li></a>

=======
						<a href="${pageContext.request.contextPath}/management/main.bit"><li>반려동물 관리</li></a>
						<a href="${pageContext.request.contextPath}/blog/main.bit"><li>블로그</li></a>
						<a href="${pageContext.request.contextPath}/management/management.bit"><li>즐겨찾기</li></a>
						<a href="${pageContext.request.contextPath}/management/management.bit"><li>마이페이지</li></a>
						<a href="${pageContext.request.contextPath}/management/management.bit"><li>후원게시판</li></a>
>>>>>>> 297c58dda3464560993fe71df00c24bbce3fb2fa:2sotto/src/main/webapp/WEB-INF/include/headerAndNavi.jsp
					</ul>
				</div>
			</div>
		</div>
	</div>


	<!--   Core JS Files   -->
	<script src="${pageContext.request.contextPath}/assets/js/core/jquery.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/assets/js/core/popper.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins/moment.min.js"></script>
	
	<!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
	<script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
	
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="${pageContext.request.contextPath}/assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
	
	<!--  Google Maps Plugin  -->
	<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script> -->
	
	<!-- Place this tag in your head or just before your close body tag. -->
	<!-- <script async defer src="https://buttons.github.io/buttons.js"></script> -->
	
	<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
	<script src="${pageContext.request.contextPath}/assets/js/material-kit.js?v=2.0.4" type="text/javascript"></script>

	<script src="${pageContext.request.contextPath}/assets/js_2sotto/headerAndNavi.js"></script>

</html>  

