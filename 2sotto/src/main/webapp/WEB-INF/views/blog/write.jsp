<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
   <!-- <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> --> 
    
</head>
<body>
    
    <%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<div class="side_overlay">
		<div class="container">
			<h3>블로그 글쓰기 페이지</h3>
		<form action="write.bit" method="post">
			<!-- 내 반려동물 선택 영역 -->
			<div class="row" style="background-color: #CDEBED"> <!-- 임시 백그라운드 -->
	        	<div>
	        		<h3>내 반려동물들</h3>
	        		<div class="d-flex">  <!--  style="display: inline-block;" -->
	        			<c:forEach var="myPet" items="${myPetList}">
				        	<div class="follow-img-wrapper" onclick='petSelect()'>
			        			<div  class="rounded-circle card-modal-profile"
                                    style="float : left; background-color: white; overflow: hidden; height:100px; width:100px;">
                                    <div style="top: 0; left: 0; right: 0; bottom: 0; transform: translate(50%, 50%);">
                                        <img  src="${pageContext.request.contextPath}/images/${myPet.petimg}" alt="${myPet.petname}" href="javascript:void(0)"
                                            style="width :auto; height: 130px; transform: translate(-50%, -50%); ">
                                    </div>
                             	</div>
		        			</div>
				        </c:forEach>   			
	        		</div>
	        	</div>
	        </div>
	        
		
				<div class="form-group bmd-form-group">
				  <label class="bmd-label-static">제목</label>
				  <input type="text" name="title" class="form-control" placeholder="">
				</div>
				
				<!-- <div id="summernote">
					goodbye				
				</div> -->
				<!-- <textarea id="summernote" name="post_contents" cols="67" rows="20"></textarea> -->
				
				<!-- ckeditor 일단 cdn으로 걸었음 -->
				<textarea name="content"></textarea>
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
	
<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>	
	
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

//반려동물 이미지 클릭 이벤트
function petSelect(){
	$(this).css("border", "solid");

	console.log('나와라');
}

</script>
</html>