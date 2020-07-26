<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>	

    <title>슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css_2sotto/blog_main.css">
    
</head>
<body>
    
    <%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<div class="container">
		<div class="side_overlay">
			<div class="row">
				<div class="col"></div>
				<div class="col-11">
					<h2>모두의 블로그</h2>
					<button type="button" class="btn btn-primary" onclick="location.href='myMain.bit'">내 블로그 가기</button>
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
				        		onclick="location.href='${pageContext.request.contextPath}/mypage/petPage.bit?petindex=${petArr.petindex}'">
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
							<a href="detail.bit?bindex=${post.bindex}">
								<strong>${post.title}</strong>
								<span id="content${status.index}">${post.content}</span>
							</a>
						</div>
						<!-- 하트/코멘트 갯수 영역 -->
						<div class="heart-and-comment">
							<div class="heart-comment-time-area">
								<span class="heart"><i id="heart" class="fas fa-heart"></i></span>
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





		</div> <!-- /.container  -->
	</div> <!-- /.side_overlay -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>

<script>

//onload 함수
$(function(){
	replaceImg();
	
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


</script>
</html>