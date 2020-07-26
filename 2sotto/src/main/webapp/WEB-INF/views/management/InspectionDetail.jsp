<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<html>
<head>

<title>슬기로운 반려생활</title>

<%@ include file="/WEB-INF/include/import.jsp"%>

	

</head>

<body>

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>


	<div class="side_overlay">
		<div class="container">


<!-- 			<button class="btn btn-primary btn-round"
				onclick="location.href='main.bit'">후원글</button>
			<form method="post" action="kakaoPay.bit">
    		<button class="btn btn-primary btn-round" id="kakaoPay">카카오페이로 결제하기</button>
    		</form>  -->


			
			<div class="card card-nav-tabs">
				<div class="card-header card-header-primary">
					<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
					<div class="nav-tabs-navigation">
						<div class="nav-tabs-wrapper">
							<ul class="nav nav-tabs" data-tabs="tabs">
								<li class="nav-item">
									<a class="nav-link active show" onclick="location.href='getInspectionList.bit'" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
										<i class="material-icons"></i>메인
									</a>
								</li>
								
								<li class="nav-item">
									<a class="nav-link" onclick="location.href='InspectionRegister.bit'" data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
										<i class="material-icons"></i>접종 기록 등록하기
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="card-body">
				
					<div class="tab-content text-center">
			
						<!---------- 디테일------------------>
						<div class="tab-pane active show" >

							
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">접종 기록 이력 번호</label> 
									<input type="text" class="form-control" name="iindex" value="${Inspection.iindex}" readonly> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">보호자</label> 
									<input type="text" name="userid" class="form-control" value="${Inspection.userid}" readonly> 
								</div>
								
								<%-- <div class="form-group bmd-form-group">
									<label for="bmd-label-static">반려동물이름</label> 
									<input type="text" name="petname" class="form-control" value="${mrecord.petname}" readonly> 
								</div> --%>
								<div class="form-group">
									<label for="petname">나의 반려동물</label>	
										<select class="custom-select" name="petindex" disabled> <!-- ex) ?mcategory=dog -->
											<c:forEach var="petName" items="${petNameList}">
											<option value="${petName.petindex}">${petName.petname}</option>							
											</c:forEach>
										</select>		
								</div>
								
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">접종여부</label> 
									<input type="text" name="vstate" class="form-control" value="${Inspection.vstate}" readonly> 
								</div>	
								
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">접종유형</label> 
									<input type="text" name="vtype" class="form-control" value="${Inspection.vtype}" readonly> 
								</div>
																
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">접종일</label>
									<fmt:parseDate var="parseTime" value="${inspection.vdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate var="vdate" value="${parseTime}" pattern="yyyy-MM-dd"/> 
									<input type="text" name="vdate" class="form-control" value="${vdate}" readonly> 
								</div>	
								
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">접종 예정일</label>
									<fmt:parseDate var="parseTime" value="${inspection.evdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate var="evdate" value="${parseTime}" pattern="yyyy-MM-dd"/> 
									<input type="text" name="evdate" class="form-control" value="${evdate}" readonly> 
								</div>								
								
																								
								<!-- <div id="donateColl"> -->															
								<div class="form-group bmd-form-group">
								<label for="bmd-label-static">잔영 접종 횟수</label> 
								<input type="text" name="vcount" class="form-control" value="${inspection.vcount}" readonly> 
								</div>								
								<div class="border-top">
									<div class="card-body" style="text-align: center;">
										<button type="button" onclick="location.href='editInspection.bit?iindex=${inspection.iindex}'">수정</button>
										<button type="button" id="delete" onclick="location.href='deleteInspection.bit?iindex=${inspection.iindex}'">삭제</button>
								</div> 
															
							</div>
						



						</div>


						<!-------------- 끝 ---------------->
						<!-- 댓글 입력 폼 -->
						
				
    <!-- 
    			<div class="container">
        			<div class="commentList"></div>
    			</div> -->


					</div>
				</div>
			</div>
		</div>
	</div>
		<!-- container end -->
		
		



	
	<!-- side_overlay end -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>
<script type="text/javascript">
//삭제 전 확인 창 띄우기
$('#delete').click(function(){
	let con = confirm("정말로 삭제하시겠습니까?");
	if(con){
		return location.href='deleteMrecord.bit?mindex=${mrecord.mindex}';
	}else{
		return;
	}
});
	
}

//모든 요소 load 후 댓글 목록과 댓글 쓰기 폼 불러오기
$(function() {
	
	getCommentList();
	insertComment();
	
});


