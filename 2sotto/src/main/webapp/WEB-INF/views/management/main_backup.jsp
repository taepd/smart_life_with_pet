<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>

	<title>백업_동물관리 홈</title>
	
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

    </style>
    
    
</head>
<body>
	 
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	 
	 
	<div class="side_overlay">
		<div class="container">

		
		<button class="btn btn-primary btn-round" onclick="location.href='register.bit'">반려동물 등록</button>
		
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
					
						<!-- 일자 클릭시 메뉴오픈 -->
				        <div id="contextMenu" class="dropdown clearfix">
				            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
				                style="display:block;position:static;margin-bottom:5px;">
				                <li><a tabindex="-1" href="#">카테고리1</a></li>
				                <li><a tabindex="-1" href="#">카테고리2</a></li>
				                <li><a tabindex="-1" href="#">카테고리3</a></li>
				                <li><a tabindex="-1" href="#">카테고리4</a></li>
				                <li class="divider"></li>
				                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
				            </ul>
				        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="카테고리1">카테고리1</option>
                                    <option value="카테고리2">카테고리2</option>
                                    <option value="카테고리3">카테고리3</option>
                                    <option value="카테고리4">카테고리4</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
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
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="content">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="content" id="content"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>

            <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">구분별</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="카테고리1">카테고리1</option>
                            <option value="카테고리2">카테고리2</option>
                            <option value="카테고리3">카테고리3</option>
                            <option value="카테고리4">카테고리4</option>
                        </select>
                    </div>
                </div>

                <div class="col-lg-6">
                    <label for="calendar_view">등록자별</label>
                    <div class="input-group">
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="정연"
                                checked>정연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="다현"
                                checked>다현</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="사나"
                                checked>사나</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="나연"
                                checked>나연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="지효"
                                checked>지효</label>
                    </div>
                </div>

            </div>
        </div>
        <!-- /.filter panel -->
					
                    </div> <!-- 탭 끝 >> 지우지 말것 -->
					
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
    
	<!-- fullcalendar 3.9.0 CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css">
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script>
	
	<!-- moment.js > 시간 관련 -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/locale/ko.min.js"></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js'></script>
	
	<!-- SweetAlert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script>

	console.log('로그인한 유저 아이디: ${sessionScope.user.userid}');
	
	var draggedEventIsAllDay;
	var activeInactiveWeekends = true;

	function getDisplayEventDate(event) {

	  var displayEventDate;

	  if (event.allDay == false) {
	    var startTimeEventInfo = moment(event.start).format('HH:mm');
	    console.log(startTimeEventInfo);
	    var endTimeEventInfo = moment(event.end).format('HH:mm');
	    displayEventDate = startTimeEventInfo + " - " + endTimeEventInfo;
	  } else {
	    displayEventDate = "하루종일";
	  }

	  return displayEventDate;
	}

	function filtering(event) {
	  var show_username = true;
	  var show_type = true;

	  var username = $('input:checkbox.filter:checked').map(function () {
	    return $(this).val();
	  }).get();
	  var types = $('#type_filter').val();

	  show_username = username.indexOf(event.username) >= 0;

	  if (types && types.length > 0) {
	    if (types[0] == "all") {
	      show_type = true;
	    } else {
	      show_type = types.indexOf(event.type) >= 0;
	    }
	  }

	  return show_username && show_type;
	}

	function calDateWhenResize(event) {

	  var newDates = {
	    startDate: '',
	    endDate: ''
	  };

	  if (event.allDay) {
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
	    newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
	  } else {
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD HH:mm');
	    newDates.endDate = moment(event.end._d).format('YYYY-MM-DD HH:mm');
	  }

	  return newDates;
	}

	function calDateWhenDragnDrop(event) {
	  // 드랍시 수정된 날짜반영
	  var newDates = {
	    startDate: '',
	    endDate: ''
	  }

	  // 날짜 & 시간이 모두 같은 경우
	  if(!event.end) {
	    event.end = event.start;
	  }

	  //하루짜리 all day
	  if (event.allDay && event.end === event.start) {
	    console.log('1111')
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
	    newDates.endDate = newDates.startDate;
	  }

	  //2일이상 all day
	  else if (event.allDay && event.end !== null) {
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
	    newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
	  }

	  //all day가 아님
	  else if (!event.allDay) {
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD HH:mm');
	    newDates.endDate = moment(event.end._d).format('YYYY-MM-DD HH:mm');
	  }

	  return newDates;
	}

	var eventModal = $('#eventModal');

	var modalTitle = $('.modal-title');
	var editAllDay = $('#edit-allDay');
	var editTitle = $('#edit-title');
	var editStart = $('#edit-start');
	var editEnd = $('#edit-end');
	var editType = $('#edit-type');
	var editColor = $('#edit-color');
	var content = $('#content');

	var addBtnContainer = $('.modalBtnContainer-addEvent');
	var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


	/* ****************
	 *  새로운 일정 생성
	 * ************** */
	var newEvent = function (start, end, eventType) {

	    $("#contextMenu").hide(); //메뉴 숨김

	    modalTitle.html('새로운 일정');
	    editType.val(eventType).prop('selected', true);
	    editTitle.val('');
	    editStart.val(start);
	    editEnd.val(end);
	    content.val('');
	    
	    addBtnContainer.show();
	    modifyBtnContainer.hide();
	    eventModal.modal('show');

	    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
	    var eventId = 1 + Math.floor(Math.random() * 1000);
	    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

	    //새로운 일정 저장버튼 클릭
	    $('#save-event').unbind();
	    $('#save-event').on('click', function () {

	        var eventData = {

	            _id: eventId,
	            title: editTitle.val(),
	            start: editStart.val(),
	            end: editEnd.val(),
	            description: content.val(),
	            type: editType.val(),
	            username: '사나',
	            backgroundColor: editColor.val(),
	            textColor: '#ffffff',
	            allDay: false
	        };

	        if (eventData.start > eventData.end) {
	            alert('끝나는 날짜가 앞설 수 없습니다.');
	            return false;
	        }

	        if (eventData.title === '') {
	            alert('일정명은 필수입니다.');
	            return false;
	        }

	        var realEndDay;

	        if (editAllDay.is(':checked')) {
	            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
	            //render시 날짜표기수정
	            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
	            //DB에 넣을때(선택)
	            realEndDay = moment(eventData.end).format('YYYY-MM-DD');

	            eventData.allDay = true;
	        }

	        $("#calendar").fullCalendar('renderEvent', eventData, true);
	        eventModal.find('input, textarea').val('');
	        editAllDay.prop('checked', false);
	        eventModal.modal('hide');

	        //새로운 일정 저장
	        $.ajax({
	            type: "get",
	            url: "",
	            data: {
	                //.....
	            },
	            success: function (response) {
	                //DB연동시 중복이벤트 방지를 위한
	                //$('#calendar').fullCalendar('removeEvents');
	                //$('#calendar').fullCalendar('refetchEvents');
	            }
	        });
	    });
	};
	

		///////////////////////////////////////////////////////////////////////////////////////////////////////////

		$(function() {
			var calendar = $('#calendar').fullCalendar({

				  eventRender: function (event, element, view) {

				    //일정에 hover시 요약
				    element.popover({
				      title: $('<div />', {
				        class: 'popoverTitleCalendar',
				        text: event.title
				      }).css({
				        'background': event.backgroundColor,
				        'color': event.textColor
				      }),
				      content: $('<div />', {
				          class: 'popoverInfoCalendar'
				        }).append('<p><strong>등록자:</strong> ' + event.username + '</p>')
				        .append('<p><strong>구분:</strong> ' + event.type + '</p>')
				        .append('<p><strong>시간:</strong> ' + getDisplayEventDate(event) + '</p>')
				        .append('<div class="popoverDescCalendar"><strong>설명:</strong> ' + event.description + '</div>'),
				      delay: {
				        show: "800",
				        hide: "50"
				      },
				      trigger: 'hover',
				      placement: 'top',
				      html: true,
				      container: 'body'
				    });

				    return filtering(event);

				  },

				  //주말 숨기기 & 보이기 버튼
				  customButtons: {
				    viewWeekends: {
				      text: '주말',
				      click: function () {
				        activeInactiveWeekends ? activeInactiveWeekends = false : activeInactiveWeekends = true;
				        $('#calendar').fullCalendar('option', {
				          weekends: activeInactiveWeekends
				        });
				      }
				    }
				  },

				  header: {
				    left: 'today, prevYear, nextYear, viewWeekends',
				    center: 'prev, title, next',
				    right: 'month,agendaWeek,agendaDay,listWeek'
				  },
				  views: {
				    month: {
				      columnFormat: 'dddd'
				    },
				    agendaWeek: {
				      columnFormat: 'M/D ddd',
				      titleFormat: 'YYYY년 M월 D일',
				      eventLimit: false
				    },
				    agendaDay: {
				      columnFormat: 'dddd',
				      eventLimit: false
				    },
				    listWeek: {
				      columnFormat: ''
				    }
				  },

				  /* ****************
				   *  일정 받아옴 
				   * ************** */
				  events: function (start, end, timezone, callback) {
				    $.ajax({
				      url: "getSchedule.bit",
				      data: {
					      userid:'${sessionScope.user.userid}'
				        // 실제 사용시, 날짜를 전달해 일정기간 데이터만 받아오기를 권장
				      },
				      dataType: "json",
				      success: function (response) {
				        var fixedDate = response.schedule.map(function (array) {
				          if (array.allDay && array.start !== array.end) {
				            // 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
				            array.end = moment(array.end).add(1, 'days');
				          }
				          return array;
				        })
				        callback(fixedDate);
				      }
				    });
				  },

				  eventAfterAllRender: function (view) {
				    if (view.name == "month") {
				      $(".fc-content").css('height', 'auto');
				    }
				  },

				  //일정 리사이즈
				  eventResize: function (event, delta, revertFunc, jsEvent, ui, view) {
				    $('.popover.fade.top').remove();

				    /** 리사이즈시 수정된 날짜반영
				     * 하루를 빼야 정상적으로 반영됨. */
				    var newDates = calDateWhenResize(event);

				    //리사이즈한 일정 업데이트
				    $.ajax({
				      type: "get",
				      url: "",
				      data: {
				        //id: event._id,
				        //....
				      },
				      success: function (response) {
				        alert('수정: ' + newDates.startDate + ' ~ ' + newDates.endDate);
				      }
				    });

				  },

				  eventDragStart: function (event, jsEvent, ui, view) {
				    draggedEventIsAllDay = event.allDay;
				  },

				  //일정 드래그앤드롭
				  eventDrop: function (event, delta, revertFunc, jsEvent, ui, view) {
				    $('.popover.fade.top').remove();

				    //주,일 view일때 종일 <-> 시간 변경불가
				    if (view.type === 'agendaWeek' || view.type === 'agendaDay') {
				      if (draggedEventIsAllDay !== event.allDay) {
				        alert('드래그앤드롭으로 종일<->시간 변경은 불가합니다.');
				        location.reload();
				        return false;
				      }
				    }

				    // 드랍시 수정된 날짜반영
				    var newDates = calDateWhenDragnDrop(event);

				    //드롭한 일정 업데이트
				    $.ajax({
				      type: "get",
				      url: "",
				      data: {
				        //...
				      },
				      success: function (response) {
				        alert('수정: ' + newDates.startDate + ' ~ ' + newDates.endDate);
				      }
				    });

				  },

				  select: function (startDate, endDate, jsEvent, view) {

				    $(".fc-body").unbind('click');
				    $(".fc-body").on('click', 'td', function (e) {

				      $("#contextMenu")
				        .addClass("contextOpened")
				        .css({
				          display: "block",
				          left: e.pageX,
				          top: e.pageY
				        });
				      return false;
				    });

				    var today = moment();

				    if (view.name == "month") {
				      startDate.set({
				        hours: today.hours(),
				        minute: today.minutes()
				      });
				      startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
				      endDate = moment(endDate).subtract(1, 'days');

				      endDate.set({
				        hours: today.hours() + 1,
				        minute: today.minutes()
				      });
				      endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
				    } else {
				      startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
				      endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
				    }

				    //날짜 클릭시 카테고리 선택메뉴
				    var $contextMenu = $("#contextMenu");
				    $contextMenu.on("click", "a", function (e) {
				      e.preventDefault();

				      //닫기 버튼이 아닐때
				      if ($(this).data().role !== 'close') {
				        newEvent(startDate, endDate, $(this).html());
				      }

				      $contextMenu.removeClass("contextOpened");
				      $contextMenu.hide();
				    });

				    $('body').on('click', function () {
				      $contextMenu.removeClass("contextOpened");
				      $contextMenu.hide();
				    });

				  },

				  //이벤트 클릭시 수정이벤트
				  eventClick: function (event, jsEvent, view) {
				    editEvent(event);
				  },

				  locale: 'ko',
				  timezone: "local",
				  nextDayThreshold: "09:00:00",
				  allDaySlot: true,
				  displayEventTime: true,
				  displayEventEnd: true,
				  firstDay: 0, //월요일이 먼저 오게 하려면 1
				  weekNumbers: false,
				  selectable: true,
				  weekNumberCalculation: "ISO",
				  eventLimit: true,
				  views: {
				    month: {
				      eventLimit: 12
				    }
				  },
				  eventLimitClick: 'week', //popover
				  navLinks: true,
				  defaultDate: moment('2019-05'), //실제 사용시 삭제
				  timeFormat: 'HH:mm',
				  defaultTimedEventDuration: '01:00:00',
				  editable: true,
				  minTime: '00:00:00',
				  maxTime: '24:00:00',
				  slotLabelFormat: 'HH:mm',
				  weekends: true,
				  nowIndicator: true,
				  dayPopoverFormat: 'MM/DD dddd',
				  longPressDelay: 0,
				  eventLongPressDelay: 0,
				  selectLongPressDelay: 0
				});

		});




		

	</script>
	
	
	

</html>