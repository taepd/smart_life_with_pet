<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!DOCTYPE html>
<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
    
    <%@ include file="/WEB-INF/include/import.jsp"%>
    
    <style type="text/css">
    
    	* {
    		box-sizing: border-box;
    	}
    	.img {
    		height: 100%;
    		width: 100%;
    	}
    	
    	.follow-img-wrapper {
    		 width: 85px;
    		 height: 85px;
    		 float: left;
			 margin: 0px 10px 11px 10px;
    	}
    	
    	#myPetImage {
    		width: 130px;
    		height: 130px;
    	}
    	
		.h3-korean {
			font-family: 'Noto Sans KR', sans-serif;
			margin-left: 0;
			margin-top: 0;
			margin-bottom: 45px;
			color: #9c27b0;
			font-size: 1.8rem;
			letter-spacing: -1.5px;
		}
		
		h4 {
			font-family: 'Noto Sans KR', sans-serif;
		}
		
		#result, #result p {
			/* border: 1px solid #EAEAEA; */
			font-size: 15px;
		}
		
		.row {
			margin-bottom: 20px;
		}
		
		.main-card {
			background-color: #ffffff;
 			box-shadow: rgba(0, 0, 0, 0.08) 0px 20px 40px 0px;
			padding: 30px;
			border-radius: 6px;	
		}
		
		.main-card::-webkit-scrollbar {
			background-color: #ffffff;
			border-radius: 6px;	
		}
		
		.main-card::-webkit-scrollbar-thumb {
			background-color: #f0f0f0;
			border-radius: 10px;
			background-clip: padding-box;
			border: 4px solid transparent;
			
		}
		
		#myPetInfo {
			margin-bottom: 30px;
		}
		
		.main-card card {
			float: left;
		}
    	
    </style>
</head>

