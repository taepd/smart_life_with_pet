<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%
//코드구현
request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
	<title>2sotto</title>

<!-- Favicon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/images/icons8-cat-footprint-48.png">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/images/icons8-cat-footprint-48.png"
	type="image/x-icon">


</head>
<body>

	<!-- header -->
	<%@ include file="/WEB-INF/views/include/headerAndNavi.jsp"%>
	<!-- header -->


<c:set var="user_id" value="${sessionScope.user_id}"/>
<c:set var="currentPost" value="${requestScope.CurrentPost}"/>

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
<!-- 게시판 수정 -->
<div style="max-width:1000px; margin:0 auto; padding: 100px 80px 170px 80px;background-color:white;">

<table cellpadding="0" cellspacing="0" >
	<tr style="color:tomato;">
		<td colspan="5">후원게시판</td>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<h2><b>${currentPost.post_title}후원글 제목</b></h2>
		</td>
	</tr>
	
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	
	
	<tr>
		<td style="font-family:돋음; font-size:12">
			<table border=0 width=100% style="table-layout:fixed;min-height:280px;">
				<tr>
					<td valign=top style="font-family:돋음; font-size:12;">
						<div style="margin:40px 40px 80px 40px;">${currentPost.post_contents}후원게시판 내용</div>
					</td>
				</tr>
			</table>
			
		</td>
	</tr>


	
		<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;"></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<c:if test="${currentPost.user_id == user_id }">
				<a class="btn btn-rose btn-round" href="">
					&nbsp;수정&nbsp;
				</a> 
				<a id="confirmDelete" class="btn btn-white btn-round" href="">
					&nbsp;삭제&nbsp;
				</a>
			</c:if>
		</td>
		
	</tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<br>
			<a class="btn btn-block btn-gray btn-round" href="">
					&nbsp;&nbsp;&nbsp;이전 돌아가기&nbsp;&nbsp;&nbsp;
				</a>
		</td>
	</tr>
	
	
	
</table>
</div>
</form>
<script>
$('#confirmDelete').click(function() {
	/* var result = confirm('정말로 삭제하시겠습니까?'); 
	if(result) { //yes 
		location.replace('./Delete.post?post_seq='+${currentPost.post_seq}); 
	} else {
		//no 
	}  */
});

</script>
</body>
</html>