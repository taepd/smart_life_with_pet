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
			color: rgba(156, 39, 176, 0.2);
		}
		
		.commentIcons {
			font-size: 20px;
			color: rgba(156, 39, 176, 0.2);
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
<body>
    
    <%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<div class="container">
		<div class="side_overlay">
			<div class="main-card">
				<a href="myMain.bit"><span id="back-icon"><i class="fas fa-angle-double-left"></i></span></a>
				
				<!-- 글쓴이 및 관련 반려동물 영역 -->
				<div class="d-flex">  <!--  style="display: inline-block;" -->
					<!-- <span class="align-self-center"><b>${post.nick}</b>님과 </span> -->
					<h4 class="align-self-center">A story of</h4>
					<c:forEach var="myPet" items="${pArr}">
					<c:forTokens var="petindex" items="${post.petindex}" delims=",">
						<c:if test="${petindex eq myPet.petindex}">
						<div class="follow-img-wrapper d-flex flex-column" value="${petArr.petindex}" style="margin:10px; cursor:pointer;"
							onclick="location.href='${pageContext.request.contextPath}/mypage/petPage.bit?petindex=${petindex}'">
						<!-- 이미지 동그랗게 잘라서 크기에 맞게 나오게 하는 코드 -->
							<div class="rounded-circle card-modal-profile"
								style="float : left; background-color: white; overflow: hidden; height:50px; width:50px; margin: 0 auto;">
								<div style="top: 0; left: 0; right: 0; bottom: 0; transform: translate(50%, 50%);">
									<img  src="${pageContext.request.contextPath}/assets/images/${myPet.petimg}" alt="${myPet.petname}" href="javascript:void(0)"
										style="width :auto; height: 70px; transform: translate(-50%, -50%); ">
								</div>
							</div>
							<!-- <div class="text-center"> ${myPet.petname} </div> -->
						</div>
						</c:if>
					</c:forTokens>
					</c:forEach>
					<!-- <span class="align-self-center">의 이야기</span>   			 -->
				</div>

				<h1>${post.title}</h1>	
		
				<div class="heart-comment-time-area">
					<fmt:parseDate var="parseTime" value="${post.rtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate var="rtime" value="${parseTime}" pattern="yyyy-MM-dd hh:mm"/>
					<span>${rtime}</span>
				</div>
			
				<li class="nav-item dropdown" style="float: right;">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span><i class="fas fa-ellipsis-v"></i></span></a>
					<c:if test="${sessionScope.user.userid eq post.userid}">
						<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
			            	<a class="dropdown-item" href="edit.bit?bindex=${post.bindex}">수정</a>
			            	<a class="dropdown-item" href="javascript:;" id="delete">삭제</a>
					  	</div>
					</c:if> 
				</li>
			
			<hr>
			<div style="margin-top: 50px;">
				${post.content}
			</div>
			<!-- <c:if test="${sessionScope.user.userid eq post.userid}">
				<button type="button" onclick="location.href='edit.bit?bindex=${post.bindex}'">수정</button>
				<button type="button" id="delete">삭제</button>
			</c:if> -->
			<!-- 하트/코멘트 갯수 영역 -->
				<div class="heart-and-comment">
					<div class="heart-comment-time-area" onclick='toggleHeart()'
							style="cursor:pointer">
						<span class="heart"><i id="heart" class="far fa-heart"></i></span>
						좋아요 <span id="blikeCount">${post.blike}</span>
					</div>
					<div class="heart-comment-time-area">
						<span class="icon"><i class="far fa-comment"></i></span>
						<span id="bcCount">${post.bcCount}</span>
					</div> 			
				</div>	
			
				<hr>
				<h4 id="reply_h4">댓글</h4>
				
				<div id="commentBox"></div>
					<!-- 댓글 폼 -->
					<se:authorize access="hasAnyRole('ROLE_USER')">
					<br>
					<form name="comment" id="comment" method="POST">
						작성자&nbsp;&nbsp;${sessionScope.user.nick}<br>
						<%-- <input type="hidden" name="bindex" id="bindex" value="${post.bindex}"> --%>
						<%-- <input type="hidden" name="userid" id="userid" value="${sessionScope.user.userid}"> --%>
						<textarea rows="3" cols="" id="content" name="content" style="width: 100%"></textarea>
						<br>
						<input type="button" class="btn btn-sm" value="등록" id="writecom">
						<input type="reset" class="btn btn-sm" value="다시 쓰기">
					</form>
					<!-- 댓글 폼 끝 -->
					</se:authorize>
					<hr>
					
					
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/include/footer.jsp"%>	
</body>

<script>

//모든 요소 load 후 댓글 목록과 댓글 쓰기 폼 불러오기
$(function() {
	
	getCommentList();
	insertComment();

	//좋아요 하트 활성/비활성 체크
	if(${blike.bindex eq post.bindex}){ 
		$('#heart').attr('class','fas fa-heart'); 
	}
	
});

//좋아요 토글
function toggleHeart(){
	
	if(($('#heart').attr('class')) == 'far fa-heart'){ //좋아요 클릭하면(좋아요 안된 상태일 때)
		
		$.ajax({
			type : "POST",
			url : 'likePost.bit',
			data : {
				bindex: '${post.bindex}',
				userid: '${sessionScope.user.userid}'	
			},
			datatype : 'json',
			async: false,
			success : function(data) {
				
				if (data == 1) {

					$('#heart').attr('class','fas fa-heart'); 
					$('#blikeCount').html($('#blikeCount').html()*1+1);

					return;
				} else {
					alert("문제가 생겨 좋아요 요청이 취소되었습니다.");

					return;
				}
			}
		});

		
	}else{

		$.ajax({
			type : "POST",
			url : 'unlikePost.bit',
			data : {
				bindex: '${post.bindex}',
				userid: '${sessionScope.user.userid}'	
			},
			datatype : 'json',
			async: false,
			success : function(data) {
				
				if (data == 1) {

					$('#heart').attr('class','far fa-heart');
					$('#blikeCount').html($('#blikeCount').html()*1-1);
									
					return;
				} else {
					alert("문제가 생겨 좋아요 요청이 취소되었습니다.");

					return;
				}
			}
		});
	}
}


// 블로그 글 삭제 전 확인 창 띄우고 확인 시 삭제
$('#delete').click(function(){
	let con = confirm("정말로 삭제하시겠습니까?");
	if(con){
		return location.href='delete.bit?bindex=${post.bindex}';
	}else{
		return;
	}
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
				let depthCss = "";
				if(this.depth == 1) {
					depthCss = "padding-left:45px";
				}

				if(element.depth==1){
					html += "<div class='reCom' style='position:relative; padding: 15px 0;"+depthCss+"'>";
				}else{
					html += "<div>";
				};
				//html += "<form action='commentDelete.bit' method='POST'>";
				html += "<div class='d-flex justify-content-between'style='background-color: #F1F1F1; padding: 0 0 0 10px;'><div id='commentUserid'><b>";
				html += element.nick;
				//댓글인 경우
				if(element.depth ==0){
					html += "</b></div><div><se:authorize access='hasAnyRole(\'ROLE_USER\')'><button onclick='openReComment("+element.bcindex+",\""+element.userid+"\",\""+element.refer+"\"); this.onclick=null;' class='btn btn-sm'>대댓글</button></se:authorize></div></div>";
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
				// html += "'> <input type='button' id='editCommentBtn"+element.bcindex+"' value='수정' class='button small' onclick='editComment("+element.bcindex+"); this.onclick=null;'>";
				html += "'> <a href='" + "javascript:void(0);' onclick='editComment(" + element.bcindex + ");  this.onclick=null;'; id='editCommentBtn" + element.bcindex + "';><span class='commentIcons'><i class='fas fa-edit'></i></span></a>";
				
				//html += "<input type='submit' value='삭제' class='button small' onclick='deleteReply(this.form)'>";
				// html += "<input type='submit' id='deleteCommentBtn' value='삭제' class='button small' onclick='deleteComment("+element.bcindex+"); this.onclick=null;'>";
				// html += "<input type='submit' id='deleteCommentBtn' value='삭제' class='button small' onclick='deleteComment("+element.bcindex+"); this.onclick=null;'>";
				html += "<a href='" + "javascript:void(0);' onclick='deleteComment(" + element.bcindex + ")'; id='deleteCommentBtn'><span class='commentIcons'><i class='fas fa-trash-alt'></i></span></a>";
				


				
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
					nick: '${sessionScope.user.nick}',
					content: $('#content').val()
				  },	
			success: function(data) {
					$('#commentBox').empty();
					$('#content').val("");
					getCommentList();
					$('#bcCount').html($('#bcCount').html()*1+1);
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
				html +=	'<input type="button" class="btn btn-sm" value="수정" id="editcom">';
				html +=	'<input type="reset" class="btn btn-sm" value="원래대로"></form>';
				
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



//댓글 삭제  >> 비동기로 전환해야 함
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

		let depthCss = "";
		if(this.depth == 1) {
			depthCss = "padding-left:45px";
		}
		
		//로그인 유저 본인의 댓글이 아닐 때 해당 댓글쓴 아이디값을 '@아이디'형태로 인풋창에 불러옴
		if(userid!='${sessionScope.user.userid}'){
			content='@'+userid+' '; 
			console.log('우와와');
		} 
		html += '<div class="writereCom" style="position:relative; top:10px; padding-left:45px">';
		html += '<form name="reCommentBox" id ="reCommentBox" method="POST">';
		html +=	'<input type="hidden" id="refer" value="'+refer+'">';
		html +=	'<input type="hidden" id="bcindex" value="'+bcindex+'">';
		html +=	'<textarea rows="3" cols="" id="content" name="content" placeholder="대댓글을 입력해 주세요" style="width: 100%; '+depthCss+'">'+content+'</textarea><br>';
		html +=	'<input type="button" class="btn btn-sm" value="등록" id="writeRecom">';
		html +=	'<input type="reset" class="btn btn-sm" value="다시 쓰기"></form>';
		html += '</div>';
		
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
					nick: '${sessionScope.user.nick}',
					content: $('#content').val(),
					refer: $('#refer').val()
				  },	
			success: function(data) {
					$('#commentBox').empty();
					//$('#reCommentBox').empty();
					$('#content').val("");
					getCommentList();
					$('#bcCount').html($('#bcCount').html()*1+1);

					//기본 댓글 입력창 활성화
					$('#comment').show();	
				}
				
		});
		
		return false;
		
	});
	

</script>
</html>