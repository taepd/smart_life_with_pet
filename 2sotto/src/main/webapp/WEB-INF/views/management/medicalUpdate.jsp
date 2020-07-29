<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>

<title>슬기로운 반려생활</title>

<%@ include file="/WEB-INF/include/import.jsp"%>
<!-- 타임피커 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-datetimepicker/2.7.1/css/bootstrap-material-datetimepicker.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

</head>
<style>
		@font-face {
			font-family: 'netmarbleM';
			src: url('../assets/fonts/netmarbleM.ttf') format('truetype'); 
		}


		h1, h2, h3 {
			/* font-family : 'netmarbleM', sans-serif; */
			font-family: 'Noto Sans KR', sans-serif;
			/* color: #9c27b0; */
		}
		
		#joinForm-wrapper {
			display: inline-block;
			width: 428px;
		}

		#joinForm {
			margin-bottom: 0;
			text-align: center;
			margin-top: 25px;
		}
	
	</style>
<body>

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>


	
		<div class="container">
		<div class="side_overlay">
			<div class="row">
				
				<div class="col-2"></div>
				<div class="col-8 area">
			
					<div class="card card-nav-tabs">				
					<div class="card-body">
					<br>
					<div class="col-12 title-area">
					<h3 style=" text-align: center">병원이용이력 수정페이지<i class="fas fa-paw"></i></h3>
					</div>
					<br>
					<form id="joinForm" action="editMrecord.bit" method="post" enctype="multipart/form-data">
					<div id="joinForm-wrapper">
					
								<!-- <div class="form-group has-default bmd-form-group">
									<label for="bmd-label-static">병원이용 기록 등록번호</label> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">반려동물식별번호</label> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">보호자</label> 
								</div> -->
									<input type="hidden" class="form-control" name="mindex" value="${mrecord.mindex}" readonly> 
									<%-- <input type="hidden" name="petindex" class="form-control" value="${mrecord.petindex}" readonly> --%> 
									<input type="hidden" name="userid" class="form-control" value="${mrecord.userid}" readonly> 
		
								<div class="form-group bmd-form-group text-left">
									<label for="bmd-label-static" style="margin-bottom:15px" for="petname">나의 반려동물</label>	
										<select class="custom-select" name="petindex"> <!-- ex) ?mcategory=dog -->
											<c:forEach var="petName" items="${petNameList}">
												<c:choose>
													<c:when test="${mrecord.petname == petName.petname}">
														<option  value="${petName.petindex}" selected>${petName.petname}</option>							
													</c:when>
													<c:otherwise>
													<option  value="${petName.petindex}">${petName.petname}</option>
													</c:otherwise>	
												</c:choose>
											</c:forEach>
										</select>		
								</div>
																	
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">병원 방문 시간</label>
									<fmt:parseDate var="parseTime" value="${mrecord.vdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate var="vdate" value="${parseTime}" pattern="yyyy-MM-dd"/> 
									<input type="text" id="vdate" name="vdate" class="form-control" value="${vdate}"> 
								</div>								
								<div class="form-group bmd-form-group">
								<label for="bmd-label-static" style="text-align: left;" >병원 방문 목적</label> 											
								<input type="text" name="vreason" class="form-control" value="${mrecord.vreason}">
								</div>	
																							
								<!-- <div id="donateColl"> -->															
								<div class="form-group bmd-form-group">
								<label for="bmd-label-static">방문명원명</label> 
								<input type="text" name="hname" class="form-control" value="${mrecord.hname}"> 
								</div>								
								
								
									<div class="card-body" style="text-align: center;">
										<button type="submit" class="btn btn-primary"><b>수정 완료</b></button>
										<button type="reset" class="btn btn-outline-primary">취소</button>
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
	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>
<script type="text/javascript">
$(function() {
	/* 타임피커  */
	//datetimepicker
	$("#vdate").bootstrapMaterialDatePicker({
		format: 'YYYY-MM-DD HH:mm',
		lang: 'ko',
		okText: '확인',
		cancelText: '취소'
	});

});


</script>
</html>

