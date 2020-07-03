<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
			<h3>쪽지</h3>
			<button type="button" onclick="location.href='adminMain.bit'">받은 쪽지함</button>
			<button type="button" onclick="location.href='adminMain.bit'">보낸 쪽지함</button>
			<button type="button" onclick="location.href='noteWrite.bit'">쪽지 쓰기</button>
			<button type="button" onclick="location.href='noteDetail.bit'">쪽지 상세보기</button>
		
		
		
		<div class="card card-nav-tabs">
                <div class="card-header card-header-primary">
                  <!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
                  <div class="nav-tabs-navigation">
                    <div class="nav-tabs-wrapper">
                      <ul class="nav nav-tabs" data-tabs="tabs">
                        <li class="nav-item">
                          <a class="nav-link" href="#profile" data-toggle="tab">
                            <i class="material-icons">face</i>
                            받은 쪽지함
                          <div class="ripple-container"></div></a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#messages" data-toggle="tab">
                            <i class="material-icons">face</i>
                            보낸 쪽지함
                          <div class="ripple-container"></div></a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#settings" data-toggle="tab">
                            <i class="material-icons">chat</i>
                           쪽지 쓰기
                          <div class="ripple-container"></div></a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#Detail" data-toggle="tab">
                            <i class="material-icons">chat</i>
                           쪽지 상세보기
                          <div class="ripple-container"></div></a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="card-body ">
                  <div class="tab-content text-center">
                    <div class="tab-pane" id="profile">
                      <p> 나는 보캐슬이다 </p>
                    </div>
                    <div class="tab-pane" id="messages">
                      <p> 어렵지만...</p>
                    </div>
                    <div class="tab-pane" id="settings">
                      <p>불태운다.</p>
                    </div>
                     <div class="tab-pane" id="Detail">
                      <p>하...뜨거</p>
                    </div>
                  </div>
                </div>
              </div>
		

		</div> <!-- container end -->
	</div> <!-- side_overlay end -->
	
	<
</body>
</html>