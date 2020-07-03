<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>	 
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>회원 가입</title>
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="assets/libs/select2/dist/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="assets/libs/jquery-minicolors/jquery.minicolors.css">
    <link rel="stylesheet" type="text/css" href="assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" type="text/css" href="assets/libs/quill/dist/quill.snow.css">
    <link href="dist/css/style.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <title>홈_슬기로운 반려생활</title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14e1cd5829baabce1e0239e9778eb76a&libraries=services"></script>
	<!-- 카카오 주소 api 호출 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>



<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	

<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">




    <title>회원 가입</title>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14e1cd5829baabce1e0239e9778eb76a&libraries=services"></script>
	<!-- 카카오 주소 api 호출 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}

/*------------------------------------------------------------------
[ Input ]*/

/* .wrap-input100 { */
/* 	display: -webkit-box; */
/* 	display: -webkit-flex; */
/* 	display: -moz-box; */
/* 	display: -ms-flexbox; */
/* 	display: flex; */
/* 	flex-wrap: wrap; */
/* 	align-items: flex-end; */
/* 	width: 100%; */
/* 	/*   height: 80px; */
/* 	padding: 100px; */
/* 	position: relative; */
/* 	border: 1px solid #e6e6e6; */
/* 	border-radius: 10px; */
/* 	margin-bottom: 10px; */
/* } */
.wrap-input100 {
	width: 100%;
	/*   height: 80px; */
	padding: 100px;
	position: relative;
	border: 1px solid #e6e6e6;
	border-radius: 10px;
	margin-bottom: 10px;
	text-align: center;
}

input {
	outline: none;
	margin: 0;
	border: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	width: 100%;
	font-size: 14px;
	font-family: inherit;
}

.input--style-4 {
	line-height: 50px;
	background: #fafafa;
	-webkit-box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
	-moz-box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
	box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	padding: 0 20px;
	font-size: 16px;
	color: #666;
	-webkit-transition: all 0.4s ease;
	-o-transition: all 0.4s ease;
	-moz-transition: all 0.4s ease;
	transition: all 0.4s ease;
}

.input--style-4::-webkit-input-placeholder {
	/* WebKit, Blink, Edge */
	color: #666;
}

.input--style-4:-moz-placeholder {
	/* Mozilla Firefox 4 to 18 */
	color: #666;
	opacity: 1;
}

.input--style-4::-moz-placeholder {
	/* Mozilla Firefox 19+ */
	color: #666;
	opacity: 1;
}

.input--style-4:-ms-input-placeholder {
	/* Internet Explorer 10-11 */
	color: #666;
}

.input--style-4:-ms-input-placeholder {
	/* Microsoft Edge */
	color: #666;
}

.label {
	font-size: 16px;
	color: #555;
	text-transform: capitalize;
	display: block;
	margin-bottom: 5px;
}

.input-group {
	position: relative;
	margin-bottom: 22px;
}

.input-group-icon {
	position: relative;
}

.input-icon {
	position: absolute;
	font-size: 18px;
	color: #999;
	right: 18px;
	top: 50%;
	-webkit-transform: translateY(-50%);
	-moz-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	-o-transform: translateY(-50%);
	transform: translateY(-50%);
	cursor: pointer;
}

/* ==========================================================================
   #GRID
   ========================================================================== */
.row {
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-flex-wrap: wrap;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
}

.row-space {
	-webkit-box-pack: justify;
	-webkit-justify-content: space-between;
	-moz-box-pack: justify;
	-ms-flex-pack: justify;
	justify-content: space-between;
}

.col-2 {
	width: -webkit-calc(( 100% - 30px)/2);
	width: -moz-calc(( 100% - 30px)/2);
	width: calc(( 100% - 30px)/2);
}

