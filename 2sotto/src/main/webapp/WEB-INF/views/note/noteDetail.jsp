<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
    
</head>
<body>

	<!-- header -->
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
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
	<div class="side_overlay">
		<div class="container">
<div style="max-width:1000px; margin:0 auto; padding: 100px 80px 170px 80px;background-color:white;">

<table cellpadding="0" cellspacing="0" >
	<tr style="color:tomato;">
		<td colspan="5">쪽지 상세보기</td>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<h2><b>${currentPost.user}보낸사람</b></h2>
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
						<div style="margin:40px 40px 80px 40px;">${currentPost.post_contents}쪽지 내용</div>
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
</div>
</div>

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