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
	</div>
	
</body>
</html>