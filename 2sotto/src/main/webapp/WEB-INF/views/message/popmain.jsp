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
									href="#A" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
										<i class="material-icons">email</i> 받은 쪽지함
										</a></li>
								<li class="nav-item"><a class="nav-link " href="#B"
									data-toggle="tab"> <!-- <i class="material-icons">chat</i> -->
										<i class="material-icons">email</i> 보낸 쪽지함
										</a></li>
								<li class="nav-item"><a class="nav-link" href="#C"
									data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
										<i class="material-icons">email</i> 쪽지 쓰기
										</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="card-body">
					
					<div class="tab-content text-center">
						<div class="tab-pane" id="A">
							<!---------- 받은쪽지함 ------------------>

							<div class="table-responsive">
								 <form action="delete.bit" method="get">
								<table class="table" style="font-size: 0.5em;">
								    <thead class="text-primary" style="font-size: 1.5em;">
								   
								        <tr>
								   	 		<th class="text-center" >체크박스</th>
											<th class="text-center" >쪽지번호</th>
											<th class="text-center" >보낸사람</th>
											<th class="text-center" >내용</th>
											<th class="text-center" >받은 날짜</th>
											<th class="text-center" >읽은 날짜</th>
										</tr>
								        
								    </thead>
								     <c:forEach var="message" items="${messageList}" >
								    <tbody id="message" style="font-size: 2em;">
								        
								       <tr data-tr_value="${message.msindex}"> 
								            <td><input type="checkbox" name="msindexes" value="${message.msindex}" ></td>
								            <td class="text-center" >${message.msindex}</td>
											<td class="text-center" >${message.suserid}</td>
											  <td class="text-center" style="cursor:pointer;" onclick="location.href='detail.bit?msindex=${message.msindex}'">${message.content}</td> 
											<!--  <td  data-toggle="modal" data-target="#deleteModal" >${message.content}</td> -->
											<!-- <td data-toggle="modal" data-target="#deleteModal" onClick="$('#createFormId').modal('show')">${message.content}</td> --> 
											<td class="text-center" >${message.sendtime}</td>
											<td class="text-center" >${message.readtime!=null?message.readtime:'읽지않음'}</td>
								        </tr>
								         
								        
								    </tbody>
								    </c:forEach> 
								</table>
								<button type="submit" class="btn btn-primary" style="padding: 10px 20px"><b>삭제</b></button>
 								<!--  
 								<label for="bmd-label-static">삭제</label> 			
								<input type="button" id="delete" placeholder="삭제">-->
								</form>
								
								
								<!-- 페이징 -->
			<div class="pagination justify-content-center">
			<!-- <nav aria-label="Page navigation example" style="display: none;" id="pagingNav"> -->
					<ul class="pagination" id="pagingview">
						<c:if test="${cpage > 1}">
							<li class="page-item"><a class="page-link"
								href="popRePage.bit?cp=${cpage-1}&ps=${pageSize}"
								cp="${cpage-1}" ps="${pageSize}" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
						</c:if>

						<c:forEach var="i" begin="1" end="${pageCount}" step="1">
							<c:choose>
								<c:when test="${cpage==i }">
									<li class="page-item active"><a class="page-link"
										href="popRePage.bit?cp=${i}&ps=${pageSize}" cp="${i}"
										ps="${pageSize}">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="popRePage.bit?cp=${i}&ps=${pageSize}" cp="${i}"
										ps="${pageSize}">${i}</a></li>
								</c:otherwise>
							</c:choose>

						</c:forEach>

						<c:if test="${cpage < pageCount}">

							<li class="page-item">
								<a class="page-link" href="popRePage.bit?cp=${cpage+1}&ps=${pageSize}"
									cp="${cpage+1}" ps="${pageSize}" aria-label="Next"> 
									<span aria-hidden="true">&raquo;</span>
									<span class="sr-only">Next</span>
								</a>
							</li>
						</c:if>
					</ul>
			<!-- </nav> -->
			</div>
			<!-- 여기까지 페이징처리 -->
							</div>
			
						</div>

							
						<!-------------- 끝 ---------------->
						
						<!-------------- 여기 시작점 ---------------->
						<div class="tab-pane" id="B">
							<!---------- 보낸쪽지함 ------------------>

							<div class="table-responsive">
								<table class="table">
									<thead class="text-primary">
										<tr>
											<th class="text-center">받은사람</th>
											<th class="text-center">내용</th>
											<th class="text-center">보낸 날짜</th>
											<th class="text-center">읽은 날짜</th>
										</tr>
									</thead>
									 <c:forEach var="message" items="${messageList}" >
									<tbody>
									
										<tr>
											<td class="text-center">${message.ruserid}</td>
											<td class="text-center">${message.content}</td>
											<td class="text-center">${message.sendtime}</td>
											<td class="text-center">${message.readtime!=null?message.readtime:'읽지않음'}</td>

										</tr>
										</tbody>
										</c:forEach>
								</table>
								
								<!-- 페이징 -->
			<div class="pagination justify-content-center">
			<!-- <nav aria-label="Page navigation example" style="display: none;" id="pagingNav"> -->
					<ul class="pagination" id="pagingview">
						<c:if test="${cpage > 1}">
							<li class="page-item"><a class="page-link"
								href="popRePage.bit?cp=${cpage-1}&ps=${pageSize}"
								cp="${cpage-1}" ps="${pageSize}" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
						</c:if>

						<c:forEach var="i" begin="1" end="${pageCount}" step="1">
							<c:choose>
								<c:when test="${cpage==i }">
									<li class="page-item active"><a class="page-link"
										href="popRePage.bit?cp=${i}&ps=${pageSize}" cp="${i}"
										ps="${pageSize}">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="popRePage.bit?cp=${i}&ps=${pageSize}" cp="${i}"
										ps="${pageSize}">${i}</a></li>
								</c:otherwise>
							</c:choose>

						</c:forEach>

						<c:if test="${cpage < pageCount}">

							<li class="page-item">
								<a class="page-link" href="popRePage.bit?cp=${cpage+1}&ps=${pageSize}"
									cp="${cpage+1}" ps="${pageSize}" aria-label="Next"> 
									<span aria-hidden="true">&raquo;</span>
									<span class="sr-only">Next</span>
								</a>
							</li>
						</c:if>
					</ul>
			<!-- </nav> -->
			</div>
			<!-- 여기까지 페이징처리 -->
							</div>

						</div>


						<!-------------- 끝 ---------------->
						<!-------------- 시작 ---------------->
						<!---------- 쪽지쓰기 ------------------>
						<div class="tab-pane active show" id="C">

						<form action="popmain.bit" method="post">
				
						
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">받는 사람</label> 
									<input type="text" name="ruserid" class="form-control" placeholder="받는사람 닉네임(아이디)"> 
								</div>
								
									   <textarea name="content" class="form-control"  rows="10" placeholder="여기에 쪽지 내용을 입력합니다"></textarea>
								
							<div class="border-top">
									<div class="card-body" style="text-align: center;">
										<button type="submit" id="sendQna" class="btn btn-primary"><b>쪽지보내기</b></button>
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
	




