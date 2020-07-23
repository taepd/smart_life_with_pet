<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>생활</title>
<%@ include file="/WEB-INF/include/import.jsp"%>
</head>
<body>
	
	<div class="bodiary-wrapper">
		<div class="content pt-4">
			<div class="row ">
				<div class="col-lg-3">
					<div>
						<div class="p-3">
							<div class="chat-title mt-3">
								<h3 text="${chat.room_title}"></h3>
							</div>
							<hr>
							<div class="mt-2">
								<i class="icon-people mt-2"></i>&nbsp;&nbsp;<small text="${chat.room_count}"></small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<i class="icon-lock mt-2"></i>&nbsp;&nbsp;<small if="${chat.room_secret.equals('N')}"></small><small if="${chat.room_secret.equals('Y')}">비밀방</small>
							</div>
							<div class="mt-3 mb-4">
								<button id="exitBtn" class="btn btn-outline-primary w-100" type="button">나가기</button>
							</div>
							<div class="mt-3 mb-4">
								<button id="deleteBtn" style="display:none;" class="btn btn-outline-primary w-100" type="button" >방 삭제</button>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header count">
							
						</div>
						
					</div>
					<div class="userlist">
							
						</div>
				</div>
				<div class="col chat-content-box m-3">
					<div class="chat-content">
						
					</div> 
					<div class="chat-input-box row">
						<div class="col-10 pr-0">
						<input type="text" id="message" class="form-control chat-input input-lg pl-4 pr-4" placeholder="매너채팅 하세요!! :)">
						</div>
						<div class="col pl-1">
							<button type="button" id="sendBtn" class="btn btn-lg btn-dark chat-input-btn w-100">전송</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 기본 폼 완성 -->

	<!-- 공통 스크립트-->

	
</body>

