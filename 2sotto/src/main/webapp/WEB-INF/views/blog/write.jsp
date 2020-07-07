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
			<h3>블로그 글쓰기 페이지</h3>
			<div class="card  card-nav-tabs ">


				<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
	
				<div class="card-body">
					<div class="tab-content text-center">

						<!---------- 글쓰기  ------------------>

						<div class="table-responsive">
							<table class="table">
								<thead class=" text-primary">
									<tr>
										<td>
											<div style="margin-bottom: 8px;">
												<input type="text" class="form-control" name="post_title"
													placeholder="제목" value="" required />
											</div>
										</td>
									</tr>
								</thead>
								<tbody>
									<tr>

										<td><textarea id="summernote" name="post_contents"
												cols="67" rows="20" required></textarea></td>
									</tr>
									<tr>

										<td><input name="file" type="file" /><br></td>
									</tr>
									<tr>
										<td align="center"><a href="javascript:history.go(-1)"
											class="btn btn-round btn-rose">&nbsp;&nbsp;등록&nbsp;&nbsp;</a>
											<a href="javascript:addpost()" class="btn btn-round btn-white">&nbsp;&nbsp;취소&nbsp;&nbsp;</a>
										</td>
									</tr>
							</table>

						</div>

					</div>

				</div>
			</div>
			
			
		</div>
	</div>
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
	<!-- 글쓰기 등록 -->
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#summernote').summernote({
			height : 500,
			minHeight : null,
			maxHeight : null,
			focus : true
		});
	});
</script>
</html>