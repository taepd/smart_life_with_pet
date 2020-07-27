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

<style>
	.fc-toolbar-title, a.fc-col-header-cell-cushion, th {
		color: black;
	}
	
	.icons {
		font-size: 15px;
		color: orange;
	}
	
	#wrapper {
		display: inline-block;
		/* margin: 0 auto; */
	}
	
	.card-img-top {
		margin-top: 16px;
	}
	
	.card {
		margin-left: 10px;
		margin-right: 10px;
	}
	
	#tab-list {
		margin: 0 auto;
	}
	
	#tab-row {
		margin-bottom: 100px;
		margin-top: 73px;
	}
	
	.form-check {
		margin-left: 5px;
		margin-top: 8px;
	}
	

</style>


</head>
<body>

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>


	<div class="container">
		<div class="side_overlay">

			<div class="row" id="tab-row">
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
						<div class="tab-pane active show" id="sPage">
							<div class="row justify-content-center">
								<div class="table-responsive">
								<table class="table">
									<thead>
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
								href="msgSePage.bit?cp=${cpage-1}&ps=${pageSize}"
								cp="${cpage-1}" ps="${pageSize}" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
						</c:if>

						<c:forEach var="i" begin="1" end="${pageCount}" step="1">
							<c:choose>
								<c:when test="${cpage==i }">
									<li class="page-item active"><a class="page-link"
										href="msgSePage.bit?cp=${i}&ps=${pageSize}" cp="${i}"
										ps="${pageSize}">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="msgSePage.bit?cp=${i}&ps=${pageSize}" cp="${i}"
										ps="${pageSize}">${i}</a></li>
								</c:otherwise>
							</c:choose>

						</c:forEach>

						<c:if test="${cpage < pageCount}">

							<li class="page-item">
								<a class="page-link" href="msgSePage.bit?cp=${cpage+1}&ps=${pageSize}"
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


<script>
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
//쪽지보내기 끝
/**
* @함수명 : moveTab()
* @작성일 : 2020. 7. 21.
* @작성자 : 김건휘, 김보성, 태영돈
* @설명 : 작업 처리 후 원래 탭 위치로 이동시키는  함수
* @param void
**/

//탭 이동 함수
function moveTab(){
		if(${param.tab eq 'mrecord'}){
			$("#mrecordTab").trigger("click");
		}else if(${param.tab eq 'myPets'}){
			$("#myPetsTab").trigger("click");
		//탭 위치 수정하고 활성화 하기
		/* else if(${param.tab eq 'myPets'}){
			document.getElementById("myPetsTab")[0].click(); //위와 같은 기능의 js문법
		} */
		}else if(${param.tab eq 'schedule'}){
			$("#scheduleTab").trigger("click");
		}
}


 
</script>
</html>