@media ( max-width : 767px) {
	.col-2 {
		width: 100%;
	}
}
</style>	

  <script type="text/javascript">
	var validate = new Array;
	$(function() {
		//id검증(이메일 형식)
		$('#userid')
				.keyup(
						function() {
							let email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
							if (!email.test($('#userid').val())) {
								$('.tdemail')
										.html(
												'<b style="color:red">적합하지 않은 이메일 형식입니다.</b>');
								validate[0] = false;
							} else {
								$('.tdemail').html('<b>적합한 이메일입니다.</b>');
								validate[0] = true;
							}
							console.log(validate[0]);
						});

		//password
		$('#pwd')
				.keyup(
						function() {
							let pwd = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{8,20}$/;
							if (!pwd.test($(this).val())) {
								$('.tdpw')
										.html(
												'<b style="color:red">8~20자 사이에 적어도 하나의 영어대문자,숫자, 특수문자가 포함되어야 합니다.</b>');
								validate[1] = false;
							} else {
								$('.tdpw').html('<b>적합한 패스워드입니다.</b>');
								validate[1] = true;
							}
							console.log(validate[1]);
						});
		//password check
		$('#pwdCheck, #pwd').keyup(function() {
			if ($('#pwd').val() != $('#pwdCheck').val()) {
				$('.tdpwch').html('<b style="color:red">비밀번호가 다릅니다.</b>');
				validate[2] = false;
			} else {
				$('.tdpwch').html('<b>비밀번호가 일치합니다.</b>');
				validate[2] = true;
			}
			console.log(validate[2]);
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
						$('#userid').focus();
						return false;
					case 1:
						$('#pwd').focus();
						return false;
					case 2:
						$('#pwdCheck').focus();
						return false;
					}
				}
			}
			if ($('#userid').attr("check_result") == "fail"){
				  alert("아이디 중복확인을 해주시기 바랍니다.");
				  $('#userid').focus();
				    return false;
			}			
		});			
	});
</script>  
<%@ include file="/WEB-INF/include/import.jsp"%>
    
</head>

