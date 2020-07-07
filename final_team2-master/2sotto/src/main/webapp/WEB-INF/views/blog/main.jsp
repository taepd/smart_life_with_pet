<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
    
</head>
<body>
    
    <%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	
	<div class="container">
		
		<h3>블로그  페이지</h3>
		<button type="button" onclick="location.href='detail.bit'">블로그 상세 페이지</button>
		<button type="button" onclick="location.href='write.bit'">블로그 글쓰기</button>
		<button type="button" onclick="location.href='favorite.bit'">블로그 즐겨찾기</button>
	</div>
	
</body>
</html>