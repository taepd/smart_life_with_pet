<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
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
	
	
<div id="content">
	<h2>Q&A게시판</h2>
	<h3 class="hidden">방문페이지 로그</h3>
	<ul id="breadscrumb" class="block_hlist clear">
		<li>Bocastle</li>
		<li>관리자</li>
		<li>배고프다</li>
	</ul>
	<h3 class="hidden">Q&A 목록</h3>
	<form id="content-searchform" class="article-search-form"
		action="adminQa.jsp" method="get">
		<fieldset>
			<legend class="hidden"> 목록 검색 폼 </legend>
			<input type="hidden" name="pg" value="" /> <label for="f"
				class="hidden">검색필드</label> <select name="f">
				<option value="TITLE">제목</option>
				<option value="CONTENT">내용</option>
			</select> <label class="hidden" for="q">검색어</label> <input type="text"
				name="q" value="" /> <input type="submit" value="검색" />
		</fieldset>
	</form>
	<table class="article-search-form margin-small">
		<caption class="hidden">공지사항</caption>
		<thead>
			<tr>
				<th class="">글번호</th>
				<th class="">제목</th>
				<th class="">작성자</th>
				<th class="">등록시간</th>
				<th class="">조회수</th>
				<th class="">답변여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="n">
				<tr>
					<td class="seq">${n.seq}</td>
					<td class="title"><a href="noticeDetail.htm?seq=${n.seq}">${n.title}</a></td>
					<td class="writer">${n.writer}</td>
					<td class="regdate">${n.regdate}</td>
					<td class="hit">${n.hit}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p class="article-comment margin-small">
		<a class="btn-write button" href="">글쓰기(대기)</a>
	</p>
	<p id="cur-page" class="margin-small">
		<span class="strong">1</span> / 10 page
	</p>
	<div id="pager-wrapper" class="margin-small">
		<div class="pager clear">
			<p id="btnPrev">
				<a class="button btn-prev" href="notice.jsp">이전</a>
			</p>
			<ul>
				<li><a class="strong" href="">1</a></li>
				<li><a href="">2</a></li>
				<li><a href="">3</a></li>
				<li><a href="">4</a></li>
				<li><a href="">5</a></li>
			</ul>
			<p id="btnNext">
				<span class="button btn-next">다음</span>
			</p>
		</div>
	</div>
</div>
</body>
</html>