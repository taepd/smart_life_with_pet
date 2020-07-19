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
						
						<!---------- 내 반려동물 수정 페이지  ------------------>
						<div class="tab-pane active show" id="">
							
							
								<div class="table-responsive">
								<table class="table">
									<thead class="text">
										
										<tr>
											<th rowspan="5" style="text-align: center">
												<div class="card" style="width: 20rem;">
													<img class="card-img-top" src="${pageContext.request.contextPath}/assets/images/sample_dog.jpg" rel="nofollow" alt="card image">
													<h4>인절미</h4>
												</div>
											</th>
											<td>품종</td>
											<td>시고리안</td>
										</tr>
										<tr>
											<td>털색</td>
											<td>흰색</td>
										</tr>
										<tr>
											<td>기간</td>
											<td>3년3개월</td>
										</tr>
										<tr>
											<td>몸무게</td>
											<td>5.8Kg</td>
										</tr>
										<tr>
											<td>성격</td>
											<td>사나움</td>
										</tr>
										
									</thead>
									<tr align="center" valign="middle">
										<td colspan="5"><c:if
												test="${currentPost.user_id == user_id }">
												<a class="btn btn-rose btn-round" href="">
													&nbsp;수정&nbsp; </a>
												<a id="confirmDelete" class="btn btn-white btn-round"
													href=""> &nbsp;삭제&nbsp; </a>
											</c:if></td>
									</tr>
									<tr align="center" valign="middle">
										<td colspan="5"><br> <a
											class="btn btn-block btn-gray btn-round"  href="javascript:history.back();">
												&nbsp;&nbsp;&nbsp;이전 돌아가기&nbsp;&nbsp;&nbsp; </a></td>
									</tr>
									
								</table>
							</div>
                    
                    
                    </div>

						


						

						
									<!-------------- 끝 ---------------->

					</div>
				</div>
			</div>

		</div>
		<!-- container end -->
	
	<div class="container">
		<h3>내 반려동물 수정 페이지</h3>
		<p></p>
	 	<button type="button" onclick="location.href='myPetPage.bit'">내 반려동물 홈</button>
	 	<form  action="editPet.bit" enctype="multipart/form-data" method="post" style="text-align: center;">
			<div>
				이름<input type="text" name="petname" value="${pet.petname}" readonly>
			</div>
			<div>
				품종<input type="text" name="scategory" value="${pet.scategory}">
			</div>
			<div>
				나이<input type="text" name="age" value="${pet.age}" >
			</div>
			<div>
				크기<input type="text" name="size" value="${pet.size}" >
			</div>	
			<div>
				몸무게<input type="text" name="weight" value="${pet.weight}" >
			</div>	
			<div>
				털길이<input type="text" name="hlength" value="${pet.hlength}" >
			</div>	
			<div>
				중성화 여부<input type="text" name="nstate" value="${pet.nstate}" >
			</div>		
			<div>
				이미지<input type="text" name="nstate" value="${pet.petimg}" >
			</div>		
			<div>
				메모<input type="text" name="nstate" value="${pet.memo}" >
			</div>		
			<div class="card-body" style="text-align: center;">
				<button type="submit" class="btn btn-primary" style="padding: 10px 20px"><b>전송</b></button>
				<button type="reset" class="btn" style="padding: 10px 20px">취소</button>
			</div>		
		</form>
    
	</div>
	<!-- side_overlay end -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>

	


</body>
</html>