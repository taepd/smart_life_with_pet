<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
    
</head>
<body>

    <%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<div class="side_overlay">
		<div class="container">

			<form action="edit.bit" method="post">
				<!-- bindex 가져가기 위해서 -->
				<input hidden name="bindex" value="${post.bindex}"/>
				<!-- 내 반려동물 선택 영역 -->
				<!-- 선택한 반려동물 인덱스를 배열로 넘겨주기 위해 -->
				<input type="hidden" name="petArr" id="petArr">
				<div class="row" style="background-color: #CDEBED"> <!-- 임시 백그라운드 -->
		        	<div>
		        		<h3>포스팅과 관련있는 나의 반려동물을 선택해 주세요^-^</h3>
		        		<div class="d-flex">  <!--  style="display: inline-block;" -->
		        			<c:forEach var="myPet" items="${myPetList}">
					        	<div class="follow-img-wrapper d-flex flex-column" onclick='petSelect(this)' flag="0" value="${myPet.petindex}" style="margin:10px;">
					        	<!-- 이미지 동그랗게 잘라서 크기에 맞게 나오게 하는 코드 -->
				        			<div  class="rounded-circle card-modal-profile"
	                                    style="float : left; background-color: white; overflow: hidden; height:100px; width:100px;">
	                                    <div style="top: 0; left: 0; right: 0; bottom: 0; transform: translate(50%, 50%);">
	                                        <img  src="${pageContext.request.contextPath}/assets/images/${myPet.petimg}" alt="${myPet.petname}" href="javascript:void(0)"
	                                            style="width :auto; height: 130px; transform: translate(-50%, -50%); ">
	                                    </div>
	                             	</div>
	                             	<div class="text-center"> ${myPet.petname} </div>
			        			</div>
					        </c:forEach>   			
		        		</div>
		        	</div>
		        </div>
		        <!-- 내 반려동물 선택 영역 끝-->
				
				<div class="form-group bmd-form-group">
				  <label class="bmd-label-static">제목</label>
				  <input type="text" name="title" value="${post.title}" class="form-control" placeholder="">
				</div>
				
				<!-- <div id="summernote">
					goodbye				
				</div> -->
				<!-- <textarea id="summernote" name="post_contents" cols="67" rows="20"></textarea> -->
				

				<textarea name="content">${post.content}</textarea>
				<div class="border-top">
					<div class="card-body" style="text-align: center;">
						<button type="submit" class="btn btn-primary" style="padding: 10px 20px"><b>전송</b></button>
						<button type="reset" class="btn" style="padding: 10px 20px">취소</button>
					</div>
				</div>
			</form>									

			<!-- <div class="card  card-nav-tabs ">
	

				colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger"
	
					<div class="tab-content text-center">

						-------- 글쓰기  ----------------

						<div class="table-responsive">
							<table class="table">
								<thead class=" text-primary">
									<tr>
										<td>
											<div style="margin-bottom: 8px;">
												
											</div>
										</td>
									</tr>
								</thead>
								<tbody>
									<tr>

										<td></td>
									</tr>
									<tr>

										<td><input name="file" type="file" /><br></td>
									</tr>
									<tr>
										<td align="center">
										</td>
									</tr>
							</table>

						</div>

					</div>

			</div> -->
			
			
		</div>
	</div>
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
	<!-- 글쓰기 등록 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/ckeditor/ckeditor.js"></script>	
<!-- <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> -->

<!-- <script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script> -->
<!-- <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
 	 -->
<script type="text/javascript">


//ckeditor
$(function(){
	CKEDITOR.replace('content',{
		filebrowserUploadUrl: '${pageContext.request.contextPath }/fileupload.bit', //파일업로드
		uploadUrl:'${pageContext.request.contextPath }/fileupload.bit' //드래그 앤 드롭
	});
});

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
		$(div).css("border", "solid"); // 선택시 활성화 되었다는 효과
		$(div).attr('flag', '1'); // 플래그 
		petArr.push($(div).attr('value')); 
		$('#petArr').val(petArr);
		console.log(petArr);
		
	}else{ //해제한 경우
		$(div).css("border", "");
		$(div).attr('flag', '0');
		const idx=petArr.indexOf($(div).attr('value')); //배열에서 특정 요소 선택해서 제거하는 방
		petArr.splice(idx,1);  //여기까지 방법
		$('#petArr').val(petArr);
		console.log(petArr);
	}
}

</script>
</html>