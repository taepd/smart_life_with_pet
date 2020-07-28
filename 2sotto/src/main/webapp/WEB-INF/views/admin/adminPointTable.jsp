<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
  	 슬기로운 반려생활
  </title>
  <%@ include file="/WEB-INF/include/admin_nav.jsp"%>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/admin_assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/assets/admin_assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/assets/admin_assets/demo/demo.css" rel="stylesheet" />

  <!-- 데이터테이블 CDN -->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" crossorigin="anonymous">
</head>

<body class="">
<% request.setCharacterEncoding("utf-8"); %>
  
    <div class="main-panel">
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title"> Point Table</h4>
              </div>
              <div class="card-body">
            	<div id="searchResult" class="table-responsive">
            		<table id="myTable" class="myTable hover table">
						<thead class=" text-primary">
							<tr>
								
								<th>포인트 내역 번호</th>
								<th>유저명</th>
								<th>포인트유형</th>
								<th>변동 포인트</th>
								<th>사용자 포인트 총량</th>
								<th>포인트 변동 일시</th>
								<th>결제 번호</th>
								<th>기부번호</th>
								
							</tr>
						</thead>
					</table>
            	</div>
                </div>
            </div>
          </div>
          
        </div>
      </div>
      
      <jsp:include page="/WEB-INF/views/admin/admin_common/adm_footer.jsp"/>
    </div>
  </div>
 
  <!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/assets/admin_assets/js/core/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/admin_assets/js/core/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/admin_assets/js/core/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/admin_assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <!--  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script> -->
  <!-- Chart JS -->
  <script src="${pageContext.request.contextPath}/admin_assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="${pageContext.request.contextPath}/admin_assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${pageContext.request.contextPath}/admin_assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script><!-- Paper Dashboard DEMO methods, don't include it in your project! -->
  <script src="${pageContext.request.contextPath}/admin_assets/demo/demo.js"></script>
 
   
  <!-- 제이쿼리 CDN -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 
 
 <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js" type="text/javascript"></script>
 
  <!-- 비동기 -->
  <script type="text/javascript">
//댓글 목록 가져오기
 $(function(){		
		var data = "";
		console.log('작동?');
		$.ajax(
			{
				url:"getPointList.bit",
				type:"POST",
				dataType:"json",
				//data: "",
				success:function(responsedata){
					console.log(responsedata);
					
					
			   		$('#myTable').dataTable(
			   	   			{ 
			   	   				ajax:{
			   	   					'url':'getPointList.bit', //이건 왜 필요한거지..
			   	   					'contentType': 'application/x-www-form-urlencoded; charset=UTF-8',
			   	   					'dataSrc': {
			   	   						"data": [responsedata]
			   	   					}
			   	   				},
			   	   				columns:[
			   	   					
			   	   					{"data": "ptindex"},
			   	   					{"data": "userid"},
			   	   					{"data": "ptype"},
			   	   					{"data": "pcount"},
			   	   					{"data": "pamount"},
			   	   					{"data": "pdate"},
			   	   					{"data": "pindex"},
			   	   					{"data": "drindex"}
			   	   					
			   	   				]
			   	   				
			   	   			}		
			   	   		);
					
					
				},
				error: function(){
					console.log("에러");
				}
			}		
		);	
		
	});
	

</script>

</body>
</html>