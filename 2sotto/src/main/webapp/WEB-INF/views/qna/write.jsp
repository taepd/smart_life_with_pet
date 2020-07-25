<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>

    
</head>
<script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<script type="text/javascript">
/* $(document).ready(function() {
	connect();
	/* $('#sendQna').click(function() { send(); }); */
/* })

var wsocket;

function connect() {
	wsocket = new WebSocket("ws://" + location.host + "/bodiary/alarm");
	wsocket.onopen = onOpen;
	wsocket.onmessage = onMessage;
	wsocket.onclose = onClose;
}
function disconnect() {
	wsocket.close();
}

function onOpen(evt) {
	console.log("onOpen(evt)");
}

function onMessage(evt) {
	console.log("evt :" + evt);
	var data = evt.data;
	appendMessage(data);
}

function onClose(evt) {
}

function send() {
	
	
	wsocket.send("login");
	
}

function appendMessage(msg) {
	console.log(msg);
	alert("msg : " + msg);
}
 */
 $(function() {

		CKEDITOR.replace( 'content' );

		
	}) 
 $(function() {
	 console.log(wsocket);
	 $('#sendQna').click(function() { 
		 
		 sendQna(); });
	/*  function send() {
		
		alert("갑니다")
		wsocket.send("Qna"); 
		form.submit();
	} */
})

function sendQna() {
	/* let qna_brd_title = $('#qna_brd_title').val();
	let qna_brd_content = $('#qna_brd_content').val();
	let user = "새로운 문의가 도착했습니다."; */
	
	var text = "새로운 문의가 도착했습니다.";
	var msg = {"type" : "user",
				"title" : $('#title').val(),
				"content" : $('#content').val(),
				"text" : text
				};
	
	/* 
	wsocket.send(qna_brd_title + "," + qna_brd_content + "," + user); */
	wsocket.send(JSON.stringify(msg));
	$('#title').val('');
	$('#content').val('');

	alert("성공!", "등록 되었습니다.", "success");
	setTimeout(function() {
		  location.href="/main.bit";
		}, 1000);

	
	
}


</script>
<body>


	<!-- header -->
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<!-- header -->

	<div class="side_overlay">

		<div class="container">
			<h3>Q&A 글쓰기 페이지</h3>
			
						<!---------- 글쓰기  ------------------>

			<!--  <form action="write.bit" method="post"> -->
						<div class="form-group bmd-form-group">
							<label class="bmd-label-static">제목</label>
						  	<input type="text" name="title" id="title" class="form-control" placeholder="제목을 작성해보세요">
						</div>
							
						<textarea name="content" id="content"></textarea>
				<div class="border-top">
					<div class="card-body" style="text-align: center;">
							<button type="submit" id="sendQna" class="btn btn-primary" style="padding: 10px 20px"><b>전송</b></button>
							<button type="reset" class="btn" style="padding: 10px 20px">취소</button>
					</div>
				</div>
		<!--	</form>		-->
							

						</div>

					</div>

<!-- footer -->
		<%@ include file="/WEB-INF/include/footer.jsp"%>
<!-- footer -->

<!-- 글쓰기 등록 -->



	
</body>
</html>