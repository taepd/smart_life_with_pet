<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>

<title>마이 페이지</title>

<%@ include file="/WEB-INF/include/import.jsp"%>

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

</head>
<body>

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>

	<div class="container">

		<h3>내 비밀번호 변경</h3>
		<p></p>
		<button type="button" onclick="location.href='main.bit'">마이페이지
			홈</button>


		<div class="card" style="width: 60%; margin: 0 auto;">
			<form action="editPwd.bit" method="post">
				<div class="card-body">
					<div class="form-group row">
						<div class="col-sm-12">
							<div class="row row-space">
								<div class="col-10">
									<div class="input-group">
										<input class="input--style-4" type="password" maxlength="20"
											id="crntPwd" name="crntPwd"
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
											maxlength="20" id="pwdCheck" name="pwdCheck" title="패스워드 확인"
											placeholder="새 비밀번호 확인">
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
						<button type="submit" class="btn btn-primary" style="padding: 10px 20px"><b>전송</b></button>
						<button type="reset" class="btn" style="padding: 10px 20px">취소</button>
					</div>
				</div>
				
			</form>

		</div>
	</div>
</body>
</html>