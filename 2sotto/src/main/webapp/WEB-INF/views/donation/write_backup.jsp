<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<!-- 달력 쓰려고 가져온 jquery -->

<!--jQuery UI CSS파일   -->
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- 달력 쓰려고 가져온 jquery 끝 -->

<!-- //script구문 내부에 해당 메소드를 입력합니다. -->


<title>슬기로운 반려생활</title>

<%@ include file="/WEB-INF/include/import.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-datetimepicker/2.7.1/css/bootstrap-material-datetimepicker.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

</head>

<body>

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>


	<div class="side_overlay">
		<div class="container">


	
			<div class="card card-nav-tabs">
				<div class="card-header card-header-primary">
					<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
					<div class="nav-tabs-navigation">
						<div class="nav-tabs-wrapper">
							<ul class="nav nav-tabs" data-tabs="tabs">
								<li class="nav-item">
								<a class="nav-link" onclick="location.href='main.bit'" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
										<i class="material-icons">favorite</i>후원글 메인
									</a>
								</li>
								<!-- <li class="nav-item">
									<a class="nav-link" onclick="location.href='mainbydate.bit'" data-toggle="tab"> <i class="material-icons">chat</i>
										<i class="material-icons">favorite</i>최신순
									</a>
								</li> -->
								<li class="nav-item">
									<a class="nav-link active show" onclick="location.href='write.bit'" data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
										<i class="material-icons">camera</i>글 작성
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

							<form action="write.bit" method="post">
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">제목</label> 
									<input type="text" name="title" class="form-control" placeholder="제목"> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">작성자</label> 
									<input type="text"  class="form-control" placeholder="관리자" readonly> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">후원이 필요한 아이</label> 
									<input type="text" name="dobject" class="form-control" placeholder="아이 이름"> 
								</div>								
								<div class="form-group bmd-form-group mb-0">								
									<label for="bmd-label-static">후원 기한</label>
									<input type="text" class="form-control" name="ctime" 
									id="ctime" required> 
								</div>								 	
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">목표모금액</label> 
									<input type="text" name="gcoll" class="form-control" > 
								</div>	
								<div class="form-group bmd-form-group">
								<label for="bmd-label-static">내용</label>
								<textarea class="form-control" id="content" name="content"></textarea>
								</div>
								<div class="border-top">
									<div class="card-body" style="text-align: center;">
										<button type="submit" class="btn btn-primary btn-round"><b>글 등록</b></button>
										<button type="reset" class="btn btn-primary btn-round">글 등록 취소</button>
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
<!-- <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
 	 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<script type="text/javascript">

//ckeditor
$(function(){
	CKEDITOR.replace('content',{
		filebrowserUploadUrl: '${pageContext.request.contextPath }/fileupload.bit',
		uploadUrl:'${pageContext.request.contextPath }/fileupload.bit'
	});

	//datetimepicker
	$("#ctime").bootstrapMaterialDatePicker({
		format: 'YYYY-MM-DD HH:mm',
		lang: 'ko',
		okText: '확인',
		cancelText: '취소'
	});

	
});


</script>
</html>

