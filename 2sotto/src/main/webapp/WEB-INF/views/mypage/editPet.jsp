<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>	

    <title>마이 페이지</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
    
</head>
<body>
    
    <%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	
	<div class="container">
		<h3>내 반려동물 수정 페이지</h3>
		<p></p>
	 	<button type="button" onclick="location.href='myPetPage.bit'">내 반려동물 홈</button>
	 	<form  action="editPet.bit" enctype="multipart/form-data" method="post" style="text-align: center;">
			<div>
				이름<input type="text" name="petname" value="${pet.petname}" readonly>
			</div>
			<div>
				품종<input type="text" name="scategory" value="${pet.scategory}">
			</div>
			<div>
				나이<input type="text" name="age" value="${pet.age}" >
			</div>
			<div>
				크기<input type="text" name="size" value="${pet.size}" >
			</div>	
			<div>
				몸무게<input type="text" name="weight" value="${pet.weight}" >
			</div>	
			<div>
				털길이<input type="text" name="hlength" value="${pet.hlength}" >
			</div>	
			<div>
				중성화 여부<input type="text" name="nstate" value="${pet.nstate}" >
			</div>		
			<div>
				이미지<input type="text" name="nstate" value="${pet.petimg}" >
			</div>		
			<div>
				메모<input type="text" name="nstate" value="${pet.memo}" >
			</div>		
			<div class="card-body" style="text-align: center;">
				<button type="submit" class="btn btn-primary" style="padding: 10px 20px"><b>전송</b></button>
				<button type="reset" class="btn" style="padding: 10px 20px">취소</button>
			</div>		
		</form>
	</div>
	
</body>
</html>