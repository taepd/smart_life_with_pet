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
    border-bottom: 3px solid blue;
    
            
            
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
					<div class="card" style="width: 30rem; height: 14.4rem;">
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
        //let data = { q: $('#myInput').val(), units:"metric", appid: "d2f22ea4bf87f5e2f1c91e3d19c58d8a"};
        let data = { lat: ${user.lat}, lon: ${user.lon}, units:"metric", appid: "d2f22ea4bf87f5e2f1c91e3d19c58d8a"};
        $.getJSON(publicAPI, data, function (resp, textStatus, xhr) {
            
        $('#result').empty();
        // console.log(data.weather);
        // console.log(data.weather[0].description);
        // console.log(data.weather[0]);

        var table = "<table>";
        //table += "<tr><td>지역명</td><td>날씨</td><td>상세보기</td><td>바람</td><td>구름</td><td>온도</td></tr>";
        //table += "<tr><td>그림</td><td>지역명</td><td>날씨</td><td>온도</td><td>습도</td><td>구름</td></tr>";
		//table += "<tr><td rowspan='3' colspan='2'>이미지</td><td>온도</td></tr><tr><td>날씨</td></tr><tr><td>지역명</td></tr><tr><td>풍속</td><td>습도</td><td>구름</td></tr>";
        //table += "<tr><td rowspan='3' colspan='2'>이미지</td><td>온도</td></tr><tr><td>날씨</td></tr><tr><td>지역명</td></tr><tr><td>풍속</td><td>습도</td><td>구름</td></tr>";
        ///console.log("data.weather[0].des==="+data.weather[0].description);//o
        // console.log("data.wind.speed==="+data.wind.speed);//0
        ///console.log("data.weather[0].main==="+data.weather[0].main);//o
        // console.log("data[clouds].all==="+data["clouds"].all); //o
        /*
        console.log(data.weather[0].icon);
        table += "<tr>";
        table += "<td>" + data.name + "</td>";
        table += "<td>" + data.weather[0].main + "</td>";
        table += "<td>" + data.weather[0].description + "</td>";
        table += "<td>" + data.wind.speed + "</td>";
        table += "<td>" + data["clouds"].all + "</td>";
        table += "<td>" + data.main.temp+ "℃" + "</td>";
        table += "</tr>";
        table += "</table>";
        */
        /*
        console.log(resp.weather[0].icon);
        table += "<tr>"; 
        table += "<td>" + resp.name + "</td>"; //지역명
        table += "<td>" + resp.weather[0].main + "</td>"; //날씨
        table += "<td>" + resp.weather[0].description + "</td>"; //상세보기
        table += "<td>" + resp.wind.speed + "</td>"; //바람
        table += "<td>" + resp["clouds"].all + "</td>"; //구름
        table += "<td>" + resp.main.temp+ "℃" + "</td>"; //온도
        table += "<td>" + resp.weather[0].icon + "</td>"; //이미지
        table += "</tr>";
        table += "</table>";
        */
        console.log(resp.weather[0].icon);
        table += "<tr align='center'>";
       	table += "<td rowspan='3' colspan='2' style='background-color:#81DAF5'><div id='icon'><img id='wicon' src='' alt='Weather icon' width='100'></div></td>";
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

        $('#result').empty();
        $('#result').append(table);
        //$('#result').prepend(table);
        $('table').addClass('table');
        var iconcode = resp.weather[0].icon; //테이블 만들고서 이미지를 넣어야한다.
        var iconurl = "http://openweathermap.org/img/w/" + iconcode + ".png"; 
        $('#wicon').attr('src', iconurl);  //테이블 만들고서 이미지를 넣어야한다.
     
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


