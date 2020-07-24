<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>

<title>동물관리 홈</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-datetimepicker/2.7.1/css/bootstrap-material-datetimepicker.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<%@ include file="/WEB-INF/include/import.jsp"%>

<style>
	.fc-toolbar-title, a.fc-col-header-cell-cushion, th {
		color: black;
	}
	
	.icons {
		font-size: 15px;
		color: orange;
	}
	
	#wrapper {
		display: inline-block;
		/* margin: 0 auto; */
	}
	
	.card-img-top {
		margin-top: 16px;
	}
	
	.card {
		margin-left: 10px;
		margin-right: 10px;
	}
	
	#tab-list {
		margin: 0 auto;
	}
	
	#tab-row {
		margin-bottom: 100px;
		margin-top: 73px;
	}
	
	.form-check {
		margin-left: 5px;
		margin-top: 8px;
	}
	
</style>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css_2sotto/blog_main.css">
</head>
<body>

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	
	 
	<c:set value="${petInfoList}" var="petInfo" />

	<div class="container">
			<div class="side_overlay">
			<hr>
			<div class="row">
				<div class="col-3 text-center">
							<img class="card-img-top rounded-circle img-fluid img" style='width:150px; height:150px'
								src="${pageContext.request.contextPath}/assets/images/${pet.petimg}"
								rel="nofollow" alt="card image">
				</div>
				<div class="col-9">
					<h4>${pet.petname}</h4>
					<p class="card-text" id="petInfo">
						<fmt:parseNumber var="age" value="${pet.age/12}"
							integerOnly="true" />
						${pet.scaname} | ${pet.size == 'small' ? '소형':petInfo.size == 'medium'? '중형':'대형'}${pet.mcategory == '1' ? '견':'묘'}
						| ${pet.weight}kg | <br> ${age}년
						${pet.age%12}개월 | ${pet.sex == 'female' ? '암컷':'수컷' }
						| ${pet.nstate == 'n' ? '중성화X':'중성화O'} | <br>
						${pet.memo}
					</p>
					<c:if test="${sessionScope.user.userid eq pet.userid}">
						<div>
							<!-- 나중에 아이콘으로 바꾸기~~~ -->
							
							<!-- <a><span class="icons"><i class="fas fa-pen"></i></span></a> -->
							<a href="edit.bit?petindex=${pet.petindex}">수정</a>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<!-- <span class="icons"><i class="fas fa-times"></i></span> 삭제 아이콘...-->
							<a href="delete.bit?petindex=${pet.petindex}">삭제</a>
						</div>
					</c:if>
				</div>
				<div class="col-3 text-center" style="margin-top:20px;">
							<button id="unFollowBtn"> 언팔로우 </button>
							<button id="followBtn">	팔로우 </button>
				</div>
				<div class="col-9" style="margin-top:20px;">
							<span onclick='popupMessage()'
							style="cursor:pointer">
								<i class="far fa-envelope"></i>
								<strong>${pet.petname}의 ${pet.mcategory eq "1"? "주인":"집사"} ${pet.nick}에게 쪽지보내기</strong>
							</span>
				</div>
			</div>			

			<hr>
	

	
				<c:forEach var="post" items="${postList}" varStatus="status">
				<div class="row">
					<div class="col-9">
					<!-- 글쓴이 및 관련 반려동물 영역 -->
					<div class="d-flex">  <!--  style="display: inline-block;" -->
						<span class="align-self-center"><b>${post.nick}</b>님과 </span>
						<c:forEach var="petArr" items="${pArr}">
	        			<c:forTokens var="petindex" items="${post.petindex}" delims=",">
	        				<c:if test="${petindex eq petArr.petindex}">
				        		<div class="follow-img-wrapper d-flex flex-column" value="${petArr.petindex}" style="margin:10px; cursor:pointer;"
				        		onclick="location.href='${pageContext.request.contextPath}/mypage/petPage.bit?petindex=${petindex}'">
				        	<!-- 이미지 동그랗게 잘라서 크기에 맞게 나오게 하는 코드 -->
			        			<div  class="rounded-circle card-modal-profile"
                                    style="float : left; background-color: white; overflow: hidden; height:50px; width:50px;">
                                    <div style="top: 0; left: 0; right: 0; bottom: 0; transform: translate(50%, 50%);">
                                        <img  src="${pageContext.request.contextPath}/assets/images/${petArr.petimg}" alt="${petArr.petname}" href="javascript:void(0)"
                                            style="width :auto; height: 70px; transform: translate(-50%, -50%); ">
                                    </div>
                             	</div>
                             	<div class="text-center"> ${petArr.petname} </div>
		        			</div>
		        			</c:if>
				        </c:forTokens>
				        </c:forEach>
				        <span class="align-self-center">의 이야기</span>   			
	        		</div>
					<!-- 제목 및 내용 영역 -->
						<div class="contents">
							<a href="${pageContext.request.contextPath}/blog/detail.bit?bindex=${post.bindex}">
								<strong>${post.title}</strong>
								<span id="content${status.index}">${post.content}</span>
							</a>
						</div>
						<!-- 하트/코멘트 갯수 영역 -->
						<div class="heart-and-comment">
							<div class="heart-comment-time-area">
								<span class="heart"><i class="fas fa-heart"></i></span>
								<span>${post.blike}</span>
							</div>
							<div class="heart-comment-time-area">
								<span class="icon"><i class="far fa-comment"></i></span>
								<span>${post.bcCount}</span>
							</div>
							<div class="heart-comment-time-area">
								<fmt:parseDate var="parseTime" value="${post.rtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate var="rtime" value="${parseTime}" pattern="yyyy-MM-dd hh:mm"/>
								<span>${rtime}</span>
							</div>
						</div>
					</div>	
					<!-- 게시글 오른쪽 이미지 영역 -->
					<div class="col-3 test">
						<div class="wrapper">
							<img id="${status.index}" src="${pageContext.request.contextPath}/assets/images/pet_profile.jpg" style="width:180px; height:150px;"alt="게시물 이미지">
						</div>
					</div>
				</div>
			</c:forEach>

			<div>
			<h4>cpage: ${cpage }/ pagesize: ${pageSize }/ pagecount: ${pageCount}/ totalPostCount: ${totalPostCount } </h4>
			</div>

			<!-- 페이징 -->
			<div class="pagination justify-content-center">
			<!-- <nav aria-label="Page navigation example" style="display: none;" id="pagingNav"> -->
					<ul class="pagination" id="pagingview">
						<c:if test="${cpage > 1}">
							<li class="page-item">
								<a class="page-link" href="main.bit?cp=${cpage-1}&ps=${pageSize}" cp="${cpage-1}" ps="${pageSize}" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
								</a>
							</li>
						</c:if>

						<c:forEach var="i" begin="1" end="${pageCount}" step="1">
							<c:choose>
								<c:when test="${cpage==i }">
									<li class="page-item active"><a class="page-link"
										href="main.bit?cp=${i}&ps=${pageSize}" cp="${i}"
										ps="${pageSize}">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="main.bit?cp=${i}&ps=${pageSize}" cp="${i}"
										ps="${pageSize}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${cpage < pageCount}">

							<li class="page-item">
								<a class="page-link" href="main.bit?cp=${cpage+1}&ps=${pageSize}"
									cp="${cpage+1}" ps="${pageSize}" aria-label="Next"> 
									<span aria-hidden="true">&raquo;</span>
									<span class="sr-only">Next</span>
								</a>
							</li>
						</c:if>
					</ul>
			<!-- </nav> -->
			</div>
		
		
		
		</div> <!-- side_overlay end -->
	</div>
	<!-- container end -->



	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>

