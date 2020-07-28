<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png"> 
  <title>
   	슬기로운 반려생활
  </title>
   <%@ include file="/WEB-INF/include/admin_nav.jsp"%>

  <!-- 차트  -->
  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
  <!-- 차트  -->
  <!-- 구글 차트 -->
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
  
  <div class="main-panel">
   
      <div class="content">      
        <!-- 차트 뿌려질 부분 시작-->
         
        <div class="row">
 		 <div class="col-lg-12 d-flex">
          <div class="col-lg-4">
            <div class="card ">
              <div class="card-header ">
                <h5 class="card-title">반려동물 종별 비율 차트</h5>
              <!--   <p class="card-category">차트1-1</p> -->
              </div>
              <div class="card-body">
                <div id="petKindCount_piechart" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
			  </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-history"></i> 차트는 언제 업데이트 해야할까요?
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-lg-4">
            <div class="card ">
              <div class="card-header ">
                <h5 class="card-title">일별 가입자 수 현황 차트</h5>
               <!--  <p class="card-category">차트1-2</p> -->
              </div>
              <div class="card-body ">
               <div id="signUpCountbyDay_Linechart" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
			 </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-history"></i> 차트는 언제 업데이트 해야할까요?
                </div>
              </div>
            </div>
          </div>
           <div class="col-lg-4">
            <div class="card ">
              <div class="card-header ">
                <h5 class="card-title">일별 총 결제액 차트</h5>
                <!-- <p class="card-category">차트1-2</p> -->
              </div>
              <div class="card-body ">
                <div id="pCountByDay_ColumnChart" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
			 </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-history"></i> 차트는 언제 업데이트 해야할까요?
                </div>
              </div>
            </div>
          </div>
          


          </div>     
        </div>
       
        <!-- 차트 뿌려질 부분 끝-->
   
    </div>
    <jsp:include page="/WEB-INF/views/admin/admin_common/adm_footer.jsp"/>
  </div>
  
   

 </body>
  <!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/assets/admin_assets/js/core/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/admin_assets/js/core/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/admin_assets/js/core/bootstrap.min.js"></script>
	
<script type="text/javascript">
$(function(){
	
	getPetKindCount();
	signUpCountbyDay();
	pCountByDay();
	
});





var getPetKindCount = function(){
	google.charts.load('current', {'packages':['corechart']});
	google.setOnLoadCallback(drawChart);
	function drawChart() {
	
		
		var chart_data = [["동물 대분류", "비율"]];
		$.each(${getPetKindCount}[0], function(key, value){
			var arr=[key, value];
			chart_data.push(arr);
			 
		}); 
		var data = new google.visualization.arrayToDataTable(chart_data);
		var options = {
				title : "동물 종류 비율",
		        pieHole: 0.4,
			};
		var chart = new google.visualization.PieChart(document.getElementById("petKindCount_piechart"));
		chart.draw(data, options); 
	}
}
	
var signUpCountbyDay = function(){
	google.charts.load('current', {'packages':['corechart']});
	google.setOnLoadCallback(drawChart);
	function drawChart() {
		var chart_data = [["가입 일자", "가입자 "]];
		
		var array = ${signUpCountbyDay};
		for(var i in array){
			var arr = [];
			$.each(array[i], function(key, value){
				arr.push(value);
			}); 
			chart_data.push(arr);			
			
		}
		var data = new google.visualization.arrayToDataTable(chart_data);
		var options = {
				hAxis: {
					title:'가입일',
					logScale: true
				},
				vAxis:{
					title:'가입자 수',
					logScale: false
				},
				colors: ['blue']
				
			};
		var chart = new google.visualization.LineChart(document.getElementById("signUpCountbyDay_Linechart"));
		chart.draw(data, options); 
	}
}


var pCountByDay = function(){
	google.charts.load('current', {'packages':['corechart']});
	google.setOnLoadCallback(drawChart);
	function drawChart() {
		var chart_data = [["결제 일자", "총 결제액"]];
		
		var array = ${pCountByDay};
		for(var i in array){
			var arr = [];
			$.each(array[i], function(key, value){
				arr.push(value);
			}); 
			chart_data.push(arr);			
			
		}
		var data = new google.visualization.arrayToDataTable(chart_data);
		var options = {
			 	trendlines: {
		          0: {type: 'linear', lineWidth: 5, opacity: .3},
		          1: {type: 'exponential', lineWidth: 10, opacity: .3}
		        },
				hAxis: {
					title:'결제일',
					logScale: true
				},
				vAxis:{
					title:'총 결제액',
					logScale: false
				},
				colors: ['blue']
				
			};
		var chart = new google.visualization.ColumnChart(document.getElementById("pCountByDay_ColumnChart"));
		chart.draw(data, options); 
	}
}
	
</script>

</html>