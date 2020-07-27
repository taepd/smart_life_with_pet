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
  <!--     Fonts and icons     -->
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/admin_assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/assets/admin_assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!--  JQuery 추가 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- 차트  -->
  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
  <!-- 차트  -->
  <!-- 구글 차트 -->
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
  <div class="wrapper ">
      <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="/" class="simple-text logo-mini">
          <div class="logo-image-small">
            <img src="${pageContext.request.contextPath}/assets/admin_assets/img/logo-small.png">
          </div>
        </a>
        <a href="adminMain.bit" class="simple-text logo-normal">
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
            <a href="userPetTable.bit">
              <i class="nc-icon nc-diamond"></i>
              <p>동물 리스트</p>
            </a>
          </li>
          <li>
            <a href="userPointTable.bit">
              <i class="nc-icon nc-diamond"></i>
              <p>포인트 리스트</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    
  <div class="main-panel">
      <jsp:include page="/WEB-INF/views/admin/admin_common/adm_nav.jsp"/>
      <div class="content">
      <!--  주석부분은 상단 부분입니다.
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
                      <p class="card-title"><a href="SaveDataToDB.book">동물 DB 저장</a><p>
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
        -->
        
        <!-- 차트 뿌려질 부분 시작-->
         
        <div class="row">
         <!--   <div class="col-md-12"> -->
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card ">
              <div class="card-header ">
                <h5 class="card-title">차트1-1</h5>
                <p class="card-category">차트1-1</p>
              </div>
              <div class="card-body ">
                <div id="employee_piechart" style="min-width: 310px; height: 400px; margin: 0 auto">
				</div>
			 </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-history"></i> 차트는 언제 업데이트 해야할까요?
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card ">
              <div class="card-header ">
                <h5 class="card-title">차트1-2</h5>
                <p class="card-category">차트1-2</p>
              </div>
              <div class="card-body ">
                <div id="chart2" style="min-width: 310px; height: 400px; margin: 0 auto">
				</div>
			 </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-history"></i> 차트는 언제 업데이트 해야할까요?
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card ">
              <div class="card-header ">
                <h5 class="card-title">차트1-3</h5>
                <p class="card-category">차트1-3</p>
              </div>
              <div class="card-body ">
                <div id="basicline3" style="min-width: 310px; height: 400px; margin: 0 auto">
				</div>
			 </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-history"></i> 차트는 언제 업데이트 해야할까요?
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card ">
              <div class="card-header ">
                <h5 class="card-title">차트1-4</h5>
                <p class="card-category">차트1-4</p>
              </div>
              <div class="card-body ">
                <div id="basicline4" style="min-width: 310px; height: 400px; margin: 0 auto">
				</div>
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
       
        <!-- 차트 뿌려질 부분 끝-->
        
        <!-- 새로운 차트 시작-->
        <div class="row">
          <div class="col-md-6">          
            <div class="card ">
              <div class="card-header ">
                <h5 class="card-title">차트2-1</h5>
                <p class="card-category">차트2-1</p>
                <div id="pie" style="min-width: 310px; height: 400px; margin: 0 auto">
              </div>
              <div class="card-body ">
                <canvas id="chartEmail"></canvas>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-calendar"></i> 차트는 언제 업데이트 해야할까요?
                </div>
              </div>
            </div>
          </div>
          </div>
          
          <div class="col-md-6">
            <div class="card card-chart">
              <div class="card-header">
                <h5 class="card-title">차트2-2</h5>
                <p class="card-category">차트2-2</p>
                <div id="column" style="min-width: 310px; height: 400px; margin: 0 auto">
              </div>
              <div class="card-body">
                <canvas id="speedChart"></canvas>
              </div>
              <div class="card-footer">
                <hr/>
                <div class="card-stats">
                  <i class="fa fa-check"></i> 차트는 언제 업데이트 해야할까요?
                </div>
              </div>
            </div>
          </div>
        </div>
        
      </div>
      <!-- 차트 끝 -->

      
    </div>
    <jsp:include page="/WEB-INF/views/admin/admin_common/adm_footer.jsp"/>
  </div>
  
 </div>
  

 </body>
  <!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/assets/admin_assets/js/core/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/admin_assets/js/core/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/admin_assets/js/core/bootstrap.min.js"></script>
	
<script type="text/javascript">
google.load("visualization", "1", {
	packages : [ "corechart" ]
});
google.setOnLoadCallback(drawChart);
function drawChart() {


	chart_data = '${getPetKindCount}';
	console.log('차트데이타: '+ chart_data);




	
	/* var data = google.visualization.arrayToDataTable([
			[ "Employee", "Rating" ], [ "Suresh", 25 ], [ "Amit", 56 ],
			[ "Rahul", 37 ], [ "Lucky", 71 ], [ "Pooja", 11 ],
			[ "Manoj", 49 ] ]);
	var options = {
		title : "Employee Ratings"
	};
	var chart = new google.visualization.PieChart(document.getElementById("employee_piechart"));
	chart.draw(data, options); */
};




/* var chart_data;
var startdate = "default";
var enddate = "default";
google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(load_page_data);

function load_page_data(){
    $.ajax({
        url: 'getUserList.bit',
        data: {'date':userid,'date':snstype},
        async: false,
        success: function(data){
            if(data){
                chart_data = $.parseJSON(data);
                drawChart(chart_data, "My Chart", "Data");
            }
        },
    });
}

function drawChart(chart_data, chart1_main_title, chart1_vaxis_title) {
    var chart1_data = new google.visualization.DataTable(chart_data);
    var chart1_options = {
        title: chart1_main_title,
        vAxis: {title: chart1_vaxis_title,  titleTextStyle: {color: 'red'}}
    };

    var chart1_chart = new google.visualization.BarChart(document.getElementById('chart1_div'));
    chart1_chart.draw(chart1_data, chart1_options);
} */
</script>

</html>