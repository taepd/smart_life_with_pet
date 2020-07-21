<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>

<title>홈_슬기로운 반려생활</title>

<%@ include file="/WEB-INF/include/import.jsp"%>



	

</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<!-- header -->










	<div class="side_overlay">
		<div class="container">

			<button class="btn btn-primary btn-round"
				onclick="location.href='main.bit'">게시글</button>
			<!-- 탭 아이콘 영역 -->
			<!--  탭영역 음....기다린다 -->
			<div class="card card-nav-tabs">
				<div class="card-header card-header-primary">
				
				
				
					<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
					<div class="nav-tabs-navigation">
						<div class="nav-tabs-wrapper">
							<ul class="nav nav-tabs" data-tabs="tabs">
								<li class="nav-item">
									<a class="nav-link active show" onclick="location.href='main.bit'" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
										<i class="material-icons">favorite</i>후원글 메인
									</a>
								</li>
								<!-- <li class="nav-item">
									<a class="nav-link" onclick="location.href='mainbydate.bit'" data-toggle="tab"> <i class="material-icons">chat</i>
										<i class="material-icons">favorite</i>최신순
									</a>
								</li> -->
								<li class="nav-item">
									<a class="nav-link" onclick="location.href='write.bit'" data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
										<i class="material-icons">camera</i>글 작성
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="card-body">
					<div class="tab-content text-center">
						<div class="tab-pane active show" id="donationlist">
							<!---------- 후원게시판 ------------------>

							<div class="table-responsive">
								<table class="table">
									<thead class=" text-primary">
										<tr>
											<th>글번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>등록시간</th>
											<th>완료시간시간</th>
											<th>목표모금액</th>
											<th>현재모금액</th>
											<th>모금률</th>
											<th>모금중</th>
											

										</tr>
									</thead>
								<tbody id="donationtable">
									<c:forEach var="donate" items="${donationList}">
										
											<tr>
												<td>${donate.dindex}</td>
												<td><a href="detail.bit?dindex=${donate.dindex}&cp=${cpage}&ps=${pageSize}">
															${donate.title}</a></td>
												<td class="text-center">관리자</td>

												<!-- timestamp 날짜시간 표시 포맷 변환 -->
												<fmt:parseDate var="parseTime" value="${donate.rtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
												<fmt:formatDate var="rtime" value="${parseTime}" pattern="yyyy-MM-dd"/>
												<td class="text-center">${rtime}</td>
												<!-- timestamp 날짜시간 표시 포맷 변환 -->
												<fmt:parseDate var="parseTime" value="${donate.ctime}" pattern="yyyy-MM-dd HH:mm:ss"/>
												<fmt:formatDate var="ctime" value="${parseTime}" pattern="yyyy-MM-dd"/>
												<td class="text-center">${ctime}</td>
												<td class="text-center">${donate.gcoll}</td>
												<td class="text-center">${donate.ccoll}</td>
												<td class="text-center">
												<fmt:formatNumber value= "${donate.ccoll/donate.gcoll*100}" pattern="#,###" />%
												</td> 
												<td class="text-center">${donate.dstate}</td><!-- 모금완료 여부 표시 -->																
											</tr>
									
										
											
									</c:forEach>
								</tbody>
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
											</a></li>
										</c:if>
									</ul>
									
								</div> 
								<%-- <div class="row">
								<div class="col-sm-12 col-md-5">

									<div class="dataTables_info" id="pagingview"
										role="status" aria-live="polite"> ${pageCount}</div>

								</div>
								<div class="col-sm-12 col-md-7">
									<div class="dataTables_paginate paging_simple_numbers"
										id="pagingview">

										<c:if test="${cpage > 1}">
											<a href="main.bit?cp=${cpage-1}&ps=${pageSize}" cp="${cpage-1}" ps="${pageSize}">이전</a>
										</c:if>
										<!-- page 목록 나열하기 -->
										<c:forEach var="i" begin="1" end="${pageCount}" step="1">
											<c:choose>
												<c:when test="${cpage==i }">
													<font color="red">[${i}]</font>
												</c:when>
												<c:otherwise>
													<a href="main.bit?cp=${i}&ps=${pageSize}" cp="${i}" ps="${pageSize}">[${i}]</a>
												</c:otherwise>
											</c:choose>

										</c:forEach>
										<!--다음 링크 -->
										<c:if test="${cpage < pageCount}">
											<a href="main.bit?cp=${cpage+1}&ps=${pageSize}" cp="${cpage+1}" ps="${pageSize}">다음</a>
										</c:if>
										
									</div>
									<!-- <a href="EmpInsert.emp">사원 등록</a> -->
								</div>
							</div> --%>
							</div>
	
						</div>

						

						


					</div>
				</div>
			</div>
                
		</div>
		<!-- container end -->
	</div>
	<!-- side_overlay end -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
