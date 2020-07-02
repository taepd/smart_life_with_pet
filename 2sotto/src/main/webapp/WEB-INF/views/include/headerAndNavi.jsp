<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>

	<title>Insert title here</title>

	<meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0, name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/material-kit.css?v=2.0.4" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css_2sotto/headerAndNavi.css">

	<!-- Fonts and icons -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css">
	
</head>

<body>

	<!-- header -->
	<nav class="navbar navbar-default navbar-expand-lg" role="navigation-demo">
		<a class="toggle-btn"><span class="toggle-btn"><i class="fas fa-bars"></i></span></a>
        <div class="collapse navbar-collapse">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a href="javascript:;" class="nav-link">로그인</a>
                </li>
                <li class="nav-item">
                    <a href="javascript:;" class="btn btn-rose btn-raised btn-round" data-toggle="dropdown">
                      	시작하기
                    </a>
				</li>
			</ul>
		</div>
	</nav>
	
	<!-- navi -->
	<div id="wrapSideMenu" class="sidenav">
		<div id="sideMenu">
			<div class="user-pic-wrapper">
				<span class="user-pic"><i class="far fa-user-circle"></i></span>
			</div>
			<div class="nickname">
				닉네임
			</div>
		</div>
	</div>

</body>

	<!--   Core JS Files   -->
	<script src="assets/js/core/jquery.min.js" type="text/javascript"></script>
	<script src="assets/js/core/popper.min.js" type="text/javascript"></script>
	<script src="assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
	<script src="assets/js/plugins/moment.min.js"></script>
	
	<!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
	<script src="assets/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
	
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
	
	<!--  Google Maps Plugin  -->
	<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script> -->
	
	<!-- Place this tag in your head or just before your close body tag. -->
	<!-- <script async defer src="https://buttons.github.io/buttons.js"></script> -->
	
	<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
	<script src="assets/js/material-kit.js?v=2.0.4" type="text/javascript"></script>
	
	<script src="${pageContext.request.contextPath}/assets/js_2sotto/headerAndNavi.js"></script>
	
</html>