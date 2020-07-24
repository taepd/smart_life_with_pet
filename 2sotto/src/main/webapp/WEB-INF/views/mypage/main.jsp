<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>

	<title>마이페이지</title>
	<%@ include file="/WEB-INF/include/import.jsp"%>
	<style>
	
		#tab-row {
    		margin-bottom: 100px;
    		margin-top: 73px;
    	}
    	#tab-list {
    		margin: 0 auto;
    	}
    	#mypage-img-wrapper img {
    		width: 280px;
    		height: 280px;
    	}
    	.mypage-card {
    		background-color: #ffffff;
 			box-shadow: rgba(0, 0, 0, 0.08) 0px 20px 40px 0px;
			padding: 40 100px;
			border-radius: 6px;	
			/* margin-bottom: 300px; */
			position: relative;
			height: 500px;
    	}
    	#mypage-img-wrapper {
    		position: absolute;
    		transform: translate(67%, 33%);
    	}
    	#mypage-myinfo-wrapper {
    		position: absolute;
    		width: 300px;
    		transform: translate(200%, 15%);
    	}
    	#edit-link {
    		 position: absolute;
    		 top: 385px;
    		 left: 285px;
    		 font-size: 13px;
    		 text-align: center;
    	}
    	.card-img-top {
			margin-top: 16px;
		}
		.card {
			margin-left: 10px;
			margin-right: 10px;
		}
		#mypage-editPwd-wrapper {
			width: 425px;
			position: absolute;
			transform: translate(83%, 32%);
		}
		#pwdEditBtn {
			position: absolute;		
			bottom: 72px;
			left: 500px;	
		}
		#delete {
			position: absolute;
			bottom: 0;
			right: 0;
			margin: 10px;
			font-size: 13px;
			color: #9E9E9E;
			font-weight: bold;
		}
	
	</style>

