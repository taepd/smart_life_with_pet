<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>

	<title>동물관리 홈</title>
	
	<!-- Favicon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/icons8-cat-footprint-48.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/icons8-cat-footprint-48.png" type="image/x-icon">
    
</head>
<body>
	<h3>관리 페이지</h3>
	<button type="button" onclick="location.href='main.bit'">관리 홈</button>
	<button type="button" onclick="location.href='schedule.bit'">일정</button>
	<button type="button" onclick="location.href='hospitalRecord.bit'">병원 기록</button>
	
	<div class="side_overlay">
		<div class="container">
			<h3>관리 페이지</h3>
			<button type="button" onclick="location.href='management.bit'">관리 홈</button>
			<button type="button" onclick="location.href='schedule.bit'">일정</button>
			<button type="button" onclick="location.href='hospitalRecord.bit'">병원 기록</button>
		
		
		
		<div class="card card-nav-tabs">
                <div class="card-header card-header-primary">
                  <!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
                  <div class="nav-tabs-navigation">
                    <div class="nav-tabs-wrapper">
                      <ul class="nav nav-tabs" data-tabs="tabs">
                        <li class="nav-item">
                          <a class="nav-link" href="#profile" data-toggle="tab">
                            <i class="material-icons">face</i>
                            Profile
                          <div class="ripple-container"></div></a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#messages" data-toggle="tab">
                            <i class="material-icons">chat</i>
                            Messages
                          <div class="ripple-container"></div></a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link active show" href="#settings" data-toggle="tab">
                            <i class="material-icons">build</i>
                            Settings
                          <div class="ripple-container"></div></a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="card-body ">
                  <div class="tab-content text-center">
                    <div class="tab-pane" id="profile">
                      <p> I will be the leader of a company that ends up being worth billions of dollars, because I got the answers. I understand culture. I am the nucleus. I think that’s a responsibility that I have, to push possibilities, to show people, this is the level that things could be at. I think that’s a responsibility that I have, to push possibilities, to show people, this is the level that things could be at. </p>
                    </div>
                    <div class="tab-pane" id="messages">
                      <p> I think that’s a responsibility that I have, to push possibilities, to show people, this is the level that things could be at. I will be the leader of a company that ends up being worth billions of dollars, because I got the answers. I understand culture. I am the nucleus. I think that’s a responsibility that I have, to push possibilities, to show people, this is the level that things could be at.</p>
                    </div>
                    <div class="tab-pane active show" id="settings">
                      <p>I think that’s a responsibility that I have, to push possibilities, to show people, this is the level that things could be at. So when you get something that has the name Kanye West on it, it’s supposed to be pushing the furthest possibilities. I will be the leader of a company that ends up being worth billions of dollars, because I got the answers. I understand culture. I am the nucleus.</p>
                    </div>
                  </div>
                </div>
              </div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		</div> <!-- container end -->
	</div> <!-- side_overlay end -->
	
	<jsp:include page="/WEB-INF/views/include/headerAndNavi.jsp" />
</body>
</html>