<body>

    <%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
     
    <div class="container">
    	<div class="side_overlay"> 
			<div class="row">
				<div class="col-lg-12">
					<h3 style="font-family: 'Noto Serif KR', serif; margin-left: 30px; margin-bottom: 30px; font-size: 36px;">
						어서오세요, ${sessionScope.user.nick} 님!<br>
						오늘도 슬기로운 반려생활 하세요.
					</h3>
							
				</div>
			</div>
			<div class="row">
				<div class="col-lg-7">
					<div class="main-card" style="height: 312px;">
		        		<h3 class="h3-korean">오늘의 산책지수</h3>
	              		<div id="result" class="row align-self-center"></div>
              		</div>
				</div>
				<div class="col-lg-5">
					<div class="main-card" style="height: 312px;">
						<h3 class="h3-korean">나의 반려동물</h3>
						<c:set value="${petList}" var="pet"/>
						<c:choose>
							<c:when test="${empty petList}">
								나의 반려동물을 등록해보세요.
								<div class="text-center" style="margin:30px">
									<button onclick='location.href="${pageContext.request.contextPath}/management/register.bit"' class="btn btn-outline-primary btn-round" >
					        	  			<i class="material-icons">pets</i> 반려동물 등록하기
					        		</button>
								</div>					        		
							</c:when>
							<c:otherwise>
								<div class="row">
									<div class="col-lg-4">
										<div id="myPetImage"></div>
									</div>
									<div class="col-lg-1"></div>
									<div class="col">
										<div id="myPetNameAndSchedule">
											<select class="custom-select" id="myPetInfo">
												<!-- <option disabled selected>=====선택=====</option> -->
												<c:forEach var="pet" items="${pet}" varStatus="status">
													<c:choose>
														<c:when test="${status.index eq 0}">
															<option selected>${pet.petname}</option>
														</c:when>
														<c:otherwise>
															<option>${pet.petname}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										<!-- <a href="management/main.bit?tab=schedule"> -->
											<div id="myPetSchedule" class="text-center"></div>
										<!-- </a> -->
									</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>	

					



				</div>
			</div>			
			<div class="row">
				<div class="col-lg-5">
					<div class=" main-card" style="height: 351px; overflow-y: scroll;">
		        		<h3 class="h3-korean">관심 있는 동물 친구</h3>
		        		<!-- <div> -->
							<div  style="overflow: hidden;">
							<c:set value="${petLikeList}" var="likeList"/>
							<c:choose>
								<c:when test="${empty petLikeList}">
										팔로우하는 동물이 없어요. 찾으러 가볼까요?
								</c:when>
								<c:otherwise>
									<c:forEach items="${likeList}" var="like">
										
					        			<div class="follow-img-wrapper">
						        			<a href="${pageContext.request.contextPath}/mypage/petPage.bit?petindex=${like.petindex}">
						        				<img class="rounded-circle img-fluid img" src="${pageContext.request.contextPath}/assets/images/${like.petimg}" 
				 		        					rel="nofollow" alt="${like.petname}" data-toggle="tooltip" data-placement="bottom" data-original-title="${like.petname}">
				 		        			</a>
				 		        			<!-- <div class="text-center">${like.petname}</div> -->
				 		        			<!-- <h6 style="text-align: center;">${like.petname}</h6> -->
					        			</div>
					        		</c:forEach>
								</c:otherwise>
							</c:choose>	 
							</div>       			
		        		<!-- </div> -->
	        		</div>




					





				</div>
				<div class="col-lg-7">
					<div class="main-card" style="max-height: 350px; overflow: hidden;">
						<h3 class="h3-korean">이번주 인기글</h3>
						<div class="row">
							<!-- <div class="col-lg"></div> -->
						<c:forEach var="post" items="${postList}" varStatus="status">
							<div class="col-lg-6">
				        		<div class="text-center" style="height: 200px">
									<a href="${pageContext.request.contextPath}/blog/detail.bit?bindex=${post.bindex}">
									<img class="d-block w-100" id="p${status.index}" src="${pageContext.request.contextPath}/assets/images/pet_profile.jpg" 
													style="border-radius: 6px; width: 100%; height: 100%;" alt="card image">
												<div>
													<h4>${post.title}</h4>
													<br>
													<span id="contentp${status.index}" style="display: none;">${post.content}</span>
												</div>
									</a>
								</div>
							</div>
						</c:forEach>
						<!-- <div class="col-lg"></div> -->
						</div>
					</div>
				</div> <!-- /.col -->
			</div> <!-- /.row -->

			<div class="row">
				<div class="col-5">



					<div class="main-card" style="height: 350px; width: 100%; display: inline-block;">
						<h3 class="h3-korean">추천 친구</h3>
						<div class="row">
						<div class="col-lg-12">
						<c:choose>
							<c:when test="${empty petList}">
								나의 반려동물을 등록하시면 동물 친구를 추천해 드려요.
							</c:when>
							<c:otherwise>
							<c:forEach var="recomPet" items="${recommendPetList}" varStatus="status">
								<%-- <div>추천 동물: ${recomPet.petname}/ 추천 유형: ${recomPet.recomType}/ 관련 내 반려동물 petindex: ${recomPet.relatedPet}
								이미지: ${recomPet.petimg} --%>
								<!-- </div> -->
								<div class="follow-img-wrapper">
				        			<a href="${pageContext.request.contextPath}/mypage/petPage.bit?petindex=${recomPet.petindex}">
				        				<img class="rounded-circle img-fluid img" src="${pageContext.request.contextPath}/assets/images/${recomPet.petimg}" 
		 		        					rel="nofollow" alt="${recomPet.petname}" data-toggle="tooltip" data-placement="bottom" 
		 		        					data-original-title="${recomPet.recomType == 'dist' ? '근처에 사는 친구예요!' : recomPet.recomType == 'kind' ? '같은 종이에요!' : '나이가 비슷하네요!' }">
			 		        			<%-- <h6 class="text-center">${recomPet.petname}</h6> --%>
		 		        			</a>
		 		        			<!-- <div class="text-center">${like.petname}</div> -->
		 		        			<!-- <h6 style="text-align: center;">${like.petname}</h6> -->
						        </div>
							</c:forEach>
							</c:otherwise>
						</c:choose>
						</div>
						</div>
					</div>
					
					
				
				
				
				</div>
				<div class="col-7">
					<!-- <div class="main-card"> -->
						<div class="main-card" style="height: 350px;">
						<h3 class="h3-korean">도움이 필요해요</h3>
						
						<div class="row">
							<!-- <div class="col-lg"></div> -->
							<c:forEach var="donation" items="${donationList}" varStatus="status">
							<div class="col-lg-6">
				        		<div class="text-center" style="height: 200px">
									<a href="${pageContext.request.contextPath}/donation/detail.bit?dindex=${donation.dindex}">
									<img class="d-block w-100" id="d${status.index}" src="${pageContext.request.contextPath}/assets/images/pet_profile.jpg" 
														style="border-radius: 6px; height: 100%; width: 100%" alt="card image">
												<div>
													<h4>${donation.title}</h4>
													<br>
													<span id="contentd${status.index}" style="display: none;">${donation.content}</span>
												</div>
									</a>
								</div>
							</div>
							</c:forEach>
							<!-- <div class="col-lg"></div> -->
						</div>
						</div>
						</div>
						
		
								


							<%-- 	

								<c:forEach var="donation" items="${donationList}" varStatus="status">
									<div class="carousel-item">
										<a href="${pageContext.request.contextPath}/donation/detail.bit?dindex=${donation.dindex}">
											<img class="d-block w-100" id="d${status.index}" src="${pageContext.request.contextPath}/assets/images/pet_profile.jpg" 
														style="width:200px;height:200px" alt="card image">
											<div class="carousel-caption d-none d-md-block">
												<strong>${donation.title}</strong>
												<span id="contentd${status.index}">${donation.content}</span>
											</div>
										</a>
									</div>
								</c:forEach>
 --%>





								  <!-- <img class="d-block w-100" src="./assets/img/bg2.jpg" alt="First slide"> -->
								 
							<!-- 	</div>





								<div class="carousel-item active carousel-item-left">
								  <img class="d-block w-100" src="./assets/img/bg3.jpg" alt="Second slide">
								  <div class="carousel-caption d-none d-md-block">
									<h4>
									  <i class="material-icons">location_on</i>
									  Somewhere Beyond, United States
									</h4>
								  </div>
								</div>
								<div class="carousel-item carousel-item-next carousel-item-left">
								  <img class="d-block w-100" src="./assets/img/bg.jpg" alt="Third slide">
								  <div class="carousel-caption d-none d-md-block">
									<h4>
									  <i class="material-icons">location_on</i>
									  Yellowstone National Park, United States
									</h4>
								  </div>
								</div>
							  </div>



							  캐러셀 버튼
							  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
								<i class="material-icons">keyboard_arrow_left</i>
								<span class="sr-only">Previous</span>
							  </a>
							  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
								<i class="material-icons">keyboard_arrow_right</i>
								<span class="sr-only">Next</span>
							  </a>
							</div>
						</div>
						
						
						
						
					</div> -->
						
						
						
						
						
						
						
						
					<!-- </div> -->
				</div>
			</div>

		</div> <!-- /.side_overlay -->
	</div> <!-- /.container --> 	            
     
	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>

