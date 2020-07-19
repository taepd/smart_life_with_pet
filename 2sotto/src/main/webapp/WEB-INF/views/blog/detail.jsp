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
			<button type="button" onclick="location.href='edit.bit?bindex=${post.bindex}'">수정</button>
			<button type="button" id="delete">삭제</button>

			<hr>
				<h4 id="reply_h4">댓글</h4>
				
				<div id="commentBox"></div>
					<!-- 댓글 폼 -->
					<br>
					<form name="comment" id="comment" method="POST">
						작성자&nbsp;&nbsp;${sessionScope.user.userid}<br>
						<%-- <input type="hidden" name="bindex" id="bindex" value="${post.bindex}"> --%>
						<%-- <input type="hidden" name="userid" id="userid" value="${sessionScope.user.userid}"> --%>
						<textarea rows="3" cols="" id="content" name="content" style="width: 100%"></textarea>
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


// 블로그 글 삭제 전 확인 창 띄우고 확인 시 삭제
$('#delete').click(function(){
	let con = confirm("정말로 삭제하시겠습니까?");
	if(con){
		return location.href='delete.bit?bindex=${post.bindex}';
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
    
		url:"getCommentList.bit",

		datatype: "json",
		data: { bindex:'${post.bindex}'},
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
					html += "</b></div><div><button onclick='openReComment("+element.bcindex+",\""+element.userid+"\",\""+element.refer+"\"); this.onclick=null;'>대댓글</button></div></div>";
				}else{
					html += "</b></div></div>";
				};
				html += "<div id='commentContent"+element.bcindex+"'>";
				html += element.content;
				html += "</div>";
				html += "<div id='commentDate'><h6>";
				html += element.rtime;
				html += "</h6></div>";
				html += "<input type='hidden' name='commentNum' id='commentNum' value='";
				html += element.bcindex;
				html += "'> <input type='button' id='editCommentBtn"+element.bcindex+"' value='수정' class='button small' onclick='editComment("+element.bcindex+"); this.onclick=null;'>";
				//html += "<input type='submit' value='삭제' class='button small' onclick='deleteReply(this.form)'>";
				html += "<input type='submit' id='deleteCommentBtn' value='삭제' class='button small' onclick='deleteComment("+element.bcindex+"); this.onclick=null;'>";
				//html += "</form>";
				html += "<div id='editForm"+element.bcindex+"'></div>"
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
			
			url:"writeComment.bit",
			type: "post",
			datatype:"json",
			data: { bindex:'${post.bindex}',
					userid: '${sessionScope.user.userid}',
					content: $('#content').val()
				  },	
			success: function(data) {
					$('#commentBox').empty();
					$('#content').val("");
					getCommentList();
				}
				
		});
		
		return false;
		
	});
}

//댓글 수정 창 열기 
function editComment(bcindex) {
					
				let html = "";
				let content = $('#commentContent'+bcindex+'').text();
				
				html += '<form name="editCommentBox" id ="editCommentBox" method="POST">';
				html +=	'<input type="hidden" id="bcindex" value="'+bcindex+'">';
				html +=	'<textarea rows="3" cols="" id="content" name="content" style="width: 100%">'+content+'</textarea><br>';
				html +=	'<input type="button" class="" value="댓글 수정" id="editcom">';
				html +=	'<input type="reset" class="" value="다시 쓰기"></form>';
				
				$('#editForm'+bcindex+'').append(html);
				
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
		
 		var bcindex = $('#bcindex').val();
 		var content = $('#content').val();
		
 		$.ajax ({		
			url:"editComment.bit",
			type: "post",
			datatype:"json",
			data: { bcindex: $('#bcindex').val(),
					userid: '${sessionScope.user.userid}',
					content: $('#content').val()
				  },	
			success: function(data) {
					$('#editCommentBox').remove();
					$('#commentContent'+bcindex+'').text(content);
					$('#editCommentBtn'+bcindex+'').attr("onclick", "editComment("+bcindex+"); this.onclick=null;");
					//기본 댓글 입력창 활성화
					$('#comment').show();					
			}
		}); 
			
		return false;		
});



//댓글 삭제
// 블로그 댓글 삭제 전 확인 창 띄우고 확인 시 삭제

function deleteComment(bcindex) {

	let con = confirm("정말로 삭제하시겠습니까?");
	if(con){
		return location.href='deleteComment.bit?bcindex='+bcindex+'&bindex=${post.bindex}';
	}else{

		return;
	}
}

//대댓글 창 열기 
function openReComment(bcindex, userid, refer) {
			
		let html = "";
		let content = "";
		console.log("refer" + refer);
		//로그인 유저 본인의 댓글이 아닐 때 해당 댓글쓴 아이디값을 '@아이디'형태로 인풋창에 불러옴
		if(userid!='${sessionScope.user.userid}'){
			content='@'+userid+' '; 
			console.log('우와와');
		} 
		
		html += '<form name="reCommentBox" id ="reCommentBox" method="POST">';
		html +=	'<input type="hidden" id="refer" value="'+refer+'">';
		html +=	'<input type="hidden" id="bcindex" value="'+bcindex+'">';
		html +=	'<textarea rows="3" cols="" id="content" name="content" placeholder="대댓글을 입력해 주세요" style="width: 100%">'+content+'</textarea><br>';
		html +=	'<input type="button" class="" value="대댓글 등록" id="writeRecom">';
		html +=	'<input type="reset" class="" value="다시 쓰기"></form>';
		
		$('#editForm'+bcindex+'').append(html);
		
		//기본 댓글 입력창 비활성화
		$('#comment.content.value').empty();
		$('#comment').hide();
			
		return false;
		
};

//대댓글 쓰기
$(document).on("click","#writeRecom",function(){
		
		if(!reCommentBox.content.value) {
			swal('대댓글 내용을 입력하세요!');
			comment.content.focus();
			return false;
		}
		
		$.ajax ({
			
			url:"writeRecomment.bit",
			type: "post",
			datatype:"json",
			data: { bindex:'${post.bindex}',
					bcindex: $('#bcindex').val(),
					userid: '${sessionScope.user.userid}',
					content: $('#content').val(),
					refer: $('#refer').val()
				  },	
			success: function(data) {
					$('#commentBox').empty();
					//$('#reCommentBox').empty();
					$('#content').val("");
					getCommentList();

					//기본 댓글 입력창 활성화
					$('#comment').show();	
				}
				
		});
		
		return false;
		
	});
	

</script>
</html>