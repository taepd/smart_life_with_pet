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
		
		<form action="registerPets.bit" method="post" enctype="multipart/form-data">
		
			<div class="form-group bmd-form-group">
                <label for="exampleInput1" class="bmd-label-floating">이름</label>
                <input type="email" class="form-control" id="exampleInput1">
                <span class="bmd-help">반려동물의 이름을 입력하세요</span>
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
			<div class="form-group bmd-form-group">
                <label for="exampleInput1" class="bmd-label-floating">몸무게</label>
                <input type="email" class="form-control" id="exampleInput1"> kg
                <span class="bmd-help">반려동물의 몸무게를 입력하세요</span>
            </div>
			<div class="form-group">
				<label for="exampleInputEmail1">나이</label>
				<select class="custom-select">
					<option>1</option>
					<option>2</option>
					<option>3</option>
				</select>
				년
				<select class="custom-select">
					<option>1</option>
					<option>2</option>
					<option>3</option>
				</select>
				개월
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
			<div class="form-group bmd-form-group">
                <label for="exampleInput1" class="bmd-label-floating">특이사항</label>
                <input type="email" class="form-control" id="exampleInput1">
                <span class="bmd-help">반려동물의 특이사항을 입력하세요</span>
            </div>
            
            <br>
            <div class= "profile">
						<img src="${pageContext.request.contextPath}/img/headerLogin.png" class="basic_img"/>
								<div class="choosePick">
								 <input type="text" readonly="readonly" id="file_route">
								 <label>이미지 선택
								 <input type="file" id="showImg" name="file" onchange="javascript:document.getElementById('file_route').value=this.value">
								 </label>
						<p class="info_profile">정보 변경 가능 알리기</p>
						</div>
					</div>
            
			
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="reset" class="btn btn-primary">다시쓰기</button>
			<button type="reset" class="btn btn-primary" onclick="location.href='#'">취소</button>
		</form>
	</div>
	</div>
	
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>