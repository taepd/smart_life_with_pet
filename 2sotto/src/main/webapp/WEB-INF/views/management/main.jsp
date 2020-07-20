<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>

	<title>동물관리 홈</title>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-datetimepicker/2.7.1/css/bootstrap-material-datetimepicker.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<%@ include file="/WEB-INF/include/import.jsp"%>
  	
    <style>
    
    	.fc-toolbar-title, a.fc-col-header-cell-cushion, th {
    		color: black;
    	}
    	
    	.icons {
    		font-size: 15px;
    		color: orange;
    	}
    	
    	#wrapper {
    		display: inline-block;
    		/* margin: 0 auto; */
    	}
    	
    	.card-img-top {
    		margin-top: 16px;
    	}
    	
    	.card {
    		margin-left: 10px;
    		margin-right: 10px;
    	}
    	
    	#tab-list {
    		margin: 0 auto;
    	}
    	
    	#tab-row {
    		margin-bottom: 100px;
    		margin-top: 73px;
    	}
    	
    	.form-check {
    		margin-left: 5px;
    		margin-top: 8px;
    	}

    </style>
    
    
</head>
<body>
	 
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<c:set value="${petInfoList}" var="petInfo"/>
	 
	<div class="container">
		<div class="side_overlay">
			<div class="row">
				<div class="col-10"></div>
				<div class="col-2" style="margin: 0 auto;">
					<button class="btn btn-sm" onclick="location.href='register.bit'" style="display: inline-block;">반려동물 등록</button>
				</div>
			</div>
			<div class="row" id="tab-row">
				<ul class="nav nav-pills nav-pills-icons" id="tab-list" role="tablist">
                <!--
                                color-classes: "nav-pills-primary", "nav-pills-info", "nav-pills-success", "nav-pills-warning","nav-pills-danger"
                            -->
                <li class="nav-item">
                  <a class="nav-link active show" href="#dashboard-1" role="tab" data-toggle="tab" aria-selected="false">
					<i class="material-icons">calendar_today</i>
                    	일정
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#schedule-1" role="tab" data-toggle="tab" aria-selected="false">
                    <i class="material-icons">pets</i>
                    <!-- <span class="material-icons">home</span>  -->
                    	내 반려동물
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#tasks-1" role="tab" data-toggle="tab" aria-selected="true">
                    <i class="material-icons">local_hospital</i>
                    	병원/접종기록
                  </a>
                </li>
              </ul>
			</div> <!-- /.row -->
            
            <div class="row">
            	<div class="col-12">
              <div class="tab-content tab-space">
                <div class="tab-pane active show" id="dashboard-1">
                  		<div id="calendar"></div>
                  <!-- 일정 추가 MODAL -->
					<div class="modal fade" tabindex="-1" role="dialog" id="createEventModal">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="modal-title-for-add">일정 추가하기</h4>
									<h4 class="modal-title" id="modal-title-for-edit">일정 수정하기</h4>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">


										<div class="form-check">
											<label class="form-check-label">
											  <input class="form-check-input" type="checkbox" value="1" id="allday" name="allday">
											  하루종일
											  <span class="form-check-sign">
												<span class="check"></span>
											  </span>
											</label>
										</div>

										<div class="form-group bmd-form-group mb-0">
											<!-- <label class="bmd-label-static">일정명</label> -->
											<input type="text" class="form-control" name="title" id="title" placeholder="일정명" required>
											<!-- <input type="text" class="form-control" name="edit-title" id="edit-title" placeholder="" required> -->
										</div>

										<div class="form-group bmd-form-group mb-0">
											<!-- <label class="bmd-label-static">시작</label> -->
											<input type="text" class="form-control" name="start" id="start" placeholder="시작" required>
											<!-- <input type="text" class="form-control datetimepicker" name="edit-start" id="edit-start" placeholder="" required> -->
										</div>

										<div class="form-group bmd-form-group mb-0">
											<!-- <label class="bmd-label-static">끝</label> -->
											<input type="text" class="form-control datetimepicker" name="end" id="end" placeholder="끝" required>
											<!-- <input type="text" class="form-control datetimepicker" name="edit-end" id="edit-end" placeholder="" required> -->
										</div>

										<div class="form-group bmd-form-group mb-0">
											<label class="" for="petindex">누구의 일정인가요?</label>
											<select class="custom-select" type="text" name="petindex" id="petindex">
												<c:forEach items="${petInfo}" var="info">
													<option value="${info.petindex}">${info.petname}</option>
												</c:forEach>
											</select>
										</div>
										
										<div class="form-group bmd-form-group mb-0">
											<label class="" for="color">색깔</label>
											<select class="custom-select" name="color" id="color">
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
										
										<div class="form-group bmd-form-group">
											<!-- <label class="" for="edit-desc">설명</label> -->
											<textarea rows="2" cols="50" class="form-control" name="content" id="content" placeholder="필요하다면 일정에 관해 메모하세요."></textarea>
										</div>
								</div>
								<div class="modal-footer modalBtnContainer-addEvent">
									<button type="button" class="btn btn-sm" data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary btn-sm" id="save-event">저장</button>
								</div>
								<!-- 기존 일정을 누르면 나오는 버튼 -->
								<div class="modal-footer modalBtnContainer-modifyEvent">
									<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-danger btn-sm" id="deleteEvent">삭제</button>
									<button type="button" class="btn btn-primary btn-sm" id="updateEvent">수정</button>
								</div>
							</div><!-- /.modal-content -->
						</div><!-- /.modal-dialog -->
					</div><!-- /.modal -->
                </div>
                
                <div class="tab-pane" id="schedule-1">
                	<div class="row">
                    	<c:forEach var="petInfo" items="${petInfo}">
							<div class="card col-4" style="width: 20rem;">
								<img class="card-img-top" src="${pageContext.request.contextPath}/assets/images/${petInfo.petimg}" rel="nofollow" alt="card image">
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
                </div>
                <div class="tab-pane" id="tasks-1">
                
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
              </div>
              </div>
            </div>
		</div> <!-- side_overlay end -->
	</div> <!-- container end -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
    