//댓글 목록 가져오기
function getCommentList() {
	
	$.ajax({
    
		url:"getCommentList.bit",

		datatype: "json",
		data: { dindex:'${donate.dindex}'},
		success: function(data) {
			
			var html = "";
			console.log("data: "+data);
			
			$.each(data, function(index, element) {

				//대댓글은 임시로 배경색 넣음. 나중에 들여쓰기 적용해야 함
				if(element.depth==1){
					html += "<div style='background-color:gold'>";
				}else{
					html += "<div>";
				};
				//html += "<form action='commentDelete.bit' method='POST'>";
				html += "<div class='d-flex justify-content-between'><div id='commentUserid'><b>";
				html += element.userid;
				//댓글인 경우
				if(element.depth ==0){
					html += "</b></div><div><button onclick='openReComment("+element.dcindex+",\""+element.userid+"\",\""+element.refer+"\"); this.onclick=null;'>대댓글</button></div></div>";
				}else{
					html += "</b></div></div>";
				};
				html += "<div id='commentContent"+element.dcindex+"'>";
				html += element.dccontent;
				html += "</div>";
				html += "<div id='commentDate'><h6>";
				html += element.rtime;
				html += "</h6></div>";
				html += "<input type='hidden' name='commentNum' id='commentNum' value='";
				html += element.dcindex;
				html += "'> <input type='button' id='editCommentBtn"+element.dcindex+"' value='수정' class='button small' onclick='editComment("+element.dcindex+"); this.onclick=null;'>";
				//html += "<input type='submit' value='삭제' class='button small' onclick='deleteReply(this.form)'>";
				html += "<input type='submit' id='deleteCommentBtn' value='삭제' class='button small' onclick='deleteComment("+element.dcindex+"); this.onclick=null;'>";
				//html += "</form>";
				html += "<div id='editForm"+element.dcindex+"'></div>"
				html += "</div>";
			});
			
			$('#commentBox').append(html);
					
		}
	});
}


//댓글 쓰기
function insertComment() {
	$('#writecom').click(function(){
		
		if(!comment.dccontent.value) {
			swal('댓글 내용을 입력하세요!');
			comment.dccontent.focus();
			return false;
		}
		
		$.ajax ({
			
			url:"writeComment.bit",
			type: "post",
			datatype:"json",
			data: { dindex:'${donate.dindex}',
					userid: '${sessionScope.user.userid}',
					dccontent: $('#dccontent').val()
				  },	
			success: function(data) {
					$('#commentBox').empty();
					$('#dccontent').val("");
					getCommentList();
				}
				
		});
		
		return false;
		
	});
}

//댓글 수정 창 열기 
function editComment(bcindex) {
					
				let html = "";
				let dccontent = $('#commentContent'+dcindex+'').text();
				
				html += '<form name="editCommentBox" id ="editCommentBox" method="POST">';
				html +=	'<input type="hidden" id="dcindex" value="'+dcindex+'">';
				html +=	'<textarea rows="3" cols="" id="dccontent" name="dccontent" style="width: 100%">'+dccontent+'</textarea><br>';
				html +=	'<input type="button" class="" value="댓글 수정" id="editcom">';
				html +=	'<input type="reset" class="" value="다시 쓰기"></form>';
				
				$('#editForm'+dcindex+'').append(html);
				
				//기본 댓글 입력창 비활성화
				$('#comment.dccontent.value').empty();
				$('#comment').hide();

		return false;
		
};


//댓글 수정 처리
//동적 생성 태그에는 on형식의 이벤트를 걸어야 작동한다
$(document).on("click","#editcom",function(){
		
 		if(!editCommentBox.dccontent.value) {
			swal('댓글 내용을 입력하세요!');
			editCommentBox.dccontent.focus();
			return false;
		}
		
 		var dcindex = $('#dcindex').val();
 		var dccontent = $('#dccontent').val();
		
 		$.ajax ({		
			url:"editComment.bit",
			type: "post",
			datatype:"json",
			data: { dcindex: $('#dcindex').val(),
					userid: '${sessionScope.user.userid}',
					dccontent: $('#dccontent').val()
				  },	
			success: function(data) {
					$('#editCommentBox').remove();
					$('#commentContent'+dcindex+'').text(dccontent);
					$('#editCommentBtn'+dcindex+'').attr("onclick", "editComment("+dcindex+"); this.onclick=null;");
					//기본 댓글 입력창 활성화
					$('#comment').show();					
			}
		}); 
			
		return false;		
});



//댓글 삭제
// 블로그 댓글 삭제 전 확인 창 띄우고 확인 시 삭제

function deleteComment(dcindex) {

	let con = confirm("정말로 삭제하시겠습니까?");
	if(con){
		return location.href='deleteComment.bit?dcindex='+dcindex+'&dindex=${DonateComment.dcindex}';
	}else{

		return;
	}
}


</script>
</html>


