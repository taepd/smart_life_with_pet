<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<html>
<head>	

    <title>홈_슬기로운 반려생활</title>
    
     <%@ include file="/WEB-INF/include/import.jsp"%>
     <link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
    
</head>

<body>


	<!-- header -->
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<!-- header -->

	<div class="side_overlay">

		<div class="container">

			<div class="card  card-nav-tabs ">


				<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
	
				<div class="card-body">
				 <div class="tab-content text-center">

						-------- 글쓰기  ----------------
					<form action="/donation/main.bit" method="post" enctype="multipart/form-data">
						<div class="table-responsive">
							<table class="table">
								<thead class=" text-primary">
									<tr>
										<td>
											<div style="margin-bottom: 8px;">
												<input type="text" class="form-control" name="post_title"
													placeholder="제목" value="" required />
											</div>
										</td>
									</tr>
									
									<tr>										
                        					<td>작성자</td>                     			
                        					<td>
                        						<div style="margin-bottom: 8px;">
                        							<input type="text" class="form-control" name="admin" value="관리자" required/>
                        						</div>
                        					</td>
                        				
                   					</tr>
                    				<tr>
                        					<td>제목</td>
                        					<td>
                        						<div style="margin-bottom: 8px;">
                        							<input type="text" class="form-control" name="title"> 
                        						</div>
                        					</td>
                    				</tr>
                    				<tr>
                        					<td>도움이 필요한 아이</td>
                        					<td>
                        						<div style="margin-bottom: 8px;">
                        							<input type="text" class="form-control" name="dobject"> 
                        						</div>
                        					</td>
                    				</tr>
                        
                    				<tr>
                        					<td>글내용</td>
                        					<td>
                        						<textarea class="ckeditor" id="summernote" name="content" ></textarea>
                        					</td>
                    				</tr>
                    				<tr>
                        				<td colspan="2" align="center">
                            				<input type="submit" class="btn btn-secondary" value="글 등록" /> 
                            				<input type="reset" class="btn btn-secondary" value="다시쓰기" />
                        				</td>
                    				</tr>
								</thead>
								<tbody>
									<tr>

										<td><textarea id="summernote" name="post_contents"
												cols="67" rows="20" required></textarea></td>
									</tr>
									<tr>

										<td><input name="file" type="file" /><br></td>
									</tr>
									<tr>
										<td align="center"><a href="javascript:history.go(-1)"
											class="btn btn-round btn-rose">&nbsp;&nbsp;등록&nbsp;&nbsp;</a>
											<input class="btn btn-round btn-rose" type="submit" value="글 등록" />
											<a href="javascript:addpost()" class="btn btn-round btn-white">&nbsp;&nbsp;다시쓰기&nbsp;&nbsp;</a>
										</td>
									</tr>
							</table>

						</div>
							</form>
					</div> 
					
					<!-- <div>
						<form action="main.bit" method="post" enctype="multipart/form-data">
                			<table class="table">
                    			<tr>
                        			<td width="40%" align="center">작성자</td>
                        			<td width="60%" align="left"><input type="text" name="adminid" size="40" value="관리자" readonly style="background-color:#eae6e6"></td>
                   				</tr>
                    			<tr>
                        			<td width="40%" align="center">제목</td>
                        			<td width="60%" align="left"><input type="text" name="title" size="60"></td>
                    			</tr>
                    			<tr>
                        			<td width="40%" align="center">도움이 필요한 아이</td>
                        			<td width="60%" align="left"><input type="text" name="dobject" size="60"></td>
                    			</tr>
                        
                    			<tr>
                        			<td width="40%" align="center">글내용</td>
                        			<td width="60%" align="left"><textarea id="summernote" rows="10" cols="60" name="content" class="ckeditor"></textarea></td>
                    			</tr>
                    			<tr>
                        			<td colspan="2" align="center">
                            			<input type="submit" class="btn btn-round btn-rose" value="글 등록" /> 
                            			<input type="reset" class="btn btn-round btn-rose" value="다시쓰기" />
                        			</td>
                    			</tr>
                			</table>
              			</form>
	
					</div> -->
				</div>
			</div>
		</div>

	</div>



</body>
</html>
<!-- 글쓰기 등록 -->
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
	/* $(function() {
		$('#summernote').summernote({
			height : 500,
			minHeight : null,
			maxHeight : null,
			focus : true
		});
	}); */

	 $(function() {
	    	$('#summernote').summernote({
	            placeholder: '내용을 입력해 주세요',
	            tabsize: 2,
	            height: 300,
	            width: 600,
	            toolbar: [
	              ['style', ['style']],
	              ['font', ['bold', 'underline', 'clear']],
	              ['color', ['color']],
	              ['para', ['ul', 'ol', 'paragraph']],
	              ['table', ['table']],
	              ['insert', ['link', 'picture', 'video']],
	              ['view', ['fullscreen', 'codeview', 'help']]
	            ]
	          });
	    });
</script>

	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>