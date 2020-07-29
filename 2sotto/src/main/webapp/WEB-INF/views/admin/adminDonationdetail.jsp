<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<html>
<head>

<title>슬기로운 반려생활</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 타임피커 cdn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-datetimepicker/2.7.1/css/bootstrap-material-datetimepicker.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<%@ include file="/WEB-INF/include/import.jsp"%>
<!-- 프로그레스 바 부트스트렙 시작 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<!-- 프로그레스 바 부트스트렙 끝-->
<style>
#jb {
	width: 100%;
	height: 40px;
}

a:visited {
	color: #000000;
}

ul, li {
	list-style: none;
}

h2 {
	margin-top: 100px;
	padding-top: 100px;
}

hr.dot {
	border: none;
	border: 1px dashed #ffffff;
	opacity: 0.4;
	margin: 20px 0px; /* 0 > 40px */
}

#replybox, #reply {
	margin: 0 40px;
}

#reply_h4 {
	margin: 70px 0 20px 32px;
	padding-right: 15px;
	padding-left: 0;
}

#btns_wrapper {
	text-align: right;
}

#btns {
	display: inline-block;
}

.container>li {
	float: right;
}

.align-center {
	text-align: center;
}

/* .recom{position:relative;} */
.reCom:before {
	content: "";
	position: absolute;
	display: inline-block;
	top: 10;
	left: 30px;
	width: 16px;
	height: 16px;
	border: 1px solid #ccc;
	border-width: 0 0 1px 1px;
	border-radius: 0 0 0 2px;
}

.writereCom:before {
	content: "";
	position: absolute;
	display: inline-block;
	top: 0;
	left: 30px;
	width: 16px;
	height: 16px;
	border: 1px solid #ccc;
	border-width: 0 0 1px 1px;
	border-radius: 0 0 0 2px;
}

.main-card {
	background-color: #ffffff;
	box-shadow: rgba(0, 0, 0, 0.08) 0px 20px 40px 0px;
	padding: 100px;
	border-radius: 6px;
	position: relative;
}

#back-icon {
	position: absolute;
	top: 7px;
	left: 10px;
	font-size: 34px;
	color: rgba(156, 39, 176, 0.2);
}

#comment {
	margin-top: 50px;
}
</style>
<script>
	window.onload = function() {
		document.getElementById('jb').value = '${donate.ccoll/donate.gcoll*100}';
	}
</script>


</head>

