<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
	  <%@ include file="/WEB-INF/include/import.jsp"%>
	<style>
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
    
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	
	<div class="container">
		<div class="side_overlay">
			<form id="writeForm" action="adminQnaWrite.bit" method="post">
				<div class="row">
					<h3>Q&A 글쓰기</h3>
					<div class="col-12">
						<div class="form-group bmd-form-group">
							<label class="bmd-label-static">제목</label>
							<input type="text" id="title" name="title" class="form-control" placeholder="">
						</div>
						<textarea name="content"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="col-4"></div>
					<div class="col-4">
						<div id="writeBtnBox">
							<button type="button" onclick="check();" class="btn btn-primary" id="btn-write">글쓰기</button>
							<button type="button" onclick="javascript:history.back()" class="btn">뒤로 가기</button>
						</div>
					</div>
					<div class="col-4"></div>
				</div>
			</form>									
		</div> <!-- /.side_overlay -->
	</div> <!-- /.container -->
	
	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>
	<!-- 글쓰기 등록 -->
	
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/ckeditor/ckeditor.js"></script>	
<script type="text/javascript">

	$(function(){		
		//ckeditor
		CKEDITOR.replace('content',{
			filebrowserUploadUrl: '${pageContext.request.contextPath }/fileupload.bit', //파일업로드
			uploadUrl:'${pageContext.request.contextPath }/fileupload.bit' //드래그 앤 드롭
		});

	}); // /.onload

	function check() {
		
		
		$('#writeForm').submit();
	}
</script>
</html>