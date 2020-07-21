<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
										<i class="material-icons"></i>후원글 메인
									</a>
								</li>
								<!-- <li class="nav-item">
									<a class="nav-link" onclick="location.href='mainbydate.bit'" data-toggle="tab"> <i class="material-icons">chat</i>
										<i class="material-icons"></i>최신순
									</a>
								</li> -->
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

							<form action="update.bit" method="post">
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">글번호</label> 
									<input type="text" name="dindex" class="form-control" value="${donate.dindex}" readonly> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">제목</label> 
									<input type="text" name="title" class="form-control" value="${donate.title}" > 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">작성자</label> 
									<input type="text" class="form-control" placeholder="관리자" readonly> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">후원이 필요한 아이</label> 
									<input type="text" name="dobject" class="form-control" value="${donate.dobject}" > 
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
									<input type="text" name="ctime" class="form-control" value="${donate.ctime}" > 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">목표모금액</label> 
									<input type="text" name="gcoll" class="form-control" value="${donate.gcoll}" > 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">현재모금액</label> 
									<input type="text" name="ccoll" class="form-control" value="${donate.ccoll}" readonly> 
								</div>
								
									   <textarea id="content" name="content" class="form-control"  rows="10" > ${donate.content}</textarea>
									  
								<div class="border-top">
									<div class="card-body" style="text-align: center;">
										<button type="submit" class="btn btn-primary"><b>글 수정 완료</b></button>
										<button type="button" class="btn btn-primary" id="cancle" onclick="location.href='detail.bit?dindex=${donate.dindex}'">수정 취소</button>									
								</div>
							</div>
						</form>



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
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<script type="text/javascript">

//ckeditor
$(function(){
	CKEDITOR.replace('content',{
		filebrowserUploadUrl: '${pageContext.request.contextPath }/fileupload.bit',
		uploadUrl:'${pageContext.request.contextPath }/fileupload.bit'
	});
});
</script>
</html>