<script>
$(function(){
	replaceImg();

	//팔로우/언팔로우 버튼 토글
	if(${petLike.petindex eq pet.petindex}){
		$('#followBtn').hide();
		console.log('팔로우');
	}else{
		$('#unFollowBtn').hide();
		console.log('언팔로우');
	}

});

/**
* @함수명 : replaceImg()
* @작성일 : 2020. 7. 17.
* @작성자 : 태영돈
* @설명 :이미지 위치 디자인(조정/삭제)을 위한 함수
* @param void
**/

function replaceImg(){ 
	for(var i =0; i<${fn:length(postList)}; i++){ //현재 페이지 포스팅 갯수만큼 for문
	    var imgs = $('#content'+i+' img'); //포스팅 내용 중 img 태그를 찾아서 배열로 저장
	    var imgSrcs = [];
	    for (var j = 0; j < imgs.length; j++) { //img 개수만큼 for문
	        imgSrcs.push(imgs[j].src); //src값 즉, 이미지 경로를 imgSrcs배열에 저장
			console.log(imgs[j]);      
			imgs[j].removeAttribute('src'); //기존 내용 중 이미지는 미리보기시 지저분하므로 지워준다		        
	        //imgs.remove(imgs[j].src);
	    }
		console.log("imgSrcs: "+ imgSrcs[0]);
		$('#'+i+'').attr("src", imgSrcs[0]); //블로그 리스트 오른쪽 썸네일 영역에 올린 이미지 중 첫 번째 사진 표시
	}
}


//반려동물 팔로우 
$('#followBtn').click(function() {

	$.ajax({
		type : "POST",
		url : 'followPet.bit',
		data : {
			petindex: '${pet.petindex}'
		},
		datatype : 'json',
		async: false,
		success : function(data) {
			
			if (data == 1) {

				$('#followBtn').hide();
				$('#unFollowBtn').show();
								
				return;
			} else {
				alert("문제가 생겨 팔로우 요청이 취소되었습니다.");

				return;
			}
		}
	});
});

//반려동물 언팔로우 
$('#unFollowBtn').click(function() {
	
	$.ajax({
		type : "POST",
		url : 'unFollowPet.bit',
		data : {
			petindex: '${pet.petindex}'  
		},
		datatype : 'json',
		async: false,
		success : function(data) {
			
			if (data == 1) {

				$('#unFollowBtn').hide();
				$('#followBtn').show();
								
				return;
			} else {
				alert("문제가 생겨 언팔로우 요청이 취소되었습니다.");

				return;
			}
		}
	});
	
});

function popupMessage(){
	
	var popupX = (document.body.offsetWidth / 2) - (580 / 2);
	//만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height / 2) - (700 / 2);
	//만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	//window.open('${pageContext.request.contextPath}/message/write.bit','_blank',
	window.open('${pageContext.request.contextPath}/message/popmain.bit','_blank',
'width=580, height=700, left='+ popupX + ', top='+ popupY);
	
}


</script>
</html>