<body>



	<div class="container">
		<div class="side_overlay">
			<div class="row">
				<div class="col-lg-12">
					<div class="main-card">
						<a href="userDonationTable.bit" style="color: #EE82EE;"><span
							id="back-icon"><i class="fas fa-angle-double-left"></i></span></a>
						<div class="row">
							<div class="col-lg-9">
								<h2 class="mt-0 pt-0"
									style="font-family: 'Noto Serif KR', serif;">${donate.title}</h2>
								<hr style="margin-top: 30px; margin-bottom: 40px;">
								<p>${donate.content}</p>
							</div>
							<div class="col"
								style="border: 1px solid rgba(156, 39, 176, 0.2); padding: 30px;">
								<div class="row">
									<fmt:parseDate var="parseTime" value="${donate.rtime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate var="rtime" value="${parseTime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
									등록일 ${rtime}
								</div>
								<br>
								<div class="row">
									<fmt:parseDate var="parseTime" value="${donate.ctime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate var="ctime" value="${parseTime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
									마감일 ${ctime}
								</div>
								<br>
								<div class="row">
									모금률&nbsp; <span
										style="text-align: center; color: rgba(156, 39, 176); font-weight: bold; font-size: 27px;">
										<fmt:formatNumber value="${donate.ccoll/donate.gcoll*100}"
											pattern="#,###" />%
									</span> <br>
									<progress value="0" max="100" id="jb"></progress>
								</div>

							</div>
						</div>

						<!-- 댓글 시작 -->
						<div class="row">
							<div class="col"></div>
							<h4 id="reply_h4" class="col-lg-10">댓글</h4>
							<div class="col"></div>
						</div>
						<div class="row">
							<div class="col"></div>
							<div class="col-lg-10">
								<div id="commentBox"></div>
								<!-- 댓글 폼: 유저만 볼 수 있게 -->
							</div>
							<div class="col"></div>
						</div>
						<div class="border-top">
							<div class="card-body" style="text-align: center;">
								<se:authorize access="hasAnyRole('ROLE_ADMIN')">
									<button class="btn btn" type="button"
										onclick="location.href='adminDonationupdate.bit?dindex=${donate.dindex}'">수정</button>
									<a href="#" data-toggle="modal" data-target="#deleteModal"
										class="btn btn-primary">삭제</a>
								</se:authorize>
								<%-- <button type="button" id="delete" onclick="location.href='delete.bit?dindex=${donate.dindex}'" >삭제</button> --%>
							</div>
						</div>
					</div>
					<!-- /.main-card -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.side_overlay -->
	</div>
	<!-- /.container -->
	<!-- Modal -->

	<div class="modal" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">게시물 삭제</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">게시물을 정말 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button onclick="Delete()" type="button" class="btn btn-primary">삭제하기</button>
					<button type="button" class="btn btn" data-dismiss="modal">취소하기</button>

				</div>
			</div>
		</div>
	</div>
</body>



<script type="text/javascript">
	//모든 요소 load 후 댓글 목록과 댓글 쓰기 폼 불러오기
	$(function() {

		getCommentList();
		insertComment();

	});
	function Delete() {
		location.replace("adminDonationdelete.bit?dindex=${donate.dindex}");
	}

	//댓글 목록 가져오기
	function getCommentList() {

		$
				.ajax({

					url : "getCommentList.bit",

					datatype : "json",
					data : {
						dindex : '${donate.dindex}'
					},
					success : function(data) {

						var html = "";
						console.log("data: " + data);

						$
								.each(
										data,
										function(index, element) {
											let depthCss = "";
											if (this.depth == 1) {
												depthCss = "padding-left:45px";
											}

											//대댓글은 임시로 배경색 넣음. 나중에 들여쓰기 적용해야 함
											if (element.depth == 1) {
												html += "<div class='reCom' style='position:relative; padding: 15px 0;"+depthCss+"'>";
											} else {
												html += "<div>";
											}
											;
											//html += "<form action='commentDelete.bit' method='POST'>";
											html += "<div class='d-flex justify-content-between'style='background-color: #F1F1F1; padding: 0 0 0 10px;'><div id='commentUserid'><b>";
											html += element.nick;
											//댓글인 경우
											if (element.depth == 0) {
												html += "</b></div><div><se:authorize access='hasAnyRole(\'ROLE_USER\')'><button onclick='openReComment("
														+ element.dcindex
														+ ",\""
														+ element.userid
														+ "\",\""
														+ element.refer
														+ "\"); this.onclick=null;' class='btn btn-sm'>대댓글</button></se:authorize></div></div>";
											} else {
												html += "</b></div></div>";
											}
											;
											html += "<div id='commentContent"+element.dcindex+"'>";
											html += element.dccontent;
											html += "</div>";
											html += "<div id='commentDate'><h6>";
											html += element.rtime;
											html += "</h6></div>";
											html += "<input type='hidden' name='commentNum' id='commentNum' value='";
				html += element.dcindex;
				// html += "'> <input type='button' id='editCommentBtn"
													+ element.bcindex
													+ "' value='수정' class='button small' onclick='editComment("
													+ element.bcindex
													+ "); this.onclick=null;'>";
											html += "'>";
											if ("${sessionScope.user.userid}" == element.userid) {
												html += "<a href='"
														+ "javascript:void(0);' onclick='editComment("
														+ element.dcindex
														+ ");  this.onclick=null;'; id='editCommentBtn"
														+ element.dcindex
														+ "';><span class='commentIcons'><i class='fas fa-edit'></i></span></a>";

												//html += "<input type='submit' value='삭제' class='button small' onclick='deleteReply(this.form)'>";
												// html += "<input type='submit' id='deleteCommentBtn' value='삭제' class='button small' onclick='deleteComment("+element.bcindex+"); this.onclick=null;'>";
												// html += "<input type='submit' id='deleteCommentBtn' value='삭제' class='button small' onclick='deleteComment("+element.bcindex+"); this.onclick=null;'>";
												html += "<a href='"
														+ "javascript:void(0);' onclick='deleteComment("
														+ element.dcindex
														+ ")'; id='deleteCommentBtn'><span class='commentIcons'><i class='fas fa-trash-alt'></i></span></a>";
											}

											//html += "</form>";
											html += "<div id='editForm"+element.dcindex+"'></div>"
											html += "</div>";
										});

						$('#commentBox').append(html);

					}
				});
	}
</script>
</html>


