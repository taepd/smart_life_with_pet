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
		
		<h3>마이 페이지</h3>
		<p>여기에 회원 기본 정보가 뿌려진다</p>
	 	<button type="button" onclick="location.href='main.bit'">마이페이지 홈</button>
		<button type="button" onclick="location.href='edit.bit'">내 정보 수정</button>
		<button type="button" onclick="location.href='editPwd.bit'">비밀번호 변경</button>
		<button type="button" onclick="location.href='withdrawal.bit'">회원 탈퇴</button>
		<button type="button" onclick="location.href='myPetPage.bit'">내 반려동물 상세페이지</button>
	</div>
	
</body>
</html>