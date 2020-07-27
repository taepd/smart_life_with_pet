<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>

	<!-- pageContext.request.userPrincipal.name -->
	<se:authentication property="name" var="userid" />
	<c:set var="user" value="${sessionScope.user}" />
	
	<!-- header -->
	<nav class="navbar navbar-transparent fixed-top" role="navigation-demo" style="color: #000000;">
		<a class="toggle-btn"><span class="toggle-btn"><i class="fas fa-bars"></i></span></a>
		<div style="width:200px; margin-top:8px;">
			<span id="header-title">
				<se:authorize access="!hasAnyRole('ROLE_USER')">
					<a href="${pageContext.request.contextPath}/">
				</se:authorize>
				<se:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
					<a href="${pageContext.request.contextPath}/main.bit">
				</se:authorize>
					<svg id="레이어_1" data-name="레이어 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 360 60"><defs><style>.cls-1{fill:#9c27b0;}</style></defs><path d="M8.26,29.84V27.22H45.88v2.62Zm34-6.05c-7.3-1.48-13.36-5.53-15.17-9.3-1.38,3.81-7.44,7.92-15,9.35l-1.48-2.48c7-.77,14.93-5.11,14.93-10.78V9.29h3.14v1.29c0,5.72,8.68,10,15,10.73ZM13,50v-9.3H37.91V36.85H12.83V34.23H41v8.82H16.08v4.34H42.59V50Z"/><path d="M51.8,41.86l-1.86-2.43c10.63-5.29,16.92-13.88,17.69-23.51H51.7V13.3H71C70.73,27.13,62,36.38,51.8,41.86Zm28.56,8.58V8.77h3V50.44Z"/><path d="M90.76,45.1V42.48H108V34.76H95.77V21.88h24.55V14.82H95.77V12.25h27.61V24.46H98.82v7.72h25.65v2.58H111v7.72h17.36V45.1Z"/><path d="M149.37,41.48V32.9H132V30.27h37.62V32.9H152.42v8.58Zm1.38-15.31c-8.82,0-14.07-2.62-14.07-7.91s5.3-7.92,14.12-7.92S165,13,165,18.26,159.62,26.17,150.75,26.17ZM137,49V37.57h3v8.87H165V49Zm2.81-30.75c0,3.62,4.29,5.29,10.92,5.29s11.16-1.67,11.16-5.29S157.47,13,150.8,13,139.83,14.68,139.83,18.26Z"/><path class="cls-1" d="M186.62,32.47V11.2h4.91v7h10V11.1h4.87V32.47Zm4.53,17.11V36.23h4.91v9.4h23.6v3.95Zm10.34-27.65h-10V28.6h10Zm16.93-1.43h6.25v4.1h-6.25V39.09h-4.91V8.39h4.91Z"/><path class="cls-1" d="M249.52,40c-4.72.91-9.44,1.1-16.55,1.14H228.3V23.74h13.3V16H228.3V12.11h18.21V27.7H233.16v9.39A96,96,0,0,0,249,36Zm-.1-10.44h7.34v-7h-7.34v-4h7.34V8.39h4.87V50.87h-4.87V33.56h-7.34Z"/><path d="M287.48,31.18c-3-1.62-7.2-5.48-8.59-8.77-.95,3.43-4.57,7.62-8.39,10.06l-2.05-2.24c4.15-2.25,8.92-7.25,8.92-13.45V11.39h3v5.34c0,6.53,5.92,10.63,8.92,12.11Zm2.14,19.12c-8.87,0-14.06-2.86-14.06-7.39s5.19-7.44,14.06-7.44,14.12,2.86,14.12,7.44S298.54,50.3,289.62,50.3ZM278.8,42.91c0,3,4.24,4.77,10.82,4.77s10.88-1.81,10.88-4.77-4.25-4.82-10.88-4.82S278.8,40,278.8,42.91Zm21.5-7.39V22.64h-5.81V33.32h-3.05V9.53h3.05V20h5.81V8.77h3.06V35.52Z"/><path d="M323.63,28.37v2.05c4.77-.24,9.39-.62,12-1l.23,2.43c-3.05.39-8.29.86-13.44,1.24-4.68.29-9.82.48-12.83.48L309,30.94c2.86,0,7-.09,11.54-.33V28.37c-4.34-.29-7.78-1.82-7.78-5.11,0-3.67,4.25-5.24,9.21-5.24s9.29,1.52,9.29,5.2C331.3,26.51,327.92,28,323.63,28.37ZM310.37,16.78V14.25H334v2.53Zm4.48,33.38V41.48h23.51V38.33h-23.6V35.76h26.65v8.15H317.86v3.67H343v2.58ZM322,20.5c-3.44,0-6.3.76-6.3,2.72s2.91,2.67,6.3,2.67,6.34-.77,6.34-2.67S325.39,20.5,322,20.5Zm-5.63-8.44V9.48h11.4v2.58Zm25,12v9.45h-3.05V8.77h3.05V21.45h6.49v2.62Z"/></svg></a>
			</span>
		</div>
		
		<se:authorize access="!hasRole('ROLE_USER')">
			<ul class="navbar-nav">
				<li class="nav-item" id="item01">
					<a href="${pageContext.request.contextPath}/login/login.bit" class="nav-link">로그인</a>
				</li>
				<li class="nav-item" id="item02">
					<a href="${pageContext.request.contextPath}/join/register.bit" class="btn btn-primary btn-raised btn-round">
						회원가입
					</a>
				</li>
			</ul>
		</se:authorize>	
		<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">			
					
					<li class="nav-item" id="item03">
						<a href="${pageContext.request.contextPath}/message/msgRePage.bit"><span id="message"><i class="far fa-bell"></i></span>
						<%-- <a href="${pageContext.request.contextPath}/message/main.bit"><span id="message"><i class="far fa-envelope"></i></span> --%>
							<span class="badge badge-pill badge-warning" id="alarmCount"></span>
						</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span onclick='popupchatList()' id="message" style="cursor:pointer"><i class="far fa-comment"></i></span>
						<%-- <a href="${pageContext.request.contextPath}/message/main.bit"><span id="message"><i class="far fa-envelope"></i></span> --%>
							<span class="badge badge-pill badge-warning" id="message-alarm" ></span>
							
							
		            </li>
					
		            <li class="nav-item" id="item02">
		                <a href="${pageContext.request.contextPath}/logout" class="btn btn-primary btn-raised btn-round">
		                	로그아웃
		                </a>
        </li>
		</se:authorize>
	</nav>
	

<!-- navi -->
<div id="wrapSideMenu" class="sidenav">
	<div class="row">
		<div class="col"></div>
		<div class="col-lg-2">
			<span class="sideMenu-close-icon"><i class="fas fa-times"></i></span>
		</div>
	</div>
	<div class="row" style="margin-bottom: 40px;">
		<div class="col-lg-12" style="text-align: center;">
			<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
					<div class="profile-img-box">
						<img src="${pageContext.request.contextPath}/assets/images/${user.uimg}" class="rounded-circle img-fluid">
					</div>
					<div class="nickname">
						${user.nick}<br>(${userid})<br>
						<a href="${pageContext.request.contextPath}/point/main.bit">${user.userPoint}P</a><br>
						<button class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/mypage/main.bit'">마이페이지</button>
					</div>
			</se:authorize>
			<se:authorize access="!hasRole('ROLE_USER')">	
				<!-- 뭔가 멘트가 구린데... 생각나는 게 없넴 -->
					<p id="nav-paragraph">
						내 반려동물을
						<br>
						더 사랑하는 방법,
						<br>
						<br>
						슬기로운 반려생활<br>
					</p>
				<div class="nickname">
					<button class="btn btn-primary btn-sm" onclick="location.href='join/register.bit'">회원가입</button>
					<!-- <button class="btn btn-primary btn-sm" onclick="location.href='mainTest2.bit'">테스트</button> -->
				</div>
			</se:authorize>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12" style="text-align: center;">
			<div class="menuList">
				<ul class="navbar-nav ml-auto">
				<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
					<li><a href="${pageContext.request.contextPath}/management/main.bit">반려동물 관리</a></li>
					<!-- <li><a href="${pageContext.request.contextPath}/blog/myMain.bit">내 블로그</a></li> -->
					<%-- <li><a href="${pageContext.request.contextPath}/blog/favorite.bit">즐겨찾기한 글</a></li> 블로그 안쪽으로 들어가야 할듯... 아님 마이페이지 라든지--%>
					<%-- <li><a href="${pageContext.request.contextPath}/mypage/main.bit">마이페이지</a></li> --%>
					<li><a href="${pageContext.request.contextPath}/blog/main.bit">모두의 블로그</a></li>	
					<li><a href="${pageContext.request.contextPath}/donation/main.bit">후원게시판</a></li>
					<!--  <li><a href="${pageContext.request.contextPath}/qna/main.bit">Q&A</a></li> -->
				</se:authorize>
				
				<se:authorize access="hasAnyRole('ROLE_ADMIN')"> 
					<!-- <li><a href="${pageContext.request.contextPath}/admin/main.bit">관리자 페이지</a></li> -->
					<li><a href="${pageContext.request.contextPath}/admin/adminMain.bit">admin테스트</a></li>
				</se:authorize>	
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- 알람테스트 세션에 저장된 유저 이메일 저장 시작 -->
<se:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
<input type="hidden" id="userid" value="${session.user.userid}">
</se:authorize>
	<!-- 알람테스트 세션에 저장된 유저 이메일 저장 끝 -->
	<!-- 알람테스트 세션에 저장된 유저 이메일 저장 시작 -->
			<!-- <th:block th:if="${session.currentUser != null}">
				<input type="hidden" th:value="${session.currentUser.user_email}" id="user_email">
				</th:block> -->
	<!-- 알람테스트 세션에 저장된 유저 이메일 저장 끝 -->
<script>
//알람 테스트 
$(document).ready(function() {
			if($('#userid').val() != null) {
				connect();	
			}
			
		})
		
		var wsocket;
		
		function connect() {
			wsocket = new WebSocket(
					"ws://" + location.host + "/bit/alarm");
			wsocket.onopen = onOpen;
			wsocket.onmessage = onMessage;
			wsocket.onclose = onClose;
		}
		function disconnect() {
			wsocket.close();
		}
		
		function onOpen(evt) {
			send();
		}
		
		function onMessage(evt) {
			
			
			var data = evt.data;
			var msg = JSON.parse(data);
			appendMessage(msg);
			console.log(evt.data);
			
			
			
		}
		
		function onClose(evt) {
		}
		
		function send() {
			var msg = {"type" : "view"};
			wsocket.send(JSON.stringify(msg));
			/* wsocket.send("login"); */
		}
	
		function appendMessage(msg) {	
			$("#alarmCount").html(msg.count);
			if(msg.type == "view") {
				if(msg.now == "userid") {
					$("#alarmMessage").html(
							'<li>'+
		                         '<a href="msgRePage.bit">'+
		                             '<span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>'+
		                             '<div class="notification-content">'+
		                                '<h6 class="notification-heading">'+msg.text+'</h6>'+
		                             '</div>'+
		                         '</a>'+
		                     '</li>')	
				}else {
					$("#alarmMessage").html(
							'<li>'+
		                         '<a href="msgRePage.bit">'+
		                             '<span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>'+
		                             '<div class="notification-content">'+
		                                '<h6 class="notification-heading">'+msg.text+'</h6>'+
		                             '</div>'+
		                         '</a>'+
		                     '</li>'	)
				}
			} else if(msg.type == "user") {
				$("#alarmMessage").html(
						'<li>'+
	                         '<a href="msgRePage.bit">'+
	                             '<span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>'+
	                             '<div class="notification-content">'+
	                                '<h6 class="notification-heading">'+msg.text+'</h6>'+
	                             '</div>'+
	                         '</a>'+
	                     '</li>'	)
			} else if(msg.type == "admin"){
				$("#alarmMessage").html(
						'<li>'+
	                         '<a href="msgRePage.bit">'+
	                             '<span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>'+
	                             '<div class="notification-content">'+
	                                '<h6 class="notification-heading">'+msg.text+'</h6>'+
	                             '</div>'+
	                         '</a>'+
	                     '</li>'	)
			}
				
		
			
		/* 	var count = msg.split(",")[0];
			var message = msg.split(",")[1];
			
			$(".alarmCount").html(count);
			if(count === '0') {
				$("#alarmMessage").empty();
				
			}else {
				if(message === '새로운 문의가 도착했습니다.') {
				$("#alarmMessage").html(
						'<li>'+
	                         '<a href="javascript:void()">'+
	                             '<span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>'+
	                             '<div class="notification-content">'+
	                                '<h6 class="notification-heading">새로운 문의가 도착했습니다.'+count+'건</h6>'+
	                             '</div>'+
	                         '</a>'+
	                     '</li>'		
					)
				}else if (message === "관리자가 답변을 했습니다.") {
					$("#alarmMessage").html(
							'<li>'+
		                         '<a href="javascript:void()">'+
		                             '<span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>'+
		                             '<div class="notification-content">'+
		                                '<h6 class="notification-heading">관리자가 답변을 했습니다.'+count+'건</h6>'+
		                             '</div>'+
		                         '</a>'+
		                     '</li>'		
						)
				}
			} */
		
		}
//알람테스트 

function popupchatList(){
	
	var popupX = (window.screen.width / 2) - (1000 / 2); 
	//만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height /2) - (1000 / 2); 
	//만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	
	window.open('${pageContext.request.contextPath}/chatList.bit','_blank',
			'width=580, height=700, left='+ popupX + ', top='+ popupY);
	
}
</script>
