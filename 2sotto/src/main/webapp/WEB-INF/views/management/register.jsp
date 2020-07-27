<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>

	<title>반려동물 등록하기</title>
	
	<%@ include file="/WEB-INF/include/import.jsp"%>
	
	<style>
		
	/* 	.custom-select {
			width: 200px;
		}
		
		input[type=text] {
			width: 200px;
		} */
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
			border-radius: 6px;	
		}

		h1, h3 {
			/* font-family : 'netmarbleM', sans-serif; */
			font-family: 'Noto Sans KR', sans-serif;
			/* color: #9c27b0; */
		}

		h1 {
			margin-top: 30px;
		}
		.title-area {
			text-align: center;
			margin-bottom: 80px;
		}
		#register-wrapper {
			display: inline-block;
			width: 428px;
			text-align: left;
		}
		#regisger {
			margin-bottom: 0;
		}
		.form-check-label {
    		padding-left: 20px !important;
    		padding-right: 10px !important;
		}
		.form-check {
			margin-bottom: 25px !important;
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
					<h1>반려동물 등록하기 <i class="fas fa-paw"></i></h1>
			</div>
			<div class="col-2"></div>
			<div class="col-8 area">
				<form id="register" action="register.bit" method="post" enctype="multipart/form-data">
					<div id="register-wrapper">
						<div class="form-group has-defalut bmd-form-group">
							<label for="petname" class="bmd-label-floating">이름</label>
							<input type="text" class="form-control" id="petname" name="petname">
						</div>
						
						<div class="form-group">
							<label for="mcategory">종류</label>
							<select class="custom-select" id="mcategory" name="mcategory"> <!-- ex) ?mcategory=dog -->
							</select>
						</div>
						
						<div class="form-group">
							<label for="scategory">종 선택하기</label>
							<select class="custom-select" id="scategory" name="scategory">
							</select>
						</div>
						
						<div class="form-check">
							<label for="sex">성별</label>
							<br>
							<label class="form-check-label">
								<input class="form-check-input" type="radio" name="sex" id="sex_female" value="female">
									암컷
								<span class="circle">
									<span class="check"></span>
								</span>
							</label>
							<label class="form-check-label">
								<input class="form-check-input" type="radio" name="sex" id="sex_male" value="male">
									수컷
								<span class="circle">
									<span class="check"></span>
								</span>
							</label>
						</div>
						
						<div class="form-group bmd-form-group">
							<label for="weight" class="bmd-label-floating">몸무게</label>
							<input type="text" class="form-control" id="weight" name="weight"/>
							<div style="position:absolute; top: 35px; right:0;">kg</div>
						</div>
						
						<br>
						
						<div class="form-group">
				<label for="age">나이</label>
				<br>
				<select class="custom-select" style="width:40%;" id="age_year" name="age_year">
				</select>
				<span>년</span>
				<select class="custom-select" style="width:44.2%; margin-left:10px;" id="age_month" name="age_month">
				</select>
				<span>개월</span>
			</div>
						
						<div class="form-check">
							<label for="hlength">털 길이</label>
							<br>
							<label class="form-check-label">
								<input class="form-check-input" type="radio" name="hlength" id="hlength_short" value="short">
									짧음
								<span class="circle">
									<span class="check"></span>
								</span>
							</label>
							<label class="form-check-label">
								<input class="form-check-input" type="radio" name="hlength" id="hlength_medium" value="medium">
									중간
								<span class="circle">
									<span class="check"></span>
								</span>
							</label>
							<label class="form-check-label">
								<input class="form-check-input" type="radio" name="hlength" id="hlength_long" value="long">
									김
								<span class="circle">
									<span class="check"></span>
								</span>
							</label>
						</div>
						
						<div class="form-check">
							<label for="size">크기</label>
							<br>
							<label class="form-check-label">
								<input class="form-check-input" type="radio" name="size" id="size_small" value="small">
									소형
								<span class="circle">
									<span class="check"></span>
								</span>
							</label>
							<label class="form-check-label">
								<input class="form-check-input" type="radio" name="size" id="size_medium" value="medium">
									중형
								<span class="circle">
									<span class="check"></span>
								</span>
							</label>
							<label class="form-check-label">
								<input class="form-check-input" type="radio" name="size" id="size_big" value="big">
									대형
								<span class="circle">
									<span class="check"></span>
								</span>
							</label>
						</div>
						
						<div class="form-check">
							<label for="nstate">중성화 여부</label>
							<br>
							<label class="form-check-label">
								<input class="form-check-input" type="radio" name="nstate" id="nstate_y" value="y">
									Y
								<span class="circle">
									<span class="check"></span>
								</span>
							</label>
							<label class="form-check-label">
								<input class="form-check-input" type="radio" name="nstate" id="nstate_n" value="n">
									N
								<span class="circle">
									<span class="check"></span>
								</span>
							</label>
						</div>
						
						<div class="form-group bmd-form-group">
							<label for="memo" class="bmd-label-floating">특이사항</label>
							<input type="text" class="form-control" id="memo" name="memo">
						</div>
						<div class="form-group bmd-form-group">
							<div class="input-group">
								<label for="cono1" class="label" style="text-align: left">
									반려동물 프로필 이미지 등록
								</label>
								<div style="float: left;">
									<label class="btn btn-primary btn-default btn-file"
										style="padding: 10px 20px; margin-right: 80px">
										이미지 설정/변경 
										<input class="input--style-4" type="file"
										name="file" style="display: none;"
										onchange="readURL(this);">
									</label> &nbsp;&nbsp;&nbsp;&nbsp; 
										<img id="img" name="petimg" src="../assets/images/pet_profile.jpg" alt="" width="150px"
										height="150px" style="border-radius: 10px;" /> 
										<span id="imgFileName">&nbsp;&nbsp;</span>
								</div>	
							</div>
						</div>
						
						<br>
					<!-- <input type="file" id="petimg" name="petimg"> -->
					<div class="text-center">							
						<button type="submit" class="btn btn-primary">등록</button>
						<button type="reset" class="btn btn-outline-primary">다시쓰기</button>
						<button type="reset" class="btn btn-outline-primary" onclick="location.href='#'">취소</button>
					</div>	
				</div> <!-- /.wrapper -->
				</form>
				</div>
				<div class="col-2"></div>
			</div> <!-- /.row -->
		</div> <!-- /.side_overlay --> 
	</div> <!-- /.container -->

	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
