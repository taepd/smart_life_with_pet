$(document).ready(function(){
		
	$('.toggle-btn').on('click', function(){
	    $('#wrapSideMenu').addClass('side_show');
		$('#wrapSideMenu').fadeIn();
		console.log('실행!');
	});
	
	$('.side_overlay').on('click', function(){
	    $('#wrapSideMenu').removeClass('side_show');
	    $('#wrapSideMenu').fadeOut();
	});
		
	$('.sideMenu-close-icon').on('click', function () {
		$('#wrapSideMenu').removeClass('side_show');
		$('#wrapSideMenu').fadeOut();
	}); 
	
	//스피너	
	$("#page-loading").fadeOut(500);

	
	//알람 테스트 
	if($('#userid').val() != null) {
		connect();	
	}
	
});

// jquery slide toggle

		
var wsocket;

function connect() {
	wsocket = new WebSocket(
			"ws://" + location.host + "/bit/alarm");
	wsocket.onopen = onOpen;
	wsocket.onmessage = onMessage;
	//wsocket.onclose = onClose;
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

