<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>

	<title>반려동물 등록하기</title>
	
	<%@ include file="/WEB-INF/include/import.jsp"%>
	
</head>

<body>

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	
	 <div class="side_overlay">
	<div class="container">
	
		<h3>반려동물 등록하기</h3>
		<form>
			<div class="form-group">
				<label for="exampleInputEmail1">이름</label>
				<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="반려동물의 이름을 입력하세요">
			</div>
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
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">종 선택하기</label>
				<select class="custom-select">
					<option>테스트1</option>
					<option>테스트2</option>
					<option>테스트3</option>
				</select>
			</div>
			<div class="form-check">
                <label for="exampleInputEmail1">성별</label>
                <br>
                <label class="form-check-label">
					<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1">
						암컷
					<span class="circle">
                    	<span class="check"></span>
                  	</span>
                </label>
				<label class="form-check-label">
					<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1">
                  		수컷
					<span class="circle">
						<span class="check"></span>
					</span>
                </label>
			</div>
			<!-- 크기 일단 뺌 >> 애매모호한 구석이 있음... -->
			<div class="form-group">
				<label for="exampleInputEmail1">몸무게</label>
				<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="반려동물의 몸무게를 입력하세요"> kg
			</div>
			<div class="form-check">
                <label for="exampleInputEmail1">털 길이</label>
                <br>
                <label class="form-check-label">
					<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1">
						짧음
					<span class="circle">
                    	<span class="check"></span>
                  	</span>
                </label>
				<label class="form-check-label">
					<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1">
                  		중간
					<span class="circle">
						<span class="check"></span>
					</span>
                </label>
                <label class="form-check-label">
					<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1">
                  		김
					<span class="circle">
						<span class="check"></span>
					</span>
                </label>
			</div>
			<div class="form-check">
                <label for="exampleInputEmail1">중성화 여부</label>
                <br>
                <label class="form-check-label">
					<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1">
						했음
					<span class="circle">
                    	<span class="check"></span>
                  	</span>
                </label>
				<label class="form-check-label">
					<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1">
                  		하지 않았음
					<span class="circle">
						<span class="check"></span>
					</span>
                </label>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">특이사항</label>
				<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="반려동물의 특이사항을 입력하세요">
			</div>
			
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="reset" class="btn btn-primary">다시쓰기</button>
			<button type="reset" class="btn btn-primary" onclick="location.href='#'">취소</button>
		</form>
	</div>
	</div>
</body>
</html>