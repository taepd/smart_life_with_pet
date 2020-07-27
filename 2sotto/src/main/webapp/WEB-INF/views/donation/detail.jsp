<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>

<html>
<head>

	<title>슬기로운 반려생활</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<!-- 타임피커 cdn -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-datetimepicker/2.7.1/css/bootstrap-material-datetimepicker.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

	<%@ include file="/WEB-INF/include/import.jsp"%>
	<!-- 프로그레스 바 부트스트렙 시작 -->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
	<!-- 프로그레스 바 부트스트렙 끝-->
	<style>
	#jb {
			width: 100%;
			height: 50px;
		}
    
   .align-center { text-align: center; }
      
     /* .recom{position:relative;} */ 
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
 	.writereCom
 	:before {

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
			<div class="main-card">
				<a href="main.bit"><span id="back-icon"><i class="fas fa-angle-double-left"></i></span></a>
			<!-- 포인트 user point로 업데이트 -->
			<!-- <form action="payInput.bit" method="POST">    		
    		<input type="text" name="point" id="point" value="" placeholder="충전할 금액을 입력해 주세요 (100원 = 100point)">   		
			<button type="button" id="check_module" class="btn btn-primary">포인트 충전하기</button>
    		</form>  -->
    		<%-- <form name="myForm" method="post">
	    		
    			<input type="text" name="point" id="point" value="" placeholder="충전할 금액을 입력해 주세요 (100원 = 100point)">
    			<input type="hidden" name="dindex" value="${donate.dindex}">
	    		<input type="hidden" name="point" value="${point}">
	    		<input type="hidden" name="ptype" value="결제">
    			<input type="button" onClick="mySubmit()" id="check_module" class="btn btn-primary" placeholder="포인트 충전하기">
    		</form> --%>


			<!-- <a class="nav-link active show" onclick="location.href='main.bit'" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
				<!-- <i class="material-icons"></i>후원글 메인
			</a> -->

			
						<!---------- 디테일------------------>
						<div class="" ><!-- class="tab-pane active show" -->

							<form action="donatePoint.bit" method="POST">
								
									<!-- 넘겨야 할 데이터 -->
									<input type="hidden" class="form-control" name="dindex" value="${donate.dindex}" readonly> 										
									<input type="hidden" name="title" class="form-control" value="${donate.title}" readonly> 														
									<input type="hidden"  class="form-control" placeholder="관리자" readonly> 																
									<input type="hidden" name="dobject" class="form-control" value="${donate.dobject}" readonly> 																
									<fmt:parseDate var="parseTime" value="${donate.rtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate var="rtime" value="${parseTime}" pattern="yyyy-MM-dd HH:mm:ss"/> 
									<input type="hidden" name="rtime" class="form-control" value="${rtime}" readonly> 														
									<fmt:parseDate var="parseTime" value="${donate.ctime}" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate var="ctime" value="${parseTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
									<input type="hidden" name="ctime" class="form-control" value="${ctime}" readonly> 																						
									<input type="hidden" name="gcoll" class="form-control" value="${donate.gcoll}" readonly> 								
									<input type="hidden" name="ccoll" class="form-control" value="${donate.ccoll}" readonly> 
								
								<table class="table">
								<thead class=" text">
									
									<tr>
										<th>글번호</th>
										<td>${donate.dindex}</td>
										<th>제목</th>
										<td>${donate.title}</td>
									</tr>
									<tr>
										<th>작성자</th>
										<td>관리인</td>
										<th>후원이 필요한 아이</th>
										<td>${donate.dobject}</td>
									</tr>
									<tr>
										<th>후원글 등록 시간</th>
										<td>${rtime}</td>
										<th>후원 완료시간</th>
										<td>${ctime}</td>
									</tr>
									<tr>
										<th>목표 모금액</th>
										<td>${donate.gcoll}</td>
										<th>현재 모금액</th>
										<td>${donate.ccoll}</td>
									</tr>
									
								</thead>							
								</table>
								<h4 class="align-center">모금률</h4>
								<div class="form-group bmd-form-group" >
									<!-- <label class=" text" >모금률</label> --><!-- for="bmd-label-static" -->
									<progress value="0" max="100" id="jb"></progress>
									<p><fmt:formatNumber value= "${donate.ccoll/donate.gcoll*100}" pattern="#,###"/>%</p>
								</div>	
												
									<!-- <label for="bmd-label-static">기부중</label>  -->
									<input type="hidden" name="dstate" class="form-control" value="${donate.dstate}" readonly> 																																				
								<!-- <div id="donateColl"> -->															
								<input type="text" name="dpoint"  placeholder="기부하실 포인트를 직접 입력해 주세요">
								<button type="submit" id="donatePoint" class="btn btn-primary">포인트 기부하기</button>
								</form>								
								
								</div>	
								<div>
								&nbsp;&nbsp;&nbsp;
								</div><!-- 공백 용 div -->															
								  ${donate.content}
								<div>
								&nbsp;&nbsp;&nbsp;
								</div><!-- 공백 용 div -->							
								<div class="border-top">
									<div class="card-body" style="text-align: center;">
										<se:authorize access="hasAnyRole('ROLE_ADMIN')">
										<button class="btn btn-primary btn-round" type="button" onclick="location.href='update.bit?dindex=${donate.dindex}'">수정</button>										
										<a href="#" data-toggle="modal" data-target="#deleteModal"class="btn btn-primary btn-round">삭제</a>	
										</se:authorize>
										<%-- <button type="button" id="delete" onclick="location.href='delete.bit?dindex=${donate.dindex}'" >삭제</button> --%>
								</div> 
															 
								
								</div>
								
						</div>
				
					</div>
				</div>
				<hr>
				<h4 id="reply_h4">댓글</h4>
				
				<div id="commentBox"></div>
				<!-- 댓글 폼 -->
				<br>
				
				<form name="comment" id="comment" method="POST">
						작성자&nbsp;&nbsp;${sessionScope.user.nick}<br>
						<%-- <input type="hidden" name="bindex" id="bindex" value="${post.bindex}"> --%>
						<%-- <input type="hidden" name="userid" id="userid" value="${sessionScope.user.userid}"> --%>
						<textarea  rows="3" cols="" id="dccontent" name="dccontent" style="width: 100%"></textarea>
						<br>
						<div style="text-align: center;">
						<input type="button" class="btn btn-primary btn-round" value="댓글 등록" id="writecom">
						<input type="reset" class="btn btn-primary btn-round" value="다시 쓰기">
						</div>
				</form>
				<!-- 댓글 폼 끝 -->
					
				<hr>
				</div>
			</div> <!-- /.main-card -->
		</div> <!-- /.side-overlay -->
	</div> <!-- /.container -->




			<!-- Modal -->
	
<div class="modal" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">게시물 삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        게시물을 정말 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
  		<button onclick="Delete()" type="button" class="btn btn-primary btn-round">삭제하기</button>
        <button type="button" class="btn btn-primary btn-round" data-dismiss="modal">취소하기</button>
       	
      </div>
    </div>

  </div>
</div>
<!-- 삭제Modal -->
<!-- 댓글 -->
			
<!-- container end -->		
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 


<!-- side_overlay end -->
<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>
<!-- ckeditor -->

<!-- 결제시작 -->
<script type="text/javascript">

/* function mySubmit() {
	document.myForm.action='payInput.bit';
	document.myForm.action='writeDonationRecord.bit';
} */


function Delete() {
    location.replace("delete.bit?dindex=${donate.dindex}"); 
  }

function Pay() {
    location.replace("../payTest.bit"); 
  }

function Hidden() {
	$('#payModal').modal('hide');
}

</script>
<script>
$("#check_module").click(function () {
var IMP = window.IMP; // 생략가능
IMP.init('imp77900278');
// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
IMP.request_pay({
pg: 'kakao', // version 1.1.0부터 지원.
//pg: 'inicis', // version 1.1.0부터 지원.
/*
'kakao':카카오페이,
html5_inicis':이니시스(웹표준결제)
'nice':나이스페이
'jtnet':제이티넷
'uplus':LG유플러스
'danal':다날
'payco':페이코
'syrup':시럽페이
'paypal':페이팔
*/
pay_method: 'card',
/*
'samsung':삼성페이,
'card':신용카드,
'trans':실시간계좌이체,
'vbank':가상계좌,
'phone':휴대폰소액결제
*/
merchant_uid: 'merchant_' + new Date().getTime(),
/*
merchant_uid에 경우
https://docs.iamport.kr/implementation/payment
위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
참고하세요.
나중에 포스팅 해볼게요.
*/
name: '김건휘 일상보고서',
//결제창에서 보여질 이름
amount: $('#point').val(),
//가격
buyer_email: '2sotto@sotto.do',
buyer_name: '김건휘',
buyer_tel: '010-1234-5678',
buyer_addr: '서울특별시 강남구 삼성동',
buyer_postcode: '123-456',
m_redirect_url: 'payInput.bit'
//m_redirect_url: 'http://localhost:8090/payments/complete' 
/*
모바일 결제시,
결제가 끝나고 랜딩되는 URL을 지정
(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
*/
}, function (rsp) {
console.log(rsp);
if (rsp.success) {
	//결제 완료시 DB에 반영
	 location.replace("${pageContext.request.contextPath}/donation/payInput.bit?point="+$('#point').val()+""); 	
var msg = '결제가 완료되었습니다.';
msg += '고유ID : ' + rsp.imp_uid;
msg += '상점 거래ID : ' + rsp.merchant_uid;
msg += '결제 금액 : ' + rsp.paid_amount;
msg += '카드 승인번호 : ' + rsp.apply_num;
$('#point').val(rsp.paid_amount); 
}else {
var msg = '결제에 실패하였습니다.';
//msg += '에러내용 : ' + rsp.error_msg;
}
alert(msg);
});
});


//https://github.com/iamport/iamport-manual/blob/master/%EC%9D%B8%EC%A6%9D%EA%B2%B0%EC%A0%9C/README.md 참고문서
//https://minaminaworld.tistory.com/78
</script>
<!-- 결제종료 -->
<script type="text/javascript">




//삭제 전 확인 창 띄우기
/* $('#delete').click(function(){
	let con = confirm("정말로 삭제하시겠습니까?");
	if(con){
		return location.href='delete.bit?dindex=${donate.dindex}';
	}else{
		return;
	}
}); */
	


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
				let depthCss = "";
				if(this.depth == 1) {
					depthCss = "padding-left:45px";
				}

				//대댓글은 임시로 배경색 넣음. 나중에 들여쓰기 적용해야 함
				if(element.depth==1){
					html += "<div class='reCom' style='position:relative; padding: 15px 0;"+depthCss+"'>";
				}else{
					html += "<div>";
				};
				//html += "<form action='commentDelete.bit' method='POST'>";
				html += "<div class='d-flex justify-content-between' style='background-color: #F1F1F1; padding: 0 0 0 10px;'><div id='commentUserid'><b>";
				html += element.nick;
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
					nick: '${sessionScope.user.nick}',
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
function editComment(dcindex) {
					
				let html = "";
				let dccontent = $('#commentContent'+dcindex+'').text();
				
				html += '<form name="editCommentBox" id ="editCommentBox" method="POST">';
				html +=	'<input type="hidden" id="dcindex" value="'+dcindex+'">';
				html +=	'<textarea rows="3" cols="" id="dccontent" name="dccontent" style="width: 100%">'+dccontent+'</textarea><br>';
				html +=	'<input type="button" class="button small" value="댓글 수정" id="editcom">';
				html +=	'<input type="reset" class="button small" value="다시 쓰기"></form>';
				
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
		return location.href='deleteComment.bit?dcindex='+dcindex+'&dindex=${donate.dindex}';
	}else{

		return;
	}
}

