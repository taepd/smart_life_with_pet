<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/include/import.jsp"%>



 <style type="text/css">
     
.table {
    
    font-weight: bold;
    vertical-align: top;
   
    
            
            
}
       
 

</style>
</head>

<body>

	<div class="side_overlay">

		<!---------- 관리홈 ------------------>

		<div class="container-fluid">
			<!-- 시작 -->
			<div class="row">
			<!--  	${user.lat}
					${user.lon} -->
				<div class="col-sm-6">
					<div class="card" style="width: 30rem; height: 16rem;"> <!-- height:14.4 수정했습니다 -->
						<h4 class="text-center">오늘의 산책 지수</h4>
					
								<!-- <div id="icon"><img id="wicon" src="" alt="Weather icon"></div> -->
								<div id="result"></div>
								
					</div>
				</div>
			</div>

		</div>
	</div>






</body>

<script type="text/javascript">

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
		var table = "<table>";
		table += "<tr align='center'>";
		table += "<td colspan='2'>" + resp.name + "</td>";
		table += "<td>산책지수</td>";
		table += "<td>7월17일</td>";
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



//api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={your api key}
//var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=" + "korea" + "&appid=" + "d2f22ea4bf87f5e2f1c91e3d19c58d8a";
/*
var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat="+"37.5030852"+"&lon="+"127.024766"+ "&appid=" + "d2f22ea4bf87f5e2f1c91e3d19c58d8a";
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {
        console.log(resp);
        console.log("현재온도 : "+ (resp.main.temp- 273.15) );
        console.log("현재습도 : "+ resp.main.humidity);
        console.log("날씨 : "+ resp.weather[0].main );
        console.log("상세날씨설명 : "+ resp.weather[0].description );
        console.log("날씨 이미지 : "+ resp.weather[0].icon );
        console.log("바람   : "+ resp.wind.speed );
        console.log("나라   : "+ resp.sys.country );
        console.log("도시이름  : "+ resp.name );
        console.log("구름  : "+ (resp.clouds.all) +"%" );                 
   	 	}
	});
    
*/
 //http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=d2f22ea4bf87f5e2f1c91e3d19c58d8a

</script>
</html>


