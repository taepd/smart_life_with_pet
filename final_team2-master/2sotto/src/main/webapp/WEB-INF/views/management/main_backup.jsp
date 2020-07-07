<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>

	<title>동물관리 홈</title>
	
	<%@ include file="/WEB-INF/include/import.jsp"%>
    
    <!-- fullcalendar -->
    <link href='https://unpkg.com/fullcalendar@5.1.0/main.min.css' rel='stylesheet' />
  	<script src='https://unpkg.com/fullcalendar@5.1.0/main.min.js'></script>
  	
  	<!-- 위에 안 되면 여기 링크 풀어볼 것 -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"> -->
    
    <!-- 
    <link href='${pageContext.request.contextPath}/fullcalendar/packages/core/main.css' rel='stylesheet' />
	<link href='${pageContext.request.contextPath}/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
	<link href='${pageContext.request.contextPath}/fullcalendar/packages/bootstrap/main.css' rel='stylesheet' />
	
	<script src='${pageContext.request.contextPath}/fullcalendar/packages/core/main.js'></script>
	<script src='${pageContext.request.contextPath}/fullcalendar/packages/daygrid/main.js'></script>
	<script src='${pageContext.request.contextPath}/fullcalendar/packages/bootstrap/main.js'></script>

	<script src='${pageContext.request.contextPath}/fullcalendar/packages/interaction/main.js'></script>
	 -->
	<!-- <link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
	<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
 -->
 
 <!--
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/css/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/FullCalendar-Example-master/css/main.css">
   -->
   
   
    <!-- <link href='fullcalendar/main.css' rel='stylesheet' />
    <script src='fullcalendar/main.js'></script>
     -->
     
     	<style>
		.fc-toolbar-title {
			color: black;
		} 	
 	</style>
 
 
 	<%-- <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/js/fullcalendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/js/ko.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/js/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/js/addEvent.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/js/editEvent.js"></script>
    <script src="${pageContext.request.contextPath}/FullCalendar-Example-master/js/etcSetting.js"></script> --%>
 
 
 
	<script>


	document.addEventListener('DOMContentLoaded', function() {

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
	          start: '2020-06-01'
	        },
	        {
	          title: 'Long Event',
	          start: '2020-06-07',
	          end: '2020-06-10'
	        },
	        {
	          groupId: '999',
	          title: 'Repeating Event',
	          start: '2020-06-09T16:00:00'
	        },
	        {
	          groupId: '999',
	          title: 'Repeating Event',
	          start: '2020-06-16T16:00:00'
	        },
	        {
	          title: 'Conference',
	          start: '2020-06-11',
	          end: '2020-06-13'
	        },
	        {
	          title: 'Meeting',
	          start: '2020-06-12T10:30:00',
	          end: '2020-06-12T12:30:00'
	        },
	        {
	          title: 'Lunch',
	          start: '2020-06-12T12:00:00'
	        },
	        {
	          title: 'Meeting',
	          start: '2020-06-12T14:30:00'
	        },
	        {
	          title: 'Birthday Party',
	          start: '2020-06-13T07:00:00'
	        },
	        {
	          title: 'Click for Google',
	          url: 'http://google.com/',
	          start: '2020-06-28'
	        }
	      ], 
	     
	    });

	    calendar.render();


	    calendar.on('dateClick', function(info) {
	    	  console.log('clicked on ' + info.dateStr);
	    });

	    
	  });
	
		/* document.addEventListener('DOMContentLoaded', function() {
	      var calendarEl = document.getElementById('calendar');
	    
	      var calendar = new FullCalendar.Calendar(calendarEl, {

	        	plugins: [ 'interaction', 'dayGrid', 'bootstrap' ],
	        	themeSystem: 'bootstrap',
		      	header: {
					left: 'prevYear, prev, next, nextYear, today',
					center: 'title',
					right: 'dayGridMonth, dayGridWeek, dayGridDay'
			      },
			      
			    defaultDate: '2020-07-03',
			    events: [
					{
						title: '스터디',
						start: '2020-07-03',
						end: '2020-07-03'
						},
						{
							title: '스터디',
							start: '2020-07-20',
							end: '2020-07-20'
							}
	
				    ]
	      });
	    
	      calendar.render();
	    });
   */

/* 
		$(function(){
			 calendarEvent();
			});

			function calendarEvent(eventData){
			 $("#calendar").html("");
			 var date = new Date();
			 var d = date.getDate();
			 var m = date.getMonth();
			 var y = date.getFullYear();
			 var calendar = $('#calendar').fullCalendar({
			  header: {
			   left: "",
			   center: "title",
//			    right: "month,basicWeek,basicDay"
			   right: "today prev,next"
			   },
			   editable: true,
			   titleFormat: {
			   month: "yyyy년 MMMM",
			   week: "[yyyy] MMM dd일{ [yyyy] MMM dd일}",
			   day: "yyyy년 MMM d일 dddd"
			   },
			   allDayDefault: false,
			   defaultView: "month",
			   editable: false,
			   monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			   monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			   dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
			   dayNamesShort: ["일","월","화","수","목","금","토"],
			   buttonText: {
			   today : "오늘",
			   month : "월별",
			   week : "주별",
			   day : "일별",
			   },
			   events : eventData,
			   timeFormat : "HH:mm",
			 });
			 */
	</script>
    
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
                          <a class="nav-link active show" href="#home" data-toggle="tab">
                            <!-- <i class="material-icons">face</i> -->
                            <i class="fas fa-home"></i>
                            Home
                          <div class="ripple-container"></div></a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#schedule" data-toggle="tab">
                            <!-- <i class="material-icons">chat</i> -->
                            <i class="far fa-calendar-alt"></i>
                            Schedule
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
                    <div class="tab-pane active show" id="home">
                    
                    	<div class="row">
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
                    </div>
                    
                    
                    </div>
                    <div class="tab-pane" id="schedule">
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
</html>