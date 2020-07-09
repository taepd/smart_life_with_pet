<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>	

    <title>마이 페이지</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
    
</head>
<body>
    
    <%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	
	<div class="container">
		
		<h3>내 반려동물 페이지</h3>
		<p>실제로는 내 반려동물 중 하나를 클릭했을 때 도달하는 페이지</p>
	 	<button type="button" onclick="location.href='main.bit'">마이페이지 홈</button>
		<button type="button" onclick="location.href='editPet.bit'">내 반려동물 정보 수정</button>
		<form  action="editPet.bit" enctype="multipart/form-data" method="post" style="text-align: center;">
			<div>
				이메일<input type="text" name="petname" value="${pet.petname}" readonly>
			</div>
			<div>
				핸드폰 번호<input type="text" name="mcategory" value="${pet.mcategory}" >
			</div>
			<div>
				닉네임<input type="text" name="scategory" value="${pet.scategory}" >
				<button>중복 확인</button>
			</div>
			<div>
				주소<input type="text" name="loc" value="${pet.petindex}" >
				<button>주소 검색</button>
			</div>		
			
			<div class="card-body" style="text-align: center;">
				<button type="submit" class="btn btn-primary" style="padding: 10px 20px"><b>전송</b></button>
				<button type="reset" class="btn" style="padding: 10px 20px">취소</button>
			</div>		
		</form>
		
	</div>




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
								<a class="nav-link active show" href="#myPetPage" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
									<i class="material-icons">email</i> 내 반려동물 페이지</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				
				<div class="card-body">
					<div class="tab-content text-center">
						<div class="tab-pane active show" id="main">
							<!---------- 마이 페이지 ------------------>

							<div class="table-responsive">
								<table class="table">
									<thead class="text">
										
										<tr>
											<th rowspan="5" style="text-align: center">
												<div class="card" style="width: 20rem;">
													<img class="card-img-top" src="${pageContext.request.contextPath}/images/sample_dog.jpg" rel="nofollow" alt="card image">
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
							</div>
							</div>
							
							</div>
							</div>
							<%@ include file="/WEB-INF/include/footer.jsp"%>
	
</body>
</html>