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

	<div class="section">
		<div class="container tim-container">
		</div>
		</div>

	<div style="height: 10px;"></div>
	<div class="row">
	<div class= "col-md-9 ml-auto mr-auto" >
	<form class="form form-row" enctype="multipart/form-data">
		<table class="col" >
	
			<tr>
				
				<td> 
					<input type="text" class="form-control" name="user_id" size="10" maxlength="10" placeholder="글쓴이" value="${user_id}" hidden />
               		<input type="text" name="bookSeq" value="${param.bookSeq}" hidden/>
               </td>
              
			</tr>
			<tr>
				
				<td>
					<div style="margin-bottom:8px;">
						<input type="text" class="form-control" name="post_title"
							placeholder="제목을 입력하세요" value="" required />
					</div>
				</td>
			</tr>
			<tr>
				
				<td><textarea id="summernote" name="post_contents" cols="67"
						rows="20"  required></textarea>
				</td>
			</tr>
			<tr>
				
				<td><input name="file" type="file"/><br></td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
					<a href="javascript:history.go(-1)" class="btn btn-round btn-white">&nbsp;&nbsp;뒤로&nbsp;&nbsp;</a>
					<a href="javascript:addpost()" class="btn btn-round btn-rose">&nbsp;&nbsp;등록&nbsp;&nbsp;</a>
				</td>
			</tr>
		</table><br>
	</form>
	</div>
	</div>
	<!-- 게시판 등록 -->
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