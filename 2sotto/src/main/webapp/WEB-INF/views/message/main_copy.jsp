<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>

<title>슬기로운 반려생활</title>

<%@ include file="/WEB-INF/include/import.jsp"%>


</head>

<body>

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>


	<div class="side_overlay">
		<div class="container">


			<button class="btn btn-primary btn-round"
				onclick="location.href='main.bit'">쪽지</button>
				

			
			<div class="card card-nav-tabs">
				<div class="card-header card-header-primary">
					<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
					<div class="nav-tabs-navigation">
						<div class="nav-tabs-wrapper">
							<ul class="nav nav-tabs" data-tabs="tabs">
								<li class="nav-item"><a class="nav-link active show"
									onclick="location.href='main.bit'" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
										<i class="material-icons">email</i> 받은 쪽지함
										</a></li>
								<li class="nav-item"><a class="nav-link" onclick="location.href='messagePage.bit'"
									data-toggle="tab"> <!-- <i class="material-icons">chat</i> -->
										<i class="material-icons">email</i> 보낸 쪽지함
										</a></li>
								<li class="nav-item"><a class="nav-link" onclick="location.href='write.bit'"
									data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
										<i class="material-icons">email</i> 쪽지 쓰기
										</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="card-body">
					
					<div class="tab-content text-center">
						<div class="tab-pane active show" id="">
							<!---------- 받은쪽지함 ------------------>

							<div class="table-responsive">
							
								<table class="table">
								
								
								
									<thead class=" text-primary">
									<tr>
											<th>쪽지번호</th>
											<th>보낸사람</th>
											<th>내용</th>
											<th class="text-right">받은 날짜</th>
										</tr>
									</thead>
									 <c:forEach var="message" items="${messageList}" >
									<tbody id="message">
									
										<tr>
											<td>${message.msindex}</td>
											<td>${message.suserid}</td>
											  <td onclick="location.href='detail.bit?msindex=${message.msindex}'">${message.content}</td> 
											<!--  <td  data-toggle="modal" data-target="#deleteModal" >${message.content}</td> -->
											<!-- <td data-toggle="modal" data-target="#deleteModal" onClick="$('#createFormId').modal('show')">${message.content}</td> --> 
											<td class="text-right">${message.sendtime}</td>
										</tr>
									</tbody>
									
									</c:forEach> 
								</table>
								
								
								
								
								<!-- 페이징 -->
			<div class="pagination justify-content-center">
			<!-- <nav aria-label="Page navigation example" style="display: none;" id="pagingNav"> -->
					<ul class="pagination" id="pagingview">
						<c:if test="${cpage > 1}">
							<li class="page-item"><a class="page-link"
								href="main.bit?cp=${cpage-1}&ps=${pageSize}"
								cp="${cpage-1}" ps="${pageSize}" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
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
			<!-- 여기까지 페이징처리 -->
							</div>
			
						</div>


						<!-------------- 끝 ---------------->


					</div>
					
				</div>
			</div>
			
			
			
		</div>
		<!-- container end -->
	</div>
	
	
	<!-- Modal -->
	<!--  
<div class="modal" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <c:forEach var="message" items="${messageList}" >
      <div class="modal-header"> 
        <h5 class="modal-title" id="exampleModalLabel">보낸사람: ${message.suserid} </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       내용: ${message.content}
      </div>
      <div class="modal-footer">
  		<button onclick="Delete()" type="button" class="btn btn-primary">삭제하기</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
    	
      </div>
      </c:forEach> 
    </div>

  </div>
</div>
-->
<!-- Modal -->
	

	<!-- side_overlay end -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>

<script>
<!-- Modal에서 삭제 -->
<!--
// 삭제 전 확인 창 띄우기
function Delete() {
  location.replace("delete.bit?msindex=${message.msindex}"); 
  //location.replace("delete.bit"); 
  }
-->
<!-- Modal에서 삭제 --> 




</script>

</body>
</html>

