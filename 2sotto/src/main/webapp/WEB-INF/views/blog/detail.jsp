<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
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
			margin-left: 40px;
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
		
	
		
	</style>
</head>
<body>
    
    <%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<div class="side_overlay">
		<div class="container">
			<h1>${post.title}</h1>
			<fmt:parseDate var="parseTime" value="${post.rtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate var="rtime" value="${parseTime}" pattern="yyyy-MM-dd hh:mm"/>
			<h4>${rtime}</h4>
			
			<!-- 직관적인 badge
			<a href="#"><span class="badge badge-default">수정</span></a>
			<span class="badge badge-default">삭제</span> -->
			
			
			
				<li class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span><i class="fas fa-ellipsis-v"></i></span></a>
					 <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
			            <a class="dropdown-item" href="javascript:;">수정</a>
			            <a class="dropdown-item" href="javascript:;">삭제</a>
          			</div>
				</li>
			
			<br>
			<hr>
			<div>
				${post.content}
			</div>
			<hr>
			<button type="button" onclick="location.href='.bit?bindex=${post.bindex}'">수정</button>
			<button type="button" onclick="location.href='delete.bit?bindex=${post.bindex}'">삭제</button>
			<hr>
				<h4 id="reply_h4">댓글</h4>
				<div id="replybox"></div>
					<!-- 댓글 폼 -->
					<br>
					<form name="reply" id="reply" method="POST">
						작성자&nbsp;&nbsp;${sessionScope.id}<br>
						<input type="hidden" name="boardnum" id="boardnum" value="${dto.boardnum}">
						<input type="hidden" name="id" id="id" value="${sessionScope.id}">
						<textarea rows="3" cols="" id="comment" name="comment" style="width: 100%"></textarea>
						<br>
						<input type="button" class="" value="댓글 등록" id="writecom">
						<input type="reset" class="" value="다시 쓰기">
					</form>
					<!-- 댓글 폼 끝 -->
					
					<hr>
			
		</div>
	</div>
	
	<%@ include file="/WEB-INF/include/footer.jsp"%>	
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

//모든 요소 load 후 댓글 목록과 댓글 쓰기 폼 불러오기
$(function() {
	
	getReplyList();
	insertReply();
	
});


//댓글 목록 가져오기
function getReplyList() {
	
	$.ajax({
		url:"GetReplyList",
		datatype: "json",
		data: { boardnum:'${dto.boardnum}'},
		success: function(data) {
			
			var html = "";
			console.log("data: "+data);
			
			$.each(JSON.parse(data), function(index, element) {
				
				
				html += "<form action='ReplyDelete' method='POST'>";
				html += "<div id='reply_id'><b>";
				html += element.id;
				html += "</b></div>";
				html += "<div id='reply_comment'>";
				html += element.replycont;
				html += "</div>";
				html += "<div id='reply_date'><h6>";
				html += element.replydate;
				html += "</h6></div>";
				html += "<input type='hidden' name='replynum' id='replynum' value='";
				html += element.replynum;
				html += "'> <input type='submit' value='삭제' class='button small' onclick='deleteReply(this.form)'>";
				html += "</form>";
				
			});
			
			$('#replybox').append(html);
			
		}
	});
	
}


//댓글 쓰기
function insertReply() {
	$('#writecom').click(function(){
		
		if(!reply.comment.value) {
			swal('댓글 내용을 입력하세요!');
			reply.comment.focus();
			return false;
		}
		
		$.ajax ({
			
			url:"ReplyInsert",
			datatype:"json",
			data: { boardnum:'${dto.boardnum}',
					id: '${dto.id}',
					comment: $('#comment').val()
				  },
			success: function(data) {
					$('#replybox').empty();
					getReplyList();
					$('#comment').val("");
					
				}
				
		});
		
		return false;
		
	});
}


//댓글 삭제

function deleteReply(form) {
	$(form).on("submit", function() {
		
		var data = $(this).serialize();
		
		$.ajax({
			url: "ReplyDelete",
			data: data,
			success: function(data) {
				$('#replybox').empty();
				getReplyList();
			}
		});
		return false;
	});
}
</script>
</html>