<!-- fullcalendar -->
<link href='https://unpkg.com/fullcalendar@5.1.0/main.min.css' rel='stylesheet' />
<script src='https://unpkg.com/fullcalendar@5.1.0/main.min.js'></script>

<!-- moment.js > 시간 관련 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/locale/ko.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js'></script>

<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
$(function() {

	console.log("아아아어ㅣㅏ;ㅓㅣㅏㅓㅣㅏㅓ");
	console.log('로그인한 유저 아이디: ${sessionScope.user.userid}');
	
	// Datetimepicker
	$("#start, #end").bootstrapMaterialDatePicker({
		format: 'YYYY-MM-DD HH:mm',
		lang: 'ko',
		okText: '확인',
		cancelText: '취소'
	});

	var calendarEl = document.getElementById('calendar');
	var addBtnContainer = $('.modalBtnContainer-addEvent');
	var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');

	// 풀캘린더 그리기
	var calendar = new FullCalendar.Calendar(calendarEl, {
		
		editable: true,
		selectable: true,
		locale: 'ko',
		initialView: 'dayGridMonth',
		contentHeight: 1000,
		headerToolbar: {
			left: 'prev,next today',
			center: 'title',
			right: 'dayGridMonth,timeGridWeek,timeGridDay'
		},
		eventColor: '#E6CDED', //default 컬러 설정
		displayEventTime: false,
		events: function(info, successCallback, failureCallback) {
			
			$.ajax({
				url: "getSchedule.bit",
				data: { userid : '${sessionScope.user.userid}' },
				dataType: "json",
				//async: false,
				success: function(response) {
					var schedule = response.schedule;
					var fixedDate = schedule.map(function(array) {
						//console.log("array>>> "+JSON.stringify(array));
						//console.log("getAllDay: "+array.allday);
						array.allday = true;
						//console.log("again: "+array.allday);
						//console.log("again array>>> "+JSON.stringify(array));
						//array.title = "["+moment(array.start).format('HH:mm') + "-" + moment(array.end).format('HH:mm') + "] "+ array.title;
						
						//console.log("content>>> "+array.content);
						return array;
					});
					successCallback(fixedDate);
				}
			}); // /.ajax

		},
		select: function(start, end, allDay) {

			// input 태그값 초기화
			$('#allday').prop("checked", false);
			$('#title').val('');
			$('#start').val('');
			$('#end').val('');
			$('#content').val('');

			// 모달 타이틀 바꾸기
			$('#modal-title-for-edit').hide();
			$('#modal-title-for-add').show();

			// 모달 버튼 바꾸기
			modifyBtnContainer.hide();
			addBtnContainer.show();

			// 모달 열기
			$('#createEventModal').modal('show');

			$('#save-event').on('click', function() {

				var start = $('#start').val();
				var end = $('#end').val();
				var titleVal = $('#title').val();
				var contentVal = $('#content').val();
				var petindexVal = $('#petindex').val();
				var colorVal = $('#color').val();
				
				// #allday 체크 여부에 따라 값 부여하기 
				//var allday = $('#allday');
				//var isallDay = "";
				
				//if(allday.is(':checked')) { isallDay = allday.val(); }
				//else { isallDay = 0; }
				
				var eventData = {
					userid: '${sessionScope.user.userid}',
					petindex: petindexVal,
					title: titleVal,
					start: moment(start).format('YYYY-MM-DD HH:mm:ss'),
					end: moment(end).format('YYYY-MM-DD HH:mm:ss'),
					content: contentVal,
					//allday: 1, // 1=true, 0=false 
					color: colorVal
				};

				if(eventData.title == "") {
					swal('일정명을 입력하세요.');
					return false;
				}

				if(eventData.start > eventData.end) {
					swal('끝나는 날짜가 시작 날짜보다 앞설 수 없습니다.');
					return false;
				}

				calendar.addEvent(eventData);
				//calendar.render();
				
				$('#createEventModal').modal('hide');

				$.ajax({
					type: "get",
					data: eventData,
					dataType: "JSON",
					url: "insertSchedule.bit",
					success: function(data) {
						console.log(data); //result값인 0(실패) 또는 1(성공) 출력
					},
					error: function(e) {
						console.log("insert에러: "+e);
					}
				});
				
			}); // /.저장하기
			
			
		},
		eventClick: function(event, jsEvent, view) {
			editEvent(event);
		} /*/.eventClick */

		// 문제: 수정하고 rerender가 바로 안됨 (함수명은 .render() 맞음)
		

		
	});
	
	calendar.render();

	/////////////////////////////////////////////함수 영역/////////////////////////////////////////////

	
	var editEvent = function(event, element, view) {

		console.log("======함수 실행==========");

		// JSON 형태로 데이터 출력해보고 싶으면 아래 실행 ---지우지 마세요---
		// console.log("나와: "+JSON.stringify(event));

		var title = event.event.title;
		var content = event.event.extendedProps.content;
		var sindex = event.event.extendedProps.sindex;
		var petindex = event.event.extendedProps.petindex;
		var allday = event.event.extendedProps.allday; //true, false로 리턴
		var start = event.event.start;
		var end = event.event.end;
		var color = event.event.backgroundColor;
		var userid = event.event.extendedProps.userid;
		
		// input 태그 초기화
		$('#allday').prop("checked", false);
		$('#title').val('');
		$('#start').val('');
		$('#end').val('');
		$('#content').val('');
		
		// 모달 타이틀 바꾸기
		$('#modal-title-for-add').hide();
		$('#modal-title-for-edit').show();

		// 모달 버튼 바꾸기
		addBtnContainer.hide();
		modifyBtnContainer.show();

		// 기존 정보 뿌리기
		$('#title').val(title);
		$('#content').val(content); 
		$('#start').val(moment(start).format('YYYY-MM-DD HH:mm'));
		$('#end').val(moment(end).format('YYYY-MM-DD HH:mm'));

		// 하루종일 여부 체크
		if(allday === true) {
			$('#allday').prop("checked", true);
		} else {
			$('#allday').prop("checked", false);
		}

		// 모달 열기 > 마지막에 열자
		$('#createEventModal').modal('show');


		$('#updateEvent').on('click', function() {

			$('#createEventModal').modal('hide');
			
			$.ajax({
					type: "get",
					data: {
						sindex: sindex,
						userid: '${sessionScope.user.userid}',
						petindex: $('#petindex').val(),
						title: $('#title').val(),
						start: moment($('#start').val()).format('YYYY-MM-DD HH:mm:ss'),
						end: moment($('#end').val()).format('YYYY-MM-DD HH:mm:ss'),
						content: $('#content').val(),
						//allday: 1, // 1=true, 0=false  $('#allday').val()
						color: $('#color').val()
					},
					dataType: "JSON",
					url: "updateSchedule.bit",
					success: function(response) {
							console.log(response);
						},
					error: function(e) {
							console.log("update error: "+e);
						}

				});
			calendar.render(); //이거 테스트해보기...........안돼.......

			});
		/*
		
		if(end === null) {
			end = start;
		}
		
		var content;
		var petindex;
		var end;
		var schedule = getSchedule();
		
		
		
		
		
		$('#end').val(moment(end).format('YYYY-MM-DD HH:mm'));

		

		// 시작 일자 설정
		$('#start').val(moment(start).format('YYYY-MM-DD HH:mm'));

		// 끝 일자 설정
		//$('#end').val(moment(end).format('YYYY-MM-DD HH:mm'));
		
		if(allday === true && end !== start) {
			$('#end').val(moment(end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'));
		} else if(allday !== true && end !== start) {
			$('#end').val(moment(end).format('YYYY-MM-DD HH:mm'));
		}
		

		
		$('#title').val(title);
		$('#content').val(content);
		
		

		$('#updateEvent').on('click', function() {
			
			$('#title').val('');
			$('#content').val('');
			$('#start').val('');
			$('#end').val('');
			$('#allday').prop("checked", false);
			$('#modal-title-for-add').show();

			$('#createEventModal').modal('hide');
		});

		//var event = info.event;
		
		$('#deleteEvent').on('click', function(info) {
			info.remove();
		});
		*/

	}
	
	
	
	// 일정 불러오기
	function getSchedule() {

		var schedule = [];

		$.ajax({
			url: "getSchedule.bit",
			data: { userid : '${sessionScope.user.userid}' },
			dataType: "json",
			async: false,
			success: function(response) {
					//console.log(response);
				$.each(response.schedule, function(index, element) {
					//console.log(response.schedule); //이거 자체가 json 배열인디? [ {}, {}, {}, ] 이렇게 생겼음
					//이걸 넘기도록 하자....?
					
					schedule = response.schedule;

					/*
					var viewData = {};
					
					viewData["title"] = element.title;
					viewData["start"] = element.start;

					if(element.allday == '1') {
						viewData["allDay"] = true;
					} else {
						viewData["allDay"] = false;
					}
					
					if(element.allday == '1' && element.start !== element.end) {
 						viewData["end"] = moment(element.end).add(1, 'days').format('YYYY-MM-DD HH:mm:ss');
					}
					//viewData["end"] = moment(element.end).format('YYYY-MM-DD HH:mm:ss');
					viewData["color"] = '#E6CDED'; //컬럼에 컬러값이 있어야 색깔별로 출력할 수 있을 듯... 어쨌든 여기에 적용하면 적용됨
					viewData["content"] = element.content;
					viewData["petindex"] = element.petindex;

					console.log("viewData: "+JSON.stringify(viewData));
					schedule.push(viewData);

					  */
				});
			}
		});

		//console.log("스케쥴 모양: "+schedule);
		return schedule;
	} // /.getSchedule()
	
	

}); // /.$(function)
</script>
</html>