<script type="text/javascript">

$(function(){

	

	
	//페이지 사이즈 비동기
	$('#paging').change(function(){
		let data = {ps : $('#paging option:selected').val(),
				    cp : $('#cp').val() 
		           };		
		$.ajax({
			url:"donationListAjax.bit",
			data: data,
			type:"POST",		
			dataType: "json",
			success:function(responsedata){ 
				 console.log(responsedata);
				$('#donationtable').empty();
				$.each(responsedata.donationList,function(index,obj){	
					$('#donationtable').append(	
							"<tr><td>"+obj.dindex+"</td>" +
							"<td><a href='detail.bit?dindex="+obj.dindex+"&cp=${cpage}&ps=${pageSize}'>" +
								obj.title+"</a></td>" +
							"<td class='text-center'>관리자</td>" +					
							"<td class='text-center'>"+obj.ctime+"</td>"+
							"<td class='text-center'>"+obj.gcoll+"</td>" +
							"<td class='text-center'>"+obj.ccoll+"</td>" +
							"<td class='text-center'>"+

							"</td>" + 
							"<td class='text-center'>" + obj.dstate + "</td>"
					);
				});
				$('#zero_config_info').empty();
				$('#zero_config_info').append("총 부서원 " + responsedata.totaldonatecount);
				console.log("현재 페이지" + responsedata.cpage);
				//페이지 번호 처리
				console.log("타입"+ (typeof responsedata.cpage));
				page(responsedata.cpage);
		   }
			
		
		}); 
	});
	
	//page()
	function page(cp){
		console.log('cp='+cp);
		$('#pagingview').empty();
		var pagesize = $('#paging option:selected').val();
		var totaldonatecount = $('#totaldonatecount').val();

		var pagecount;
		console.log('pagesize= '+pagesize);
		console.log('totaldonatecount= '+ totaldonatecount);
		if((totaldonatecount % pagesize) == 0){
			pagecount = totaldonatecount/pagesize;
		}else if(totaldonatecount/pagesize<1){
			pagecount=1;
		}else{
		
			pagecount = Math.floor(totaldonatecount/pagesize + 1); 
		}
		
		console.log('pagecount = '+pagecount);
		let tmp="";
		console.log('시피 = '+cp);
		if(cp>1){
			tmp +='<a href="main.bit?cp=${cpage-1}&ps='+pagesize+'" cp="'+(cp-1)+'" ps="'+pagesize+'">이전</a>';
		}
		//page 목록 나열하기
		for(var i=1;i<=pagecount; i++){
			if(cp==i){
				tmp +=('<font color="red">['+i+']</font>');
			}else{
				tmp +=('<a href="main.bit?cp='+i+'&ps='+pagesize+'" cp="'+i+'" ps="'+pagesize+'" >['+i+']</a>');
			}
		}
		//다음 링크
		if(cp<pagecount){
			tmp += '<a href="main.bit?cp=${cpage+1}&ps='+pagesize+'" cp="'+(cp+1)+'" ps="'+pagesize+'">다음</a>';
		};
		$('#pagingview').append(tmp);
	};
	
	//페이지 링크 비동기
	$(document).on('click', '#pagingview a', function(e){
		e.preventDefault();
		let data = {ps : $(this).attr('ps'),
			        cp : $(this).attr('cp')
	           };		
	$.ajax({
		url:"donationListAjax.bit",
		data: data,
		type:"POST",		
		//dataType: "json",
		success:function(responsedata){ 
			 console.log(responsedata);
			$('#donationtable').empty();
			$.each(responsedata.emplist,function(index,obj){	
				$('#donationtable').append(	
						"<tr><td>"+obj.dindex+"</td>" +
						"<td><a href='detail.bit?dindex="+obj.dindex+"&cp=${cpage}&ps=${pageSize}'>" +
							obj.title+"</a></td>" +
						"<td class='text-center'>관리자</td>" +

						"<td class='text-center'>"+obj.ctime+"</td>"+
						"<td class='text-center'>"+obj.gcoll+"</td>" +
						"<td class='text-center'>"+obj.ccoll+"</td>" +
						"<td class='text-center'>"+
						"</td>" + 
						"<td class='text-center'>" + obj.dstate + "</td>"
				   
				);
			});
			$('#zero_config_info').empty();
			$('#zero_config_info').append("총 부서원 " + responsedata.totaldonatecount);
			
			//페이지 번호 처리
			page(responsedata.cpage);
	   }
		
	
	}); 
		
	});
});
</script>

</html>