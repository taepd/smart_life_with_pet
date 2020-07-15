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
				onclick="location.href='writeMedical.bit'">게시글</button>
	 <div class="card-body">
					<div class="tab-content text-center">
						<div class="tab-pane active show" id="donationlist">
							<!---------- 후원게시판 ------------------>

							<div class="table-responsive">
								<table class="table">
									<thead class=" text-primary">
										<tr>
											<th>병원이용 번호</th>
											<th>보호자</th>
											<th>반려동물 이름</th>											
											<th>병원 방문 일시</th>
											<th>병원명</th>
											
											
											

										</tr>
									</thead>
									<c:forEach var="mrecord" items="${mrecordList}">
										<tbody>
											<tr>
												<td>${mrecord.mindex}</td>
												<td><a href="detail.bit?mindex=${mrecord.mindex}&cp=${cpage}&ps=${pageSize}">
															${mrecord.userid}</a></td>
												<td class="text-center">보호자</td>

												<!-- timestamp 날짜시간 표시 포맷 변환 -->
												<%-- <fmt:parseDate var="parseTime" value="${donate.rtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
												<fmt:formatDate var="rtime" value="${parseTime}" pattern="yyyy-MM-dd"/>
												<td class="text-center">${rtime}</td> --%>
												<!-- timestamp 날짜시간 표시 포맷 변환 -->
												
												<td>
												<a href="detail.bit?mindex=${mrecord.mindex}&cp=${cpage}&ps=${pageSize}">${mrecord.petname}</a></td>						
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
												href="main.bit?cp=${cpage-1}&ps=${pageSize}" 
												cp="${cpage-1}" ps="${pageSize}" aria-label="Previous"> 
												<span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
										</c:if>

										<c:forEach var="i" begin="1" end="${pageCount}" step="1">
											<c:choose>
												<c:when test="${cpage==i }">
													<li class="page-item active"><a class="page-link"
														href="medicalMain.bit?cp=${i}&ps=${pageSize}" cp="${i}"
														ps="${pageSize}">${i}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="medicalMain.bit?cp=${i}&ps=${pageSize}" cp="${i}"
														ps="${pageSize}">${i}</a></li>
												</c:otherwise>
											</c:choose>

										</c:forEach>

										<c:if test="${cpage < pageCount}">

											<li class="page-item">
											<a class="page-link" href="medicalMain.bit?cp=${cpage+1}&ps=${pageSize}" 
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
	<!-- 병원 이용 기록 메인  끝-->


	<!-- 접종 기록 메인 시작-->	
	<div class="tab-pane" id="inspectionRecord">              
		<h3>예방 접종 기록</h3>                    
	        <div class="table-responsive">
	             <table class="table">
	                <thead class=" text-primary">
	                	<tr><th> Name </th> <th> Country </th> <th> City </th> <th class="text-right"> Salary </th></tr></thead>
	                	<tbody> <tr> <td> Dakota Rice </td> <td> Niger </td> <td> Oud-Turnhout </td> <td class="text-right"> $36,738 </td>
	                	</tr> <tr> <td> Minerva Hooper </td> <td> Curaçao </td> <td> Sinaai-Waas </td> <td class="text-right"> $23,789 </td> </tr>
	             </table>
	         </div>
	                
	  </div>
	<!-- 접종 기록 메인  끝-->
	
<!-- footer 시작 -->	
	<%@ include file="/WEB-INF/include/footer.jsp"%>
<!-- footer 끝 -->	
</body>
</html>