</head>
<body>

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>

	<div class="container">
		<div class="side_overlay">

			<!-- 탭 버튼 영역 -->
			<div class="row" id="tab-row">
				<ul class="nav nav-pills nav-pills-icons" id="tab-list" role="tablist">
	                <li class="nav-item">
	                  <a class="nav-link active show" href="#myPage-myInfo" role="tab" data-toggle="tab" aria-selected="false">
						<i class="material-icons">face</i>
	                    	내 정보
	                  </a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link" href="#myPage-myPetInfo" role="tab" data-toggle="tab" aria-selected="false">
	                    <i class="material-icons">pets</i>
	                    <!-- <span class="material-icons">home</span>  -->
	                    	내 반려동물 정보
	                  </a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link" href="#myPage-editMyPwd" role="tab" data-toggle="tab" aria-selected="true">
	                    <i class="material-icons">vpn_key</i>
	                    	비밀번호 변경
	                  </a>
	                </li>
            	</ul>
			</div> <!-- /.탭 버튼 영역 -->
			
			<!-- 탭 내용 영역 -->
			<div class="row">
				<div class="col-12">
					<div class="tab-content tab-space">
						<div class="tab-pane active show" id="myPage-myInfo">
							<div class="mypage-card">
								<form action="edit.bit" id="editForm" method="post" enctype="multipart/form-data">
									<div id="mypage-myinfo-wrapper">
							            <div class="form-group has-default bmd-form-group">
							            	<label>닉네임</label>
							                <input type="text" class="form-control" placeholder="닉네임" value="${user.nick}" id="nick" name="nick">
							                <button type="button" class="btn btn-primary btn-sm" id="btn-nickchk" style="position: absolute; top: 23px; right: 0;">중복확인 </button>
							            </div>
							            <div class="form-group has-default bmd-form-group">
							            	<label>이메일</label>
							                <input type="text" class="form-control" placeholder="이메일" value="${user.userid}" disabled>
							            </div>
							            <div class="form-group has-default bmd-form-group">
							            	<label>잔여포인트</label>
							                <input type="text" class="form-control" placeholder="잔여포인트" value="${user.point}" disabled>
							            </div>
							            <div class="form-group has-default bmd-form-group">
							            	<label>지역</label>
							                <input type="text" class="form-control" placeholder="위치" value="${user.loc}" id="loc" name="loc">
											<input type="hidden" name="lat" id="lat"> 
											<input type="hidden" name="lon" id="lon">
							            </div>
							            <button type="button" id="currentLoc" class="btn btn-primary btn-sm social facebook btn-flat btn-addon mb-3"
							            	style="position: absolute; bottom: 87px; right: -1px;">
											<i class="fa fa-crosshairs"></i>
										</button>
										<div id="layer"
											style="border-radius: 10px; margin-bottom: 10px; display: none; position: absolute; overflow: hidden; z-index: 1; top: 0px; left: 0px; max-width: 600px; width: 100%; height: 400px; border: 1px solid #e6e6e6;">
											<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer"
												style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1; width: 20px" alt="닫기 버튼">
										</div>
							            <div class="form-group has-default bmd-form-group">
							            	<label>휴대폰번호</label>
							                <input type="text" class="form-control" placeholder="휴대폰번호" value="${user.cpnumber}" id="cpnumber" name="cpnumber">
							            </div>
									</div>
									<div id="mypage-img-wrapper">
										<img id="previous-img" class="rounded-circle img-fluid" src="${pageContext.request.contextPath}/assets/images/${user.uimg}" rel="nofollow" alt="프로필 사진">
									</div>
									<div id="edit-link">
										<label for="uimg" id="editImgText">사진 바꾸기</label>
										<input type="file" id="uimg" name="file" style="display: none;" onchange="readURL(this);">
										<!-- <span id="imgFileName" style="display: none;">&nbsp;&nbsp;</span> -->
										<br>
										<a href="javascript:void(0);" onclick="changeBtn();" id="editBtn" class="btn btn-sm">내 정보 수정</a>
									</div>
									<input type="hidden" value="${sessionScope.user.userid}" name="userid">
								</form>
							</div>
						</div>
						
						<div class="tab-pane" id="myPage-myPetInfo">
							<div class="row">
							<c:forEach items="${petList}" var="pet">
								<div class="card col-4" style="width: 20rem;">
								<img class="card-img-top" src="${pageContext.request.contextPath}/assets/images/${pet.petimg}" style="height:250px"rel="nofollow" alt="card image">
								  <div class="card-body">
									<h4>${pet.petname}</h4>
								    <p class="card-text" id="petInfo">
								    	<fmt:parseNumber var="age" value="${pet.age/12}" integerOnly="true"/>
								    	${pet.scaname} | 
								    	${pet.size == 'small' ? '소형':pet.size == 'medium'? '중형':'대형'}${pet.mcategory == '1' ? '견':'묘'} | 
								    	${pet.weight}kg | 
								    	<br>
								    	${age}년 ${pet.age%12}개월 | 
								    	${pet.sex == 'female' ? '암컷':'수컷' } | 
								    	${pet.nstate == 'n' ? '중성화X':'중성화O'} |
								    	<br>
								    	${pet.memo}
								    </p>
								    <div>

										<!-- 나중에 아이콘으로 바꾸기~~~ -->
										
										<!-- <a><span class="icons"><i class="fas fa-pen"></i></span></a> -->
								    	<a href="${pageContext.request.contextPath}/management/edit.bit?petindex=${pet.petindex}">수정</a>
								    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								    	<!-- <span class="icons"><i class="fas fa-times"></i></span> 삭제 아이콘...-->
								    	<a href="${pageContext.request.contextPath}/management/delete.bit?petindex=${pet.petindex}">삭제</a>
								    </div>
								  </div>
							</div>
							
							
							</c:forEach>
							</div>
						</div>
						
						
						
						
						
						
						
						
						
						
						<div class="tab-pane" id="myPage-editMyPwd">
							<div class="mypage-card">
								<form action="editPwd.bit" id="editPwdForm" method="post" enctype="multipart/form-data">
									<div id="mypage-editPwd-wrapper">
							            <div class="form-group has-default bmd-form-group">
							            	<label>현재 비밀번호</label>
							                <input type="password" class="form-control" placeholder="" id="pwd" name="pwd">
							            </div>
							            <div class="form-group has-default bmd-form-group">
							            	<label>새 비밀번호</label>
							                <input type="password" class="form-control" placeholder="" id="newPwd" name="newPwd"
												title="8~20자 사이에 적어도 하나의 영어 대문자, 숫자, 특수문자가 포함되어야 합니다.">
											<div class="newPwdMsg" style="font-size: 12px; color: #F27D7D"></div>
							            </div>
							            <div class="form-group has-default bmd-form-group">
							            	<label>새 비밀번호 확인</label>
							                <input type="password" class="form-control" placeholder="" id="newPwdCheck" name="newPwdCheck">
							            	<div class="newPwdChkMsg" style="font-size: 12px; color: #F27D7D"></div>
							            </div>
							            <!-- <div class="col-sm-12 tdpwch" align="left	"></div> -->
									</div>
									<button type="submit" class="btn btn-sm" id="pwdEditBtn">비밀번호 수정</button>
								</form>
								
								
								<a href="javascript:void(0);" id="delete">회원 탈퇴</a>
								 
								<!-- <button id="delete" class="btn btn-white btn-round btn-sm">회원탈퇴</button> -->
							</div>
						</div>
					</div>
				</div> <!-- /.col-12 -->
			</div> <!-- /.row -->
		</div> <!-- /.side_overlay -->
	</div> <!-- /.container --> 
	
	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>

