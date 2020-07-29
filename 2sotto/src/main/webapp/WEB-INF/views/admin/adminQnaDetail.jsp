<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>

<!-- pageContext.request.userPrincipal.name -->
<se:authentication property="name" var="userid" />
<c:set var="user" value="${sessionScope.user}" />
<!DOCTYPE html>
<html>
<head>

<title>홈_슬기로운 반려생활</title>

  	<%@ include file="/WEB-INF/include/import.jsp"%>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css_2sotto/blog_main.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap" rel="stylesheet">
    <style type="text/css">


		a:visited {
			color: #000000;
		}
		
		ul, li {
			list-style: none;
		}


		h2 {
			margin-top: 100px;
			padding-top: 100px;
		}
		
		hr.dot {
			border: none;
			border: 1px dashed #ffffff;
			opacity: 0.4;
			margin: 20px 0px; /* 0 > 40px */
		}
		
		#replybox, #reply {
			margin: 0 40px;
		}
		
		#reply_h4 {
			margin-left: 50px;
			margin-bottom: 50px;
		}
		
		#btns_wrapper {
			text-align: right;
		}
		
		#btns {
			display: inline-block;
		}
		
		.container > li {
			float: right;
		}
		
		.reCom:before {

     	    content: "";
		    position: absolute;
		    display: inline-block;
		    top: 10;
		    left: 30px;
		    width: 16px;
		    height: 16px;
		    border: 1px solid #ccc;
		    border-width: 0 0 1px 1px;
		    border-radius: 0 0 0 2px;

 		}
 		.writereCom:before {

     	    content: "";
		    position: absolute;
		    display: inline-block;
		    top: 0;
		    left: 30px;
		    width: 16px;
		    height: 16px;
		    border: 1px solid #ccc;
		    border-width: 0 0 1px 1px;
		    border-radius: 0 0 0 2px;
		}
		 
		.main-card {
			background-color: #ffffff;
 			box-shadow: rgba(0, 0, 0, 0.08) 0px 20px 40px 0px;
			padding: 100px;
			border-radius: 6px;
			position: relative;	
		}
		
		#back-icon {
			position: absolute;
			top: 7px;
			left: 10px;
			font-size: 34px;
			color: rgba(233, 33, 101, 0.2);
		}
		
		.commentIcons {
			font-size: 20px;
			color: rgba(233, 33, 101, 0.2);
			padding: 0 2px;
		}

		#commentBox, #comment {
			margin-left: 50px;
			margin-right: 50px;
		}

		.heart-comment-time-area {
			margin: 5px 10px 50px 3px;
			color: #838383;
		}

		.heart-and-comment {
			margin: 50px 0 30px;
		}
	
	</style>
