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
								<li class="nav-item"><a class="nav-link" onclick="location.href='myPetPage.bit'" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
									<i class="material-icons">email</i> 내 반려동물 페이지</a>
								</li>
								<li class="nav-item"><a class="nav-link active show" onclick="location.href='edit.bit'" data-toggle="tab"> <!-- <i class="material-icons">chat</i> -->
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
					
						<!---------- 내정보 수정------------------>
						<div class="tab-pane active show" id="">
				
							<form action="edit.bit" enctype="multipart/form-data"
								method="post" style="text-align: center;">
								<div>
									이메일<input type="text" name="userid" value="${user.userid}"
										readonly>
								</div>
								<div>
									핸드폰 번호<input type="text" name="cpnumber"
										value="${user.cpnumber}">
								</div>
								<div>
									<input type="text" name="authNumber" placeholder="인증번호">
									<button>인증번호 전송</button>
								</div>
								<div>
									닉네임<input type="text" name="nick" value="${user.nick}">
									<button>중복 확인</button>
								</div>
								<div>
									주소<input type="text" name="loc" value="${user.loc}">
									<button>주소 검색</button>
								</div>

								<div class="card-body" style="text-align: center;">
									<button type="submit" class="btn btn-primary"
										style="padding: 10px 20px">
										<b>전송</b>
									</button>
									<button type="reset" class="btn" style="padding: 10px 20px">취소</button>
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