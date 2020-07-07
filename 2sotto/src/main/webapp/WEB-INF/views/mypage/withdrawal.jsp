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
		
		<h3>회원 탈퇴</h3>
		<p></p>
		<button type="button" onclick="location.href='main.bit'">마이페이지 홈</button>
		<form action="withdrawal.bit" method="post">
			<button type="submit">회원 탈퇴</button>
		</form>
	</div>
	
</body>
</html>