<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				location.href = "/";
			})
			
			$("#submit").on("click", function(){
				if($("#userid").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userid").focus();
					return false;
				}
				if($("#pwd").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#pwd").focus();
					return false;
				}
				if($("#nick").val()==""){
					alert("성명을 입력해주세요.");
					$("#nick").focus();
					return false;
				}
				if($("#cpnumber").val()==""){
					alert("휴대전화 번호를 입력해주세요.");
					$("#cpnumber").focus();
					return false;
				}
				var idChkVal = $("#idCheck").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
			});
		})
		
		function fn_idChk(){
			$.ajax({
				url : "idCheck.bit",
				type : "post",
				dataType : "json",
				data : { userid : $("#userid").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idCheck").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
	</script>
	<body>
	
	<div class="joinForm-wrapper container col-md-8">
	<section class="sc-welcome">
		<p class="welcomeEE">WELCOME TO sotto!</p>
		<p class="subTitle">Community sotto에 오신것을 환영합니다.<br>
			회원가입하신 후 sotto의 다양한 서비스를 이용해보세요.</p>
	</section>
	
	<section class="sc-agreement">
		<div class="agreement-wrap">
		
			<h1 class="sc-title">약관동의</h1>
			
			<div id="ermsOfuse" class="agree_content">
				<p>
					1조 (목적 등)<br> <br> 1. 이 서비스 약관은 회원이 ㈜TT(이하 ""회사"")에서 제공하는
					인터넷 사이트 Community sotto(www.sotto.com) 서비스(이하 ""서비스"")를 이용함에 있어 회사와 회원
					간의 권리, 의무 및 책임사항 등을 규정함을 목적으로 합니다.<br> 2. 회원이 되고자 하는 이용자가 회사가
					정한 소정의 절차를 거쳐서 ""동의"" 버튼을 누르면 본 약관에 동의하는 것으로 간주합니다. 본 약관에 정하는 이외의
					회사와 회원의 권리, 의무 및 책임사항에 관해서는 전기통신사업법 기타 대한민국의 관련 법령과 상관습에 의합니다.<br>
					<br> 제2조 (회원의 정의)<br> <br> 회원이란 회사가 제공하는 서비스에 접속하여 본
					약관에 따라 회원으로 가입하여 서비스를 제공받는 자를 말합니다.<br> <br> 제3조 (서비스 이용
					계약)<br> <br> 1. 회원 가입을 희망하는 이용자는 회사가 정한 가입 양식에 따라 회원정보를
					기입하고 ""동의"" 버튼을 누르는 방법으로 회원 가입을 신청합니다.<br> 2. 회사는 제1항과 같이 회원으로
					가입을 신청한 자가 다음 각 호에 해당하지 않는 한 신청한 자를 회원으로 등록합니다.<br> - 등록 내용에
					허위, 기재누락, 오기가 있는 경우<br> - 제6조 제2항에 해당하는 회원 자격 제한 및 정지, 상실을 한
					경험이 있었던 경우<br> - 기타 회원으로 등록하는 것이 회사의 서비스 운영 및 기술상 현저히 지장이 있다고
					판단되는 경우<br> <br> 3. 회원가입계약의 성립시기는 회사의 승낙이 가입신청자에게 도달한
					시점으로 합니다.<br> <br> 4. 회원은 제1항의 회원정보 기재 내용에 변경이 발생한 경우, 즉시
					변경사항을 정정하여 기재하여야 합니다.<br> <br> 제4조 (서비스의 제공 및 변경)<br>
					<br> 1. 회사는 회원에게 아래와 같은 서비스를 제공합니다.<br> - Community
					sotto(http://www.sotto.com) 서비스<br> - 회사가 자체 개발하거나 다른 회사와의 협력계약 등을
					통해 회원들에게 제공할 일체의 서비스<br> <br> 2. ""서비스제공자""는 그 변경될 서비스의
					내용 및 제공일자를 제7조 제2항에서 정한 방법으로 이용자에게 통지하고, 제1항에 정한 서비스를 변경하여 제공할 수
					있습니다.<br> <br> 제5조 (서비스의 중단)<br> 1. 회사는 컴퓨터 등
					정보통신설비의 보수점검/교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수
					있고, 새로운 서비스로의 교체 기타 ""서비스제공자""가 적절하다고 판단하는 사유에 기하여 현재 제공되는 서비스를 완전히
					중단할 수 있습니다.<br> 2. 제1항에 의한 서비스 중단의 경우에는 ""서비스제공자""는 제7조 제2항에서
					정한 방법으로 ""회원""에게 통지합니다. 다만, 회사가 통제할 수 없는 사유로 인한 서비스의 중단(시스템 관리자의
					고의. 중과실이 없는 시스템 장애 또는 다운 등)으로 인하여 사전 통지가 불가능한 경우에는 그러하지 아니합니다.<br>
					<br> 제6조 (회원 탈퇴 및 자격 상실 등)<br> <br> 1. 회원은 회사에 언제든지
					자신의 회원등록 정보를 말소해 줄 것(회원 탈퇴)을 요청할 수 있으며 회사는 위 요청을 받은 즉시 해당 회원의 정보
					말소를 위한 절차를 시행합니다.<br> 2. 회원이 다음 각 호의 사유에 해당하는 경우, 회사는 회원의 자격을
					적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다.<br> - 허위 내용을 등록한 경우<br> -
					다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우<br> - 서비스를
					이용하여 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br> <br> 3. 회사가
					회원의 회원자격을 상실시키기로 결정한 경우에는 회원등록 정보를 말소합니다.<br> <br> 4.
					이용자가 서비스 이용 도중 12개월 이상 로그인 기록이 없는 경우, 회사는 해당 회원의 자격을 상실시킬 수 있습니다.<br>
					<br> 제7조 (회원에 대한 통지)<br> <br> 1. 회사가 특정 회원에게 서비스에 관한
					통지를 하는 경우 회원정보에 등록된 메일주소를 사용할 수 있습니다.<br> <br> 2. 회사가
					불특정다수 회원에 대한 통지를 하는 경우 7일 이상 공지사항 게시판 혹은 관련 서비스 게시판에 게시함으로써 개별 통지에
					갈음할 수 있습니다.<br> <br> 이 약관은 2020 7월 1일부터 적용하고 이전의 모든 약관의
					내용에 우선하여 적용됩니다.
				</p>
			</div>
			<p class="agreeCheck">이용약관 동의(필수)</p>
			<input id="isAgree_01" type="checkbox" name="agreement_1"/>
			
			<div id="personalInfo" class="agree_content">
				<p>
					㈜Community sotto 회원가입 및 서비스 제공을 위한 개인정보 수집 및 이용에 관한 동의를 받고 있습니다.<br>
					<br> 1. 개인정보 수집, 이용 목적<br> <br> Community sotto는 회원관리,
					서비스 제공 등 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는
					이용되지 않으며, 이용 목적이 변경되는 경우에는 정보통신망법 제22조(개인정보의 수집ㆍ이용 동의 등)에 따라 별도의
					동의를 받는 등 필요한 조치를 이행할 것입니다.<br> <br> - 회원 가입 의사의 확인, 연령
					확인, 이용자본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를위하여 개인정보를 이용합니다.<br>
					- Community sotto 서비스 제공, 관심에 기반한 이용자간 관계의 형성, 기존 서비스 개선 등을 위하여 개인정보를
					이용합니다.<br> - 민원인의 신원확인, 민원사항 확인, 사실조사를 위한 연락, 통지, 처리 결과 통보 등의
					목적으로 개인정보를 처리합니다. 또한 범죄의 예방 및 수사를 위한 요청 시 개인정보를 처리합니다. 자살시도의 개연성이
					충분한 게시물에 대해 경찰청의 요청이 있는 경우, 자살구호 및 예방의 목적으로 게시물 작성자의 인적사항, 연락처 등의
					개인정보를 처리합니다.<br> - 법령 및 Community sotto 이용약관을 위반하는 회원에 대한 이용 제한
					조치, 부정 이용행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및
					부정거래방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록보존, 민원처리 등 이용자 보호 및 서비스 운영을
					위하여 개인정보를 이용합니다.<br> - 이벤트 정보 및 참여기회 제공 등을 위하여 개인정보를 이용합니다.<br>
					<br> 2. 수집하는 개인정보의 항목<br> <br> 회원제 서비스를 이용하기 위해
					회원가입을 할 경우, Community sotto는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다. 회원가입 시점에
					Community sotto가 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br> <br> - 개인
					회원<br> [필수항목]: 이메일, 비밀번호, 닉네임, 핸드폰 번호<br> [선택항목]: 기본정보
					프로필 사진<br> <br> 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로
					생성되어 수집될 수 있습니다.<br> - IP 주소, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록<br>
					<br> 3. 개인정보 이용기간 및 파기<br> <br> ① 이용자의 개인정보는 원칙적으로
					개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.<br> 다만, 관련 법령에 의하여 보존할 필요가
					있는 경우 아래와 같이 관련 법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.<br> <br>
					[전자상거래 등에서의 소비자보호에 관한 법률]<br> - 계약 또는 청약철회 등에 관한 기록 : 5년 보관<br>
					- 대금결제 및 재화 등의 공급에 관한 기록 : 5년 보관<br> - 소비자의 불만 또는 분쟁처리에 관한 기록
					: 3년 보관<br> <br> [통신비밀보호법]<br> - 로그인 기록 : 3개월<br>
					<br> ② 회원 탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 개인정보를 지체 없이
					파기합니다.<br> <br> 정보통신망법 제29조(개인정보의 파기)에 따라 1년 동안 서비스를 이용하지
					않은 이용자의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.<br> <br> ③ 회사는 개인정보의
					수집 및 이용목적이 달성된 개인정보는 재생이 불가능한 방법으로 파기하고 있습니다.
				</p>
			</div>
			<p class="agreeCheck">개인정보수집 및 이용에대한 안내(필수)</p>
			<input id="isAgree_02" type="checkbox" name="agreement_2"/>
			
		</div>
	</section>
		<section id="container">
			<form action="/joinForm.bit" method="post" id="regForm">
				<div class="form-group has-feedback">
					<label class="control-label" for="userid">아이디(이메일형식)</label>
					<input class="form-control" type="text" id="userid" name="userid" />
					<button class="idChk" type="button" id="idCheck" onclick="fn_idChk();" value="N">중복확인</button>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="pwd">패스워드</label>
					<input class="form-control" type="password" id="pwd" name="pwd" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="nick">닉네임</label>
					<input class="form-control" type="text" id="nick" name="nick" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cpnumber">휴대전화번호</label>
					<input class="form-control" type="text" id="cpnumber" name="cpnumber" />
				</div>
				
			</form>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="button" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
		</section>
		
	</body>
<body>
<!-- header -->
<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
<!-- header -->

<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper">
		<!--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->

		<!-- ============================================================== -->
		<!-- Bread crumb and right sidebar toggle -->
		<!-- ============================================================== -->
		<div class="page-header">
			<h1 class="logo" align="center" style="padding-bottom: 10px;">
				<a href="register.bit" style="text-decoration:none "><b>2sotto</b></a>
			</h1>
		</div>
		<br>
		<br>
		<!-- ============================================================== -->
		<!-- End Bread crumb and right sidebar toggle -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Container fluid  -->
		<!-- ============================================================== -->
		<div class="container-fluid">
			<!-- ============================================================== -->
			<!-- Start Page Content -->
			<!-- ============================================================== -->
			<div class="row">

				<div class="card" style="width: 60%; margin: 0 auto;">
					<form class="form-horizontal" action="joinForm.bit"
						enctype="multipart/form-data" method="post">
						<div class="card-body">

							<div class="page-body">
								<h3 class="logo" align="center">
									<b>회원정보 입력</b>
								</h3>
							</div>

							<br>
							<br>

							<div class="wrap-input100">
								<div class="form-group row">
									<div class="col-sm-12">

										<div class="row row-space">

											<div class="col-10">
												<div class="input-group">
													<label for="fname" class="label" style="text-align: left">아이디</label>
													<input class="input--style-4" type="text" maxlength="20"
														id="userid" name="userid" title="5~16자리의 영문+숫자 조합으로 입력해주세요"
														placeholder="이메일 형식으로 입력해 주세요" check_result="fail">
												</div>
											</div>

											<div class="col-2" style="padding-top: 35px">
											<button type="button" class="btn btn-primary" id="btn-idchk" style="padding: 10px 20px">중복확인</button>
											</div>

										</div>



									</div>
									<div class="col-sm-9 tdemail" align="left"></div>
								</div>




								<div class="form-group row">
									<div class="col-sm-12">
										<div class="row row-space">
											<div class="col-10">
												<div class="input-group">
													<label for="lname" class="label" style="text-align: left">비밀번호</label>
													<input class="input--style-4" type="password"
														maxlength="20" id="pwd" name="pwd"
														title="8~20자 사이에 적어도 하나의 영어대문자,숫자, 특수문자가 포함되어야 합니다."
														placeholder="비밀번호를 입력해주세요">
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
													<label for="email1" class="label" style="text-align: left">비밀번호
														확인</label> <input class="input--style-4" type="password"
														maxlength="20" id="pwdCheck" name="pwdCheck"
														title="패스워드 확인" placeholder="비밀번호를 입력해주세요">
												</div>
											</div>
											<div class="col-2"></div>
										</div>
									</div>
									<div class="col-sm-12 tdpwch" align="left"></div>
								</div>






								<div class="form-group row">
									<div class="col-sm-12">
										<div class="row row-space">
											<div class="col-10">
												<div class="input-group">
													<label for="cono1" class="label" style="text-align: left">닉네임</label>
													<input class="input--style-4" type="text" maxlength="20"
														id="nick" name="nick" title="닉네임"
														placeholder="사용할 닉네임을 입력해 주세요">
												</div>
											</div>
											<div class="col-2"></div>
										</div>
									</div>
									<div class="col-sm-12"></div>
								</div>








								<div class="form-group row">
									<div class="col-sm-12">
										<div class="row row-space">
											<div class="col-10">
												<div class="input-group">

													<label for="cono1" class="label" style="text-align: left">주소</label>

													<!-- 카카오 지도 API 적용 -->
													<input class="input--style-4" type="text" maxlength="20"
														size="45" id="loc" name="loc" title="주소-기본주소"
														placeholder="동명(읍,면)으로 검색 (ex.서초동)"> 
													<input type="hidden" name="lat" id="lat">
													<input type="hidden" name="lon" id="lon">	<br>
													<br>



													<button type="button" id="currentLoc"
														class="btn btn-primary social facebook btn-flat btn-addon mb-3" style="padding: 10px 20px">
														<i class="fa fa-crosshairs"></i>현재 위치로 찾기
													</button>

													<!-- 지도로 찾기 잠시 보류 <button type="button" class="btn btn-primary" id="searchMap">지도에서 찾기</button> -->
													<!-- 카카오지도 뿌려지는 곳 -->
													<!-- 	<div id="map" style="width:300px;height:300px;"></div>   -->

													<div id="layer"
														style="border-radius: 10px; margin-bottom: 10px; display: none; position: absolute; overflow: hidden; z-index: 1; top: 0px; left: 0px; max-width: 600px; width: 100%; height: 400px; border: 1px solid #e6e6e6; ">
														<img
															src="//t1.daumcdn.net/postcode/resource/images/close.png"
															id="btnCloseLayer"
															style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1; width: 20px"
															alt="닫기 버튼">
													</div>

												</div>
											</div>
											<div class="col-2"></div>
										</div>
									</div>
									<div class="col-sm-12"></div>
								</div>










								<!-- 지도로 찾기 잠시 보류 <button type="button" class="btn btn-primary" id="searchMap">지도에서 찾기</button> -->
								<!-- 카카오지도 뿌려지는 곳 -->
								<!-- 	<div id="map" style="width:300px;height:300px;"></div>   -->







								<div class="form-group row">

									<div class="col-sm-12">
										<div class="row row-space">
											<div class="col-10">
												<div class="input-group">



													<label for="cono1" class="label" style="text-align: left">이미지 추가</label> 
													
													<div style="float: left;">
														<label class="btn btn-primary btn-default btn-file" style="padding: 10px 20px; margin-right:80px"> 이미지 설정/변경 
														<input class="input--style-4" type="file" name="profile" style="display: none;"
														onchange="readURL(this);" multiple></label> &nbsp;&nbsp;&nbsp;&nbsp;
														<img id="uimg" src="upload/${param.umig}" alt="" width="150px" height="150px" style="border-radius: 10px;" />
														<span id="imgFileName">&nbsp;&nbsp;${param.uimg}</span> 
													</div>


												</div>
											</div>
											<div class="col-2"></div>
										</div>
									</div>
									<div class="col-sm-12"></div>
								</div>





							</div>
							<!-- wrap -->
						</div>
						<!-- form 다음 -->
						<div class="border-top">
							<div class="card-body" style="text-align: center;">
								<button type="submit" class="btn btn-primary" style="padding: 10px 20px"><b>전송</b></button>
								<button type="reset" class="btn" style="padding: 10px 20px">취소</button>
							</div>
						</div>







					</form>
				</div>





				<!-- ============================================================== -->
				<!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->

<script>
//카카오 지도
/* 
	$('#searchMap').click(function(){
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};
	
	var map = new kakao.maps.Map(container, options);
	}); */	
//카카오지도 끝

//카카오 주소
        var element_layer = document.getElementById('layer');
        var themeObj = {};
        function closeDaumPostcode() { element_layer.style.display = 'none'; }
        var element_layer = document.getElementById('layer');
        $("#loc").click(function () { sample2_execDaumPostcode() })
        $("#btnCloseLayer").click(function () { closeDaumPostcode() })
        function sample2_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
                    if (data.userSelectedType === 'R') {
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                    }
                    //주소 인풋창에 입력
                    $("#loc").val(addr);
                    //주소값을 이용해서 좌표값 입력
                    addrToCoor(addr);
                    

                    element_layer.style.display = 'none';
                },
                width: '100%',
                height: '100%',
                maxSuggestItems: 5,
                theme: themeObj
            }).embed(element_layer);
            element_layer.style.display = 'block';
           
        }
       


//카카오 api활용 주소값으로 좌표값 얻어내기

function addrToCoor(addr){

 var geocoder = new daum.maps.services.Geocoder();



 // 주소로 좌표를 검색
 geocoder.addressSearch(addr, function(result, status) {
  
  // 정상적으로 검색이 완료됐으면,
  if (status == daum.maps.services.Status.OK) {
   
   $('#lat').val(result[0].y);
   $('#lon').val(result[0].x);

  }
 });
}


// html5 geolocation을 이용하여 현재 위치 값 받아내기

$('#currentLoc').click(function getLocation() {
  if (navigator.geolocation) { // GPS를 지원하면
    navigator.geolocation.getCurrentPosition(function(position) {
      alert(position.coords.latitude + ' ' + position.coords.longitude);
      	//위도/경도 값 저장
     	$('#lat').val(position.coords.latitude);
     	$('#lon').val(position.coords.longitude);  
     	
		console.log($('#lat').val());
		console.log($('#lon').val());
      //카카오 지도 api 라이브러리 활용, 좌표에서 주소로 변환 // 
      var geocoder = new kakao.maps.services.Geocoder();

      var coord = new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude);
      var callback = function(result, status) {
    	  let currentAddr = result[0].address.address_name;
          if (status === kakao.maps.services.Status.OK) {
              console.log('그런 너를 마주칠까 ' + currentAddr + '을 못가');
          }
          $("#loc").val(currentAddr);
          
      }; 
      
      geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
 
    //카카오 지도api 라이브러리 활용, 좌표에서 주소로 변환 끝 //
     
    }, function(error) {
      console.error(error);
    }, {
      enableHighAccuracy: false,
      maximumAge: 0,
      timeout: Infinity
    });
  } else {
    alert('GPS를 지원하지 않습니다');
  }
});
//html5 geolocation을 이용하여 현재 위치 값 받아내기 끝
</script>
		
