<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>



<!DOCTYPE html>
<html>
<head>

	<title>동물관리 홈</title>
	
	<%@ include file="/WEB-INF/include/import.jsp"%>
  	
    <style>
    
    	.fc-toolbar-title {
    		color: black;
    	}
    
    </style>
    
    
</head>
<body>
	 
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	 
	 
	<div class="side_overlay">
		<div class="container">

		
		<button class="btn btn-primary btn-round" onclick="location.href='registerPets.bit'">반려동물 등록</button>

		

			<div class="card card-nav-tabs">
                <div class="card-header card-header-primary">
                  <!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
                  <div class="nav-tabs-navigation">
                    <div class="nav-tabs-wrapper">
                      <ul class="nav nav-tabs" data-tabs="tabs">
                        <li class="nav-item">
                          <a class="nav-link active show" href="#schedule" data-toggle="tab">
                            <!-- <i class="material-icons">face</i> -->
                            <i class="fas fa-home"></i>
                            	일정
                          <div class="ripple-container"></div></a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#home" data-toggle="tab">
                            <!-- <i class="material-icons">chat</i> -->
                            <i class="far fa-calendar-alt"></i>
								홈
	                          <div class="ripple-container"></div></a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#hospitalRecord" data-toggle="tab">
                            <!-- <i class="material-icons">build</i> -->
							<i class="fas fa-stethoscope"></i>
                            Hospital Record
                          <div class="ripple-container"></div></a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                
                <div class="card-body">
                  <div class="tab-content text-center">
                    <div class="tab-pane active show" id="schedule">
                    <div id="calendar"></div>
                    	<%-- <div class="row">
                      <div class="card col-4" style="width: 20rem;">
						  <img class="card-img-top" src="${pageContext.request.contextPath}/images/sample_dog.jpg" rel="nofollow" alt="card image">
						  <div class="card-body">
							<h4>동물 이름</h4>
						    <p class="card-text">
						    	동물 프로필
						    </p>
						    <span class=""><i class="fas fa-times"></i></span>
						  </div>
					</div>
					
					<div class="card col-4" style="width: 20rem;">
						  <img class="card-img-top" src="${pageContext.request.contextPath}/images/sample_cat.jpg" rel="nofollow" alt="card image">
						  <div class="card-body">
							<h4>동물 이름</h4>
						    <p class="card-text">
						    	동물 프로필
						    </p>
						    <span class=""><i class="fas fa-times"></i></span>
						  </div>
					</div>
					
					<div class="card col-4" style="width: 20rem;">
						  <img class="card-img-top" src="${pageContext.request.contextPath}/images/sample_boon.jpg" rel="nofollow" alt="card image">
						  <div class="card-body">
							<h4>동물 이름</h4>
						    <p class="card-text">
						    	동물 프로필
						    </p>
						    <span class=""><i class="fas fa-times"></i></span>
						  </div>
					</div>
                    </div> --%>
                    
                    
                    </div>
                    <div class="tab-pane" id="home">
                    	
                    	<!-- <div id="calendar"></div> -->
                    
                    
                    </div>
   
        
                     
	                 
	                 
<!--------------------------------------------- 병원 기록 영역 ---------------------------------------------------- -->   
                    
                    <div class="tab-pane" id="hospitalRecord">

					<h3>병원 방문 기록</h3>                    
                    <div class="table-responsive">
                    	<table class="table">
                    		<thead class=" text-primary">
                    			<tr><th> Name </th> <th> Country </th> <th> City </th> <th class="text-right"> Salary </th></tr></thead>
                    			<tbody> <tr> <td> Dakota Rice </td> <td> Niger </td> <td> Oud-Turnhout </td> <td class="text-right"> $36,738 </td>
                    				</tr> <tr> <td> Minerva Hooper </td> <td> Curaçao </td> <td> Sinaai-Waas </td> <td class="text-right"> $23,789 </td> </tr>
                    	</table>

                    </div>
                    
                    
					<h3>예방 접종 기록</h3>                    
                    <div class="table-responsive">
                    	<table class="table">
                    		<thead class=" text-primary">
                    			<tr><th> Name </th> <th> Country </th> <th> City </th> <th class="text-right"> Salary </th></tr></thead>
                    			<tbody> <tr> <td> Dakota Rice </td> <td> Niger </td> <td> Oud-Turnhout </td> <td class="text-right"> $36,738 </td>
                    				</tr> <tr> <td> Minerva Hooper </td> <td> Curaçao </td> <td> Sinaai-Waas </td> <td class="text-right"> $23,789 </td> </tr>
                    	</table>
                    </div>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    </div>
                    

<!------------------------------------------ 끝 --------------------------------------------------------------- -->
                    
                    
                  </div>
                </div>
              </div>
		
		</div> <!-- container end -->
	</div> <!-- side_overlay end -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>


    
    <!-- fullcalendar -->
    <link href='https://unpkg.com/fullcalendar@5.1.0/main.min.css' rel='stylesheet' />
  	<script src='https://unpkg.com/fullcalendar@5.1.0/main.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js'></script>
    
    <%-- <link href='${pageContext.request.contextPath}/fullcalendar/packages/core/main.css' rel='stylesheet' />
	<link href='${pageContext.request.contextPath}/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
	<link href='${pageContext.request.contextPath}/fullcalendar/packages/bootstrap/main.css' rel='stylesheet' />
	
	<script src='${pageContext.request.contextPath}/fullcalendar/packages/core/main.js'></script>
	<script src='${pageContext.request.contextPath}/fullcalendar/packages/daygrid/main.js'></script>
	<script src='${pageContext.request.contextPath}/fullcalendar/packages/bootstrap/main.js'></script>

	<script src='${pageContext.request.contextPath}/fullcalendar/packages/interaction/main.js'></script> --%>
<script>
	

	document.addEventListener('DOMContentLoaded', function() {

		console.log("DOMContentLoaded");
		var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      theme: true,
	      initialView: 'dayGridMonth',
	      initialDate: '2020-07-07',
	      headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
	      },
	      events: [
	        {
	          title: 'All Day Event',
	          start: '2020-07-01'
	        },
	        {
	          title: 'Long Event',
	          start: '2020-07-07',
	          end: '2020-07-10'
	        },
	        {
	          groupId: '999',
	          title: 'Repeating Event',
	          start: '2020-07-09T16:00:00'
	        },
	        {
	          groupId: '999',
	          title: 'Repeating Event',
	          start: '2020-07-16T16:00:00'
	        },
	        {
	          title: 'Conference',
	          start: '2020-07-11',
	          end: '2020-07-13'
	        },
	        {
	          title: 'Meeting',
	          start: '2020-07-12T10:30:00',
	          end: '2020-07-12T12:30:00'
	        },
	        {
	          title: 'Lunch',
	          start: '2020-07-12T12:00:00'
	        },
	        {
	          title: 'Meeting',
	          start: '2020-07-12T14:30:00'
	        },
	        {
	          title: 'Birthday Party',
	          start: '2020-07-13T07:00:00'
	        },
	        {
	          title: 'Click for Google',
	          url: 'http://google.com/',
	          start: '2020-07-28'
	        }
	      ], 
	     
	    });

	    calendar.render();


	    calendar.on('dateClick', function(info) {
	    	  console.log('clicked on ' + info.dateStr);
	    });

	    
	  });
	
	</script>
</html>