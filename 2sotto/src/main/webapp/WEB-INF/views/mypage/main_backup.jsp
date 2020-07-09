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
								<a class="nav-link active show" href="#main" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
									<i class="material-icons">email</i> 마이 페이지</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#myPetPage" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
									<i class="material-icons">email</i> 내 반려동물 페이지</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#edit" data-toggle="tab"> <!-- <i class="material-icons">chat</i> -->
								 	<i class="material-icons">email</i> 내 정보 수정</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#editPwd" data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
									<i class="material-icons">email</i> 비밀번호 변경</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#withdrawal" data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
									<i class="material-icons">email</i> 회원 탈퇴</a>
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
													<img class="card-img-top" src="${pageContext.request.contextPath}/images/bo1.png" rel="nofollow" alt="card image">
													<h4>보캐슬</h4>
												</div>
											</th>
											<td>보유 포인트</td>
											<td>500p</td>
										</tr>
										<tr>
											<td>이메일</td>
											<td>kbs@mbc.sbs</td>
										</tr>
										<tr>
											<td>회원 지역</td>
											<td>안드로메다</td>
										</tr>
										<tr>
											<td>가입일시</td>
											<td>2020.7.1</td>
										</tr>
										<tr>
											<td>등록 반려동물 수</td>
											<td>1댕이 1냥이</td>
										</tr>
									</thead>
								</table>
							</div>


						</div>


						<!---------- 내 반려동물 페이지  ------------------>
						<div class="tab-pane" id="myPetPage">


							<div class="row">
                      <div class="card col-4" style="width: 20rem;">
						  <a href="myPetPage.bit"><img class="card-img-top" src="${pageContext.request.contextPath}/images/sample_dog.jpg" rel="nofollow" alt="card image"></a>
						  <div class="card-body">
							<h4>동물 이름</h4>
						    <p class="card-text">
						    	동물 프로필
						    </p>
						    <span class=""><i class="fas fa-times"></i></span>
						  </div>
					</div>
					
					<div class="card col-4" style="width: 20rem;">
						  <img class="card-img-top" src="${pageContext.request.contextPath}/images/sample_cat.jpg" rel="nofollow" alt="card image">
						  <div class="card-body">
							<h4>동물 이름</h4>
						    <p class="card-text">
						    	동물 프로필
						    </p>
						    <span class=""><i class="fas fa-times"></i></span>
						  </div>
					</div>
					
					<div class="card col-4" style="width: 20rem;">
						  <img class="card-img-top" src="${pageContext.request.contextPath}/images/sample_boon.jpg" rel="nofollow" alt="card image">
						  <div class="card-body">
							<h4>동물 이름</h4>
						    <p class="card-text">
						    	동물 프로필
						    </p>
						    <span class=""><i class="fas fa-times"></i></span>
						  </div>
					</div>
                    </div>
                    
                    
                    </div>

						<!---------- 내정보 수정------------------>
						<div class="tab-pane" id="edit">

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


						<!-------------- 비밀번호 변경 ---------------->
						<div class="tab-pane" id="editPwd">

							
								<form action="editPwd.bit" method="post">
									<div class="card-body">
										<div class="form-group row">
											<div class="col-sm-12">
												<div class="row row-space">
													<div class="col-10">
														<div class="input-group">
															<input class="input--style-4" type="password"
																maxlength="20" id="crntPwd" name="crntPwd"
																title="8~20자 사이에 적어도 하나의 영어대문자,숫자, 특수문자가 포함되어야 합니다."
																placeholder="현재 비밀번호 입력">
														</div>
													</div>
													<div class="col-2"></div>
												</div>
											</div>
											<div class="col-sm-12" align="left"></div>
										</div>
										<div class="form-group row">
											<div class="col-sm-12">
												<div class="row row-space">
													<div class="col-10">
														<div class="input-group">
															<input class="input--style-4" type="password"
																maxlength="20" id="pwd" name="pwd" title="패스워드 확인"
																placeholder="새 비밀번호">
														</div>
													</div>
													<div class="col-2"></div>
												</div>
											</div>
											<div class="col-sm-12 tdpw" align="left"></div>
										</div>
										<div class="form-group row">
											<div class="col-sm-12">
												<div class="row row-space">
													<div class="col-10">
														<div class="input-group">
															<input class="input--style-4" type="password"
																maxlength="20" id="pwdCheck" name="pwdCheck"
																title="패스워드 확인" placeholder="새 비밀번호 확인">
														</div>
													</div>
													<div class="col-2"></div>
												</div>
											</div>
											<div class="col-sm-12 tdpwch" align="left"></div>
										</div>
									</div>
									<div class="border-top">
										<div class="card-body" style="text-align: center;">
											<button type="submit" class="btn btn-primary"
												style="padding: 10px 20px">
												<b>전송</b>
											</button>
											<button type="reset" class="btn" style="padding: 10px 20px">취소</button>
										</div>
									</div>

								</form>

							



						</div>

						<!-------------- 회원탈퇴 ---------------->
						<div class="tab-pane" id="withdrawal">
						
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
												<button type="submit" class="btn btn-white btn-round"> 
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
	</script>


</body>
</html>