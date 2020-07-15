<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<html>
<head>

<title>슬기로운 반려생활</title>

<%@ include file="/WEB-INF/include/import.jsp"%>

	<style>
		#jb {
			width: 100%;
			height: 50px;
		}
	</style>
	<script>
	window.onload = function() {
		document.getElementById( 'jb' ).value = '${donate.ccoll/donate.gcoll*100}';
	}
	</script>
	

</head>

<body>

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>


	<div class="side_overlay">
		<div class="container">


			<button class="btn btn-primary btn-round"
				onclick="location.href='main.bit'">후원글</button>
			<form method="post" action="kakaoPay.bit">
    		<button class="btn btn-primary btn-round" id="kakaoPay">카카오페이로 결제하기</button>
    		</form>


			
			<div class="card card-nav-tabs">
				<div class="card-header card-header-primary">
					<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
					<div class="nav-tabs-navigation">
						<div class="nav-tabs-wrapper">
							<ul class="nav nav-tabs" data-tabs="tabs">
								<li class="nav-item">
									<a class="nav-link active show" onclick="location.href='main.bit'" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
										<i class="material-icons"></i>후원글 메인
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" onclick="location.href='mainbydate.bit'" data-toggle="tab"> <!-- <i class="material-icons">chat</i> -->
										<i class="material-icons"></i>최신순
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" onclick="location.href='write.bit'" data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
										<i class="material-icons"></i>글 작성
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

							<form action="donatePoint.bit" method="POST">
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">글번호</label> 
									<input type="text" class="form-control" name="dindex" value="${donate.dindex}" readonly> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">제목</label> 
									<input type="text" name="title" class="form-control" value="${donate.title}" readonly> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">작성자</label> 
									<input type="text"  class="form-control" placeholder="관리자" readonly> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">후원이 필요한 아이</label> 
									<input type="text" name="dobject" class="form-control" value="${donate.dobject}" readonly> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">후원 등록 시간</label>
									<fmt:parseDate var="parseTime" value="${donate.rtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate var="rtime" value="${parseTime}" pattern="yyyy-MM-dd"/> 
									<input type="text" name="rtime" class="form-control" value="${rtime}" readonly> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">후원 완료 시간</label> 
									<fmt:parseDate var="parseTime" value="${donate.ctime}" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate var="ctime" value="${parseTime}" pattern="yyyy-MM-dd"/>
									<input type="text" name="ctime" class="form-control" value="${donate.ctime}" readonly> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">목표모금액</label> 
									<input type="text" name="gcoll" class="form-control" value="${donate.gcoll}" readonly> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">현재모금액</label> 
									<input type="text" name="ccoll" class="form-control" value="${donate.ccoll}" readonly> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">모금률</label>
									<progress value="0" max="100" id="jb"></progress>
									<p><fmt:formatNumber value= "${donate.ccoll/donate.gcoll*100}" pattern="#,###"/>%</p>
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">기부중</label> 
									<input type="text" name="dstate" class="form-control" value="${donate.dstate}" readonly> 
								</div>				
								<textarea name="content" class="form-control"  rows="10" readonly>${donate.content}</textarea>																
								<!-- <div id="donateColl"> -->															
								<input type="text" name="dpoint" placeholder="기부하실 포인트를 직접 입력해 주세요">
								<button type="submit" class="btn btn-primary">포인트 기부하기</button>
								</form>
								</div>							
								  <textarea name="content" class="form-control"  rows="10" readonly>${donate.content}</textarea>								
								<div class="border-top">
									<div class="card-body" style="text-align: center;">
										<button type="button" onclick="location.href='update.bit?dindex=${donate.dindex}'">수정</button>
										<button type="button" id="delete" >삭제</button>
								</div> 
								
								
								<hr>
								<h4 id="reply_h4">댓글</h4>
								
								<div id="commentBox"></div>
									<!-- 댓글 폼 -->
									<br>
									<form name="comment" id="comment" method="POST">
										작성자&nbsp;&nbsp;${sessionScope.user.userid}<br>
										<%-- <input type="hidden" name="bindex" id="bindex" value="${post.bindex}"> --%>
										<%-- <input type="hidden" name="userid" id="userid" value="${sessionScope.user.userid}"> --%>
										<textarea rows="3" cols="" id="dccontent" name="dccontent" style="width: 100%"></textarea>
										<br>
										<input type="button" class="" value="댓글 등록" id="writecom">
										<input type="reset" class="" value="다시 쓰기">
									</form>
									<!-- 댓글 폼 끝 -->
									
								<hr>
								 
								
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
		<!-- container end -->
		<%@ include file="DonateComment.jsp" %>
		



	
	<!-- side_overlay end -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>
<script type="text/javascript">
//삭제 전 확인 창 띄우기
$('#delete').click(function(){
	let con = confirm("정말로 삭제하시겠습니까?");
	if(con){
		return location.href='delete.bit?dindex=${donate.dindex}';
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


