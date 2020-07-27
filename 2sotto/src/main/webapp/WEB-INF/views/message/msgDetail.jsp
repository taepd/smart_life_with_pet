<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>

<title>동물관리 홈</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-datetimepicker/2.7.1/css/bootstrap-material-datetimepicker.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<%@ include file="/WEB-INF/include/import.jsp"%>
<style>
	.fc-toolbar-title, a.fc-col-header-cell-cushion, th {
		color: black;
	}
	
	.icons {
		font-size: 15px;
		color: orange;
	}
	
	#wrapper {
		display: inline-block;
		/* margin: 0 auto; */
	}
	
	.card-img-top {
		margin-top: 16px;
	}
	
	.card {
		margin-left: 10px;
		margin-right: 10px;
	}
	
	#tab-list {
		margin: 0 auto;
	}
	
	#tab-row {
		margin-bottom: 100px;
		margin-top: 73px;
	}
	
	.form-check {
		margin-left: 5px;
		margin-top: 8px;
	}
	

</style>



</head>

<body>

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>


	<div class="container">
		<div class="side_overlay">

			<div class="row justify-content-center" id="tab-row">
				<ul class="nav nav-pills nav-pills-icons" id="tab-list"
					role="tablist">
					<!--
                                color-classes: "nav-pills-primary", "nav-pills-info", "nav-pills-success", "nav-pills-warning","nav-pills-danger"
                            -->
					<li class="nav-item"><a class="nav-link" onclick="location.href='msgRePage.bit'" id="rPageTab"
						role="tab" data-toggle="tab" aria-selected="false"> <i
							class="material-icons">email</i> <!-- <span class="material-icons">home</span>  -->
							받은 쪽지함
					</a></li>
					<li class="nav-item"><a class="nav-link"
						onclick="location.href='msgSePage.bit'" role="tab" data-toggle="tab" id="sPageTab"
						aria-selected="false"> <i class="material-icons">email</i>
							보낸 쪽지함
					</a></li>
					<li class="nav-item"><a class="nav-link" onclick="location.href='msgWrite.bit'" id="writeTab"
						role="tab" data-toggle="tab" aria-selected="true"> <i
							class="material-icons">email</i> 쪽지 쓰기 
					</a></li>
				</ul>
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-12">
					<div class="tab-content text-center">
			
						<div class="table-responsive">
						
							<table class="table">
						 
								<thead class=" text-left">
									
									<tr>
										<th colspan="5" valign=top>보낸사람</th>
									</tr>
									
								</thead>
								 	
								<tbody>
									<tr>
										<td colspan="5" align="left" valign=top>${message.suserid}</td>
									</tr>
									<tr>
										<td colspan="5" align="left" valign=top">
											<div>${message.content}</div>
										</td>
									</tr>
									


									<tr align="center" valign="middle">
										<td colspan="5">
										<!--<c:if test="${currentPost.user_id == user_id }"> -->
												<a class="btn btn" href="javascript:history.back();"> 이전 </a>
												<a class="btn btn-primary" href="edit.bit?qaindex=${qna.qaindex}">
													수정 </a>
											<!-- <a class="btn btn-rose btn-round" href="reply.bit?qaindex=${qna.qaindex}">답글 </a> -->
											<!-- <a id="delete" class="btn btn-white btn-round" href="delete.bit?qaindex=${qna.qaindex}"> 삭제 </a> --> 	
											 <!-- Modal로 보내기 -->
											 <a href="#" data-toggle="modal" data-target="#deleteModal" class="btn btn-white">삭제</a>	
											 <!-- Modal로 보내기 -->
											<!-- </c:if> --></td>

									</tr>
								</tbody>

							</table>
							
							
							
						</div>
						
						
						
				
					</div>
				</div>
			</div>
			<!-- side_overlay end -->

		</div>
		<!-- side_overlay end -->

	</div>
	<!-- container end -->

<!-- Modal -->
	
<div class="modal" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">게시물 삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        게시물을 정말 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
  		<button onclick="Delete()" type="button" class="btn btn-primary">삭제하기</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
       	
      </div>
    </div>

  </div>
</div>
<!-- Modal -->

	
<script>

	<!-- Modal에서 삭제 -->
	// 삭제 전 확인 창 띄우기
	function Delete() {
	    location.replace("detailDelete.bit?msindex=${message.msindex}"); 
	  }
	<!-- Modal에서 삭제 --> 
	
</script>
	
		<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>



</html>