<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


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
			color: rgba(233, 33, 101, 0.2);
		}
		
		.commentIcons {
			font-size: 20px;
			color: rgba(233, 33, 101, 0.2);
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

   
	<div class="container">
		<div class="side_overlay">
		 <div class="main-card">
				<a href="javascript:history.back()"><span id="back-icon"><i class="fas fa-angle-double-left"></i></span></a>
				
			<form action="adminQnaReply.bit" method="post">
				<!-- bindex 가져가기 위해서 -->
				<input hidden name="qaindex" value="${qna.qaindex}"/>
				<div class="form-group bmd-form-group">
				  <label class="bmd-label-static">제목</label>
				  <input type="text" name="title" value="${qna.title}" class="form-control" placeholder="" readonly>
				</div>
				
	
				<textarea name="replyContent"> 해당글 내용입니다.${qna.content} </textarea>
				<div class="border-top">
					<div class="card-body" style="text-align: center;">
						<button type="submit" class="btn btn-primary" style="padding: 10px 20px"><b>전송</b></button>
						<button type="reset" class="btn" style="padding: 10px 20px">취소</button>
					</div>
				</div>
			</form>									

			
			
		 </div>
		</div>
	</div>

</body>
	<!-- 글쓰기 등록 -->
<!-- <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> -->

<script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<!-- <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
 	 -->
<script type="text/javascript">

	$(function() {

		CKEDITOR.replace( 'replyContent' );
	
	});
</script>
</html>