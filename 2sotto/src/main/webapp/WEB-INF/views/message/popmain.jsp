<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>

<title>슬기로운 반려생활</title>

<%@ include file="/WEB-INF/include/import.jsp"%>


</head>
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
				"ruserid" : $('#ruserid').val(),
				"content" : $('#content').val(),
				"text" : text
				};
	console.log('여기타니니니니니니닝');
	/* 
	wsocket.send(qna_brd_title + "," + qna_brd_content + "," + user); */
	wsocket.send(JSON.stringify(msg));
	$('#ruserid').val('');
	$('#content').val('');

	alert("성공!", "등록 되었습니다.", "success");
	setTimeout(function() {
		  location.href="rPage.bit";
		}, 1000);

	
	
}
 </script>
<body>



	<div class="side_overlay">
		<div class="container">


			<button class="btn btn-primary btn-round"
				onclick="location.href='popmain.bit'">쪽지</button>
				

			
			<div class="card card-nav-tabs">
				<div class="card-header card-header-primary">
					<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
					<div class="nav-tabs-navigation">
						<div class="nav-tabs-wrapper">
							<ul class="nav nav-tabs" data-tabs="tabs">
								<li class="nav-item"><a class="nav-link"
									href="#C" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
										<i class="material-icons">email</i> 쪽지 쓰기
										</a></li>
								<!--  
								<li class="nav-item"><a class="nav-link " href="#B"
									data-toggle="tab">  <i class="material-icons">chat</i>
										<i class="material-icons">email</i> 받은 쪽지함
										</a></li>
								<li class="nav-item"><a class="nav-link" href="#C"
									data-toggle="tab"> <i class="material-icons">build</i>
										<i class="material-icons">email</i> 보낸 쪽지함
										</a></li>
										-->
							</ul>
						</div>
					</div>
				</div>

				<div class="card-body">
					
					<div class="tab-content text-center">
						<!---------- 쪽지쓰기 ------------------>
						<div class="tab-pane active show" id="C">

						<form action="popmain.bit" method="post">
				
						
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">받는 사람</label> 
									<input type="text" name="ruserid" class="form-control" placeholder="받는사람 닉네임(아이디)" value="${ruserid }"> 
								</div>
								
									   <textarea name="content" class="form-control"  rows="10" placeholder="여기에 쪽지 내용을 입력합니다"></textarea>
								
							<div class="border-top">
									<div class="card-body" style="text-align: center;">
										<button type="submit" id="sendQna" class="btn btn-primary" onclick="javascript:btn()"><b>쪽지보내기</b></button>
										<button type="reset" class="btn btn-primary">취소</button>
								</div>
							</div>
						 </form> 



						</div>


						<!-------------- 끝 ---------------->
					</div>
					
				</div>
			</div>
			
			
			
		</div>
		<!-- container end -->
	</div>
	
	
	<!-- Modal -->
<!--  
<div class="modal" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <c:forEach var="message" items="${messageList}" >
      <div class="modal-header"> 
        <h5 class="modal-title" id="exampleModalLabel">보낸사람: ${message.suserid} </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       내용: ${message.content}
      </div>
      <div class="modal-footer">
  		<button onclick="Delete()" type="button" class="btn btn-primary">삭제하기</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
    	
      </div>
      </c:forEach> 
    </div>

  </div>
</div>
-->
<!-- Modal -->
<script> function btn(){ 
	alert('쪽지를 보냈습니다.'); 
	} 
</script>

</body>
</html>