<script type="text/javascript">
	//***********************************//
	// 이미지 파일 업로드시 이미지 미리보기
	//***********************************//
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#img').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}$('#imgFileName').html(input.files[0].name);
	};
	
	//***********************************//
    //  아이디 중복 체크
    //***********************************//	
    
    $('#btn-idchk').click(function(){
    	//아이디 적합성 체크
    	let email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		if (!email.test($('#userid').val())) {
				alert('적합하지 않은 이메일 형식입니다');
				$('#userid').focus();
				return;
		};
		//아이디 중복 체크
    	$('#userid').change(function () {
     		//$('#id_check_sucess').hide();
     		$('#btn-idchk').show();
     	 	$('#userid').attr("check_result", "fail");
    	});


    	if ($('#userid').val() == '') {
      	alert('이메일을 입력해주세요.')
      	return;
    	}

    	console.log($('#userid').val());
			
    	$.ajax({
      		type: "POST",
      		url: 'idCheck.bit',
      		data: {
        			userid: $('#userid').val()
      		 	 },
      		datatype: 'json',
      		success: function (data) {
        		console.log(data);
        		if (data[0] != null) {	
          			alert("이미 존재하는 아이디 입니다.");
          			$("#userid").val('');
          			$("#userid").focus();
          			return;
        		} else {
          			alert("사용가능한 아이디 입니다.");
          			$('#userid').attr("check_result", "success");
         			// $('#id_check_sucess').show();
          			//$('#btn-idchk').hide();
          			return;
        		}
      		}
    	});
    });
	
</script>	
		
		
		


	

    
    
    <script>
        //***********************************//
        // For select 2
        //***********************************//
        $(".select2").select2();

        /*colorpicker*/
        $('.demo').each(function() {
        //
        // Dear reader, it's actually very easy to initialize MiniColors. For example:
        //
        //  $(selector).minicolors();
        //
        // The way I've done it below is just for the demo, so don't get confused
        // by it. Also, data- attributes aren't supported at this time...they're
        // only used for this demo.
        //
        $(this).minicolors({
                control: $(this).attr('data-control') || 'hue',
                position: $(this).attr('data-position') || 'bottom left',

                change: function(value, opacity) {
                    if (!value) return;
                    if (opacity) value += ', ' + opacity;
                    if (typeof console === 'object') {
                        console.log(value);
                    }
                },
                theme: 'bootstrap'
            });

        });
        /*datwpicker*/
        jQuery('.mydatepicker').datepicker();
        jQuery('#datepicker-autoclose').datepicker({
            autoclose: true,
            todayHighlight: true
        });
        var quill = new Quill('#editor', {
            theme: 'snow'
        })

    </script>
</body>
>>>>>>> 552709afc25e3406a4f47703ec4b4dd622d858d3
</html>