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
		
		<h3>내 정보 수정</h3>
		<p></p>
		<button type="button" onclick="location.href='main.bit'">마이페이지 홈</button>
		<button type="button" onclick="location.href='edit.bit'">내 정보 수정</button>
		<button type="button" onclick="location.href='editPwd.bit'">비밀번호 변경</button>
		<button type="button" onclick="location.href='withdrawal.bit'">회원 탈퇴</button>
		
		<form  action="edit.bit" enctype="multipart/form-data" method="post" style="text-align: center;">
			<div>
				이메일<input type="text" name="userid" value="${user.userid}" readonly>
			</div>
			<div>
				핸드폰 번호<input type="text" name="cpnumber" value="${user.cpnumber}" >
			</div>
			<div>
				<input type="text" name="authNumber" placeholder="인증번호">
				<button>인증번호 전송</button>
			</div>
			<div>
				닉네임<input type="text" name="nick" value="${user.nick}" >
				<button>중복 확인</button>
			</div>
			<div>
				주소<input type="text" name="loc" value="${user.loc}" >
				<button>주소 검색</button>
			</div>		
			
			<div class="card-body" style="text-align: center;">
				<button type="submit" class="btn btn-primary" style="padding: 10px 20px"><b>전송</b></button>
				<button type="reset" class="btn" style="padding: 10px 20px">취소</button>
			</div>		
		</form>
		
		
	</div>
	
</body>
</html>