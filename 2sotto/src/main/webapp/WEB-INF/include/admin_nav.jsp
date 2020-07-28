<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
          <div class="sidebar" data-color="white" data-active-color="danger">
               <div class="logo">
		        <a href="adminMain.bit" class="simple-text logo-mini">
		            <img src="${pageContext.request.contextPath}/assets/admin_assets/img/logo-small.png">
		        </a>
		        <a href="adminMain.bit" class="simple-text logo-normal">
		          슬기로운 반려생활
		        </a>
		      </div>
          <div class="sidebar-wrapper">
        	<ul class="nav">
	          <li>
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
	          <li>
	            <a href="userDonationTable.bit">
	              <i class="nc-icon nc-diamond"></i>
	              <p>후원게시판</p>
	            </a>
	          </li>
	        </ul>
          </div>
        	</div>	
          </div>
    
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
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
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
 
 
