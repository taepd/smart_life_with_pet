<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>

	<title>동물관리 홈</title>
	
	<%@ include file="/WEB-INF/include/import.jsp"%>
  	
    <style>
    
    	.fc-toolbar-title {
    		color: black;
    	}
    	
    	.icons {
    		font-size: 15px;
    		color: orange;
    	}
    
    </style>
    
    
</head>
<body>
	 
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	 
	 
	<div class="side_overlay">
		<div class="container">

		
		<button class="btn btn-primary btn-round" onclick="location.href='register.bit'">반려동물 등록</button>
		
		
		<!-- 새로 시도하는 디자인 시작 -->
		
			<!-- <div class="row">
              <ul class="nav nav-pills nav-pills-icons" role="tablist" style="margin: 0 auto;">
                
                                color-classes: "nav-pills-primary", "nav-pills-info", "nav-pills-success", "nav-pills-warning","nav-pills-danger"
                           
                
                <li class="nav-item">
                  <a class="nav-link active show" href="#schedule-1" role="tab" data-toggle="tab" aria-selected="true">
                    <i class="material-icons">schedule</i>
                    	일정
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#dashboard-1" role="tab" data-toggle="tab" aria-selected="false">
                    <i class="material-icons">dashboard</i>
                    Dashboard
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#tasks-1" role="tab" data-toggle="tab" aria-selected="false">
                    <i class="material-icons">list</i>
                    Tasks
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#tasks-1" role="tab" data-toggle="tab" aria-selected="false">
                    <i class="material-icons">list</i>
                    반려동물 등록
                  </a>
                </li>
                
              </ul>
              </div>
              
              
              <div class="tab-content tab-space">
                <div class="tab-pane" id="dashboard-1">
                  Collaboratively administrate empowered markets via plug-and-play networks. Dynamically procrastinate B2C users after installed base benefits.
                  <br><br>
                  Dramatically visualize customer directed convergence without revolutionary ROI.
                </div>
                <div class="tab-pane active show" id="schedule-1">
					<div id="calendar"></div>
                </div>
                <div class="tab-pane" id="tasks-1">
                  Completely synergize resource taxing relationships via premier niche markets. Professionally cultivate one-to-one customer service with robust ideas.
                  <br><br>Dynamically innovate resource-leveling customer service for state of the art customer service.
                </div>
              </div>
           
          </div> -->
		<!-- 새로 시도하는 디자인 끝 -->
		
			<div class="container">
			<div class="card card-nav-tabs">
                <div class="card-header card-header-primary">
                  <!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
                  <div class="nav-tabs-navigation">
                    <div class="nav-tabs-wrapper">
                      <ul class="nav nav-tabs" data-tabs="tabs">
                        <li class="nav-item">
                          <!-- <a class="nav-link active show" href="#schedule" data-toggle="tab"> -->
                          <a class="nav-link active show" href="#schedule" data-toggle="tab">
                            <!-- <i class="material-icons">face</i> -->
                            
                            <i class="fas fa-home"></i>
                            	일정
                          <div class="ripple-container"></div></a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#home" data-toggle="tab" id="draw-calendar">
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
                    
                    <!--Add event modal-->
					<div id="createEventModal" class="modal fade">
					    <div class="modal-dialog">
					        <div class="modal-content">
					            <div class="modal-header">
					                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span> <span class="sr-only">close</span></button>
					                <h4>Add an Event</h4>
					            </div>
					            <div id="modalBody" class="modal-body">
					               <div class="form-group">
					                    <input class="form-control" type="text" placeholder="Event Name">
					                </div>
					
					                <div class="form-group form-inline">
					                    <div class="input-group date" data-provide="datepicker">
					                        <input type="text" class="form-control" placeholder="Due Date mm/dd/yyyy">
					                        <div class="input-group-addon">
					                            <span class="glyphicon glyphicon-calendar"></span>
					                        </div>
					                    </div>
					                </div>
					
					                <div class="form-group">
					                    <textarea class="form-control" type="text" rows="4" placeholder="Event Description"></textarea>
					                </div>
					            </div>
					            <div class="modal-footer">
					                <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
					                <button type="submit" class="btn btn-primary" id="submitButton">Save</button>
					            </div>
					        </div>
					    </div>
					</div>
                    
                    </div>
                    
                    
                    <div class="tab-pane" id="home">
                    	
                    	<!-- <div id="calendar"></div> -->
                    	<c:forEach var="petInfo" items="${petInfoList}">
							<div class="card col-4" style="width: 20rem;">
								<img class="card-img-top" src="${pageContext.request.contextPath}/images/sample_boon.jpg" rel="nofollow" alt="card image">
								  <div class="card-body">
									<h4>${petInfo.petname}</h4>
								    <p class="card-text">
								    	${petInfo.age}개월 | ${petInfo.mcategory} | ${petInfo.sex} | ${petInfo.scategory} | 
								    	${petInfo.size} | ${petInfo.weight}kg | ${petInfo.memo}
								    </p>
								    <div>
								    	<!-- <a><span class="icons"><i class="fas fa-pen"></i></span></a> -->
								    	<a href="edit.bit?petindex=${petInfo.petindex}">수정</a>
								    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								    	<!-- <span class="icons"><i class="fas fa-times"></i></span> 삭제 아이콘...-->
								    	<a href="delete.bit?petindex=${petInfo.petindex}">삭제</a>
								    </div>
								  </div>
							</div>
						</c:forEach> 
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	
	/*
	document.addEventListener('load', function() {

		$('.icons').click(function() {

			var asking = confirm('정말 삭제하시겠습니까?');

			if(asking) {
				 return location.href('delete.bit?petindex=${petInfo.petindex}');
				} else {
					return;
				}
			
			});

	});
	*/

	document.addEventListener('DOMContentLoaded', function() {


	/* $('#draw-calendar').click(function() {
		console.log("달력 그리기~~");
		calendar();
	}); */
	//안된다.... 환장할 노릇


	/* function calendar() { */
		
		console.log("DOMContentLoaded");
		
		var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      theme: true,
		  editable: true,
		  selectable: true,
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
	      select: function(start, end, allDay) {
		      $('#createEventModal').modal('show');
		  }
	     
	    });

	    calendar.render();


	    calendar.on('dateClick', function(info) {
	    	  console.log('clicked on ' + info.dateStr);
	    });
	    /*}		/.function calendar() */

	 });


		

	

	
	</script>
</html>