<script>
<!-- Modal에서 삭제 -->

// 삭제 전 확인 창 띄우기
//function Delete() {
//  location.replace("delete.bit?msindex=${message.msindex}");
  //location.replace("delete.bit"); 
//  }

<!-- Modal에서 삭제 --> 

$(document).ready(function(){
    //체크박스 전체 선탣&해제
    $('#ck_all').click(function(){
         if($("#ck_all").prop("checked")){
            $("input[type=checkbox]").prop("checked",true); 
        }else{
            $("input[type=checkbox]").prop("checked",false); 
        }
    });
});	
	
	// 상단 선택버튼 클릭시 체크된 Row의 값을 가져온다.
	/*
	$("#selectBtn").click(function(){ 
		
		var rowData = new Array();
		var tdArr = new Array();
		var checkbox = $("input[name=user_CheckBox]:checked");
		
		// 체크된 체크박스 값을 가져온다
		checkbox.each(function(i) {

			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			// 체크된 row의 모든 값을 배열에 담는다.
			rowData.push(tr.text());
			
			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var no = td.eq(1).text()+", "
			//var userid = td.eq(2).text()+", ";
			//var name = td.eq(3).text()+", ";
			//var email = td.eq(4).text()+", ";
			//var email1 = td.eq(5).text()+", ";
			// 가져온 값을 배열에 담는다.
			tdArr.push(no);
			//tdArr.push(userid);
			//tdArr.push(name);
			//tdArr.push(email);
			//tdArr.push(email1);
			console.log("msindex : " + no);
			//console.log("userid : " + userid);
			//console.log("name : " + name);
			//console.log("email : " + email);
		});
		
		$("#ex3_Result1").html(" * 체크된 Row의 모든 데이터 = "+rowData);	
		$("#ex3_Result2").html(tdArr);	
	
	});

	*/
  


    
	/*
    $('#delete').click(function(){
        if(confirm("삭제하시겠습니까?")){
            $("input[name=checkRow]:checked").each(function(){
                var tr_value =$(this).val();
                var tr=$("tr[data-tr_value='"+tr_value+"']");
                tr.remove();
           		
            });
        }else{
            return false;
        }
    });
 	
});
*/

$('#delete').click(function(){
	
	let con = confirm("정말로 삭제하시겠습니까?");
	if(con){
		return location.href='popDelete.bit?msindex=${message.msindex}';
	}else{
		return;
	}
});

</script>

</body>
</html>