<script type="text/javascript">
	
	
		var room_number = ${chat.room_number};
		var room_count =  ${chat.room_count};
		var user_nickname = "${sessionScope.user.nick}";
		var user_img = "${sessionScope.user.uimg}";
		var user_email = "${sessionScope.user.userid}";
		var master_email =  "${chat.user_email}";
			
		console.log(user_email);



	
	
	
	//채팅방 나가기
	$('#exitBtn').click(function() {
		
		if(confirm("채팅방에서 나가시겠습니까?") == true) {
			var text = '님이 나가셨습니다.';
			var msg = 
				{
					"type" : "notice",
	            	"text": text,
					"user_nickname" : user_nickname,
					"date" : Date.now()
				};
			
			webSocket.send(JSON.stringify(msg));
			
			
			
			location.href = "exitChatRoom?user_email="+user_email+"&room_number="+room_number;
				
			
			
		} else {
			return false;
		}
	

	});
	
	
	//방장일 경우 채팅방 삭제하기
	$('#deleteBtn').click(function() {
		if(confirm("채팅방을 정말 삭제하시겠습니까? 나가면 다시 참여가 불가합니다.") == true) {
			//swal("성공", "채팅방이 삭제되었습니다.", "success");
			alert("성공", "채팅방이 삭제되었습니다.", "success");
			var text = '[알  림] 방장이 해당 채팅방을 삭제했습니다. 나가면 다시 참여가 불가합니다.';
			var msg = 
				{
					"type" : "delete",
	            	"text": text,
					"date" : Date.now()
				};
			webSocket.send(JSON.stringify(msg));
		
			//location.href = "deleteChatRoom?room_number="+room_number+"&user_email="+user_email;
			
			setTimeout(function() {
				location.href = "deleteChatRoom?room_number="+room_number;
				}, 1000);
			
		
		} else {
			return false;
		}
	});
	
	
	
	
	
	$(document).ready(function() {
		connect();
		
		if(master_email == user_email){	// 해당 채팅방에서 방장이 아니면 방삭제 버튼을 안보이게함
			$('#deleteBtn').show();
		}
		
		 setInterval('getMemberList(room_number)', 1000);  // 1초간격으로 채팅방 인원변경 확인, Ajax통신
		
		
		$('#message').keypress(function(event) {	// 채팅메세지를 엔터를 쳐서 보낼수 있게해주는 것
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13') {
				send();
			}
			event.stopPropagation();
		});
		
		$('#sendBtn').click(function() { //메세지 보내는 버튼
			send();
			
		});
	});
	

	var webSocket;
	
	
	/**
	* @함수명 : connect()
	* @작성일 : 2020. 7. 21.
	* @작성자 : 오주형
	* @설명 : 웹소켓 연결하는 메소드
	**/
	function connect() {
		webSocket = new WebSocket(
				"ws://" + location.host + "/bit/chat?room_number="+room_number);
		webSocket.onopen = onOpen;
		webSocket.onmessage = onMessage;
	
	}
	

	
	
	/**
	* @함수명 : onMessage(evt)
	* @작성일 : 2020. 7. 21.
	* @작성자 : 오주형
	* @설명 : 채팅방 접속할때 실행되는 메소드
	* @param evt - 핸들러에서 받은 파라미터
	**/
	function onOpen(evt) {
				
		
		var text = '님이 참여하셨습니다.';
		var msg = 
		{
			type : "notice",
	    	text : text,
	    	room_number : room_number,
			user_nickname : user_nickname,
			date : Date.now()
		};
		console.log(msg);
		webSocket.send(JSON.stringify(msg));
	}
	

	
	/**
	* @함수명 : send()
	* @작성일 : 2020. 7. 21.
	* @작성자 : 오주형
	* @설명 : 채팅 메세지를 보내는 메서드
	**/
	function send() {				 
		var text = $("#message").val();
		
		var msg = 
		{
			type : "msg",
	    	text: text,
			user_email: user_email,
			user_nickname : user_nickname,
			user_img : user_img,
			date : Date.now()
		};
		console.log(msg);
		webSocket.send(JSON.stringify(msg));
		
		$("#message").val("");
	}
	
	
	
	/**
	* @함수명 : onMessage(evt)
	* @작성일 : 2020. 7. 21.
	* @작성자 : 오주형
	* @설명 : 채팅메세지를 받는 메소드
	* @param evt - 핸들러에서 받은 메시지 내용
	**/
	function onMessage(evt) {
	/* 	console.log(evt.data.split("/")[0]);
		console.log(evt.data.split("/")[1]);
		var memberCount = ""; */
		
		var tag = "";
		var text = "";
		
		
		
		/* var currentCount = evt.data.split("/")[0]; */
		var msg = JSON.parse(evt.data);
		/* var userlist = evt.data.split("/")[2]; */
		var time = new Date(msg.date);
		var ampm = (time.getHours() > 12 ?  "PM" : "AM");
		var h = (time.getHours() > 12 ? time.getHours() - 12 : time.getHours());
		var m = time.getMinutes();
		
		if (m >= 0 && m <= 9){
			m = "0" +m;
		}
		
		var timeStr = ampm +" " +h + ":" +m;
	/* 	appendUserList(userlist); */
	
	
		//메세지 타입이 notice일 경우
		if(msg.type == "notice") {
			
			/* memberCount += '<div>'+currentCount + " / " + room_count + '</div>';  */
		   
			
			tag += '<div class="center">';
			tag += '<span class="small">'+msg.user_nickname + msg.text + ' ['+timeStr +']</span>';
			tag += '</div>';
			appendMessage(tag); 
			
			/* appendCount(memberCount); */
			
		//메시지 타입이 delete일 경우
		} else if(msg.type == "delete") {
			tag += '<div class="notice">';
			tag += '<div class="notice-message">';
			tag += '<p class="deleteNotice">' +msg.text +' ['+timeStr +'] </p>';
			tag += '</div>';
			tag += '</div>';
			appendMessage(tag);
		
		//메시지 타입이 msg 일 경우
		} else if(msg.type == "msg") {
			if(msg.user_email == user_email) {
				
				tag += '<div class="chatting my-chat">';
				tag += msg.text;
				tag += '</div>';
				tag += '<small>' + timeStr + '</small>';
	    		appendMessage(tag);    		
	    		
	    	} else {
	    		
	    		tag += '<div class="chatting your-chat">';
	    		tag += '<img src="assets/upload/userUpload/'+msg.user_img+'" height="40" width="40" alt="">';
	    		tag += '<div>' + msg.user_nickname + '</div>';
				tag += msg.text;
				tag += '</div>';
				tag += '<small>' + timeStr + '</small>';
	    		
	    		
	    		
	    
	    		appendMessage(tag);
	    	
	   
	    	}
		}
	}
	
	
	
	
	/**
	* @함수명 : appendMessage(tag)
	* @작성일 : 2020. 7. 21.
	* @작성자 : 오주형
	* @설명 : 보낸 채팅메세지를 화면에 나타내는 메서드
	* @param tag- 메시지 내용
	**/
	function appendMessage(tag) {
		$(".chat-content").append(tag);
		/* $(".chatMessageArea").scrollTop($(".chatMessageArea")[0].scrollHeight);	 */
	}
	
	//채팅방 유저 목록 나타내기
/* 	function appendUserList(userlist) {
		$(".userlist").empty();
		$(".userlist").append(userlist);
	} */
	
	//채팅방 멤버 수 나타내기
/* 	function appendCount(memberCount) {
		$(".count").empty();
		$(".count").append(memberCount);
	} */
	
	
	
	
	
	
	
	/**
	* @함수명 : getMemberList(room_number)
	* @작성일 : 2020. 7. 21.
	* @작성자 : 오주형
	* @설명 : 현재 채팅방에 접속한 유저를 파악하는 메서드
	* @param room_number- 방 번호
	**/
	 function getMemberList(room_number) {
		$('.userlist').children().remove();
		
		$.ajax({
			type:'POST',
			url: 'getMemberList',
			data:{'room_number' : room_number},
			success:function(data){
				var memberList = "";
				$.each(data, function(key, value) {
					var currentMemberCount = data.length;
					var memberCount = '';
						memberCount += '<div class="count"> 참여자수 : ' +currentMemberCount +' / ' + room_count +'</div>'; 
						
					$('.count').html(memberCount);
					
					/*  
						memberList += "<span>" +value.user_nickname; */
						
						
				});
				/* memberList+="</span>";
				$('.userlist').html(memberList); */
			}
	    });
	} 
	
	
	//새로고침 방지
	function noEvent() { // 새로 고침 방지
	    if (event.keyCode == 116) {
	        event.keyCode = 2;
	        return false;
	    } else if (event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82)) {
	        return false;
	    }
	}
	
	document.onkeydown = noEvent;
	




	
		

	
		
	</script>
</html>