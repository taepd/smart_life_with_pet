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




							<form action="donationWrite.bit" method="post" enctype="multipart/form-data">
							  <table>
									<tr>
										<td><input type="text" value="관리자" readonly></td>
									</tr>
									<tr>
										<td><input type="text" name="title"  ></td>
									</tr>
									<tr>										
										<td><input type="text" name="dobject"  ></td>
									</tr>
									<tr>

										<td><textarea id="summernote" name="content"
												cols="67" rows="20" ></textarea></td>
									</tr>
									<tr>

										<td><input name="files" type="file" /><br></td>
									</tr>
									<tr>
										<td align="center"><!-- <a href="javascript:history.go(-1)"
											class="btn btn-round btn-rose">&nbsp;&nbsp;등록&nbsp;&nbsp;</a> -->
											<input type="submit"  value="글 등록" />
											<input type="reset"  value="다시쓰기" />
										</td>
									</tr>
							</table>
						</form>
					



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