<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
     <link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
    
</head>

<body>


	<!-- header -->
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<!-- header -->

	<div class="side_overlay">

		<div class="container">

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
										<td align="center"><a href=""
											class="btn btn-round btn-rose">&nbsp;&nbsp;등록&nbsp;&nbsp;</a>
											<a  href="javascript:history.back();" class="btn btn-round btn-white">&nbsp;&nbsp;취소&nbsp;&nbsp;</a>
										</td>
									</tr>
							</table>

						</div>

					</div>

				</div>
			</div>
		</div>

	</div>



</body>
</html>
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

	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>