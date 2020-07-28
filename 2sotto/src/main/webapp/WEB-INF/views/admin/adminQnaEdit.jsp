<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
     <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    
</head>
<body>

    <%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<div class="side_overlay">
		<div class="container">

			<form action="adminQnaEdit.bit" method="post">
				<!-- bindex 가져가기 위해서 -->
				<input hidden name="qaindex" value="${qna.qaindex}"/>
				<div class="form-group bmd-form-group">
				  <label class="bmd-label-static">제목</label>
				  <input type="text" name="title" value="${qna.title}" class="form-control" placeholder="">
				</div>
				
				
				
				<!-- ckeditor 일단 cdn으로 걸었음 -->
				<textarea name="content">${qna.content}</textarea>
				<div class="border-top">
					<div class="card-body" style="text-align: center;">
					
						<button type="submit" class="btn btn-primary" style="padding: 10px 20px"><b>전송</b></button>
						<button type="reset" class="btn" style="padding: 10px 20px">취소</button>
					</div>
				</div>
			</form>									

			<!-- <div class="card  card-nav-tabs ">
	

				colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger"
	
					<div class="tab-content text-center">

						-------- 글쓰기  ----------------

						<div class="table-responsive">
							<table class="table">
								<thead class=" text-primary">
									<tr>
										<td>
											<div style="margin-bottom: 8px;">
												
											</div>
										</td>
									</tr>
								</thead>
								<tbody>
									<tr>

										<td></td>
									</tr>
									<tr>

										<td><input name="file" type="file" /><br></td>
									</tr>
									<tr>
										<td align="center">
										</td>
									</tr>
							</table>

						</div>

					</div>

			</div> -->
			
			
			
		</div>
	</div>
	

	
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
	<!-- 글쓰기 등록 -->
<!-- <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> -->

<script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<!-- <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
 	 -->
<script type="text/javascript">

	$(function() {

		CKEDITOR.replace( 'content' );
		
	});


</script>
</html>