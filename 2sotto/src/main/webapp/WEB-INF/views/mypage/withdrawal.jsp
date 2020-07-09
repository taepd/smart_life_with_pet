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
								<li class="nav-item"><a class="nav-link" onclick="location.href='edit.bit'" data-toggle="tab"> <!-- <i class="material-icons">chat</i> -->
								 	<i class="material-icons">email</i> 내 정보 수정</a>
								</li>
								<li class="nav-item"><a class="nav-link" onclick="location.href='editPwd.bit'" data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
									<i class="material-icons">email</i> 비밀번호 변경</a>
								</li>
								<li class="nav-item"><a class="nav-link active show" onclick="location.href='withdrawal.bit'" data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
									<i class="material-icons">email</i> 회원 탈퇴</a>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="card-body">
					<div class="tab-content text-center">
					
						<!-------------- 회원탈퇴 ---------------->
						<div class="tab-pane active show" id="">
		
						<div class="table-responsive">
								<table class="table">
									<thead class="text">
										<tr>
											<td rowspan="5" style="text-align: center">
												<div class="card" style="width: 20rem;">
													<img class="card-img-top" src="${pageContext.request.contextPath}/images/sample_dog.jpg" rel="nofollow" alt="card image">
												</div>
											</td>
											<td>	
												<div class="card" style="width: 20rem;">
													<img class="card-img-top" src="${pageContext.request.contextPath}/images/sample_dog.jpg" rel="nofollow" alt="card image">
												</div>
											</td>
											<td>	
												<div class="card" style="width: 20rem;">
													<img class="card-img-top" src="${pageContext.request.contextPath}/images/sample_dog.jpg" rel="nofollow" alt="card image">
												</div>
											</td>
											
										</tr>
										<tr align="center" valign="middle">
										<td>
										<c:if test="${currentPost.user_id == user_id }">
										<form action="withdrawal.bit" method="post">
												<a class="btn btn btn-round" href="../index.jsp"> &nbsp;메인화면&nbsp; </a>
												<a class="btn btn-rose btn-round" href="javascript:history.back();">
													&nbsp;이전&nbsp; </a>
												<button type="submit" id="delete" class="btn btn-white btn-round"> 
												&nbsp;회원탈퇴&nbsp; 
												</button>
													</form>
											</c:if>
										</td>

									</tr>
									</thead>
								</table>
							</div>

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

	<script type="text/javascript">
		var validate = new Array;
		$(function() {

			//password
			$('#pwd')
					.keyup(
							function() {
								let pwd = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{8,20}$/;
								if (!pwd.test($(this).val())) {
									$('.tdpw')
											.html(
													'<b style="color:red">8~20자 사이에 적어도 하나의 영어대문자,숫자, 특수문자가 포함되어야 합니다.</b>');
									validate[0] = false;
								} else {
									$('.tdpw').html('<b>적합한 패스워드입니다.</b>');
									validate[0] = true;
								}
								console.log(validate[0]);
							});
			//password check
			$('#pwdCheck, #pwd').keyup(function() {
				if ($('#pwd').val() != $('#pwdCheck').val()) {
					$('.tdpwch').html('<b style="color:red">비밀번호가 다릅니다.</b>');
					validate[1] = false;
				} else {
					$('.tdpwch').html('<b>비밀번호가 일치합니다.</b>');
					validate[1] = true;
				}
				console.log(validate[1]);
			});

			$('input').focus(function() {
				$(this).css('background-color', "gold");
			});
			$('input').blur(function() {
				$(this).css('background-color', "white");
			});
			//입력 다 했는지 검증
			$('input:not([type=file])').prop("required", true);
			//$('#id').attr("required","required");

			//submit 클릭시 올바르지 않은 입력 검증
			$('button:submit').click(function() {
				for (let i = 0; i < validate.length; i++) {
					if (validate[i] == false) {
						alert("올바르지 않은 입력이 있습니다.");
						console.log(i);
						switch (i) {
						case 0:
							$('#pwd').focus();
							return false;
						case 1:
							$('#pwdCheck').focus();
							return false;
						}
					}
				}
			});
		});
		// 탈퇴 전 확인 창 띄우기
		$('#delete').click(function(){
			let con = confirm("정말로 탈퇴하시겠습니까?");
			if(con){
				return location.href='delete.bit?userid=${userid.userid}';
			}else{
				return;
			}
		});
		
	</script>


</body>
</html>