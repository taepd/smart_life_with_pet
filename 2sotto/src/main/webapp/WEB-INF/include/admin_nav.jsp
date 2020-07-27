<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>

  <!--     Fonts and icons     -->
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/admin_assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/assets/admin_assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!--  pet테이블에서 가지고옴 -->
  <link href="${pageContext.request.contextPath}/assets/admin_assets/demo/demo.css" rel="stylesheet" />
   <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
    <!-- 데이터테이블 CDN -->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" crossorigin="anonymous">
  
   <!--  pet테이블에서 가지고옴 -->
  <!--  JQuery 추가 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



<!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
      <div class="container-fluid">
      
       <div class="wrapper ">
      <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="/" class="simple-text logo-mini">
          <div class="logo-image-small">
            <img src="${pageContext.request.contextPath}/assets/admin_assets/img/logo-small.png">
          </div>
        </a>
        <a href="adminMain.bit" class="simple-text logo-normal">
          슬기로운 반려생활
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="active ">
            <a href="adminMain.bit">
              <i class="nc-icon nc-spaceship"></i>
              <p>대시보드</p>
            </a>
          </li>
          <li>
            <a href="userTable.bit">
              <i class="nc-icon nc-single-02"></i>
              <p>유저 리스트</p>
            </a>
          </li>
          <li>
            <a href="userPetTable.bit">
              <i class="nc-icon nc-diamond"></i>
              <p>동물 리스트</p>
            </a>
          </li>
          <li>
            <a href="userPointTable.bit">
              <i class="nc-icon nc-diamond"></i>
              <p>포인트 리스트</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
<!-- 스피너 -->
<div id="page-loading">
   	<i class="fa fa-spinner fa-pulse fa-3x fa-fw margin-bottom"></i>    
</div>  
<!-- 스피너 -->
       <ul class="navbar-nav">
        <li class="nav-item btn-rotate dropdown">
       <ul class="navbar-nav">
         <li class="nav-item btn-rotate dropdown">  
          <a class="nav-link dropdown-toggle" href="" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="nc-icon nc-single-02"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Profile</span>
                  </p>
                </a>             
           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
             <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">로그아웃</a>
           </div>
         </li>
       </ul>
   	</li>
   	</ul>
   </div>
 </nav>
      <!-- End Navbar -->
      
    
<script>
$(document).ready(function() {

//스피너	
	$("#page-loading").fadeOut(500);
		});
</script>
</body>
</html>