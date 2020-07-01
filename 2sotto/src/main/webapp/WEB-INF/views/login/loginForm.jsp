<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<title>2sotto_loginForm</title>
	
	<meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0, name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    
	<link href="${pageContext.request.contextPath}/assets/css/material-kit.css?v=2.0.4" rel="stylesheet" />
	<!-- Fonts and icons -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css">

	<style>

		.sidenav {
			position: fixed;
			width: 260px;
		    top: 0;
		    left: -260px;
		    height: 100%;
		    z-index: 9999;
			background-color: rgba(255, 255, 255); /* rgba 마지막 값: 투명도 */
			overflow-x: hidden; /* Disable horizontal scroll */
			padding-top: 1px; /* Place content 60px from the top */
			transition: all 0.5s;
			border: 1px solid #EDEDED;
		}

		.side_show {
			left: 0!important;
		}
		
		.toggle-btn {
			margin: 0 27px;
			font-size: 30px;
		}
		
		.user-pic {
			color: #B4B4B4;
			font-size: 100px;
		}
		
		.user-pic-wrapper {
			position: absolute;
			top: 100px;
			left: 80px;
		}
		
		.nickname {
			text-align: center;
			/* position: absolute;
			top: 220px; */
			
		}
		
	</style>
</head>

<body>

	<nav class="navbar navbar-default navbar-expand-lg" role="navigation-demo">
            
            <a class="toggle-btn"><span class="toggle-btn"><i class="fas fa-bars"></i></span></a>
            
              <!-- Brand and toggle get grouped for better mobile display -->
              
              <!--
              <div class="navbar-translate">
                <a class="navbar-brand" href="#0">Navbar </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="navbar-toggler-icon"></span>
                  <span class="navbar-toggler-icon"></span>
                  <span class="navbar-toggler-icon"></span>
                </button>
              </div>
              -->
              
              <!-- Collect the nav links, forms, and other content for toggling -->
              
              
              <div class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                  <li class="nav-item">
                    <a href="javascript:;" class="nav-link">
                     	로그인
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="javascript:;" class="btn btn-rose btn-raised btn-round " data-toggle="dropdown">
                      	시작하기
                    </a>
                  </li>
                </ul>
              </div><!-- /.navbar-collapse -->
          	 
          	 
          	 
   
          
          
          
	</nav>


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


<div class="side_overlay">

	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-lg-4 col-md-6 ml-auto mr-auto">
				<div class="card card-login">
					<form class="form" id="loginform" method="post" action="nomalLogin.bit">
						<div class="card-header card-header-primary text-center">
							<h4 class="card-title">Login</h4>
		                
						</div>
						<br>
		              <!-- <p class="description text-center">Or Be Classical</p> -->
		              
		              
						<div class="card-body">
							<span class="bmd-form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">
											<i class="material-icons">mail</i>
										</span>
									</div>
									<input type="text" class="form-control" placeholder="이메일주소" name="userid">
								</div>
							</span>
							<span class="bmd-form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">
											<i class="material-icons">lock_outline</i>
										</span>
									</div>
				                  	<input type="password" class="form-control" placeholder="비밀번호" name="pwd">
								</div>
							</span>
						</div>
						
						
						<!-- 소셜로그인 아이콘인데 살려서 쓰려면 쓰시오 
						<div class="social-line">
		                  <a href="#pablo" class="btn btn-just-icon btn-link">
		                    <i class="fa fa-facebook-square"></i>
		                  <div class="ripple-container"></div></a>
		                  <a href="#pablo" class="btn btn-just-icon btn-link">
		                    <i class="fa fa-twitter"></i>
		                  <div class="ripple-container"></div></a>
		                  <a href="#pablo" class="btn btn-just-icon btn-link">
		                    <i class="fa fa-google-plus"></i>
		                  <div class="ripple-container"></div></a>
		                </div>
						 -->
						
						<div class="footer text-center">
							 <a href="../index"><button type="submit" class="btn btn-primary">로그인</button></a>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		</div> <!-- container end -->
		
	</div> 
	
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
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
	<script src="assets/js/material-kit.js?v=2.0.4" type="text/javascript"></script>
</body>

<script type="text/javascript">

	$(document).ready(function(){
		
		$('.toggle-btn').on('click', function(){
		    $('#wrapSideMenu').addClass('side_show');
		    $('#wrapSideMenu').fadeIn();
		});
		
		$('.side_overlay').on('click', function(){
		    $('#wrapSideMenu').removeClass('side_show');
		    $('#wrapSideMenu').fadeOut();
		});
		
		/* $('.closebtn').on('click', function () {
		    $('#wrapSideMenu').removeClass('side_show');
		    $('.side_overlay').fadeOut();
		}); */
	
	});

</script>

</html>