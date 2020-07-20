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
									<c:forEach var="donate" items="${donateList}">
										<tbody id="donationtable">
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
									
										</tbody>
											
									</c:forEach>
										
								</table>
								<!--  donate main ajax body-->
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

						

						<!-- <div class="tab-pane" id="reply">
							-------- 댓글많은순 ----------------

							<div class="table-responsive">
								<table class="table">
									<thead class=" text-primary">
										<tr>
											<th>글번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>등록시간</th>
											<th>조회수</th>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td style="cursor:pointer;color:#blue;" onclick="location.href='qaView.bit'">후원이 필요합니다.</td>
											<td>쿼리안</td>
											<td>2020.07.06</td>
											<td>1</td>
										</tr>
										<tr>
											<td>2</td>
											<td>후원이 필요합니다.</td>
											<td>쿼리안</td>
											<td>2020.07.06</td>
											<td>1</td>
										</tr>
										<tr>
											<td>3</td>
											<td>후원이 필요합니다.</td>
											<td>쿼리안</td>
											<td>2020.07.06</td>
											<td>1</td>
										</tr>
										<tr>
											<td>4</td>
											<td>후원이 필요합니다.</td>
											<td>쿼리안</td>
											<td>2020.07.06</td>
											<td>1</td>
										</tr>
								</table>
							</div>



						</div>

						-------- 좋아요 많은순 ----------------
						<div class="tab-pane" id="favorite">

							<div class="table-responsive">
								<table class="table">
									<thead class=" text-primary">
										<tr>
											<th>글번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>등록시간</th>
											<th>조회수</th>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td style="cursor:pointer;color:#blue;" onclick="location.href='qaView.bit'">후원이 필요합니다.</td>
											<td>lim</td>
											<td>2020.07.06</td>
											<td>1</td>
										</tr>
										<tr>
											<td>2</td>
											<td>후원이 필요합니다.</td>
											<td>lim</td>
											<td>2020.07.06</td>
											<td>1</td>
										</tr>
										<tr>
											<td>3</td>
											<td>후원이 필요합니다.</td>
											<td>lim</td>
											<td>2020.07.06</td>
											<td>1</td>
										</tr>
										<tr>
											<td>4</td>
											<td>후원이 필요합니다.</td>
											<td>lim</td>
											<td>2020.07.06</td>
											<td>1</td>
										</tr>
								</table>
							</div>



						</div> -->


						<!-------------- 끝 ---------------->


					</div>
				</div>
			</div>
                
		</div>
		<!-- container end -->
	</div>
	<!-- side_overlay end -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>

<!-- donation main.jsp body 및 ajax script-->
<script type="text/javascript">


/* $(function(){
	
	//페이지 링크 비동기
	$(document).on('click', '.page-item a', function(e){
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
				$.each(responsedata.donationList,function(index,obj){	
					var rtime = obj.rtime.substring(0,10);
					var ctime = obj.ctime.substring(0,10);
					console.log(rtime);
					console.log('타입: ' + typeof obj.rtime);
					console.log('오브즈: '+obj.rtime);
					$('#donationtable').append(	
							"<tr><td>"+obj.dindex+"</td>" +
							"<td><a href='detail.bit?dindex='"+obj.dindex+"'&cp=${cpage}&ps=${pageSize}>" +
								obj.title +"</a></td>" +
							"<td class='text-center'>관리자</td>" +		
							"<td class='text-center'>"+rtime+"</td>"+
							"<td class='text-center'>"+ctime+"</td>"+
							"<td class='text-center'>"+obj.gcoll+"</td>" +
							"<td class='text-center'>"+obj.ccoll+"</td>" +
							"<td class='text-center'>"+
							"<td class='text-center'>"+obj.ccoll+"</td>" +
							"<td> "+(obj.ccoll/obj.gcoll*100).toLocaleString() + 
							"</td>"% +
							"<td class='text-center'>" + obj.dstate + "</td>"
						   
						);
					});
					$('#zero_config_info').empty();
					$('#zero_config_info').append("총 기부글 " + responsedata.totaldonatecount);
					console.log("현재 페이지" + responsedata.cpage);
				
				//페이지 번호 처리
				page(responsedata.cpage);
		   }
			
		
		}); 
		
	});
 */
	

/* 	$('#paging').change(function(){
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
							"<td class='text-center'>"+obj.ccoll+"</td>" +
							
							"</td>" + 
							"<td class='text-center'>" + obj.dstate + "</td>"
							
					);
					console.log('오브즈'+obj.dstate);
				});
				$('#zero_config_info').empty();
				$('#zero_config_info').append("총 기부글 " + responsedata.totaldonatecount);
				console.log("현재 페이지" + responsedata.cpage);
				//페이지 번호 처리
				console.log("타입"+ (typeof responsedata.cpage));
				page(responsedata.cpage);
		   }
			
		
		}); 
	}); */

	//page()
	function page(cp){
		console.log('cp='+cp);
		$('#zero_config_paginate').empty();
		var pageSize = $('#paging option:selected').val();
		var totaldonatecount = $('#totaldonatecount').val();

		var pageCount;
		console.log('pageSize= '+pageSize);
		console.log('totaldonatecount= '+ totaldonatecount);
		if((totaldonatecount % pageSize) == 0){
			pageCount = totaldonatecount/pageSize;
		}else if(totaldonatecount/pageSize<1){
			pageCount=1;
		}else{
		
			pageCount = Math.floor(totaldonatecount/pageSize + 1); 
		}
		
		console.log('pageCount = '+pageCount);
		let tmp="";
		console.log('시피 = '+cp);
		if(cp>1){
			tmp +='<a href="main.bit?cp=${cpage-1}&ps='+pageSize+'" cp="'+(cp-1)+'" ps="'+pageSize+'">이전</a>';
		}
		//page 목록 나열하기
		for(var i=1;i<=pageCount; i++){
			if(cp==i){
				tmp +=('<font color="red">['+i+']</font>');
			}else{
				tmp +=('<a href="main.bit?cp='+i+'&ps='+pageSize+'" cp="'+i+'" ps="'+pageSize+'" >['+i+']</a>');
			}
		}
		//다음 링크
		if(cp<pageCount){
			tmp += '<a href="main.bit?cp=${cpage+1}&ps='+pageSize+'" cp="'+(cp+1)+'" ps="'+pageSize+'">다음</a>';
		};
		$('#zero_config_paginate').append(tmp);
	};

});

// js 포맷팅용 커스텀 함수. 혹시 몰라 남겨둠
/* Date.prototype.format = function (f) {

    if (!this.valueOf()) return " ";



    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];

    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];

    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

    var d = this;



    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {

        switch ($1) {

            case "yyyy": return d.getFullYear(); // 년 (4자리)

            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)

            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)

            case "dd": return d.getDate().zf(2); // 일 (2자리)

            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)

            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)

            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)

            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)

            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)

            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)

            case "mm": return d.getMinutes().zf(2); // 분 (2자리)

            case "ss": return d.getSeconds().zf(2); // 초 (2자리)

            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분

            default: return $1;

        }

    });

}; */

</script>

</html>