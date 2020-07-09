<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
										<i class="material-icons">favorite</i> 좋아요 순
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" onclick="location.href='messagePage.bit'" data-toggle="tab"> <!-- <i class="material-icons">chat</i> -->
										<i class="material-icons">favorite</i> 게시 일자 순
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" onclick="location.href='write.bit'" data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
										<i class="material-icons">camera</i> 글쓰기
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

							
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">글번호</label> 
									<input type="text" class="form-control" value="${donate.dindex}" readonly> 
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
									<label for="bmd-label-static">목표모금액</label> 
									<input type="text" name="gcoll" class="form-control" value="${donate.gcoll}" readonly> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">현재모금액</label> 
									<input type="text" class="form-control" value="${donate.ccoll}" readonly> 
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


					</div>
				</div>
			</div>

		</div>
		<!-- container end -->
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
</script>
</html>

