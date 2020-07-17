<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
	<!-- <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet"> -->
	<link href="https://fonts.googleapis.com/css2?family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
    <style type="text/css">
    	.img {
    		height: 100%;
    		width: 100%;
    	}
    	
    	.follow-img-wrapper {
    		 width: 100px;
    		 height: 100px;
    		 float: left;
    		 margin: 10px;
    	}
    	
    	#myPetImage {
    		width: 200px;
    		height: 200px;
    	}
    	
    	/* h3 {
    		margin-bottom: 0;
    		margin-left: 10px;
    	} */
    	
		.h3-korean {
			/* font-family: 'Sunflower', sans-serif; */
			font-family: 'Poor Story', cursive;
			margin-left: 0;
		}
    	
    </style>
</head>

<body>

    <%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
     
    <div class="container">
    	<div class="side_overlay"> 
    		<div class="row">
				<div class="col-3">
					<h3 class="h3-korean">나의 반려동물</h3>
					<div id="myPetImage"></div>
				</div>
				<!-- <div style="background-color: #CDDEED" class="col-3">  -->
				<div class="col-3"> 
					<h3 class="h3-korean" style="color: #FFFFFF">나의 반려동물</h3>
					<select class="custom-select" id="myPetInfo"></select>					
					<div id="myPetSchedule"></div>
				</div>
				<!-- 산책API 시작 -->
	        	<div style="background-color: #91C6F5" class="col-6">
	        		
              <div id="result"></div>

	        	</div>
	        	<!-- 산책API 끝 -->
	        </div>
	        <div class="row">
	        	<div class="col-12">
	        		<h3 class="h3-korean">팔로우하는 동물</h3>
	        		<div>  <!--  style="display: inline-block;" -->
	        			<c:set value="${petLikeList}" var="likeList"/>
						<c:choose>
							<c:when test="${likeList == null}"> <!-- when 안 나오네? 훔... -->
								팔로우하는 동물이 없어요.							
							</c:when>
							<c:otherwise>
				        		<c:forEach items="${likeList}" var="like">
				        			<div class="follow-img-wrapper">
					        			<a href="#">
					        				<img class="rounded-circle img-fluid img" src="${pageContext.request.contextPath}/images/${like.petimg}" 
			 		        					rel="nofollow" alt="${like.petname}">
			 		        			</a>
				        			</div>
				        		</c:forEach>
							</c:otherwise>
						</c:choose>	        			
	        		</div>
	        	</div>
	        </div>
	        <div class="row"> <!--  style="clear: both;" -->
	        	<div class="col-12">
	        		<h3 class="h3-korean">이번주의 인기글 영역</h3>
	        	</div>
	        	<div class="col-12">
	        		<h3 class="h3-korean">도움이 필요해요 영역</h3>
	        	</div>
	        </div>	
	        	  <%-- <!-- section 시작  --> 
	        
	         <div class="section" id="card">
	          <div class="card card-nav-tabs">
				<div class="card-header card-header-primary">
					<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
					<div class="nav-tabs-navigation">
						<div class="nav-tabs-wrapper">
							<ul class="nav nav-tabs" data-tabs="tabs">
								<li class="nav-item"><a class="nav-link active show"
									href="#Home" data-toggle="tab"> <!-- <i class="material-icons">face</i> -->
										<i class="material-icons">home</i> 홈
										<div class="ripple-container"></div>
								</a></li>
								<li class="nav-item"><a class="nav-link" href="#select1"
									data-toggle="tab"> <!-- <i class="material-icons">chat</i> -->
										<i class="material-icons">email</i> 아직 미정
										<div class="ripple-container"></div>
								</a></li>
								<li class="nav-item"><a class="nav-link" href="#select2"
									data-toggle="tab"> <!-- <i class="material-icons">build</i> -->
										<i class="material-icons">email</i> 아직 미정
										<div class="ripple-container"></div>
								</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="card-body">
					<div class="tab-content text-center">
						<div class="tab-pane active show" id="Home">
							<!---------- 관리홈 ------------------>

							<div class="container-fluid" >  <!-- 시작 -->
								
								<h4 align="left">나의 반려동물 비트</h4>
								<div class="row"> 
									
									<div class="col-sm-3">
										<div class="card" style="width: 15rem; height: 14.4rem;">
											<img class="card-img-top"
												src="${pageContext.request.contextPath}/images/sample_dog.jpg"
												rel="nofollow" alt="card image">
											<h4>비트</h4>
										</div>
									</div> 
									
									<br>
									<br>
									
									<div class="col-sm-3">
										<div class="card" style="width: 15rem; height: 14.4rem;">
											<h4>할일</h4>
												<span>귀파기 (오늘)</span>
												<br>
												<span>병원가기(3일전)</span>
												<br>
												<span>목욕하기(7일전)</span>
												<br>
												<span>접종(15일전)</span>
										</div>
									</div> 
									
									<div class="col-sm-6">
										<div class="card" style="width: 30rem; height: 14.4rem;" >
												<h4 class="text-center">오늘의 산책 지수</h4>
												  <div id="result"></div>	
												  
												  <input type="text" class="form-control col-sm-6 " id="myInput" placeholder="seoul" value="${user.userid}">
     											  <input type="button" value="검색"  id="btn"  >
     											
										</div>
									
									</div> 
								
							</div> 
							
							<h4 align="left">내가 팔로우한 동물</h4>
							
								<div class="row"> 
						
									<div class="col-md-2">									
											<img class="rounded-circle img-fluid" alt="Circle Image"
												src="${pageContext.request.contextPath}/images/sample_dog.jpg"
												rel="nofollow" alt="card image">
											<h4>치즈</h4>
										</div>
									 
									<div class="col-md-2">
									<img class="rounded-circle img-fluid" alt="Circle Image"
												src="${pageContext.request.contextPath}/images/sample_dog.jpg"
												rel="nofollow" alt="card image">
											<h4>치즈</h4>
									</div> 
									<div class="col-md-2">
									<img class="rounded-circle img-fluid" alt="Circle Image"
												src="${pageContext.request.contextPath}/images/sample_dog.jpg"
												rel="nofollow" alt="card image">
											<h4>치즈</h4>
									</div> 
									<div class="col-md-2">
									<img class="rounded-circle img-fluid" alt="Circle Image"
												src="${pageContext.request.contextPath}/images/sample_dog.jpg"
												rel="nofollow" alt="card image">
											<h4>치즈</h4>
									</div> 
									<div class="col-md-2">
									<img class="rounded-circle img-fluid" alt="Circle Image"
												src="${pageContext.request.contextPath}/images/sample_dog.jpg"
												rel="nofollow" alt="card image">
											<h4>치즈</h4>
									</div> 
									<div class="col-md-2">
									<img class="rounded-circle img-fluid" alt="Circle Image"
												src="${pageContext.request.contextPath}/images/sample_dog.jpg"
												rel="nofollow" alt="card image">
											<h4>치즈</h4>
									</div> 
									
							
									
							</div> 
							
								<h4 align="left">이번주의 인기글</h4>
								<div class="row"> 
									<div class="col-lg-3">
										<div class="card" style="width: 15rem; height: 14.4rem;">
												<h4>글제목</h4>
												<img class="card-img-top"
													src="${pageContext.request.contextPath}/images/sample_dog.jpg"
													rel="nofollow" alt="card image">
										</div>
									</div> 
									<div class="col-lg-3">
										<div class="card" style="width: 15rem; height: 14.4rem;">
												<h4>글제목</h4>
												<img class="card-img-top"
													src="${pageContext.request.contextPath}/images/sample_dog.jpg"
													rel="nofollow" alt="card image">
										</div>
									</div> 
									<div class="col-lg-3">
										<div class="card" style="width: 15rem; height: 14.4rem;">
												<h4>글제목</h4>
												<img class="card-img-top"
													src="${pageContext.request.contextPath}/images/sample_dog.jpg"
													rel="nofollow" alt="card image">
										</div>
									</div> 
									<div class="col-lg-3">
										<div class="card" style="width: 15rem; height: 14.4rem;">
												<h4>글제목</h4>
												<img class="card-img-top"
													src="${pageContext.request.contextPath}/images/sample_dog.jpg"
													rel="nofollow" alt="card image">
										</div>
									</div> 
							</div>
							
							<h4 align="left">도움이 필요해요</h4>
								<div class="row"> 
									<div class="col-lg-3">
										<div class="card" style="width: 15rem; height: 14.4rem;">
												<h4>글제목</h4>
												<img class="card-img-top"
													src="${pageContext.request.contextPath}/images/sample_dog.jpg"
													rel="nofollow" alt="card image">
										</div>
									</div> 
									<div class="col-lg-3">
										<div class="card" style="width: 15rem; height: 14.4rem;">
												<h4>글제목</h4>
												<img class="card-img-top"
													src="${pageContext.request.contextPath}/images/sample_dog.jpg"
													rel="nofollow" alt="card image">
										</div>
									</div> 
									<div class="col-lg-3">
										<div class="card" style="width: 15rem; height: 14.4rem;">
												<h4>글제목</h4>
												<img class="card-img-top"
													src="${pageContext.request.contextPath}/images/sample_dog.jpg"
													rel="nofollow" alt="card image">
										</div>
									</div> 
									<div class="col-lg-3">
										<div class="card" style="width: 15rem; height: 14.4rem;">
												<h4>글제목</h4>
												<img class="card-img-top"
													src="${pageContext.request.contextPath}/images/sample_dog.jpg"
													rel="nofollow" alt="card image">
										</div>
									</div> 
							</div>  
							
							
						</div>	<!-- 끝 -->


						</div>
						
						<!---------- 회원 반려동물 ------------------>
						<div class="tab-pane" id="select1">
							
							<div class="table-responsive">
								<table class="table">
									<thead class="text">
										<tr>
											<th rowspan="5" style="text-align: center">
												<div class="card" style="width: 20rem;">
													<img class="card-img-top"
														src="${pageContext.request.contextPath}/images/sample_dog.jpg"
														rel="nofollow" alt="card image">
													<h4>비트</h4>
												</div>
												
											</th>
											<td>품종</td>
											<td>치와와</td>
										</tr>
										<tr>
											<td>털색</td>
											<td>흰색</td>
										</tr>
										<tr>
											<td>기간</td>
											<td>1년3개월</td>
										</tr>
										<tr>
											<td>몸무게</td>
											<td>2.8Kg</td>
										</tr>
										<tr>
											<td>성격</td>
											<td>순함,겁많은</td>
										</tr>
										<tr>
											<th rowspan="5" style="text-align: center">
												<div class="card" style="width: 20rem;">
													<img class="card-img-top"
														src="${pageContext.request.contextPath}/images/sample_dog.jpg"
														rel="nofollow" alt="card image">
													<h4>인절미</h4>
												</div>
											</th>
											<td>품종</td>
											<td>시고리안</td>
										</tr>
										<tr>
											<td>털색</td>
											<td>흰색</td>
										</tr>
										<tr>
											<td>기간</td>
											<td>3년3개월</td>
										</tr>
										<tr>
											<td>몸무게</td>
											<td>5.8Kg</td>
										</tr>
										<tr>
											<td>성격</td>
											<td>사나움</td>
										</tr>
										<tr>
											<th rowspan="5" style="text-align: center">
												<div class="card" style="width: 20rem;">
													<img class="card-img-top"
														src="${pageContext.request.contextPath}/images/sample_dog.jpg"
														rel="nofollow" alt="card image">
													<h4>인절미</h4>
												</div>
											</th>
											<td>품종</td>
											<td>알수없음</td>
										</tr>
										<tr>
											<td>털색</td>
											<td>흰색</td>
										</tr>
										<tr>
											<td>기간</td>
											<td>5년3개월</td>
										</tr>
										<tr>
											<td>몸무게</td>
											<td>10.8Kg</td>
										</tr>
										<tr>
											<td>성격</td>
											<td>좋음</td>
										</tr>
									</thead>
								</table>
							</div>

						

						</div>
						
						<!--포인트 사용내역  -->
						<div class="tab-pane" id="select2">
							<div class="table-responsive">
							<table class="table">
								<thead class=" text-primary">
									<tr>
										<th>포인트 내역 번호</th>
										<th>사용 내역</th>
										<th>사용자</th>
										<th>내역시간</th>
										<th>변동포인트</th>
										<th>기타</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td style="cursor:pointer;color:#blue;" onclick="location.href='../point/detail.bit'">포인트 사용</td>
										<!-- 포인트 상세내역까지 보여줄건가용?? 혹시몰라서 연결해용 -->
										<td>보캐슬</td>
										<td>2020.7.5 23:20</td>
										<td>-20 p</td>
										<td>후원 1번글에 후원</td>
									</tr>
									<tr>
										<td>2</td>
										<td>포인트 구매</td>
										<td>보캐슬</td>
										<td>2020.7.5 23:40</td>
										<td>20000 p</td>
										<td></td>
									</tr>
									<tr>
										<td>3</td>
										<td>포인트 획득</td>
										<td>보캐슬</td>
										<td>2020.7.5 23:45</td>
										<td>10</td>
										<td></td>
									</tr>
							</table>
							<div class="table-responsive">
							<table class="table" style="text-align: left">
								<thead class="text ">
									<tr>
										<th>총 게시글 :</th>
										<td><input type="text" name="text" size="130"
											style="width: 100%; border: 0;"></td>
									</tr>
								</thead>
							</table>
						</div>
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-end ">
								<li class="page-item disabled"><a class="page-link"
									href="javascript:;" tabindex="-1">Previous</a></li>
								<li class="page-item"><a class="page-link"
									href="javascript:;">1</a></li>
								<li class="page-item"><a class="page-link"
									href="javascript:;">2</a></li>
								<li class="page-item"><a class="page-link"
									href="javascript:;">3</a></li>
								<li class="page-item"><a class="page-link"
									href="javascript:;">Next</a></li>
							</ul>
						</nav>
							
							
							
							
							

						</div>



						</div>

					</div>


  
				</div>

			</div>
			
	    </div> <!-- section 끝 -->    
	    
	
	    
 </div>  <!-- side_overlay -->
	
