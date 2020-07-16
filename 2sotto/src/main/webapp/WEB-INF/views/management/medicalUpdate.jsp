<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>

<title>슬기로운 반려생활</title>

<%@ include file="/WEB-INF/include/import.jsp"%>


</head>

<body>

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>


	<div class="side_overlay">
		<div class="container">



			
			<div class="card card-nav-tabs">
				<div class="card-header card-header-primary">
					<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
					<div class="nav-tabs-navigation">
						<div class="nav-tabs-wrapper">
							<ul class="nav nav-tabs" data-tabs="tabs">
								<li class="nav-item">
									<a class="nav-link active show" onclick="location.href='getMrecordList.bit'" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
										<i class="material-icons"></i>메인
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" onclick="location.href='writeMedical.bit'" data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
										<i class="material-icons"></i>병원이용기록등록
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="card-body">
				
					<div class="tab-content text-center">
	
						<!---------- 쪽지쓰기 ------------------>
						<div class="tab-pane active show" >

							<form action="editMrecord.bit" method="post">
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">병원이용 기록 등록번호</label> 
									<input type="text" class="form-control" name="mindex" value="${mrecord.mindex}" readonly> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">반려동물식별번호</label> 
									<input type="text" name="petindex" class="form-control" value="${mrecord.petindex}" readonly> 
								</div>
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">보호자</label> 
									<input type="text" name="userid" class="form-control" value="${mrecord.userid}" readonly> 
								</div>								
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">병원 방문 시간</label>
									<fmt:parseDate var="parseTime" value="${mrecord.vdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate var="vdate" value="${parseTime}" pattern="yyyy-MM-dd"/> 
									<input type="text" name="vdate" class="form-control" value="${vdate}" readonly> 
								</div>								
								
								<label for="bmd-label-static">병원 방문 목적</label> 											
								<textarea name="vreason" class="form-control"  rows="10" >${mrecord.vreason}</textarea>																
								<!-- <div id="donateColl"> -->															
								<div class="form-group bmd-form-group">
								<label for="bmd-label-static">방문명원명</label> 
								<input type="text" name="hname" class="form-control" value="${mrecord.hname}"> 
								</div>
								<div class="border-top">
									<div class="card-body" style="text-align: center;">
										<button type="submit" class="btn btn-primary"><b>글 수정 완료</b></button>
										<button type="reset" class="btn btn-primary">글 수정 취소</button>
								</div>
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
</html>