</head>

	<div class="container">
		<div class="side_overlay">
			<div class="main-card">
				<a href="userQnaTable.bit"><span id="back-icon"><i class="fas fa-angle-double-left"></i></span></a>
				
				<!-- 글쓴이 및 관련 반려동물 영역 -->
				<div class="d-flex">  <!--  style="display: inline-block;" -->
				<a href="userQnaTable.bit"><span id="back-icon"><i class="fas fa-angle-double-left"></i></span></a>
					<!-- <span class="align-self-center"><b>${post.nick}</b>님과 </span> -->
					<h4 class="align-self-center">Q&A</h4>
					
					<!-- <span class="align-self-center">의 이야기</span>   			 -->
				</div>

				<h1>${qna.title}</h1>	
				
				
					<!-- <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span><i class="fas fa-ellipsis-v"></i></span></a> -->
					
						<!-- <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"> -->
			            	<a class="btn btn-sm" style="color: #ffffff;" href="adminQnaEdit.bit?qaindex=${qna.qaindex}">수정</a>
			            	<a class="btn btn-sm" style="color: #ffffff;" href="javascript:;" id="delete">삭제</a>
			            	<a class="btn btn-sm btn-primary" style="color: #ffffff;" href="adminQnaReply.bit?qaindex=${qna.qaindex}">관리자 답글</a>
					  	<!-- </div> -->
					 
				
				
				<div class="heart-comment-time-area">
					<fmt:parseDate var="parseTime" value="${qna.qatime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate var="rtime" value="${parseTime}" pattern="yyyy-MM-dd hh:mm"/>
					<span>${rtime}</span>
				</div>
				<h5>문의 내용</h5>
				
			
			<hr>
			<div>
			${qna.content}
			</div>
			<div style="margin-top: 50px;">
			<hr>
			<h5>관리자 답변</h5>
			<hr>
				${qna.replyContent}
			</div>
			
				
			<hr>	
				
				<h4 id="reply_h4">댓글</h4>
				
				<div id="commentBox"></div>
					<!-- 댓글 폼 -->
					<se:authorize access="hasAnyRole('ROLE_USER')">
					<br>
					<form name="comment" id="comment" method="POST">
						작성자&nbsp;&nbsp;${sessionScope.user.userid}<br>
						<%-- <input type="hidden" name="bindex" id="bindex" value="${post.bindex}"> --%>
						<%-- <input type="hidden" name="userid" id="userid" value="${sessionScope.user.userid}"> --%>
						<textarea rows="3" cols="" id="content" name="content" style="width: 100%"></textarea>
						<br>
						<input type="reset" class="btn btn-sm" value="다시 쓰기">
						<input type="button" class="btn btn-sm" value="등록" id="writecom">
						
					</form>
					<!-- 댓글 폼 끝 -->
					</se:authorize>
					<hr>
					
					
			</div>
		</div>
	</div>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 	

</body>



	




<script>


	// 삭제 전 확인 창 띄우기 confirm
	/*
	$('#delete').click(function(){
		let con = confirm("정말로 삭제 하시겠습니까?");
		if(con){
			return location.href='delete.bit?qaindex=${qna.qaindex}';
		}else{
			return false;
		}
	});
	*/