</div> <!-- container -->
 --%>
  
		
	</div>
</div>	            
     
	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>

<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js'></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/locale/ko.min.js"></script>


<script type="text/javascript">


// 날씨 API 시작
        $(function () {
   
        let publicAPI = "http://api.openweathermap.org/data/2.5/weather?";
        let data = { lat: ${user.lat}, lon: ${user.lon}, units:"metric", appid: "d2f22ea4bf87f5e2f1c91e3d19c58d8a"};
        $.getJSON(publicAPI, data, function (resp, textStatus, xhr) {
            
        $('#result').empty();
 		/* 날씨API 
        var table = "<table>";
        console.log(resp.weather[0].icon);
        table += "<tr align='center'>";
       	table += "<td rowspan='3' colspan='2' style='background-color:#81DAF5'><div id='icon'><img id='wicon' src='' alt='Weather icon' width='150'></div></td>";
       	table += "<td style='background-color:#81DAF5'>"+ "온도:  " + resp.main.temp + "℃" +"</td>";
       	table += "</tr>";
       	table += "<tr align='center'>";
       	table += "<td style='background-color:#81DAF5'>"+ "날씨:  " + resp.weather[0].main + "</td>";
       	table += "</tr>";
       	table += "<tr align='center'>";
       	table += "<td style='background-color:#81DAF5'>"+ "지역명:  " + resp.name + "</td>";
       	table += "</tr>";
       	table += "<tr align='center'>";
       	table += "<td style='background-color:#FAFAFA'>"+ "풍속:  " +resp.wind.speed + "m/s"  + "</td>";
       	table += "<td style='background-color:#FAFAFA'>"+ "습도:  " + resp.main.humidity+ "%" + "</td>";
       	table += "<td style='background-color:#FAFAFA'>"+ "구름:  " +resp["clouds"].all +"%" + "</td>";
       	table += "</tr>";
        table += "</table>";
		*/
		console.log(resp.weather[0].icon); 
		//사용자 주소 위치(동) 불러오기
		var loc = '${user.loc}'; //사용자 주소 받기
		var arr = loc.split(" ");// 주소를 공백으로 잘라서 배열에 저장
		console.log(arr[2]);
	
		//현재 날짜 불러오기
		let today = new Date();   

		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		let date = today.getDate();  // 날짜
		let day = today.getDay();  // 요일
		
		let Cday = year + '년 ' + month + '월 ' + date + '일'

		
		var table = "<table>";
		table += "<tr align='center'>";
		table += "<td colspan='2'>" + arr[0]+" "+arr[1]+" "+arr[2] + "</td>";
		table += "<td>산책지수</td>";
		table += "<td>"+Cday+"</td>";
		table += "<td> <img src='${pageContext.request.contextPath}/images/weather/wi-thermometer.svg' alt='Weather icon' width='30'>" + resp.main.temp + "℃" +"</td>";
		table += "</tr>";
		table += "<tr align='center'>";
		table += "<td colspan='2' rowspan='3'><img id='walk' src='' alt='Weather icon' width='110'></td>";
		table += "<td colspan='2' rowspan='3'><p>산책하기 너무 좋은날!</p><p>오늘을 놓치지 마세요</p></td>";
		table += "<td> <img id='wicon' src='' alt='Weather icon'width='30'>" + resp.weather[0].main +  "</td>";
		table += "</tr>";
		table += "<tr align='center'>";
		table += "<td> <img src='${pageContext.request.contextPath}/images/weather/wi-strong-wind.svg' alt='Weather icon' width='30'>" +resp.wind.speed + "m/s"  + "</td>";
		table += "</tr>";
		table += "<tr align='center'>";
		table += "<td> <img src='${pageContext.request.contextPath}/images/weather/wi-humidity.svg' alt='Weather icon' width='30'>" + resp.main.humidity+ "%"  + "</td>";
		table += "</tr>";
		table += "</table>";
        $('#result').empty();
        $('#result').append(table);
        $('table').addClass('table');
        var iconcode = resp.weather[0].icon; //테이블 만들고서 이미지를 넣어야한다.
        console.log(iconcode);
        
        switch (iconcode)
        {
          case "01d" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/day-sunny.svg' );
            break;

          case "02d" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/day-cloudy.svg' );
            break;

          case "03d" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/wi-cloud.svg' );
            break;

          case "04d" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/wi-cloudy.svg' );
              break;
              
          case "09d" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/wi-showers.svg' );
              break;

          case "10d" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/wi-day-rain.svg' );
              break;

          case "11d" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/wi-day-thunderstorm.svg' );
              break; 
              
          case "13d" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/wi-snow.svg' );
              break;   
                
          case "50d" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/wi-fog.svg' );
              break;        

          case "01n" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/wi-night-clear.svg' );
              break;

          case "02n" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/wi-night-alt-cloudy.svg' );
              break;
              
          case "03n" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/wi-cloud.svg' );
              break;
              
          case "04n" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/wi-night-cloudy.svg' );
              break;
              
          case "09n" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/wi-night-alt-showers.svg' );
              break;
              
          case "10n" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/wi-night-alt-rain.svg' );
              break;
              
          case "11n" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/wi-night-thunderstorm.svg' );
              break;
              
          case "13n" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/wi-night-showers.svg' );
              break;
              
          case "50n" :
        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/images/weather/wi-night-fog.svg' );
              break;
          
          default :
            document.write ("잘못된 값입니다.");
        };

        var iconcode = resp.weather[0].icon; //테이블 만들고서 이미지를 넣어야한다. 산책 이미지 표시
        console.log(iconcode);  
        switch (iconcode)
        {
          case "01d" :
        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/images/weather/grin-beam-regular.svg' );
            break;

          case "02d" :
        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/images/weather/grin-beam-regular.svg' );
            break;

          case "03d" :
        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/images/weather/grin-beam-regular.svg' );
            break;

          case "04d" :
        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/images/weather/grin-beam-regular.svg' );
              break;
 
          case "01n" :
        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/images/weather/grin-beam-regular.svg' );
              break;

          case "02n" :
        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/images/weather/grin-beam-regular.svg' );
              break;
              
          case "03n" :
        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/images/weather/grin-beam-regular.svg' );
              break;
              
          case "04n" :
        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/images/weather/grin-beam-regular.svg' );
              break;

          default :
        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/images/weather/grin-tears-regular.svg' );
        };
		
    
       
        
		/* 이미지 올려주는 코드
        var iconurl = "http://openweathermap.org/img/w/" + iconcode + ".png"; 
        $('#wicon').attr('src', iconurl);  //테이블 만들고서 이미지를 넣어야한다.
    	이미지 올려주는 코드	*/
       
        
    });

 });
 });


            // 반려동물 정보 영역
            moment.locale('ko');
    		getMyPetName();
    		
    		$('#myPetInfo').change(function() {
    			var whichOne = $('#myPetInfo').val();
    			getMyPetSchedule(whichOne);
    		});
            
        });


     // 나의 반려동물 이름 가져오기
    	function getMyPetName() {
    		$.ajax({
    			type: "get",
    			url: "getSimplePetInfo.bit",
    			data: { userid: '${sessionScope.user.userid}' },
    			success: function(response) {
    				var option = "<option disabled selected>=====선택=====</option>";
    				$.each(response, function(index, element) {
    					option += "<option>" + element + "</option>";
    				});
    				$('#myPetInfo').append(option);
    			}
    		});
    	}

    	// 이름에 따른 반려동물 일정 가져오기
    	function getMyPetSchedule(whichOne) {
    		$.ajax({
    			type: "get",
    			url: "getMyPetSchedule.bit",
    			data: {
    				userid: '${sessionScope.user.userid}',
    				petname: whichOne
    			},
    			success: function(response) {
    				
    				var info = "";
    				var image = "";
    				var now = moment().format("YYYY-MM-DD HH:mm:ss");

    				//참고: https://stackoverrun.com/ko/q/9770534

    				var image;
    				
    				$.each(response, function(index, element) {
        				
    					info += "<p>" + element.title + " (" + moment(moment(element.start)).from(now) + ")</p>";

    					image = element.petimg;
    					//<img src="${pageContext.request.contextPath}/images/${pic.petimg}" class="rounded img-fluid" width="150px" height="150px">
    					/*
    					image += "<img src='${pageContext.request.contextPath}/images/${";
    					image += element.petimg;
    					image += "}' class='rounded img-fluid' width='150px' height='150px'>";
*/
        				});

    				var imageSrc = "<img src='${pageContext.request.contextPath}/images/" + image + "' class='rounded-circle img-fluid img' width='150px' height='150px'>";
    				//console.log("var 확인"+image);

    				//$('#img').text(image);
    				//console.log("image>"+image);
    				$('#myPetSchedule').empty().append(info);
    				$('#myPetImage').empty().append(imageSrc);
    				console.log("SRC: "+imageSrc);
    				console.log("dejavuuuuu");

    			}
    		});
    	}

 //http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=d2f22ea4bf87f5e2f1c91e3d19c58d8a
// 날씨 API 끝
</script>	  
</html>