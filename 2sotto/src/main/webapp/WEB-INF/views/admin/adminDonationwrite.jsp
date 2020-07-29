<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<style type="text/css">
		#back-icon {
			position: absolute;
			top: 7px;
			left: 10px;
			font-size: 34px;
			color: rgba(156, 39, 176, 0.2);
		}

		@font-face {
			font-family: 'netmarbleM';
			src: url('../assets/fonts/netmarbleM.ttf') format('truetype'); 
		}
		#petSelection {
			padding: 30px;
		}
		h3 {
			font-family : 'netmarbleM', sans-serif;
		}
		#writeBtnBox {
			text-align: center;
			margin-top: 80px;
		}

</style>
</head>

<body>



	<div class="side_overlay">
		<div class="container">
			<div class="row">
			<div class="col-2"></div>
			<div class="col-8 area">
			<div class="card card-nav-tabs">
			<div class="card-body">
			<a href="adminMain.bit" style="color: #EE82EE;"><span id="back-icon"><i class="fas fa-angle-double-left"></i></span></a>
			<br>
			<div class="col-12 title-area">
					<h3 style=" text-align: center">후원글 등록<i class="fas fa-paw"></i></h3>
					</div>
					
					
				<form id="joinForm" action="adminDonationwrite.bit" method="post" enctype="multipart/form-data">
				<div id="joinForm-wrapper">
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">작성자</label> 
									<input type="text"  class="form-control" placeholder="관리자" readonly> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">제목</label> 
									<input type="text" id="title" name="title" class="form-control" placeholder="제목"> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">후원이 필요한 아이</label> 
									<input type="text" id="dobject" name="dobject" class="form-control" placeholder="아이 이름"> 
								</div>								
								<div class="form-group bmd-form-group mb-0">								
									<label for="bmd-label-static">후원 기한</label>
									<input type="text"  class="form-control" name="ctime" id="ctime" required> 
								</div>								 	
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">목표모금액</label> 
									<input type="text" id="gcoll" name="gcoll" class="form-control" > 
								</div>	
								<div class="form-group bmd-form-group">
								<label for="bmd-label-static">내용</label>
								<textarea class="form-control" id="content" name="content"></textarea>
								</div>
								<!-- <div class="border-top">
									<div class="card-body" style="text-align: center;">
										<button type="submit" class="btn btn-primary btn-round"><b>글 등록</b></button>
										<button type="reset" class="btn btn-primary btn-round">글 등록 취소</button>
									</div>
								</div>	 -->
						<div class="border-top">
						<div class="card-body" style="text-align: center;">
								<button type="reset" class="btn btn-outline-primary" onclick="location.href='adminMain.bit'">뒤로 가기</button>											
								<button type="reset" class="btn btn-outline-primary">다시쓰기</button>	
								<button type="submit" class="btn btn-primary" onclick="check();">등록</button>
						</div>
					</div>
					</div>
					</form>
					
			</div>
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

// 제대로 입력했는지 확인
function check() {
		
		if( $('#dobject').val() == "" ) {
			swal('도움이 필요한 아이를 입력해 주세요.');
			return false;
		}
		if( $('#gcoll').val() == "" ) {
			swal('목표 모금액을 입력해 주세요.');
			return false;
		} 
		if( $('#title').val().trim() == "") {
			swal('제목을 입력해 주세요!');
			$('#title').focus();
			return false;
		}
		if (CKEDITOR.instances.content.getData().trim() == '' || CKEDITOR.instances.content.getData().length == 0) {
			swal('내용을 입력해주세요.');
			return false;
		}
		$('#joinForm').submit();
	}

</script>
</html>