<script>
	
	$(function() {
		
		getMainCategory();
		makeAgeYear();
		makeAgeMonth();

		$('#mcategory').change(function() {
			if($('#mcategory').val() == '1') { // 1=개
				getSubCategory('dog');
			} else { // 2=고양이
				getSubCategory('cat');
			}
		});

	});

	function getMainCategory() {

		$.ajax({
			type: "get",
			url: "getMainCategory.bit",
			success: function(data) {
				var option = "<option disabled selected>-----선택하기-----</option>";
				$.each(data, function(index, element) {
					option += "<option value='" + element.mcategory + "'>" + element.mcaname + "</option>";
				});
				$('#mcategory').append(option);
			}
		});
	}

	function getSubCategory(element) {

		$.ajax({
			type: "get",
			url: "getSubCategory_" + element + ".bit",
			success: function(data) {
				var option = "";
				$.each(data, function(index, element) {
					option += "<option value='" + element.scategory + "'>" + element.scaname + "</option>";
				});
				$('#scategory').empty().append(option);
			}
		});

	}
	
	function makeAgeYear() {

		var year = "<option disabled selected>-----선택하기-----</option>";
		for(var i=0; i<=30; i++) {
			year += "<option value='" + i + "'>" + i + "</option>";
		}
		$('#age_year').empty().append(year);
		
	}

	function makeAgeMonth() {
		
		var month = "<option disabled selected>-----선택하기-----</option>";
		for(var i=0; i<12; i++) {
			month += "<option value='" + i + "'>" + i + "</option>";
		}
		$('#age_month').empty().append(month);
	}

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

</script>
</html>