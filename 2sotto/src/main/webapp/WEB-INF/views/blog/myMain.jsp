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
	<div class="side_overlay">
		<div class="container">
			
			<h3>블로그  페이지</h3>
			<button type="button" class="btn btn-warning" onclick="location.href='write.bit'">블로그 글쓰기</button>
			<br>
			<br>
			
			<hr>
			
			
			<c:forEach var="post" items="${postList}" varStatus="status">
				<div class="row">
					<div class="col-9">
					<!-- 글쓴이 및 관련 반려동물 영역 -->
					<div class="d-flex">  <!--  style="display: inline-block;" -->
						<span class="align-self-center"><b>${post.nick}</b>님과 </span>
						<c:forEach var="myPet" items="${myPetList}">
	        			<c:forTokens var="petindex" items="${post.petindex}" delims=",">
	        				<c:if test="${petindex eq myPet.petindex}">
				        	<div class="follow-img-wrapper d-flex flex-column" onclick='petSelect(this)' flag="0" value="${myPet.petindex}" style="margin:10px;">
				        	<!-- 이미지 동그랗게 잘라서 크기에 맞게 나오게 하는 코드 -->
			        			<div  class="rounded-circle card-modal-profile"
                                    style="float : left; background-color: white; overflow: hidden; height:50px; width:50px;">
                                    <div style="top: 0; left: 0; right: 0; bottom: 0; transform: translate(50%, 50%);">
                                        <img  src="${pageContext.request.contextPath}/assets/images/${myPet.petimg}" alt="${myPet.petname}" href="javascript:void(0)"
                                            style="width :auto; height: 70px; transform: translate(-50%, -50%); ">
                                    </div>
                             	</div>
                             	<div class="text-center"> ${myPet.petname} </div>
		        			</div>
		        			</c:if>
				        </c:forTokens>
				        </c:forEach>
				        <span class="align-self-center">의 이야기</span>   			
	        		</div>	
					<!-- 제목 및 내용 영역 -->
						<div class="contents">
							<a href="detail.bit?bindex=${post.bindex}">
								<strong style="font-size:1.5em;">${post.title}</strong>
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
								<span id="rtime${status.index}">${rtime}</span>
							</div>
						</div>
					</div>	
					<!-- 게시글 이미지 영역 -->
					<div class="col-3 test">
						<div class="wrapper">
							<img id="${status.index}" src="${pageContext.request.contextPath}/assets/images/pet_profile.jpg" alt="게시물 이미지">
						</div>
					</div>
				</div>
			</c:forEach>

			<div>
			<h4>cpage: ${cpage }/ pagesize: ${pageSize }/ pagecount: ${pageCount}/ totalpostcount: ${totalPostCount } </h4>
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





		</div> <!-- /.container  -->
	</div> <!-- /.side_overlay -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>

<script>

//onload 함수
$(function(){
	replaceImg();
	for(var i =0; i<${fn:length(postList)}; i++){
		$('#rtime'+i+'').each(function(){
			$(this).text(prettyDate($(this).text()));
		});
	};
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
function prettyDate(time){

	  var date = new Date((time || "").replace(/-/g,"/").replace(/[TZ]/g," ").split(".")[0]),
	 

	  diff = (((new Date()).getTime() - date.getTime()) / 1000);

	  console.log(date);

	  diff = diff - 33000 - 10227;//수식이 정확히 적용되지 않아서 보정한 값
	  
	  console.log(diff);

	  if(diff < 0) diff = 0;

	  day_diff = Math.floor(diff / 86400);

	  

	  if ( isNaN(day_diff) || day_diff < 0 )

	   return;

	    

	  return day_diff == 0 && (

	    diff < 60 && "방금전" ||

	    diff < 120 && "1분전" ||

	    diff < 3600 && Math.floor( diff / 60 ) + " 분전" ||

	    diff < 7200 && "1 시간전" ||

	    diff < 86400 && Math.floor( diff / 3600 ) + " 시간전") ||

	   day_diff == 1 && "어제" ||

	   day_diff < 7 && day_diff + " 일전" ||

	   day_diff < 31 && Math.floor( day_diff / 7 ) + " 주전" ||

	   day_diff < 360 && Math.floor( day_diff / 30 ) + " 개월 전" ||

	   day_diff >= 360 && (Math.floor( day_diff / 360 )==0?1:Math.floor( day_diff / 360 )) + " 년 전"

	 }



</script>
</html>