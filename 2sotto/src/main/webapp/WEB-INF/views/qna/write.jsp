<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>

    
</head>

<<<<<<< HEAD
=======
function sendQna() {
	/* let qna_brd_title = $('#qna_brd_title').val();
	let qna_brd_content = $('#qna_brd_content').val();
	let user = "새로운 문의가 도착했습니다."; */
	
	var text = "새로운 문의가 도착했습니다.";
	var msg = {"type" : "user",
				"title" : $('#title').val(),
				"content" : $('#content').val(),
				"text" : text
				};
	
	/* 
	wsocket.send(qna_brd_title + "," + qna_brd_content + "," + user); */
	wsocket.send(JSON.stringify(msg));
	$('#title').val('');
	$('#content').val('');

	alert("성공!", "등록 되었습니다.", "success");
	setTimeout(function() {
		  location.href="main.bit";
		}, 1000);

	
	
}


</script>
>>>>>>> 763b0b9438e181e2f67af4d6125becc059dd75ad
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
						  	<input type="text" name="title" class="form-control" placeholder="제목을 작성해보세요">
						</div>
							
						<textarea name="content"></textarea>
				<div class="border-top">
					<div class="card-body" style="text-align: center;">
							<button type="submit" class="btn btn-primary" style="padding: 10px 20px"><b>전송</b></button>
							<button type="reset" class="btn" style="padding: 10px 20px">취소</button>
					</div>
				</div>
			</form>		
							

						</div>

					</div>

<!-- footer -->
		<%@ include file="/WEB-INF/include/footer.jsp"%>
<!-- footer -->
</body>
</html>
<!-- 글쓰기 등록 -->

<script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<script type="text/javascript">
$(function() {

	CKEDITOR.replace( 'content' );

	
})
</script>

	
</body>
</html>