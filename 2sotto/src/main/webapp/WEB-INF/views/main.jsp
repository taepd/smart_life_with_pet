<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
    
    <%@ include file="/WEB-INF/include/import.jsp"%>
    
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
		
		#result {
			border: 1px solid #EAEAEA;
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
				<div class="col-3"> 
					<h3 class="h3-korean" style="color: #FFFFFF">나의 반려동물</h3>
					<select class="custom-select" id="myPetInfo"></select>					
					<div id="myPetSchedule"></div>
				</div>
				<!-- 산책 API 영역 -->
	        	<div class="col-6">
	        		<h3 class="h3-korean">오늘의 산책지수</h3>
              		<div id="result"></div>
	        	</div>
	        	<!-- /.산책 API 영역 -->
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
					        				<img class="rounded-circle img-fluid img" src="${pageContext.request.contextPath}/assets/images/${like.petimg}" 
			 		        					rel="nofollow" alt="${like.petname}">
			 		        			</a>
				        			</div>
				        		</c:forEach>
							</c:otherwise>
						</c:choose>	        			
	        		</div>
	        	</div>
	        </div>
	        <div class="row">
	        	<div class="col-12">
	        		<h3 class="h3-korean">이번주의 인기글</h3>
	        	</div>
	        	<div class="col-12">
	        		<h3 class="h3-korean">도움이 필요해요</h3>
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
// 날씨 API 시작
	$(function () {
   
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
	
			
			var table = "<table>";
				table += "<tr align='center'>";
					table += "<td colspan='2'>" + arr[0]+" "+arr[1]+" "+arr[2] + "</td>";
					table += "<td>"+Cday+"</td>";
					table += "<td>산책지수</td>";
					table += "<td> <img src='${pageContext.request.contextPath}/assets/images/weather/wi-thermometer.svg' alt='Weather icon' width='30'>" + resp.main.temp + "℃" +"</td>";
				table += "</tr>";
				table += "<tr align='center'>";
					table += "<td colspan='2' rowspan='3'><img id='walk' src='' alt='Weather icon' width='110'></td>";
					table += "<td colspan='2' rowspan='3'><span id='talk'></span></td>";
					table += "<td> <img id='wicon' src='' alt='Weather icon'width='30'>" + resp.weather[0].main +  "</td>";
				table += "</tr>";
				table += "<tr align='center'>";
					table += "<td> <img src='${pageContext.request.contextPath}/assets/images/weather/wi-strong-wind.svg' alt='Weather icon' width='30'>" +resp.wind.speed + "m/s"  + "</td>";
				table += "</tr>";
				table += "<tr align='center'>";
					table += "<td> <img src='${pageContext.request.contextPath}/assets/images/weather/wi-humidity.svg' alt='Weather icon' width='30'>" + resp.main.humidity+ "%"  + "</td>";
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
	        	 $('#talk').html("<p>산책하기 너무 좋은날!</p><p>오늘을 놓치지 마세요</p>");
	            break;
	
	          	case "02d" :
	          	 $('#talk').html("<p>산책하기 너무 좋은날!</p><p>오늘을 놓치지 마세요</p>");
	  		 	    break;
	
	          	case "03d" :
	        	 $('#talk').html("<p>산책하기 너무 좋은날!</p><p>오늘을 놓치지 마세요</p>");
	 	            break;
	
	         	case "04d" :
	        	 $('#talk').html("<p>산책하기 너무 좋은날!</p><p>오늘을 놓치지 마세요</p>");
	            break;
	 
	            case "01n" :
	        	  $('#talk').html("<p>산책하기 너무 좋은날!</p><p>오늘을 놓치지 마세요</p>");
	        	break;
	
	          	case "02n" :
	        	  $('#talk').html("<p>산책하기 너무 좋은날!</p><p>오늘을 놓치지 마세요</p>");
	        	break;
	              
	          	case "03n" :
	        	  $('#talk').html("<p>산책하기 너무 좋은날!</p><p>오늘을 놓치지 마세요</p>");
	        	break;
	              
	          	case "04n" :
	        	  $('#talk').html("<p>산책하기 너무 좋은날!</p><p>오늘을 놓치지 마세요</p>");
	             break;
	
	          	default :
	        	  $('#talk').html("<p>오늘은 반려동물과 </p><p>실내에서 좋은 시간 보내세요!</p>");
	        };
  
			/* 이미지 올려주는 코드
	        var iconurl = "http://openweathermap.org/img/w/" + iconcode + ".png"; 
	        $('#wicon').attr('src', iconurl);  //테이블 만들고서 이미지를 넣어야한다.
	    	이미지 올려주는 코드	*/
       
        
    }); // /.getJSON


    // moment.js 한글 변경
    moment.locale('ko');
	getMyPetName();

	// 반려동물 정보 영역
	$('#myPetInfo').change(function() {
		var whichOne = $('#myPetInfo').val();
		getMyPetSchedule(whichOne);
	});
	
    console.log("로그인한 유저 아이디: "+'${sessionScope.user.userid}');
 }); // /.onload()


 	///////////////////////////////////////////////////////////이하 함수 영역///////////////////////////////////////////////////////////////////

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
        			});

    				var imageSrc = "<img src='${pageContext.request.contextPath}/assets/images/" + image + "' class='rounded-circle img-fluid img' width='150px' height='150px'>";

    				$('#myPetSchedule').empty().append(info);
    				$('#myPetImage').empty().append(imageSrc);
    				console.log("SRC: "+imageSrc);

    			}
    		});
    	}

 //http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=d2f22ea4bf87f5e2f1c91e3d19c58d8a
// 날씨 API 끝
</script>	  
</html>