<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>슬기로운생활</title>
<%@ include file="/WEB-INF/include/import.jsp"%>
</head>
<body>

	<div class="esstto-wrapper">
		<div class="content pt-4">
			<div class="row" id="chatList">
				<div class="col-12 mb-4">
					<button type="button" class="btn btn-primary btn-lg w-100" data-toggle="modal" data-target="#roomMake">방만들기</button>
					<!-- Large modal -->
					<div id="roomMake" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span>&times;</span>
									</button>
								</div>
									<div class="modal-body p-4">
										<form method="POST" action="createChatRoom">
											<label for="chat_title">채팅방 타이틀</label> 
											<input id="room_title" name="room_title" type="text" class="form-control input-lg w-100" placeholder="몇 자 내로 작성하세요"> 
											<label for="chat_people" class="mt-3">채팅 인원수</label> 
											<input id="room_count" name="room_count" placeholder="2명에서 10명까지만 가능합니다." class="form-control" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
									<div class="row mt-3">
											<div class="col-4">
												<label for="toggle-secret">비공개 여부</label><br> <label class="switch"> 
												<input id="room_secret" name="room_secret" type="checkbox"> <span class="slider round"></span>
												</label>
											</div>
										<div class="col secret-input-box"></div>
									</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-outline-light">취소</button>
												<button type="submit" class="btn btn-primary">방만들기</button>
											</div>
										</form>
									</div>
							</div>
						</div>
					</div>
					
					
					<!-- 비밀번호 모달 -->
					<div class="modal fade bd-example-modal-lg" id="pwdmodal" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span>&times;</span>
									</button>
								</div>
							<div class="modal-body p-4">
								<label for='secret-input'>비밀번호</label><input class='form-control' id='pwdChk' name='pwdChk' placeholder='네 자리의 숫자를 입력하세요' onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
								<div class="modal-footer">
										<button type="button" class="btn btn-outline-light">취소</button>
										<div class="mt-3"><button type="button" onclick="pwdcheck();" class="btn btn-primary">입장하기</button></div>
								</div>
							</div>
								
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 기본 폼 완성 -->
	<input type="hidden" id="userid" value="${session.user.userid}">
	<input type="hidden" id="nick" value="${session.user.nick}">
	
	
	<script type="text/javascript">
		var userid = $('#userid').val();
		var nick = $('#nick').val();
		
		var roomnum = "";
		
		
		//비밀방 체크했을시 비밀번호 폼 생성
		$('#room_secret').change(function() {
			console.log($('input:checkbox[id="room_secret"]').val());

			a = "";
			if ($('#room_secret').is(':checked')) {
				a += "<label for='secret-input'>비밀번호</label><input class='form-control' type='number' id='room_pwd' name='room_pwd' placeholder='네 자리의 숫자를 입력하세요' onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>"
				$('.secret-input-box').html(a);
			} else {
				$('.secret-input-box').html(a);
					}

			})
			
			
		//방 만들때 유효성 검증				
		 $('button:submit').click(function() {
			 let pwd = /^\d{4}$/;
			 
			
			 let count = Number($('#room_count').val());
			 
             if($('#room_title').val() == '') {
            	 alert("채팅방 이름을 입력해주세요.");
            	 return false;
             } else if($('#room_count').val() == '' || count < 2 || count > 10) {
            	 alert("채팅방 인원은 2명에서 10명 사이로 선택해주세요.");
            	 return false;
             } else if($('#room_secret').is(':checked')) {
            	 if($('#room_pwd').val() == '' || !pwd.test($('#room_pwd').val())) {
                	 alert("비밀번호는 4자리 숫자를 입력해주세요.");
                	 return false;
            	 }
             }		 
                
            });			 
						
						
		//페이지 시작 시 채팅방 불러오기
		$(function () {
			getChatList();
		})
		
		//채팅방 목록 불러오기
		
		/**
		* @함수명 : getChatList()
		* @작성일 : 2020. 7. 21.
		* @작성자 : 오주형
		* @설명 : 채팅방 리스트 불러오기
		**/
		function getChatList() {
			$.ajax({
	    		type:'POST',
	    		url: 'getChatList',
	    		success:function(data) {
	    			/* $('#endNum').val(data.length); */
	    			if(data.length == 0) {
	    				$('#chatList').append(
	    					'<div>' +
	    					'<h1>현재 개설된 채팅방이 없습니다. 개설해보세요!</h1>'+
	    					'</div>'
	    				);
	    				return false;
	    			}
	    			
	    			$.each(data, function(index, obj) {
	    				var secret = "공개방";
	    				var	button = '<button type="button" onclick="selectChatRoom('+obj.current_count+','+obj.room_count+','+obj.room_number+', '+"'"+''+obj.room_secret+''+"'"+')" class="btn btn-outline-primary btn-lg">입장하기</button>'; 
	    				
	    				if(obj.room_secret == 'Y') {
	    					secret = '비밀방'
	    					button = '<button type="button" onclick="selectChatRoom('+obj.current_count+','+obj.room_count+','+obj.room_number+', '+"'"+''+obj.room_secret+''+"'"+')" class="btn btn-outline-primary btn-lg" data-toggle="modal" data-target="#pwdmodal">입장하기</button>';
	    				}
	    				
	    				$('#chatList').append(
	    				'<div class="col-lg-4">'+
						'<div class="card border-primary" style="height: 280px;">'+
							
							'<div class="card-body">'+
								'<div class="chat-title" style="height: 75%;">'+
									'<h3>'+obj.room_title+'</h3>'+
								'</div>'+
								'<span>'+obj.user_nickname+'</span>'+
								'<div>'+
									button+	
									'</div>'+
							'</div>'+
							'<div class="card-footer pl-4">'+
								'<i class="icon-people mt-2"></i>&nbsp;&nbsp;<small>'+obj.current_count+' / '+obj.room_count+'</small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
								'<i class="icon-lock mt-2"></i>&nbsp;&nbsp;<small>'+secret+'</small>'+
							'</div>'+
						'</div>'+
						'</div>'
    						
    					);
    				});
	    		}
	        });
		}
		
	
		/**
		* @함수명 : selectChatRoom(current_count, room_count, room_number, room_secret)
		* @작성일 : 2020. 7. 21.
		* @작성자 : 오주형
		* @설명 : 채팅방 입장하는 메소드
		* @param current_count - 현재 방 인원수 
				room_count - 최대 정원수  
				room_number - 방 번호
				room_secret - 비밀방 여부
		**/
		function selectChatRoom(current_count, room_count, room_number, room_secret) {
			if(current_count >= room_count) {
				alret("방이 가득 찼습니다.")
				return false;
			}
			
			if(room_secret === 'N') {
				location.href="selectChatRoomByRn?room_number="+room_number;
			}else {
				roomnum = room_number;
			}
		}
			
		
	
		/**
		* @함수명 : pwdcheck()
		* @작성일 : 2020. 7. 21.
		* @작성자 : 오주형
		* @설명 : 비밀방 입장 시 비밀번호 체크
		**/
		function pwdcheck() {
			let pwd = /^\d{4}$/;
			if(!pwd.test($('#pwdChk').val())) {
				 alert("비밀번호는 4자리 숫자를 입력해주세요.");
            	 return false;
			} 
			$.ajax({
				type:'POST',
				url: 'getRoomPwd',
				data:{'room_number' : roomnum},
				success:function(data){
					if(data == $('#pwdChk').val()) {
						swal("성공", "비밀번호가 맞았습니다.", "success");
						setTimeout(function() {
							location.href = "selectChatRoomByRn?room_number="+roomnum;
							}, 1000);
					} else {
						swal("실패", "비밀번호가 틀렸습니다.", "error");
					}
				}
		    });
		}
		
		
		//숫자만 입력가능
		
		/**
		* @함수명 : onlyNumber(event)
		* @작성일 : 2020. 7. 21.
		* @작성자 : 오주형
		* @설명 : 입력시 숫자만 입력가능하게 하는 메소드
		* @param event - 파라미터로 받는 이벤트 
		**/
		function onlyNumber(event){
            event = event || window.event;
            var keyID = (event.which) ? event.which : event.keyCode;
            if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
                return;
            else
                return false;
        }
	
		
		/**
		* @함수명 : removeChar(event)
		* @작성일 : 2020. 7. 21.
		* @작성자 : 오주형
		* @설명 : 입력시 문자 제거해주는 메소드
		* @param event - 파라미터로 받는 이벤트 
		**/
        function removeChar(event) {
            event = event || window.event;
            var keyID = (event.which) ? event.which : event.keyCode;
            if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
                return;
            else
                event.target.value = event.target.value.replace(/[^0-9]/g, "");
        }
			
		
		
		
		
		
		
		
	</script>
</body>
</html>