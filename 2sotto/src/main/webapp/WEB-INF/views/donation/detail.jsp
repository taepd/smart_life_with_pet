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
	
						<!---------- 쪽지쓰기 ------------------>
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
								
								
								<div id="donateColl">
								
								
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
								
								 
								
							</div>
						



						</div>


						<!-------------- 끝 ---------------->
						<!-- 댓글 입력 폼 -->
						<%-- <hr>
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
						
					
						<hr> --%>
				
    
    			<div class="container">
        			<div class="commentList"></div>
    			</div>


					</div>
				</div>
			</div>

		</div>
		<!-- container end -->
		<%@ include file="DonateComment.jsp" %>
		



	</div>
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

//기부완료(by Coll)시 버튼 비활성화
function() hideButton{
	
}
</script>
</html>

