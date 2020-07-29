<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
<head>

<title>슬기로운 반려생활</title>

<%@ include file="/WEB-INF/include/import.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-datetimepicker/2.7.1/css/bootstrap-material-datetimepicker.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

</head>
<style type="text/css">
#back-icon {
	position: absolute;
	top: 7px;
	left: 10px;
	font-size: 34px;
	color: rgba(156, 39, 176, 0.2);
}
</style>
<body>

	<div class="side_overlay">
		<div class="container">
			<div class="row">

				<div class="col-2"></div>
				<div class="col-8 area">

					<div class="card card-nav-tabs">
						<div class="card-body">
							<a href="adminDonationdetail.bit?dindex=${donate.dindex}"
								style="color: #EE82EE;"><span id="back-icon"><i
									class="fas fa-angle-double-left"></i></span></a> <br>
							<div class="col-12 title-area">
								<h3 style="text-align: center">
									후원글 수정페이지<i class="fas fa-paw"></i>
								</h3>
							</div>
							<br>
							<form id="joinForm" action="adminDonationupdate.bit"
								method="post" enctype="multipart/form-data">
								<div id="joinForm-wrapper">

									<div class="form-group bmd-form-group">
										<label for="bmd-label-static">글번호</label> <input type="text"
											name="dindex" class="form-control" value="${donate.dindex}"
											readonly>
									</div>
									<div class="form-group bmd-form-group">
										<label for="bmd-label-static">제목</label> <input type="text"
											name="title" class="form-control" value="${donate.title}">
									</div>
									<div class="form-group bmd-form-group">
										<label for="bmd-label-static">작성자</label> <input type="text"
											class="form-control" placeholder="관리자" readonly>
									</div>
									<div class="form-group bmd-form-group">
										<label for="bmd-label-static">후원이 필요한 아이</label> <input
											type="text" name="dobject" class="form-control"
											value="${donate.dobject}">
									</div>
									<div class="form-group bmd-form-group">
										<label for="bmd-label-static">후원 등록 시간</label>
										<fmt:parseDate var="parseTime" value="${donate.rtime}"
											pattern="yyyy-MM-dd HH:mm:ss" />
										<fmt:formatDate var="rtime" value="${parseTime}"
											pattern="yyyy-MM-dd HH:mm:ss" />
										<input type="text" name="rtime" class="form-control"
											value="${rtime}" readonly>
									</div>
									<div class="form-group bmd-form-group">
										<label for="bmd-label-static">후원 완료 시간</label>
										<fmt:parseDate var="parseTime" value="${donate.ctime}"
											pattern="yyyy-MM-dd HH:mm:ss" />
										<fmt:formatDate var="ctime" value="${parseTime}"
											pattern="yyyy-MM-dd HH:mm:ss" />
										<input type="text" name="ctime" id="ctime"
											placeholder="${ctime}" value="" class="form-control">
									</div>
									<div class="form-group bmd-form-group">
										<label for="bmd-label-static">목표모금액</label> <input type="text"
											name="gcoll" class="form-control" value="${donate.gcoll}">
									</div>
									<div class="form-group bmd-form-group">
										<label for="bmd-label-static">현재모금액</label> <input type="text"
											name="ccoll" class="form-control" value="${donate.ccoll}"
											readonly>
									</div>

									<textarea id="content" name="content" class="form-control"
										rows="10"> ${donate.content}</textarea>


									<div class="card-body" style="text-align: center;">
										<button type="submit" class="btn btn-primary">
											<b>글 수정 완료</b>
										</button>
										<button type="reset" class="btn btn-outline-primary"
											onclick="location.href='adminDonationdetail.bit?dindex=${donate.dindex}'">글
											수정 취소</button>
									</div>
									<br>
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

</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	//ckeditor
	$(function() {
		CKEDITOR
				.replace(
						'content',
						{
							filebrowserUploadUrl : '${pageContext.request.contextPath }/fileupload.bit',
							uploadUrl : '${pageContext.request.contextPath }/fileupload.bit'
						});

		//datetimepicker
		$("#ctime").bootstrapMaterialDatePicker({
			format : 'YYYY-MM-DD HH:mm',
			lang : 'ko',
			okText : '확인',
			cancelText : '취소'
		});
	});
</script>
</html>