<!-- moment.js -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js'></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/locale/ko.min.js"></script>

<script type="text/javascript">

	$(function () {

		//블로그 이미지 위치 조정 함수
		replaceImg_post('p');
		replaceImg_donation('d');
		shortContent('p');	
		shortContent('d');	

		// 날씨 API 시작
		 
		let publicAPI = "http://api.openweathermap.org/data/2.5/weather?"; 
        let data = { lat: ${user.lat}, lon: ${user.lon}, units:"metric", appid: "d2f22ea4bf87f5e2f1c91e3d19c58d8a"};

        $.getJSON(publicAPI, data, function (resp, textStatus, xhr) {
            
	        $('#result').empty();
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
			
			let Cday = year + '년 ' + month + '월 ' + date + '일';

			var table = "<div class='col-lg-3 text-center'>";
					/* 얼굴 아이콘 */
					table += "<img id='walk' src='' alt='Weather icon' width='100'>";
				table += "</div>";




				table += "<div class='col-lg-4'>"
					table += "<div class='row' style='margin-left:5px'><p>";
						/* 지역 */
						table += arr[0]+" "+arr[1]+" "+arr[2];
						table += "</p><p>";
						/* 한글 메시지 */
						table += "<span id='talk'></span></p>";
					table += "</div>";
				table += "</div>";




				/* table += "<div class='col-lg-3'>";
					table += "<div class='row'><p>";
						/* 날짜 */
						/* table += Cday;
						table += "</p><p>"; */
					/* 지역 */
					/* table += arr[0]+" "+arr[1]+" "+arr[2];
					table += "</p></div>";
				table += "</div>"; */
 



				table += "<div class='col-lg-3'>";
					/* 기상 아이콘 */
					table += "<div class='row'>";
					table += "<p><img id='wicon' src='' alt='Weather icon'width='30'>" + resp.weather[0].main;
					table += "</p><p>";
					/* 풍속 */
					table += "<img src='${pageContext.request.contextPath}/assets/images/weather/wi-strong-wind.svg' alt='Weather icon' width='30'>" +resp.wind.speed + "m/s";
				table += "</p></div>";
				table += "</div>";






				table += "<div class='col-lg-2'>";
					table += "<div class='row'>"
					/* 습도 */
					table += "<p><img src='${pageContext.request.contextPath}/assets/images/weather/wi-humidity.svg' alt='Weather icon' width='30'>" + resp.main.humidity+ "%";
					/* 기온 */
					table += "</p><br><p><img src='${pageContext.request.contextPath}/assets/images/weather/wi-thermometer.svg' alt='Weather icon' width='30'>" + resp.main.temp + "℃";
					table += "</p></div>";
				table += "</div>";

			// table += "</div>";
	        $('#result').empty();
	        $('#result').append(table);
	        // $('table').addClass('table');
	        // $('table').css('margin-bottom', '0');
	        var iconcode = resp.weather[0].icon; //테이블 만들고서 이미지를 넣어야한다.
	        console.log(iconcode);
	        
	        switch (iconcode)
	        {
	          case "01d" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/day-sunny.svg' );
	            break;
	
	          case "02d" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/day-cloudy.svg' );
	            break;
	
	          case "03d" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/wi-cloud.svg' );
	            break;
	
	          case "04d" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/wi-cloudy.svg' );
	              break;
	              
	          case "09d" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/wi-showers.svg' );
	              break;
	
	          case "10d" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/wi-day-rain.svg' );
	              break;
	
	          case "11d" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/wi-day-thunderstorm.svg' );
	              break; 
	              
	          case "13d" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/wi-snow.svg' );
	              break;   
	                
	          case "50d" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/wi-fog.svg' );
	              break;        
	
	          case "01n" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/wi-night-clear.svg' );
	              break;
	
	          case "02n" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/wi-night-alt-cloudy.svg' );
	              break;
	              
	          case "03n" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/wi-cloud.svg' );
	              break;
	              
	          case "04n" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/wi-night-cloudy.svg' );
	              break;
	              
	          case "09n" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/wi-night-alt-showers.svg' );
	              break;
	              
	          case "10n" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/wi-night-alt-rain.svg' );
	              break;
	              
	          case "11n" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/wi-night-thunderstorm.svg' );
	              break;
	              
	          case "13n" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/wi-night-showers.svg' );
	              break;
	              
	          case "50n" :
	        	  $('#wicon').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/wi-night-fog.svg' );
	              break;
	          
	          default :
	            document.write ("잘못된 값입니다.");
	        };
	
	        var iconcode = resp.weather[0].icon; //테이블 만들고서 이미지를 넣어야한다. 산책 이미지 표시
	        console.log(iconcode);  
	        switch (iconcode)
	        {
	          case "01d" :
	        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/grin-beam-regular.svg' );
	            break;
	
	          case "02d" :
	        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/grin-beam-regular.svg' );
	            break;
	
	          case "03d" :
	        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/grin-beam-regular.svg' );
	            break;
	
	          case "04d" :
	        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/grin-beam-regular.svg' );
	              break;
	 
	          case "01n" :
	        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/grin-beam-regular.svg' );
	              break;
	
	          case "02n" :
	        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/grin-beam-regular.svg' );
	              break;
	              
	          case "03n" :
	        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/grin-beam-regular.svg' );
	              break;
	              
	          case "04n" :
	        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/grin-beam-regular.svg' );
	              break;
	
	          default :
	        	  $('#walk').attr ('src' ,'${pageContext.request.contextPath}/assets/images/weather/grin-tears-regular.svg' );
	        };

	        //산책지수 문구.
	        var iconcode = resp.weather[0].icon;
	        console.log(iconcode);  
	        switch (iconcode)
	        {

	        	case "01d" :
	        	 $('#talk').html("산책하기 좋아요!<br>오늘을 놓치지 마세요 :)");
	            break;
	
	          	case "02d" :
	          	 $('#talk').html("산책하기 좋아요!<br>오늘을 놓치지 마세요 :)");
	  		 	    break;
	
	          	case "03d" :
	        	 $('#talk').html("산책하기 좋아요!<br>오늘을 놓치지 마세요 :)");
	 	            break;
	
	         	case "04d" :
	        	 $('#talk').html("산책하기 좋아요!<br>오늘을 놓치지 마세요 :)");
	            break;
	 
	            case "01n" :
	        	  $('#talk').html("산책하기 좋아요!<br>오늘을 놓치지 마세요 :)");
	        	break;
	
	          	case "02n" :
	        	  $('#talk').html("산책하기 좋아요!<br>오늘을 놓치지 마세요 :)");
	        	break;
	              
	          	case "03n" :
	        	  $('#talk').html("산책하기 좋아요!<br>오늘을 놓치지 마세요 :)");
	        	break;
	              
	          	case "04n" :
	        	  $('#talk').html("산책하기 좋아요!<br>오늘을 놓치지 마세요 :)");
	             break;
	
	          	default :
	        	  $('#talk').html("오늘은 실내에서<br>시간을 보내요.");
	        };
  
			/* 이미지 올려주는 코드
	        var iconurl = "http://openweathermap.org/img/w/" + iconcode + ".png"; 
	        $('#wicon').attr('src', iconurl);  //테이블 만들고서 이미지를 넣어야한다.
	    	이미지 올려주는 코드	*/
       
        
    }); // /.getJSON


   //http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=d2f22ea4bf87f5e2f1c91e3d19c58d8a
   // 날씨 API 끝
    

    // moment.js 한글 변경
    moment.locale('ko');
	//getMyPetName(); 동기화로 전환해서 사용 안함
	
	//최초 로딩시 기본 첫 동물 정보 보이게 설정
	var whichOne = $('#myPetInfo').val();
	console.log('위치원'+whichOne);
	getMyPetSchedule(whichOne);
	
	// 반려동물 정보 영역
	$('#myPetInfo').change(function() {
		var whichOne = $('#myPetInfo').val();
		console.log('위치원'+whichOne);
		getMyPetSchedule(whichOne);
	});
	
    console.log("로그인한 유저 아이디: "+'${sessionScope.user.userid}');
 }); 

 
 

 	///////////////////////////////////////////////////////////이하 함수 영역///////////////////////////////////////////////////////////////////

     // 나의 반려동물 이름 가져오기
     // 동기화로 전환해서 사용 안함
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
    			async:false,
    			success: function(response) {
				    if(response!=""){ //일정이 하나라도 등록됐다면
	    				var info="";
	    				var image;
	    				var now = moment().format("YYYY-MM-DD HH:mm:ss");
	
	    				//참고: https://stackoverrun.com/ko/q/9770534
	    				
	    				$.each(response, function(index, element) {
	    					info += "<p>" + element.title + " (" + moment(moment(element.start)).format('MM월 DD일') + ")</p>";
	    					image = element.petimg;
	    					petindex = element.petindex;
	    					
	        			});
				    }else{ //일정이 하나도 없다면
				    	//console.log('${petList[0]}');
				    	<c:forEach items="${petList}" var="pet">  
				    		if(whichOne =='${pet.petname}'){
						    	image = '${pet.petimg}';
						    	petindex = '${pet.petindex}';
				    		}
				    	</c:forEach>
					        info = `<p class="text-center">다가올 일정이 없습니다.</p>
					        		<button onclick='location.href="${pageContext.request.contextPath}/management/main.bit?tab=schedule"' class="btn btn-outline-primary btn-round" >
					        	  		<i class="material-icons">calendar_today</i> 일정 등록하기
					        		</button>`;  
				    	
				    }
					//(추가)반려동물 마이페이지 링크 래핑함
    				var imageSrc = "<a href='${pageContext.request.contextPath}/mypage/petPage.bit?petindex="+ petindex + "'>" +
        							"<img src='${pageContext.request.contextPath}/assets/images/" + image + 
        							"' class='rounded-circle img-fluid img' width='150px' height='150px'></a>";

    				$('#myPetSchedule').html(info);
    				$('#myPetSchedule p').css('font-size', '16px');
    				$('#myPetImage').empty().append(imageSrc);
    				//console.log("SRC: "+imageSrc);

    			}
    		});
    	}