// QNA 글 삭제 전 확인 창 띄우고 확인 시 삭제
$('#delete').click(function(){
	let con = confirm("정말로 삭제하시겠습니까?");
	if(con){
		return location.href='adminQnaDelete.bit?qaindex=${qna.qaindex}';
	}else{
		return;
	}
});
	
	
	
		

	
	//모든 요소 load 후 댓글 목록과 댓글 쓰기 폼 불러오기
	$(function() {
		
		getCommentList();
		insertComment();
		
	});


	//댓글 목록 가져오기
	function getCommentList() {
		
		$.ajax({
	    
			url:"adminQnaGetCommentList.bit",

			datatype: "json",
			data: { qaindex:'${qna.qaindex}'},
			success: function(data) {
				
				var html = "";
				console.log("data: "+data);
				
				$.each(data, function(index, element) {
					
					//html += "<form action='commentDelete.bit' method='POST'>";
					//html += "<div class='d-flex justify-content-between'style='background-color: #F1F1F1; padding: 0 0 0 10px;'><div id='commentUserid'><b>";
					html += "<div id='commentUserid'><b>";
					html += element.userid;
					//댓글일 경우
					html += "</b></div>";
					html += "<div id='commentContent"+element.qnaindex+"'>";
					html += element.content;
					html += "</div>";
					html += "<div id='commentDate'><h6>";
					html += element.rtime;
					html += "</h6></div>";
					html += "<input type='hidden' name='commentNum' id='commentNum' value='";
					html += element.qnalike;
					//html += "'><input type='submit' id='deleteCommentBtn' value='삭제' class='btn btn-sm' onclick='deleteComment("+element.qnaindex+"); this.onclick=null;'>";
					html += "'> <a href='" + "javascript:void(0);' onclick='editComment(" + element.qnaindex + ");  this.onclick=null;'; id='editCommentBtn" + element.qnaindex + "';><span class='commentIcons'><i class='fas fa-edit'></i></span></a>";
					//html += "<input type='button' id='editCommentBtn"+element.qnaindex+"' value='수정' class='btn btn-sm btn-primary' onclick='editComment("+element.qnaindex+"); this.onclick=null;'>";
					//html += "<div id='editForm"+element.qnaindex+"'></div>"
					
					html += "<a href='" + "javascript:void(0);' onclick='deleteComment(" + element.qnaindex + ")'; id='deleteCommentBtn'><span class='commentIcons'><i class='fas fa-trash-alt'></i></span></a>";

					html += "<div id='editForm"+element.qnaindex+"'></div>"
					html += "</div>";
				});
				
				$('#commentBox').append(html);
				
		
				
			}
		});
		
	}


	//댓글 쓰기
	function insertComment() {
		$('#writecom').click(function(){
			
			if(!comment.content.value) {
				swal('댓글 내용을 입력하세요!');
				comment.content.focus();
				return false;
			}
			
			$.ajax ({
				
				url:"adminQnaWriteComment.bit",
				type: "post",
				datatype:"json",
				data: { qaindex:'${qna.qaindex}',
						userid: '${sessionScope.user.userid}',
						content: $('#content').val()
					  },	
				success: function(data) {
						$('#commentBox').empty();
						$('#content').val("");
						getCommentList();
						$('#qnaCount').html($('#qnaCount').html()*1+1);
					}
					
			});
			
			return false;
			
		});
	}

	//댓글 수정 창 열기 
	function editComment(qnaindex) {
						
					let html = "";
					let content = $('#commentContent'+qnaindex+'').text();
					
					html += '<form name="editCommentBox" id ="editCommentBox" method="POST">';
					html +=	'<input type="hidden" id="qnaindex" value="'+qnaindex+'">';
					html +=	'<textarea rows="3" cols="" id="content" name="content" style="width: 100%">'+content+'</textarea><br>';
					html +=	'<input type="reset" class="btn btn-sm" value="원래대로">';
					html +=	'<input type="button" class="btn btn-sm" value="수정" id="editcom"></form>';
					
					
					$('#editForm'+qnaindex+'').append(html);
					
					//기본 댓글 입력창 비활성화
					$('#comment.content.value').empty();
					$('#comment').hide();

			return false;
			
	};


	//댓글 수정 처리
	//동적 생성 태그에는 on형식의 이벤트를 걸어야 작동한다
	$(document).on("click","#editcom",function(){
			
	 		if(!editCommentBox.content.value) {
				swal('댓글 내용을 입력하세요!');
				editCommentBox.content.focus();
				return false;
			}
			
	 		var qnaindex = $('#qnaindex').val();
	 		var content = $('#content').val();
	 		console.log(qnaindex);
	 		console.log(content);
	 		
	 		$.ajax ({
				
				url:"adminQnaEditComment.bit",
				type: "post",
				datatype:"json",
				data: { qnaindex: $('#qnaindex').val(),
						userid: '${sessionScope.user.userid}',
						content: $('#content').val()
					  },	
				success: function(data) {
						$('#editCommentBox').remove();
						$('#commentContent'+qnaindex+'').text(content);
						$('#editCommentBtn'+qnaindex+'').attr("onclick", "editComment("+qnaindex+"); this.onclick=null;");
						//기본 댓글 입력창 활성화
						$('#comment').show();
						
				}
			}); 
			
			return false;
			
	});


	// 댓글 삭제 전 확인 창 띄우고 확인 시 삭제
	function deleteComment(qnaindex) {
		let con = confirm("정말로 삭제하시겠습니까?");
		if(con){
			return location.href='adminQnaDeleteComment.bit?qnaindex='+qnaindex+'&qaindex=${qna.qaindex}';
		}else{
			return;
		}
	}
	
</script>
	
</body>
</html>