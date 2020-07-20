<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
   	슬기로운 반려생활
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/admin_assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/assets/admin_assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />

  <!--  JQuery 추가 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
   <!-- JS -->
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>


	<!-- 차트 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>



</head>
<body>
  <div class="wrapper ">
      <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="/" class="simple-text logo-mini">
          <div class="logo-image-small">
            <img src="${pageContext.request.contextPath}/admin_assets/img/logo-small.png">
          </div>
        </a>
        <a href="/" class="simple-text logo-normal">
          슬기로운 반려생활
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="active ">
            <a href="adminMain.bit">
              <i class="nc-icon nc-spaceship"></i>
              <p>대시보드</p>
            </a>
          </li>
          <li>
            <a href="userTable.bit">
              <i class="nc-icon nc-single-02"></i>
              <p>유저 리스트</p>
            </a>
          </li>
          <li>
            <a href="">
              <i class="nc-icon nc-diamond"></i>
              <p>동물 리스트</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
  <div class="main-panel">
      <jsp:include page="/WEB-INF/views/admin/admin_common/adm_nav.jsp"/>
      
      <div class="content">
        <div class="row">
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="nc-icon nc-globe text-warning"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <p class="card-category">동물 DB</p>
                      <p class="card-title"><a href="SaveDataToDB.book"> 동물 DB 저장하기</a><p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-refresh"></i>
                  Update Now
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="nc-icon nc-money-coins text-success"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <p class="card-category">테스트</p>
                      <p class="card-title">테스트<p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-calendar-o"></i>
                  Last day
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="nc-icon nc-vector text-danger"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <p class="card-category">Errors</p>
                      <p class="card-title">23<p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-clock-o"></i>
                  In the last hour
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="nc-icon nc-favourite-28 text-primary"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <p class="card-category">Followers</p>
                      <p class="card-title">+45K<p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-refresh"></i>
                  Update now
                </div>
              </div>
            </div>
          </div>
        </div>
        
        
        
        <!-- 차트 뿌려질 부분 -->
        <div class="row">
          <div class="col-md-12">
            <div class="card ">
              <div class="card-header ">
                <h5 class="card-title">실시간 회원 수</h5>
                <p class="card-category">24 Hours performance</p>
              </div>
              <div class="card-body ">
              
              <!-- 
                <canvas id=chartHours width="400" height="100"></canvas>
               -->
                
                <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto">

				</div>
                
                
                
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-history"></i> Updating every 5 seconds
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4">
            <div class="card ">
              <div class="card-header ">
                <h5 class="card-title">Email Statistics</h5>
                <p class="card-category">Last Campaign Performance</p>
              </div>
              <div class="card-body ">
                <canvas id="chartEmail"></canvas>
              </div>
              <div class="card-footer ">
                <div class="legend">
                  <i class="fa fa-circle text-primary"></i> Opened
                  <i class="fa fa-circle text-warning"></i> Read
                  <i class="fa fa-circle text-danger"></i> Deleted
                  <i class="fa fa-circle text-gray"></i> Unopened
                </div>
                <hr>
                <div class="stats">
                  <i class="fa fa-calendar"></i> Number of emails sent
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-8">
            <div class="card card-chart">
              <div class="card-header">
                <h5 class="card-title">NASDAQ: AAPL</h5>
                <p class="card-category">Line Chart with Points</p>
              </div>
              <div class="card-body">
                <canvas id="speedChart" width="400" height="100"></canvas>
              </div>
              <div class="card-footer">
                <div class="chart-legend">
                  <i class="fa fa-circle text-info"></i> Tesla Model S
                  <i class="fa fa-circle text-warning"></i> BMW 5 Series
                </div>
                <hr />
                <div class="card-stats">
                  <i class="fa fa-check"></i> Data information certified
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <jsp:include page="/WEB-INF/views/admin/admin_common/adm_footer.jsp"/>
    </div>
  </div>
 
 </body>
  
