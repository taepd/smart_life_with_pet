<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>

<title>마이 페이지</title>

<%@ include file="/WEB-INF/include/import.jsp"%>

</head>
<body>
  
    <%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	
	<div class="side_overlay">
		<div class="container">


			<button class="btn btn-primary btn-round" onclick="location.href='main.bit'">마이 페이지</button>



			<div class="card card-nav-tabs">
				<div class="card-header card-header-primary">
					<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
					<div class="nav-tabs-navigation">
						<div class="nav-tabs-wrapper">
							<ul class="nav nav-tabs" data-tabs="tabs">
								<li class="nav-item">
								<a class="nav-link " onclick="location.href='main.bit'" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
									<i class="material-icons">email</i> 마이 페이지</a>
								</li>
								<li class="nav-item"><a class="nav-link active show" onclick="location.href='myPetPage.bit'" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
									<i class="material-icons">email</i> 내 반려동물 페이지</a>
								</li>
								<li class="nav-item"><a class="nav-link" onclick="location.href='edit.bit'" data-toggle="tab"> <!-- <i class="material-icons">chat</i> -->
								 	<i class="material-icons">email</i> 내 정보 수정</a>
								</li>
								<li class="nav-item"><a class="nav-link" onclick="location.href='editPwd.bit'" data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
									<i class="material-icons">email</i> 비밀번호 변경</a>
								</li>
								<li class="nav-item"><a class="nav-link" onclick="location.href='withdrawal.bit'" data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
									<i class="material-icons">email</i> 회원 탈퇴</a>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="card-body">
					<div class="tab-content text-center">
<div class="row">
                    	<c:forEach var="petInfo" items="${petList}">
							<div class="card col-4" style="width: 20rem;">
								<img class="card-img-top" src="${pageContext.request.contextPath}/assets/images/${petInfo.petimg}" style="height:250px"rel="nofollow" alt="card image">
								  <div class="card-body">
									<h4>${petInfo.petname}</h4>
								    <p class="card-text" id="petInfo">
								    	<fmt:parseNumber var="age" value="${petInfo.age/12}" integerOnly="true"/>
								    	${petInfo.scaname} | 
								    	${petInfo.size == 'small' ? '소형':petInfo.size == 'medium'? '중형':'대형'}${petInfo.mcategory == '1' ? '견':'묘'} | 
								    	${petInfo.weight}kg | 
								    	<br>
								    	${age}년 ${petInfo.age%12}개월 | 
								    	${petInfo.sex == 'female' ? '암컷':'수컷' } | 
								    	${petInfo.nstate == 'n' ? '중성화X':'중성화O'} |
								    	<br>
								    	${petInfo.memo}
								    </p>
								    <div>

										<!-- 나중에 아이콘으로 바꾸기~~~ -->
										
										<!-- <a><span class="icons"><i class="fas fa-pen"></i></span></a> -->
								    	<a href="${pageContext.request.contextPath}/management/edit.bit?petindex=${petInfo.petindex}">수정</a>
								    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								    	<!-- <span class="icons"><i class="fas fa-times"></i></span> 삭제 아이콘...-->
								    	<a href="${pageContext.request.contextPath}/management/delete.bit?petindex=${petInfo.petindex}">삭제</a>
								    </div>
								  </div>
							</div>
						</c:forEach> 
                </div>

					</div>
				</div>
							
			</div>
		</div>
	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>
</html>