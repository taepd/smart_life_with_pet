<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>	

    <title>블로그 글쓰기</title>
     <%@ include file="/WEB-INF/include/import.jsp"%>
	<style>
		@font-face {
			font-family: 'netmarbleM';
			src: url('../assets/fonts/netmarbleM.ttf') format('truetype'); 
		}
		#petSelection {
			padding: 30px;
		}
		h3 {
			font-family : 'netmarbleM', sans-serif;
		}
		#writeBtnBox {
			text-align: center;
			margin-top: 80px;
		}
	</style>
	 
</head>
<body>
    
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	
	<div class="container">
		<div class="side_overlay">
			<form id="writeForm" action="write.bit" method="post">
				<!-- 내 반려동물 선택 영역 -->
				<!-- 선택한 반려동물 인덱스를 배열로 넘겨주기 위해 -->
				<input type="hidden" name="petArr" id="petArr">
				<div class="row"> <!-- 임시 백그라운드 -->
					<div class="col-12" id="petSelection">
						<h3>누구에 관한 이야기인가요?</h3>
						<div class="d-flex">
							<c:forEach var="myPet" items="${myPetList}">
								<div class="follow-img-wrapper d-flex flex-column" onclick='petSelect(this)' flag="0" value="${myPet.petindex}" style="margin:10px; padding: 10px 5px 0;">
								<!-- 이미지 동그랗게 잘라서 크기에 맞게 나오게 하는 코드 -->
									<div class="rounded-circle card-modal-profile"
										style="float : left; background-color: white; overflow: hidden; height:100px; width:100px;">
										<div style="top: 0; left: 0; right: 0; bottom: 0; transform: translate(50%, 50%);">
											<img  src="${pageContext.request.contextPath}/assets/images/${myPet.petimg}" alt="${myPet.petname}" href="javascript:void(0)"
												style="width :auto; height: 130px; transform: translate(-50%, -50%); ">
										</div>
									</div>
									<div class="text-center"><h6>${myPet.petname}</h6></div>
								</div>
							</c:forEach>   			
						</div>
					</div>
				</div>
				<!-- 내 반려동물 선택 영역 끝-->
				<div class="row">
					<div class="col-12">
						<div class="form-group bmd-form-group">
							<label class="bmd-label-static">제목</label>
							<input type="text" id="title" name="title" class="form-control" placeholder="">
						</div>
						<textarea name="content"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="col-4"></div>
					<div class="col-4">
						<div id="writeBtnBox">
							<button type="button" onclick="check();" class="btn btn-primary" id="btn-write">글쓰기</button>
							<button type="button" onclick="javascript:history.back()" class="btn">뒤로 가기</button>
						</div>
					</div>
					<div class="col-4"></div>
				</div>
			</form>									
		</div> <!-- /.side_overlay -->
	</div> <!-- /.container -->
	
	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>
	<!-- 글쓰기 등록 -->
	
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/ckeditor/ckeditor.js"></script>	
<script type="text/javascript">

	$(function(){
		
		//ckeditor
		CKEDITOR.replace('content',{
			filebrowserUploadUrl: '${pageContext.request.contextPath }/fileupload.bit', //파일업로드
			uploadUrl:'${pageContext.request.contextPath }/fileupload.bit' //드래그 앤 드롭
		});

	}); // /.onload


	/**
	* @함수명 : petSelect(div)
	* @작성일 : 2020. 7. 16.
	* @작성자 : 태영돈
	* @설명 : 반려동물 이미지 클릭 이벤트를 위한 함수
	* 		자신의 반려동물 리스트가 뱃지 형태로 출력되고 클릭을 통해 해당 글이 어떤 
	* 		반려동물과 관련있는지 선택할 수 있다
	* @param div: 클릭이벤트가 걸려있는 div 자신을 선택하는 this 매개변수
	**/

	var petArr=[]; // form에 담아 전달할 petindex 배열
	
	function petSelect(div){
		if($(div).attr('flag')==0){ //반려동물 클릭해 선택한 경우
			$(div).css("background-color", "rgba(233, 33, 101, 0.2)"); // 선택시 활성화 되었다는 효과
			$(div).attr('flag', '1'); // 플래그 
			petArr.push($(div).attr('value')); 
			$('#petArr').val(petArr);
			console.log(petArr);
			
		}else{ //해제한 경우
			$(div).css("background-color", "");
			$(div).attr('flag', '0');
			const idx=petArr.indexOf($(div).attr('value')); //배열에서 특정 요소 선택해서 제거하는 방
			petArr.splice(idx,1);  //여기까지 방법
			$('#petArr').val(petArr);
			console.log(petArr);
		}
	}

	/**
	* @함수명 : check()
	* @작성일 : 2020. 7. 24.
	* @작성자 : 채현아
	* @설명 : 폼 제출 전 유효성 검사
	**/
	function check() {
		
		if( $('#petArr').val() == "" ) {
			swal('글과 관련 있는 반려동물을 선택해주세요!');
			return false;
		} 
		if( $('#title').val() == "") {
			swal('제목을 입력해주세요.');
			$('#title').focus();
			return false;
		}
		if (CKEDITOR.instances.content.getData() == '' || CKEDITOR.instances.content.getData().length == 0) {
			swal('내용을 입력해주세요.');
			return false;
		}
		$('#writeForm').submit();
	}

</script>
</html>