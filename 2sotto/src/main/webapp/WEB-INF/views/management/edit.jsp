<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<%@ include file="/WEB-INF/include/import.jsp"%>
	<style>
		
		.custom-select {
			width: 100px;
		}
		
		input[type=text] {
			width: 100px;
		}
		
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	 <div class="side_overlay">
	<div class="container">
	
		<h3>반려동물 정보 수정하기</h3>
		
		<form action="edit.bit" method="post" enctype="multipart/form-data">
			
			<c:set value="${petInfo}" var="pet"/>
			<input type="hidden" name="petindex" value="${pet.petindex}">
				
			<div class="form-group bmd-form-group">
                <label for="petname" class="bmd-label-floating">이름</label>
                <input type="text" class="form-control" id="petname" name="petname" value="${pet.petname}">
            </div>
																							<!--
																							 라디오 형태
																							 
																							<div class="form-check">
																				                <label for="exampleInputEmail1">종류</label>
																				                <br>
																				                <label class="form-check-label">
																									<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1">
																										개
																									<span class="circle">
																				                    	<span class="check"></span>
																				                  	</span>
																				                </label>
																								<label class="form-check-label">
																									<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1">
																				                  		고양이
																									<span class="circle">
																										<span class="check"></span>
																									</span>
																				                </label>
																							</div> -->
			
			<div class="form-group">
				<label for="mcategory">종류</label>
				<select class="custom-select" id="mcategory" name="mcategory"> <!-- ex) ?mcategory=dog -->
					<option value="dog">dog</option>
					<option value="cat">cat</option>
				</select>
			</div>
			
			<div class="form-group">
				<label for="scategory">종 선택하기</label>
				<select class="custom-select" id="scategory" name="scategory">
					<option value="a">a</option>
					<option value="b">b</option>
					<option value="c">c</option>
				</select>
			</div>
			
			<div class="form-check">
                <label for="sex">성별</label>
                <br>
                <label class="form-check-label">
					<input class="form-check-input" type="radio" name="sex" id="sex_female" value="f">
						암컷
					<span class="circle">
                    	<span class="check"></span>
                  	</span>
                </label>
				<label class="form-check-label">
					<input class="form-check-input" type="radio" name="sex" id="sex_male" value="m">
                  		수컷
					<span class="circle">
						<span class="check"></span>
					</span>
                </label>
			</div>
			
			<div class="form-group bmd-form-group">
                <label for="weight" class="bmd-label-floating">몸무게</label>
                <input type="text" class="form-control" id="weight" name="weight" value="${pet.weight}"> kg
            </div>
            <br>
			<div class="form-group">
				<label for="age">나이</label>
				<!-- <select class="custom-select" id="age_year" name="age_year"> -->
				<select class="custom-select" id="age_year" name="age_year">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
				</select>
				년
				<select class="custom-select" id="age_month" name="age_month">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
				</select>
				개월
			</div>
			<div class="form-check">
                <label for="hlength">털 길이</label>
                <br>
                <label class="form-check-label">
					<input class="form-check-input" type="radio" name="hlength" id="hlength_short" value="s">
						짧음
					<span class="circle">
                    	<span class="check"></span>
                  	</span>
                </label>
				<label class="form-check-label">
					<input class="form-check-input" type="radio" name="hlength" id="hlength_medium" value="m">
                  		중간
					<span class="circle">
						<span class="check"></span>
					</span>
                </label>
                <label class="form-check-label">
					<input class="form-check-input" type="radio" name="hlength" id="hlength_long" value="l">
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
					<input class="form-check-input" type="radio" name="size" id="size_small" value="s">
						소형
					<span class="circle">
                    	<span class="check"></span>
                  	</span>
                </label>
				<label class="form-check-label">
					<input class="form-check-input" type="radio" name="size" id="size_medium" value="m">
                  		중형
					<span class="circle">
						<span class="check"></span>
					</span>
                </label>
                <label class="form-check-label">
					<input class="form-check-input" type="radio" name="size" id="size_big" value="l">
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
                <input type="text" class="form-control" id="memo" name="memo" value="${pet.memo}">
            </div>
            
            <br>
           <!-- <input type="file" id="petimg" name="petimg"> -->
								 
						
					
            
			
			<button type="submit" class="btn btn-primary">수정하기</button>
			<button type="reset" class="btn btn-primary" onclick="location.href='#'">취소</button>
		</form>
	</div>
	</div>
	
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
<script>

	$(document).ready(function() {

		$('#mcategory option').each(function() {
			if( $(this).val() == "${pet.mcategory}" ) {
					$(this).attr("selected", "selected");
				}
		});
		
		$('#scategory option').each(function() {
			if( $(this).val() == "${pet.scategory}" ) {
					$(this).attr("selected", "selected");
				}
		});

		/* 나이도 추가하기 */
		
		if("${pet.hlength}" == 's') {
				$('#hlength_short').attr("checked", "checked");
			} else if ("${pet.hlength}" == 'm') {
				$('#hlength_medium').attr("checked", "checked");
			} else {
				$('#hlength_long').attr("checked", "checked");
				}

		if("${pet.size}" == 's') {
				$('#size_small').attr("checked", "checked");
			} else if ("${pet.size}" == 'm') {
				$('#size_medium').attr("checked", "checked");
			} else {
				$('#size_big').attr("checked", "checked");
				}

		if("${pet.nstate}" == 'y') {
				$('#nstate_y').attr("checked", "checked");
			} else {
				$('#nstate_n').attr("checked", "checked");
			}
		
	});
		
</script>
</html>