//대댓글 창 열기 
function openReComment(dcindex, userid, refer) {
		
		let html = "";
		let dccontent = "";
		
		console.log("refer" + refer);

		let depthCss = "";	
		if(this.depth == 1) {
			depthCss = "padding-left:45px";
		}
		
		//로그인 유저 본인의 댓글이 아닐 때 해당 댓글쓴 아이디값을 '@아이디'형태로 인풋창에 불러옴
		if(userid!='${sessionScope.user.userid}'){
		   
		   dccontent='@'+userid+' '; 
		   console.log('우와와');
		} 
		

		html += '<div class="writereCom" style="position:relative; top:10px; padding-left:45px">';
		html += '<form name="reCommentBox" id ="reCommentBox" method="POST">';	
		html +=	'<input type="hidden" id="refer" value="'+refer+'">';
		html +=	'<input type="hidden" id="dcindex" value="'+dcindex+'">';
		html +=	'<textarea rows="3" cols="" id="dccontent" name="dccontent" placeholder="대댓글을 입력해 주세요" style="width: 100%">'+dccontent+'</textarea><br>';
		html +=	'<input type="button" class="" value="대댓글 등록" id="writeRecom">';
		html +=	'<input type="reset" class="" value="다시 쓰기"></form>';
		html += '</div>';
		
		$('#editForm'+dcindex+'').append(html);
		
		//기본 댓글 입력창 비활성화
		$('#comment.dccontent.value').empty();
		$('#comment').hide();
			
		return false;
		
};

//대댓글 쓰기
$(document).on("click","#writeRecom",function(){
		
		if(!reCommentBox.dccontent.value) {
			swal('대댓글 내용을 입력하세요!');
			comment.dccontent.focus();
			return false;
		}
		
		$.ajax ({
			
			url:"writeRecomment.bit",
			type: "post",
			datatype:"json",
			data: { dindex:'${donate.dindex}',
					dcindex: $('#dcindex').val(),
					userid: '${sessionScope.user.userid}',
					nick: '${sessionScope.user.nick}',
					dccontent: $('#dccontent').val(),
					refer: $('#refer').val()
				  },	
			success: function(data) {
					$('#commentBox').empty();
					//$('#reCommentBox').empty();
					$('#dccontent').val("");
					getCommentList();

					//기본 댓글 입력창 활성화
					$('#comment').show();	
				}
				
		});
		
		return false;
		
	});




</script>
</html>


