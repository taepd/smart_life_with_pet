<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
     <link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
    
</head>

<body>

	<!-- header -->
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<!-- header -->
	

	<c:set var="user_id" value="${sessionScope.user_id}"/>
<header>
<c:choose>
	<c:when test="${user_id != null}">
		<c:choose>
			<c:when test="${user_id == 'admin'}">
			
			</c:when>
			<c:otherwise>
				
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
		
	</c:otherwise>
</c:choose>
</header>
	<div class="side_overlay">
		<div class="container">
	<div class="section">
		<div class="container tim-container">
		</div>
		</div>

	<div style="height: 10px;"></div>
	<div class="row">
	<div class= "col-md-9 ml-auto mr-auto" >
	<form name="letterForm" >
		<input type="hidden" name="id" value=""/>
	<table border width="300" >
		
		<tr>
			<th bgcolor="hotpink"> 받는사람</th>
			<td> <input type ="text" name ="user" size="20" ></td>
		</tr>

		<tr>
			<th bgcolor="hotpink"> 제목</th>
			<td> <input type ="text" name ="title" size="20" ></td>
		
		<tr>
			<td colspan=4>
			
				<textarea cols="30" rows="10"name="content"> </textarea>
			</td>
		</tr>
	
	</table>
	<table width="300">
		<th>
			<input type="reset" value="다시 쓰기"/>
			<input type ="button" value="보내기" onClick="goURI('SEND')" />
			<input type ="button" value="취소" onClick="self.close()"/>
			
	
		</th>
	</table>	
</form>


	</div>
	</div>
	</div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#summernote').summernote({
				height : 500,
				minHeight : null,
				maxHeight : null,
				focus : true
			});
		});
	</script>
</body>
</html>