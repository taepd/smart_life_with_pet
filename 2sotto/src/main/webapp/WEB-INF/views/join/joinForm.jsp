<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


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
				var idChkVal = $("#idChk").val();
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
				data : {"userId" : $("#userId").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
	</script>
	<body>
		<section id="container">
			<form action="/member/register" method="post" id="regForm">
				<div class="form-group has-feedback">
					<label class="control-label" for="userid">아이디(이메일형식)</label>
					<input class="form-control" type="text" id="userId" name="userid" />
					<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="pwd">패스워드</label>
					<input class="form-control" type="password" id="pwd" name="pwd" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="nick">닉네임</label>
					<input class="form-control" type="text" id="nick" name="nick" />
				</div>
				
			</form>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="button" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
		</section>
		
	</body>
</html>