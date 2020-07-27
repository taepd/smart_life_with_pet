<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>

<title>동물관리 홈</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-datetimepicker/2.7.1/css/bootstrap-material-datetimepicker.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<%@ include file="/WEB-INF/include/import.jsp"%>




</head>
<script type="text/javascript">
//받은쪽지 시작
$(document).ready(function(){
    //체크박스 전체 선택&해제
    $('#ck_all').click(function(){
         if($("#ck_all").prop("checked")){
            $("input[type=checkbox]").prop("checked",true); 
        }else{
            $("input[type=checkbox]").prop("checked",false); 
        }
    });
});	

$('#delete').click(function(){
	
	let con = confirm("정말로 삭제하시겠습니까?");
	if(con){
		return location.href='delete.bit?msindex=${message.msindex}';
	}else{
		return;
	}
});
//받은쪽지 끝
//쪽지 보내기 시작
 $(function() {

		CKEDITOR.replace( 'content' );

		
	}) 
 $(function() {
	 console.log(wsocket);
	 $('#sendQna').click(function() { 
		 
		 sendQna(); });
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

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>


	<div class="container">
		<div class="side_overlay">

			<div class="row justify-content-center" id="tab-row">
				<ul class="nav nav-pills nav-pills-icons" id="tab-list"
					role="tablist">
					<!--
                                color-classes: "nav-pills-primary", "nav-pills-info", "nav-pills-success", "nav-pills-warning","nav-pills-danger"
                            -->
					<li class="nav-item"><a class="nav-link" onclick="location.href='msgRePage.bit'" id="rPageTab"
						role="tab" data-toggle="tab" aria-selected="false"> <i
							class="material-icons">email</i> <!-- <span class="material-icons">home</span>  -->
							받은 쪽지함
					</a></li>
					<li class="nav-item"><a class="nav-link"
						onclick="location.href='msgSePage.bit'" role="tab" data-toggle="tab" id="sPageTab"
						aria-selected="false"> <i class="material-icons">email</i>
							보낸 쪽지함
					</a></li>
					<li class="nav-item"><a class="nav-link" onclick="location.href='msgWrite.bit'" id="writeTab"
						role="tab" data-toggle="tab" aria-selected="true"> <i
							class="material-icons">email</i> 쪽지 쓰기 
					</a></li>
				</ul>
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-12">
					<div class="tab-content tab-space">
			
						<!---------- 쪽지쓰기 ------------------>
						<div class="tab-pane active show" id="write">
								<!--  <form action="write.bit" method="post"> -->
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">받는 사람</label> 
									<input type="text" name="ruserid" id="ruserid" class="form-control" placeholder="받는사람 닉네임(아이디)"> 
								</div>
								
									   <textarea name="content" id="content" class="form-control"  rows="10" placeholder="여기에 쪽지 내용을 입력합니다"></textarea>
								
							<div class="border-top">
									<div class="card-body" style="text-align: center;">
										<button type="reset" class="btn btn">취소</button>
										<button type="submit" id="sendQna" class="btn btn-primary"><b>쪽지보내기</b></button>
										
								</div>
							</div>
					<!-- </form> -->
							
							
							
							
						</div>
			<!-------------- 끝 ---------------->
						
						
						
				
					</div>
				</div>
			</div>
			<!-- side_overlay end -->

		</div>
		<!-- side_overlay end -->

	</div>
	<!-- container end -->

	

	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>



</html>