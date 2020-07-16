<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>

	<title>병원이용 기록 등록</title>
	
	<%@ include file="/WEB-INF/include/import.jsp"%>
	
	<style>
		
		.custom-select {
			width: 200px;
		}
		
		input[type=text] {
			width: 200px;
		}
		
	</style>
	
	
	
</head>

<body>

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	
	<div class="container">
		<div class="side_overlay">
			<div class="card card-body">
			<h3>병원이용 기록 등록</h3>
			
				<form action="medicalRegister.bit" method="post" enctype="multipart/form-data">
				
					<div class="form-group bmd-form-group">
						
						<label for="userid" class="bmd-label-floating">보호자</label>
						<input type="text" class="form-control" id="userid"  name="userid" value="${sessionScope.user.userid}" readonly>
						
					</div>
					
					<div class="form-group">
						<label for="petname">나의 반려동물</label>	
						<select class="custom-select" name="petindex"> <!-- ex) ?mcategory=dog -->
							<c:forEach var="petName" items="${petNameList}">
							<option value="${petName.petindex}">${petName.petname}</option>							
							</c:forEach>
						</select>		
					</div>
					
					
					<!-- <div class="form-group">
						<label for="scategory">종 선택하기</label>
						<select class="custom-select" id="scategory" name="scategory">
						</select>
					</div> -->
					
					<!-- <div class="form-check">
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
					</div> -->
					
					 <div class="form-group bmd-form-group">
						<label for="hname" class="bmd-label-floating">방문한 병원 이름</label>
						<input type="text" class="form-control" id="hname" name="hname" value="">
						<span class="bmd-help">방문 병원 명</span>
					</div>
					 <div class="form-group bmd-form-group">
						<label for="vdate" class="bmd-label-floating">병원 방문 일시</label>
						<input type="text" class="form-control" id="vdate" name="vdate" value="">
						<span class="bmd-help"></span>
					</div>
					
					<!--
					<div class="form-group">
						<label for="age">나이</label>
						<select class="custom-select" id="age_year" name="age_year">
						</select>
						년
						<select class="custom-select" id="age_month" name="age_month">
						</select>
						개월
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
					</div> -->
					
					<div class="form-group bmd-form-group">
						<label for="vreason" class="bmd-label-floating">병원 이용 사유</label>
						<input type="text" class="form-control" id="vreason" name="vreason">
						<span class="bmd-help"></span>
					</div>
					
					<br>
				<!-- <input type="file" id="petimg" name="petimg"> -->
												
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="reset" class="btn btn-primary">다시쓰기</button>
					<button type="reset" class="btn btn-primary" onclick="location.href='#'">취소</button>

				</form>
			</div>
		</div>
	</div>

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

</script>
</html>