<!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/assets/admin_assets/js/core/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/admin_assets/js/core/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/admin_assets/js/core/bootstrap.min.js"></script>

  <!-- Chart JS -->
  <script src="${pageContext.request.contextPath}/assets/admin_assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="${pageContext.request.contextPath}/assets/admin_assets/js/plugins/bootstrap-notify.js"></script>

  <!-- 
  <script>
    $(document).ready(function() {
	 console.log("jquery 실행");
      //demo.initChartsPages();
      
      Highcharts.setOptions({
          global: { useUTC: false	//시간표시방법
       	  }
      });

      Highcharts.chart('#container', {
          chart: {
              type: 'spline',		//차트모양
              animation: Highcharts.svg, //애니메이션 모양
              marginRight: 10,	//오른쪽 여백
              events: {
                  load: function () {

                      // set up the updating of the chart each second
                      var series = this.series[0];
                      setInterval(function () {
                      	
                          $.ajax({
                              url : "UserCount_s",
                              type: "GET",
                              dataType: "JSON",
                              success: function(data)
                              {
                       			console.log(data.count);				//데이터 어떻게 넘어오는지 항상 찍어보라고 선생님께서 말씀하셨지
                                  var x = (new Date()).getTime(), // current time
                                  y = data.count
                            		series.addPoint([x, y], true, true);	//점추가 할껀지 안할껀지
                       
                              },
                              error: function (xhr)
                              {
                                  console.log('Error get data from ajax' + xhr.status);
                              }
                          });
                      }, 1000);
                  }
              }
          },
          title: {
              text: 'DYNAMIC USERLIST'
          },
          xAxis: {
              type: 'datetime',
              tickPixelInterval: 150
          },
          yAxis: {
          	tickPixelInterval: 300,
              title: {
                  text: 'Number of Members'
              },
              plotLines: [{
                  value: 0,
                  width: 1,
                  color: '#808080'
              }]
          },
          tooltip: {
              formatter: function () {
                  return '<b>' + this.series.name + '</b><br/>' +
                      Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
                      Highcharts.numberFormat(this.y, 2);
              }
          },
          legend: {
              enabled: false
          },
          exporting: {
              enabled: false
          },
          series: [{
              name: 'number of members',
              data: (function () {
                  // generate an array of random data
                  var data = [],
                      time = (new Date()).getTime(),
                      i;

                  for (i = -20; i <= 0; i += 1)
                  {
                      data.push({
                          x: time + i * 1000,
                          y: data.count	//처음에 나오는 데이터 값
                      });
                  }
                  return data;
              }())
          }]
      });
      
      
      
      
    });
  </script>
</body>
	 -->

	<script type="text/javascript">
/*
	$(function(){
			
		      Highcharts.setOptions({
		          global: { useUTC: false	//시간표시방법
		       	  }
		      });

		      Highcharts.chart('container', {
		          chart: {
		              type: 'spline',		//차트모양
		              animation: Highcharts.svg, //애니메이션 모양
		              marginRight: 10,	//오른쪽 여백
		              events: {
		                  load: function () {

		                      // set up the updating of the chart each second
		                      var series = this.series[0];
		                      setInterval(function () {
		                      	
		                          $.ajax({
		                              url : "UserCount_s",
		                              type: "GET",
		                              dataType: "JSON",
		                              success: function(data)
		                              {
		                       			console.log(data.count);				//데이터 어떻게 넘어오는지 항상 찍어보라고 선생님께서 말씀하셨지
		                                  var x = (new Date()).getTime(), // current time
		                                  y = data.count
		                            		series.addPoint([x, y], true, true);	//점추가 할껀지 안할껀지
		                       
		                              },
		                              error: function (xhr)
		                              {
		                                  console.log('Error get data from ajax' + xhr.status);
		                              }
		                          });
		                      }, 5000);
		                  }
		              }
		          },
		          title: {
		              text: '실시간 회원수 현황'
		          },
		          xAxis: {
		              type: 'datetime',
		              tickPixelInterval: 150
		          },
		          yAxis: {
		          	tickPixelInterval: 300,
		              title: {
		                  text: '회원수'
		              },
		              plotLines: [{
		                  value: 0,
		                  width: 1,
		                  color: '#808080'
		              }]
		          },
		          tooltip: {
		              formatter: function () {
		                  return '<b>' + this.series.name + '</b><br/>' +
		                      Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
		                      Highcharts.numberFormat(this.y, 2);
		              }
		          },
		          legend: {
		              enabled: false
		          },
		          exporting: {
		              enabled: false
		          },
		          series: [{
		              name: 'number of members',
		              data: (function () {
		                  // generate an array of random data
		                  var data = [],
		                      time = (new Date()).getTime(),
		                      i;

		                  for (i = -20; i <= 0; i += 1)
		                  {
		                      data.push({
		                          x: time + i * 1000,
		                          y: data.count	//처음에 나오는 데이터 값
		                      });
		                  }
		                  return data;
		              }())
		          }]
		      });
		      
		      
			
			
			
		});
		*/
	</script>

</html>