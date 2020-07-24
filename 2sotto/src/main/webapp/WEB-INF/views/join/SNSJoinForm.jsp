<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html>
<head>
	<title>회원 가입</title>
	<%@ include file="/WEB-INF/include/import.jsp"%>

	<!-- 아래 jquery cdn을 주석처리하면 중복체크 속성값이 인풋창 클릭시 리셋되는 문제 발생. 어째서? -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- 카카오 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14e1cd5829baabce1e0239e9778eb76a&libraries=services"></script>
	<!-- 카카오 주소 api 호출 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<style>
		@font-face {
			font-family: 'netmarbleM';
			src: url('../assets/fonts/netmarbleM.ttf') format('truetype'); 
		}

		.area {
			box-shadow: rgba(0, 0, 0, 0.08) 0px 20px 40px 0px;
			padding-top: 100px;
			padding-bottom: 100px;
			text-align: center;
			background-color: #fafafa;
		}

		h1, h3 {
			font-family : 'netmarbleM', sans-serif;
			/* color: #9c27b0; */
		}

		h1 {
			margin-top: 30px;
		}

		.title-area {
			text-align: center;
			margin-bottom: 80px;
		}

		#joinForm-wrapper {
			display: inline-block;
			width: 428px;
		}

		#joinForm {
			margin-bottom: 0;
		}

	</style>

</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>

	<div class="container">
		<div class="side_overlay">
			<div class="row">
				<div class="col-12 title-area">
					<h1>어서오시개, 가입하냥 <i class="fas fa-paw"></i></h1>
				</div>
				<div class="col-2"></div>
				<div class="col-8 area">
					<form id="joinForm" action="../join/normalJoin.bit" enctype="multipart/form-data" method="post">
						<!-- 어떤 소셜 타입인지 받는 값  -->
						<input type="hidden" name="snstype" value="${snstype}"> 
						
						<div id="joinForm-wrapper">

							<div class="form-group has-default bmd-form-group">
								<input type="text" class="form-control" value="${sns_id}" id="userid" name="userid" readonly>
							</div>

							<div class="form-group has-default bmd-form-group">
								<input type="password" class="form-control" placeholder="비밀번호를 입력하세요." id="pwd" name="pwd">
								<!-- 8~20자 사이에 적어도 하나의 영어대문자,숫자, 특수문자가 포함되어야 합니다. -->
								<div class="tdpw" style="font-size: 12px; color: #F27D7D; text-align: left;"></div>
							</div>

							<div class="form-group has-default bmd-form-group">
								<input type="password" class="form-control" placeholder="비밀번호를 확인합니다." id="pwdCheck" name="pwdCheck">
								<!-- 비밀번호가 다릅니다. -->
								<div class="tdpwch" style="font-size: 12px; color: #F27D7D; text-align: left;"></div>
							</div>

							<div class="form-group has-default bmd-form-group">
								<input type="text" class="form-control" placeholder="닉네임을 입력하세요." value="${user.nick}" id="nick" name="nick">
								<button type="button" class="btn btn-sm" id="btn-nickchk" style="position: absolute; top: 23px; right: 0;">중복확인</button>
								<!-- 닉네임 응원. > ????? -->
								<div class="col-sm-12 tdnick" style="font-size: 12px; color: #F27D7D; text-align: left;"></div>
							</div>

							<div class="form-group has-default bmd-form-group">
								<input type="text" class="form-control" placeholder="휴대폰 번호를 입력하세요." id="cpnumber" name="cpnumber">
								<!-- <button type="button" class="btn btn-sm" id="btn-cpnumberchk" style="position: absolute; top: 23px; right: 0;">중복확인</button> -->
							</div>

							<div class="form-group has-default bmd-form-group">
								<input type="text" class="form-control" placeholder="지역을 설정합니다." id="loc" name="loc">
								<input type="hidden" name="lat" id="lat"> 
								<input type="hidden" name="lon" id="lon">
								<button type="button" id="currentLoc" class="btn btn-sm social facebook btn-flat btn-addon mb-3"
									style="position: absolute; bottom: -9px; right: -1px;">
									<i class="fa fa-crosshairs"></i> 현재 위치로 찾기
								</button>
							</div>

							<div id="layer"
								style="border-radius: 10px; margin-bottom: 10px; display: none; position: absolute; overflow: hidden; z-index: 1; top: 0px; left: 0px; max-width: 600px; width: 100%; height: 400px; border: 1px solid #e6e6e6;">
								<img
									src="//t1.daumcdn.net/postcode/resource/images/close.png"
									id="btnCloseLayer"
									style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1; width: 20px"
									alt="닫기 버튼">
							</div>

							<div class="form-group has-default bmd-form-group">
								<div style="display: inline-block;">
									<img id="img" src="../assets/images/profile-circle.png" alt="" width="150px"
									height="150px" class="rounded-circle img-fluid"  />  <!--style="border-radius: 10px;" -->
									<!-- <span id="imgFileName" style="display: none;">&nbsp;&nbsp;</span> -->
									<label class="btn btn-primary btn-default btn-file btn-sm">
										이미지 설정/변경 
										<input class="input--style-4" type="file" name="file" style="display: none;" onchange="readURL(this);">
									</label>
								</div>	
							</div>
							<div class="form-group has-default bmd-form-group" style="margin-bottom: 0;">
								<div>
									<button type="submit" class="btn btn-primary">전송</button>
									<button type="reset" class="btn btn-rose">취소</button>
								</div>
							</div>
						</div> <!-- /.wrapper -->
					</form>
				</div>
				<div class="col-2"></div>
			</div> <!-- /.row -->
		</div> <!-- /.side_overlay --> 
	</div> <!-- /.container -->				

	<!-- footer -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>