<!-- 카카오 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14e1cd5829baabce1e0239e9778eb76a&libraries=services"></script>
<!-- 카카오 주소 api 호출 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	$(function() {
		
		$('#currentLoc, #btn-nickchk, #editImgText').hide();
		$('#nick, #loc, #cpnumber').attr('readonly', true);

		//moveTab();



		// 비밀번호 확인
		var validate = new Array;
		//password
		$('#newPwd')
				.keyup(
						function() {
							let pwd = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{8,20}$/;
							if (!pwd.test($(this).val())) {
								$('.newPwdMsg').html('<b>8~20자 사이에 적어도 하나의 영어 대문자, 숫자, 특수문자가 포함되어야 합니다.</b>');
								validate[0] = false;
							} else if( $('#pwd').val() == $(this).val() ) {
								$('.newPwdMsg').html('<b>기존 비밀번호와 같을 수 없습니다.</b>');
								validate[0] = false;
							} else {
								$('.newPwdMsg').html('<b>적합한 패스워드입니다.</b>');
								validate[0] = true;
							}
							console.log(validate[0]);
						});
		//password check
		$('#newPwdCheck').keyup(function() {
			if ($('#newPwd').val() != $('#newPwdCheck').val()) {
				$('.newPwdChkMsg').html('<b>비밀번호가 다릅니다.</b>');
				validate[1] = false;
			} else {
				$('.newPwdChkMsg').html('<b>비밀번호가 일치합니다.</b>');
				validate[1] = true;
			}
			console.log(validate[1]);
		});

		/*
		$('input').focus(function() {
			$(this).css('background-color', "gold");
		});
		$('input').blur(function() {
			$(this).css('background-color', "white");
		});
		*/

		//입력 다 했는지 검증
		//$('input:not([type=file])').prop("required", true);
		//$('#id').attr("required","required");

		//submit 클릭시 올바르지 않은 입력 검증
		$('button:submit').click(function() {
			for (let i = 0; i < validate.length; i++) {
				if (validate[i] == false) {
					swal("올바르지 않은 입력이 있습니다.");
					console.log(i);
					switch (i) {
					case 0:
						$('#pwd').focus();
						return false;
					case 1:
						$('#pwdCheck').focus();
						return false;
					}
				}
			}
		});

		// 탈퇴 전 확인 창 띄우기
		$('#delete').click(function(){
			
			let con = confirm("정말로 탈퇴하시겠습니까?");
			if(con){
				return location.href='withdrawal.bit?userid=${userid}';
			}else{
				return false;
			}
		});
		

		

		

		
		

	}); /*/.onload */


	
	

	/**
	* @함수명 : moveTab()
	* @작성일 : 2020. 7. 21.
	* @작성자 : 김건휘, 김보성, 태영돈
	* @설명 : 작업 처리 후 원래 탭 위치로 이동시키는  함수
	* @param void
	**/
	function moveTab(){
		if( ${param.tab eq 'mrecord'} ){
			$("#mrecordTab").trigger("click");
		}
		//탭 위치 수정하고 활성화 하기
		/* else if(${param.tab eq 'myPets'}){
			document.getElementById("myPetsTab")[0].click(); //위와 같은 기능의 js문법
		} */
	}

	/**
	* @함수명 : editMyInfo()
	* @작성일 : 2020. 7. 22.
	* @작성자 : 채현아
	* @설명 : 회원 정보 수정 처리
	* @param void
	**/
	function changeBtn() {
		
		$('#editBtn').html('수정 완료');
		$('#currentLoc, #btn-nickchk, #editImgText').show();
		$('#nick, #loc, #cpnumber').attr('readonly', false);
		$('#nick, #loc, #cpnumber').css('background-color', 'rgba(151, 150, 240, 0.15)');
		editMyInfo();
	}


	// 수정포인트 1. 정보를 가져오는 것도 ajax여야 한다 
	// 비동기로 하는 게 맞나... 고민...
	// 비동기면 headerandnavi도 비동기로 가져와야 함;;;;
	
	function editMyInfo() {
		$('#editBtn').on('click', function() {
			
			var form = $('#editForm')[0];
			var formData = new FormData(form);
			//var userid = '${sessionScope.user.userid}';
			
			$.ajax({
				url: "edit.bit",
				type: "post",
				async: false,
				data: formData, 	
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				success: function(response) {
					console.log(response);
					$('#editBtn').html('내 정보 수정');
					$('#nick, #loc, #cpnumber').css('background-color', '#ffffff');
					
					$('#nick, #loc, #cpnumber').attr('readonly', true);
					$('#currentLoc, #btn-nickchk, #editImgText').hide();
				}
			});			
		});
	}


	//카카오 주소
	var element_layer = document.getElementById('layer');
	var themeObj = {};
	function closeDaumPostcode() {
		element_layer.style.display = 'none';
	}
	var element_layer = document.getElementById('layer');
	$("#loc").click(function() {
		sample2_execDaumPostcode()
	})
	$("#btnCloseLayer").click(function() {
		closeDaumPostcode()
	})
	function sample2_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}
						if (data.userSelectedType === 'R') {
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName
										: data.buildingName);
							}
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
						}
						//주소 인풋창에 입력
						$("#loc").val(addr);
						//주소값을 이용해서 좌표값 입력
						addrToCoor(addr);

						element_layer.style.display = 'none';
					},
					width : '100%',
					height : '100%',
					maxSuggestItems : 5,
					theme : themeObj
				}).embed(element_layer);
		element_layer.style.display = 'block';

	}

	// html5 geolocation을 이용하여 현재 위치 값 받아내기
	$('#currentLoc')
			.click(
					function getLocation() {
						if (navigator.geolocation) { // GPS를 지원하면
							navigator.geolocation
									.getCurrentPosition(
											function(position) {
												/*
												alert(position.coords.latitude
														+ ' '
														+ position.coords.longitude);
												*/
												//위도/경도 값 저장
												$('#lat')
														.val(
																position.coords.latitude);
												$('#lon')
														.val(
																position.coords.longitude);

												console.log($('#lat').val());
												console.log($('#lon').val());
												//카카오 지도 api 라이브러리 활용, 좌표에서 주소로 변환 // 
												var geocoder = new kakao.maps.services.Geocoder();

												var coord = new kakao.maps.LatLng(
														position.coords.latitude,
														position.coords.longitude);
												var callback = function(
														result, status) {
													let currentAddr = result[0].address.address_name;
													if (status === kakao.maps.services.Status.OK) {
														//console.log('그런 너를 마주칠까 '+ currentAddr+ '을 못가');
													}
													$("#loc").val(
															currentAddr);

												};

												geocoder.coord2Address(
														coord.getLng(),
														coord.getLat(),
														callback);

												//카카오 지도api 라이브러리 활용, 좌표에서 주소로 변환 끝 //

											}, function(error) {
												console.error(error);
											}, {
												enableHighAccuracy : false,
												maximumAge : 0,
												timeout : Infinity
											});
						} else {
							alert('GPS를 지원하지 않습니다');
						}
					});
	//html5 geolocation을 이용하여 현재 위치 값 받아내기 끝

	//카카오 api활용 주소값으로 좌표값 얻어내기

	function addrToCoor(addr) {

		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색
		geocoder.addressSearch(addr, function(result, status) {

			// 정상적으로 검색이 완료됐으면,
			if (status == daum.maps.services.Status.OK) {

				$('#lat').val(result[0].y);
				$('#lon').val(result[0].x);

			}
		});
	}


	//***********************************//
	//  닉네임 중복 체크
	//***********************************//	

	$('#btn-nickchk')
			.click(
					function() {
						//닉네임 중복 체크
						$('#nick').change(function() {
							//$('#id_check_sucess').hide();
							$('#btn-nickchk').show();
							$('#nick').attr("check_result", "fail");
						});

						if ($('#nick').val() == '') {
							alert('닉네임을 입력해주세요.')
							return;
						}
						

						console.log($('#nick').val());

						$.ajax({
							type : "POST",
							url : 'nickCheck.bit', 
							data : {
								nick : $('#nick').val()
							},
							datatype : 'json',
							success : function(data) {
								console.log(data);
								if (data[0] != null) {
									alert("이미 존재하는 닉네임 입니다.");
									$("#nick").val('');
									$("#nick").focus();
									return;
								} else {
									alert("사용가능한 닉네임 입니다.");
									$('#nick').attr("check_result",
											"success");
									// $('#id_check_sucess').show();
									//$('#btn-idchk').hide();
									return;
								}
							}
						});
					});

	//***********************************//
	// 이미지 파일 업로드시 이미지 미리보기
	//***********************************//
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#previous-img').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
		//$('#imgFileName').html(input.files[0].name);
	};
		
</script>
</html>