/**
* @함수명 : replaceImg()
* @작성일 : 2020. 7. 17.
* @작성자 : 태영돈
* @설명 :이미지 위치 디자인(조정/삭제)을 위한 함수
* @param void
**/

function replaceImg_post(list){ 
	for(var i =0; i<${fn:length(postList)}; i++){ //현재 페이지 포스팅 갯수만큼 for문
	    var imgs = $('#content'+list+i+' img'); //포스팅 내용 중 img 태그를 찾아서 배열로 저장
	    var imgSrcs = [];
	    for (var j = 0; j < imgs.length; j++) { //img 개수만큼 for문
	        imgSrcs.push(imgs[j].src); //src값 즉, 이미지 경로를 imgSrcs배열에 저장
			console.log(imgs[j]);    
			imgs[j].parentNode.removeChild(imgs[j]);//기존 내용 중 img태그들은 미리보기시 지저분하므로 삭제
			  
	    }
		console.log("imgSrcs: "+ imgSrcs[0]);
		$('#'+list+i+'').attr("src", imgSrcs[0]); //블로그 리스트 오른쪽 썸네일 영역에 올린 이미지 중 첫 번째 사진 표시
	}
} 

function replaceImg_donation(list){ 
	for(var i =0; i<${fn:length(postList)}; i++){ //현재 페이지 포스팅 갯수만큼 for문
	    var imgs = $('#content'+list+i+' img'); //포스팅 내용 중 img 태그를 찾아서 배열로 저장
	    var imgSrcs = [];
	    for (var j = 0; j < imgs.length; j++) { //img 개수만큼 for문
	        imgSrcs.push(imgs[j].src); //src값 즉, 이미지 경로를 imgSrcs배열에 저장
			console.log(imgs[j]);    
			imgs[j].parentNode.removeChild(imgs[j]);//기존 내용 중 img태그들은 미리보기시 지저분하므로 삭제
			  
	    }
		console.log("imgSrcs: "+ imgSrcs[0]);
		$('#'+list+i+'').attr("src", imgSrcs[0]); //블로그 리스트 오른쪽 썸네일 영역에 올린 이미지 중 첫 번째 사진 표시
		console.log(">>>"+$('#'+list+i+''));
	}
} 

//포스팅 내용의 일부만 노출시키는 함수
function shortContent(tag){
	for(var i =0; i<${fn:length(postList)}; i++){ 
		$('#content'+tag+i+'').text($('#content'+tag+i+'').text().substring(0,30));
	}
}


</script>	  
</html>