<script type="text/javascript">
	
	var validate = new Array;
	$(function() {
		

		//nick검증(nick 형식) 필요할것같아서 미리 만들었습니다.
		/*
		$('#nick')
				.keyup(
						function() {
							let nick = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
							if (!nick.test($('#nick').val())) {
								$('.tdnick')
										.html(
												'<b style="color:red">적합하지 않은 닉네임 형식입니다.</b>');
								validate[0] = false;
							} else {
								$('.tdnick').html('<b>아주 멋진 닉네임입니다.</b>');
								validate[0] = true;
							}
							console.log(validate[0]);
						});
						*/

		//password
		$('#pwd')
				.keyup(
						function() {
							let pwd = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{8,20}$/;
							if (!pwd.test($(this).val())) {
								$('.tdpw')
										.html(
												'<b>8~20자 사이에 적어도 하나의 영어 대문자,숫자, 특수문자가 포함되어야 합니다.</b>');
								validate[1] = false;
							} else {
								$('.tdpw').html('<b>적합한 비밀번호입니다.</b>');
								validate[0] = true;
							}
							console.log(validate[0]);
						});
		//password check
		$('#pwdCheck').keyup(function() {
			if ($('#pwd').val() != $('#pwdCheck').val()) {
				$('.tdpwch').html('<b>비밀번호가 다릅니다.</b>');
				validate[1] = false;
			} else {
				$('.tdpwch').html('<b>비밀번호가 일치합니다.</b>');
				validate[1] = true;
			}
			console.log(validate[1]);
		});

		//입력 다 했는지 검증
		$('input:not([type=file])').prop("required", true);
		//$('#id').attr("required","required");

		//submit 클릭시 올바르지 않은 입력 검증
		$('button:submit').click(function() {
			for (let i = 0; i < validate.length; i++) {
				if (validate[i] == false) {
					alert("올바르지 않은 입력이 있습니다.");
					console.log(i);
					switch (i) {
					case 0:
						$('#pwd').focus();
						return false;
					case 2:
						$('#pwdCheck').focus();
						return false;
					case 3:
						$('#nick').focus();
						return false;
					}
				}
			}

			if ($('#nick').attr("check_result") == "fail") {
				alert("닉네임 중복확인을 해주시기 바랍니다.");
				$('#nick').focus();
				return false;
			}
		});
	}); // /.onload

		//카카오 지도
		/* 
		 $('#searchMap').click(function(){
		 var container = document.getElementById('map');
		 var options = {
		 center: new kakao.maps.LatLng(33.450701, 126.570667),
		 level: 3
		 };
		
		 var map = new kakao.maps.Map(container, options);
		 }); */
		//카카오지도 끝
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

		// html5 geolocation을 이용하여 현재 위치 값 받아내기

		$('#currentLoc')
				.click(
						function getLocation() {
							if (navigator.geolocation) { // GPS를 지원하면
								navigator.geolocation
										.getCurrentPosition(
												function(position) {
													// alert(position.coords.latitude
													// 		+ ' '
													// 		+ position.coords.longitude);
													//위도/경도 값 저장
													$('#lat')
															.val(
																	position.coords.latitude);
													$('#lon')
															.val(
																	position.coords.longitude);

													console
															.log($('#lat')
																	.val());
													console
															.log($('#lon')
																	.val());
													//카카오 지도 api 라이브러리 활용, 좌표에서 주소로 변환 // 
													var geocoder = new kakao.maps.services.Geocoder();

													var coord = new kakao.maps.LatLng(
															position.coords.latitude,
															position.coords.longitude);
													var callback = function(
															result, status) {
														let currentAddr = result[0].address.address_name;
														if (status === kakao.maps.services.Status.OK) {
															console
																	.log('그런 너를 마주칠까 '
																			+ currentAddr
																			+ '을 못가');
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
	
		//***********************************//
		// 이미지 파일 업로드시 이미지 미리보기
		//***********************************//
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#img').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
			$('#imgFileName').html(input.files[0].name);
		};

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
								swal('닉네임을 입력해주세요.')
								return;
							}

							console.log($('#nick').val());

							$.ajax({
								type : "POST",
								url : '../join/nickCheck.bit', 
								data : {
									nick : $('#nick').val()
								},
								datatype : 'json',
								success : function(data) {
									console.log(data);
									if (data[0] != null) {
										swal("이미 존재하는 닉네임 입니다.");
										$("#nick").val('');
										$("#nick").focus();
										return;
									} else {
										swal("사용가능한 닉네임 입니다.");
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
		//  휴대폰번호 중복 체크
		//***********************************//	
/*
		$('#btn-cpnumberchk')
				.click(
						 function() {
							//휴대폰 번호 적합성 체크
							let cpnumber = /^\d{3}-\d{3,4}-\d{4}$/;
							if (!cpnumber.test($('#cpnumber').val())) {
								alert('적합하지 않은 휴대폰 번호 형식입니다');
								$('#cpnumber').focus();
								return;
							}
							;
							//휴대폰 중복 체크
							$('#cpnumber').change(function() {
								//$('#id_check_sucess').hide();
								$('#btn-cpnumberchk').show();
								$('#cpnumber').attr("check_result", "fail");
						 	});
							

							if ($('#cpnumber').val() == '') {
								alert('휴대폰 번호를 입력해주세요.')
								return;
							}

							console.log($('#cpnumber').val());

							$.ajax({
								type : "POST",
								url : 'join/cpnumberCheck.bit',
								data : {
									cpnumber : $('#cpnumber').val()
								},
								datatype : 'json',
								success : function(data) {
									console.log(data);
									if (data[0] != null) {
										alert("이미 존재하는 휴대폰 번호 입니다.");
										$("#cpnumber").val('');
										$("#cpnumber").focus();
										return;
									} else {
										alert("사용가능한 휴대폰 번호 입니다.");
										$('#cpnumber').attr("check_result",
												"success");
										// $('#id_check_sucess').show();
										//$('#btn-idchk').hide();
										return;
									}
								}
							});
						});  */

		

		/*colorpicker*/
		// $('.demo').each(function() {
			//
			// Dear reader, it's actually very easy to initialize MiniColors. For example:
			//
			//  $(selector).minicolors();
			//
			// The way I've done it below is just for the demo, so don't get confused
			// by it. Also, data- attributes aren't supported at this time...they're
			// only used for this demo.
			//
		// 	$(this).minicolors({
		// 		control : $(this).attr('data-control') || 'hue',
		// 		position : $(this).attr('data-position') || 'bottom left',
		// 		change : function(value, opacity) {
		// 			if (!value)
		// 				return;
		// 			if (opacity)
		// 				value += ', ' + opacity;
		// 			if (typeof console === 'object') {
		// 				console.log(value);
		// 			}
		// 		},
		// 		theme : 'bootstrap'
		// 	});

		// });
		/*datwpicker*/
		// $('.mydatepicker').datepicker();
		// $('#datepicker-autoclose').datepicker({
		// 	autoclose : true,
		// 	todayHighlight : true
		// });
		// var quill = new Quill('#editor', {
		// 	theme : 'snow'
		// })
	</script>
</html>