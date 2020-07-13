<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>

	<title>동물관리 홈</title>
	
	<%@ include file="/WEB-INF/include/import.jsp"%>
  	
    <style>
    
    	.fc-toolbar-title, a.fc-col-header-cell-cushion, th {
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
					
					<!-- 일정 추가 MODAL -->
					<div class="modal fade" tabindex="-1" role="dialog" id="createEventModal">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="exampleModalLabel">일정 추가하기</h4>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">


										<div class="form-check">
											<label class="form-check-label">
											  <input class="form-check-input" type="checkbox" value="" id="edit-allDay" >
											  하루종일
											  <span class="form-check-sign">
												<span class="check"></span>
											  </span>
											</label>
										</div>

										<div class="form-group bmd-form-group">
											<label class="bmd-label-static">일정명</label>
											<input type="text" class="form-control" name="title" id="title" placeholder="" required>
											<!-- <input type="text" class="form-control" name="edit-title" id="edit-title" placeholder="" required> -->
										</div>

										<div class="form-group bmd-form-group">
											<label class="bmd-label-static">시작</label>
											<input type="text" class="form-control datetimepicker" name="begin_date" id="begin_date" placeholder="" required>
											<!-- <input type="text" class="form-control datetimepicker" name="edit-start" id="edit-start" placeholder="" required> -->
										</div>

										<div class="form-group bmd-form-group">
											<label class="bmd-label-static">끝</label>
											<input type="text" class="form-control datetimepicker" name="end_date" id="end_date" placeholder="" required>
											<!-- <input type="text" class="form-control datetimepicker" name="edit-end" id="edit-end" placeholder="" required> -->
										</div>

										<div class="">
											<label class="" for="edit-type">구분</label>
											<select class="custom-select" type="text" name="edit-type" id="edit-type">
												<!-- 카테고리: 병원, 접종, 일반, 어쩌구, 뭐 이런 식으로....? -->
												<option value="카테고리1">카테고리1</option>
												<option value="카테고리2">카테고리2</option>
												<option value="카테고리3">카테고리3</option>
												<option value="카테고리4">카테고리4</option>
											</select>
										</div>
										<div class="">
											<label class="" for="edit-color">색상</label>
											<select class="custom-select" name="color" id="edit-color">
												<option value="#D25565" style="color:#D25565;">빨간색</option>
												<option value="#9775fa" style="color:#9775fa;">보라색</option>
												<option value="#ffa94d" style="color:#ffa94d;">주황색</option>
												<option value="#74c0fc" style="color:#74c0fc;">파란색</option>
												<option value="#f06595" style="color:#f06595;">핑크색</option>
												<option value="#63e6be" style="color:#63e6be;">연두색</option>
												<option value="#a9e34b" style="color:#a9e34b;">초록색</option>
												<option value="#4d638c" style="color:#4d638c;">남색</option>
												<option value="#495057" style="color:#495057;">검정색</option>
											</select>
										</div>
										<div class="">
											<label class="" for="edit-desc">설명</label>
											<textarea rows="3" cols="50" class="" name="desc" id="desc"></textarea>
										</div>
								</div>
								<div class="modal-footer modalBtnContainer-addEvent">
									<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" id="save-event">저장</button>
								</div>
								<!-- 기존 일정을 누르면 나오는 버튼 -->
								<div class="modal-footer modalBtnContainer-modifyEvent">
									<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
									<button type="button" class="btn btn-primary" id="updateEvent">저장</button>
								</div>
							</div><!-- /.modal-content -->
						</div><!-- /.modal-dialog -->
					</div><!-- /.modal -->
					
                    </div>
					
<!-------------------------------------------------------------------------------------------------------------- -->
                    
                    <div class="tab-pane" id="home">
                    	
                    	<!-- <div id="calendar"></div> -->
                    	<c:forEach var="petInfo" items="${petInfoList}">
							<div class="card col-4" style="width: 20rem;">
								<img class="card-img-top" src="${pageContext.request.contextPath}/images/sample_boon.jpg" rel="nofollow" alt="card image">
								  <div class="card-body">
									<h4>${petInfo.petname}</h4>
								    <p class="card-text" id="petInfo">
								    	<fmt:parseNumber var="age" value="${petInfo.age/12}" integerOnly="true"/>
								    	${petInfo.scaname} | 
								    	${petInfo.size == 'small' ? '소형':petInfo.size == 'medium'? '중형':'대형'}${petInfo.mcategory == '1' ? '견':'묘'} | 
								    	${petInfo.weight}kg | 
								    	<br>
								    	${age}년 ${petInfo.age%12}개월 | 
								    	${petInfo.sex == 'female' ? '암컷':'수컷' } | 
								    	${petInfo.nstate == 'n' ? '중성화X':'중성화O'} |
								    	<br>
								    	${petInfo.memo}
								    </p>
								    <div>

										<!-- 나중에 아이콘으로 바꾸기~~~ -->
										
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
	
	<!-- moment.js > 시간 관련 -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js'></script>

	<!-- SweetAlert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>

		$(function() {

			// datetimepicker 초기화 시 아이콘 로딩
			$('.datetimepicker').datetimepicker({
				icons: {
					time: "fa fa-clock-o",
					date: "fa fa-calendar",
					up: "fa fa-chevron-up",
					down: "fa fa-chevron-down",
					previous: 'fa fa-chevron-left',
					next: 'fa fa-chevron-right',
					today: 'fa fa-screenshot',
					clear: 'fa fa-trash',
					close: 'fa fa-remove'
				}
			});

			// console.log("DOMContentLoaded");
		
			var calendarEl = document.getElementById('calendar');

			var calendar = new FullCalendar.Calendar(calendarEl, {
				
				editable: true,
				selectable: true,
				locale: 'ko',
				initialView: 'dayGridMonth',
				headerToolbar: {
					left: 'prev,next today',
					center: 'title',
					right: 'dayGridMonth,timeGridWeek,timeGridDay'
				},

				events: getSchedule(),
				select: function(start, end, allDay) {

					var addBtnContainer = $('.modalBtnContainer-addEvent');
					var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');

					$('#createEventModal').modal('show');
					addBtnContainer.show();
					modifyBtnContainer.hide();

					//datetimepicker
					$("#begin_date, #end_date").datetimepicker({
						format: 'YYYY-MM-DD HH:mm:ss'
					});
				}
				
			
			});

			calendar.render();
	

			function getSchedule() {

				var schedule = [];

				$.ajax({
					url: "getSchedule.bit",
					data: { userid : "a" },
					dataType: "json",
					async: false,
					success: function(response) {
						$.each(response.schedule, function(index, element) {
							var viewData = {};
							viewData["title"] = element.title;
							viewData["start"] = element.begin_date;
							viewData["end"] = moment(element.end_date).add(1, 'days').format('YYYY-MM-DD HH:mm:ss');
							viewData["allDay"] = true;
							schedule.push(viewData);
						});
					}
				});

				return schedule;
			} // /.getSchedule()
			
			
			console.log("새로고침확인66");

			
			$('#save-event').on('click', function () {

				
				
				//이 데이터가 이 이벤트 바깥으로 나가면 저장이 안 되는 듯... 공백으로 나옴
				var eventData = {
					//backgroundColor: color,
					title: $('#title').val(),
					begin_date: moment($('#begin_date').val()).format('YYYY-MM-DD HH:mm:ss'),
					end_date: moment($('#end_date').val()).format('YYYY-MM-DD HH:mm:ss'),
					content: $('#desc').val(),
					allDay: true //이렇게 주면 네모칸으로 나옴(아니면 점으로 나오고)
					// type: editType.val(),
					// username: '사나',
					// backgroundColor: editColor.val(),
					// textColor: '#ffffff',
					// allDay: false
				};

				if(eventData.title == "") {
					swal('일정명을 입력하세요.');
					return false;
				}

				if(eventData.begin_date > eventData.end_date) {
					swal('끝나는 날짜가 시작 날짜보다 앞설 수 없습니다.');
					return false;
				}

				$.ajax({
					type: "get",
					data: eventData,
					dataType: "JSON",
					url: "insertSchedule.bit",
					success: function(data) {
						console.log(data); //result값인 0(실패) 또는 1(성공) 출력
						$('#createEventModal').modal('hide'); //일정 등록에 성공하면 모달창을 닫는다 (하지만 지금은 성공/실패 여부에 관계 없이 닫힘)
					},
					error: function(e) {
						console.log("insert에러: "+e);
					}
				});

				calendar.addEvent(eventData);//이게 안 되는 게 비동기 순서 보장 안돼서일지도 모르겠다?
				/* 원래는 버튼 눌렀을 때 이런 식으로 추가하는데.... 훔
								calendar.addEvent({
									title: '다이나믹 이벤트',
									start: date,
									allDay: true
									});
									*/
				
			});
			
		
		}); // /.$(function)

	</script>
</html>