<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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


	<!-- header -->
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<!-- header -->

	<div class="side_overlay">

		<div class="container">
			<h3>Q&A 글쓰기 페이지</h3>
			
						<!---------- 글쓰기  ------------------>

			<form action="write.bit" method="post">
						<div class="form-group bmd-form-group">
							<label class="bmd-label-static">제목</label>
						  	<input type="text" name="title" id="title" class="form-control" placeholder="제목을 작성해보세요">
						</div>
							
						<textarea name="content" id="content"></textarea>
				<div class="border-top">
					<div class="card-body" style="text-align: center;">
							<button type="reset" class="btn" style="padding: 10px 20px">취소</button>
							<button type="submit" id="sendQna" class="btn btn-primary" style="padding: 10px 20px"><b>전송</b></button>
							
					</div>
				</div>
		</form>	
							

						</div>

					</div>

<!-- footer -->
		<%@ include file="/WEB-INF/include/footer.jsp"%>
<!-- footer -->

<!-- 글쓰기 등록 -->

</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/ckeditor/ckeditor.js"></script>	
<script type="text/javascript">

	$(function(){
		
		//ckeditor
		CKEDITOR.replace('content',{
			filebrowserUploadUrl: '${pageContext.request.contextPath }/fileupload.bit', //파일업로드
			uploadUrl:'${pageContext.request.contextPath }/fileupload.bit' //드래그 앤 드롭
		});

	});
</script>	
</html>