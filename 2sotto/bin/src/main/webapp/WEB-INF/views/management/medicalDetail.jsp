<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<html>
<head>

<title>슬기로운 반려생활</title>

<%@ include file="/WEB-INF/include/import.jsp"%>
	<style>
		
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
	

</head>

<body>

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>


	
		<div class="container">
			<div class="side_overlay">
				<div class="row">
				<div class="col-12 title-area">
					<h3 style=" text-align: center">병원이용이력 상세페이지 <i class="fas fa-paw"></i></h3>
				</div>
				<div class="col-2"></div>
				<div class="col-8 area">

<!-- 			<button class="btn btn-primary btn-round"
				onclick="location.href='main.bit'">후원글</button>
			<form method="post" action="kakaoPay.bit">
    		<button class="btn btn-primary btn-round" id="kakaoPay">카카오페이로 결제하기</button>
    		</form>  -->


			
			<div class="card card-nav-tabs">
				

				<div class="card-body">
				
					<div class="tab-content text-center">
			
						<!---------- 디테일------------------>
						<!-- <div class="tab-pane active show" > -->
						<div id="joinForm">
							<div id="joinForm-wrapper">
								<div class="form-group has-default bmd-form-group">
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
									<label for="bmd-label-static" style="text-align: left;" for="petname">나의 반려동물</label>	
										<select class="custom-select" name="petindex" disabled> <!-- ex) ?mcategory=dog -->
											<c:forEach var="petName" items="${petNameList}">
											<option value="${petName.petindex}">${petName.petname}</option>							
											</c:forEach>
										</select>		
								</div>
																	
								<div class="form-group bmd-form-group">
									<label for="bmd-label-static">병원 방문 시간</label>
									<fmt:parseDate var="parseTime" value="${mrecord.vdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate var="vdate" value="${parseTime}" pattern="yyyy-MM-dd"/> 
									<input type="text" name="vdate" class="form-control" value="${vdate}" readonly> 
								</div>								
								<div class="form-group bmd-form-group">
								<label for="bmd-label-static" style="text-align: left;" >병원 방문 목적</label> 											
								<input type="text" name="vreason" class="form-control" value="${mrecord.vreason}" readonly >
								</div>	
																							
								<!-- <div id="donateColl"> -->															
								<div class="form-group bmd-form-group">
								<label for="bmd-label-static">방문명원명</label> 
								<input type="text" name="hname" class="form-control" value="${mrecord.hname}" readonly> 
								</div>								
								<div >
									<div class="card-body" style="text-align: center;">
										<button type="button" class="btn btn-primary" onclick="location.href='editMrecord.bit?mindex=${mrecord.mindex}'">수정</button>
										<button type="button" id="delete" class="btn btn-outline-primary" onclick="location.href='deleteMrecord.bit?mindex=${mrecord.mindex}'">삭제</button>
									</div> 
							
							</div>
						



						</div>
						
						

					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
	</div>
	</div>
	</div>
	
		<!-- container end -->
		
		



	
	<!-- side_overlay end -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>
<script type="text/javascript">
//삭제 전 확인 창 띄우기
$('#delete').click(function(){
	let con = confirm("정말로 삭제하시겠습니까?");
	if(con){
		return location.href='deleteMrecord.bit?mindex=${mrecord.mindex}';
	}else{
		return;
	}
});
	
}


</script>
</html>


