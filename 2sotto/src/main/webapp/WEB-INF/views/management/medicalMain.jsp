<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동물관리 홈</title>
	
	<%@ include file="/WEB-INF/include/import.jsp"%>
  	
    <style>
    
    	.fc-toolbar-title {
    		color: black;
    	}
    	
    	.icons {
    		font-size: 15px;
    		color: orange;
    	}
    
    </style>
    
    
</head>

<body>
	<!-- header 시작 -->
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<!-- header 끝 -->

	<!-- 병원 이용 기록 메인 시작-->	
	<!-- <div class="tab-pane" id="hospitalRecord">

		<h3>병원 방문 기록</h3>                    
	        <div class="table-responsive">
	             <table class="table">
	                <thead class=" text-primary">
	                	<tr><th> Name </th> <th> Country </th> <th> City </th> <th class="text-right"> Salary </th></tr></thead>
	                	<tbody> <tr> <td> Dakota Rice </td> <td> Niger </td> <td> Oud-Turnhout </td> <td class="text-right"> $36,738 </td>
	                	</tr> <tr> <td> Minerva Hooper </td> <td> Curaçao </td> <td> Sinaai-Waas </td> <td class="text-right"> $23,789 </td> </tr>
	              </table>
	
	         </div>
	 </div>	  -->
	 <button class="btn btn-primary btn-round"
		onclick="location.href='medicalRegister.bit'">허허허</button>
	 
	 <div class="container">
	 <div class="card-body">
				<div class="tab-content text-center">
						<div class="tab-pane active show" id="donationlist">
							<!---------- 후원게시판 ------------------>
							<div class="nav-tabs-navigation">
								<div class="nav-tabs-wrapper">
							<ul class="nav nav-tabs" data-tabs="tabs">
								<li class="nav-item">
									<a class="nav-link active show" onclick="location.href='medicalMain.bit'" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
										<i class="material-icons">favorite</i>메인
									</a>
								</li>
								
								<li class="nav-item">
									<a class="nav-link" onclick="location.href='writeMedical.bit'" data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
										<i class="material-icons">camera</i>글 작성
									</a>
								</li>
							</ul>
						</div>
					</div>
					
					
							<div class="table-responsive">
								<table class="table">
									<thead class=" text-primary">
										<tr>
											<th>병원이용 번호</th>
											<th>보호자</th>
											<th>반려동물 이름</th>											
											<th>병원방문목적</th>
											<th>병원 방문 일시</th>
											<th>병원명</th>

										</tr>
									</thead>
									<c:forEach var="mrecord" items="${mrecordList}">
										<tbody>
											<tr>
												<td>${mrecord.mindex}</td>
												<td>${mrecord.userid}</td>
												<td>${mrecord.petname}</td>

												<!-- timestamp 날짜시간 표시 포맷 변환 -->
												<%-- <fmt:parseDate var="parseTime" value="${donate.rtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
												<fmt:formatDate var="rtime" value="${parseTime}" pattern="yyyy-MM-dd"/>
												<td class="text-center">${rtime}</td> --%>
												<!-- timestamp 날짜시간 표시 포맷 변환 -->
												
												<td>
												<a href="getMrecordDetail.bit?mindex=${mrecord.mindex}&cp=${cpage}&ps=${pageSize}">힝힝</a></td>						
												<td class="text-center">${mrecord.vdate}</td>
												<td class="text-center">${mrecord.hname}</td>																													
											</tr>
									
										</tbody>
											
									</c:forEach>
										
								</table>
								 <!-- 페이징  -->
								<div class="pagination justify-content-center">
									<!-- <nav aria-label="Page navigation example" style="display: none;" id="pagingNav"> -->
									<ul class="pagination" id="pagingview">
										<c:if test="${cpage > 1}">
											<li class="page-item"><a class="page-link"
												href="getMrecordList.bit?cp=${cpage-1}&ps=${pageSize}" 
												cp="${cpage-1}" ps="${pageSize}" aria-label="Previous"> 
												<span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
										</c:if>

										<c:forEach var="i" begin="1" end="${pageCount}" step="1">
											<c:choose>
												<c:when test="${cpage==i }">
													<li class="page-item active"><a class="page-link"
														href="getMrecordList.bit?cp=${i}&ps=${pageSize}" cp="${i}"
														ps="${pageSize}">${i}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="getMrecordList.bit?cp=${i}&ps=${pageSize}" cp="${i}"
														ps="${pageSize}">${i}</a></li>
												</c:otherwise>
											</c:choose>

										</c:forEach>

										<c:if test="${cpage < pageCount}">

											<li class="page-item">
											<a class="page-link" href="getMrecordList.bit?cp=${cpage+1}&ps=${pageSize}" 
												cp="${cpage+1}" ps="${pageSize}" aria-label="Next"> 
												<span aria-hidden="true">&raquo;</span> 
												<span class="sr-only">Next</span>
											</a></li>
										</c:if>
									</ul>
									<!-- </nav> -->
								</div>
							</div>
	
						</div>

						<!-------------- 끝 ---------------->


					</div>
				</div>
			</div>
	<!-- 병원 이용 기록 메인  끝-->


	<!-- 접종 기록 메인 시작-->	
	<!-- <div class="tab-pane" id="inspectionRecord">              
		<h3>예방 접종 기록</h3>                    
	        <div class="table-responsive">
	             <table class="table">
	                <thead class=" text-primary">
	                	<tr><th> Name </th> <th> Country </th> <th> City </th> <th class="text-right"> Salary </th></tr></thead>
	                	<tbody> <tr> <td> Dakota Rice </td> <td> Niger </td> <td> Oud-Turnhout </td> <td class="text-right"> $36,738 </td>
	                	</tr> <tr> <td> Minerva Hooper </td> <td> Curaçao </td> <td> Sinaai-Waas </td> <td class="text-right"> $23,789 </td> </tr>
	             </table>
	         </div>
	                
	  </div> -->
	<!-- 접종 기록 메인  끝-->
	
<!-- footer 시작 -->	
	<%@ include file="/WEB-INF/include/footer.jsp"%>
<!-- footer 끝 -->	
</body>
</html>