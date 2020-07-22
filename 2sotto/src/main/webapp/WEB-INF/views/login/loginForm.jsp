<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>	

    <title>로그인</title>
    <%@ include file="/WEB-INF/include/import.jsp"%>
     
    <style type="text/css">
		
		
		#area {
			box-shadow: rgba(0, 0, 0, 0.08) 0px 20px 40px 0px;
			padding-top: 50px;
			padding-bottom: 40px;
			text-align: center;
			background-color: #fafafa;
		}
		 
	
		
		ul {
			list-style: none;
			padding: 0;
		}
		
		#signUpList li {
			width: 300px;
			height: 50px;
			margin-bottom: 6px;
			border: 1px solid #e0e0e0;
			border-radius: 3px;
			font-size: 14px;
		}
		
		.span {
			box-sizing: border-box;
			width: 200px;
			height: 40px;
			padding-top: 3px;
			display: inline-block;
			padding-top: 13px;
		}
		
		#signUpList-wrapper {
			/* margin: 0 auto; */
			display: inline-block;
		}
		
		
		
	</style> 
     
</head>

<body>

	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>

	<div class="container">
		<div class="side_overlay">
			<div class="row">
				<div class="col-lg-4 col-md-6 ml-auto mr-auto">
					<div class="card card-login">
						<form class="form" id="loginform" method="post" action="${pageContext.request.contextPath}/login">
							<div class="card-header card-header-primary text-center">
								<h4 class="card-title">Login</h4>
							</div>
							<br>
							<div class="card-body">
								<span class="bmd-form-group">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text">
												<i class="material-icons">mail</i>
											</span>
										</div>
										<input type="text" class="form-control" placeholder="이메일주소" name="userid">
									</div>
								</span>
								<span class="bmd-form-group">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text">
												<i class="material-icons">lock_outline</i>
											</span>
										</div>
					                  	<input type="password" class="form-control" placeholder="비밀번호" name="pwd"/>
					                </div>
								</span>
								<!-- 로그인 실패했을 때 뜨는 안내메시지 -->
								<c:if test="${failedLogin != null}">
								<p style="color:red;">아이디 또는 비밀번호가 잘못되었습니다.</p><!-- 스타일 나중에 수정할 것 -->
								</c:if>
								<!-- 로그인 실패했을 때 뜨는 안내메시지 -->
							</div>
							<div>
							<h4 style="text-align:center">SNS 간편 로그인</h4>
							<div id="area" class="col-8">
								<div id="signUpList-wrapper">
									<ul id="signUpList">
										<a href="${naver_url}"><li style="border: 1px solid #19ce60"><span class="span">네이버 아이디로 로그인</span></li></a>
										<a href="${kakao_url}"><li style="border: 1px solid #ffe500"><span class="span">카카오 아이디로 로그인</span></li></a>
										<a href="${google_url}"><li style="border: 1px solid #2962ff"><span class="span">구글 아이디로 로그인</span></li></a>
									</ul>
									<br>
								</div>
							</div>
							</div>
							<!-- 네이버 로그인 창으로 이동 시작 
							<div id="naver_id_login" style="text-align:center"><a href="${url}">
							<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
							네이버 로그인 창으로 이동 끝
							<br>
							-->
							
							<!-- 구글 로그인 창으로 이동 시작
							<div id="google_id_login1" style="text-align:center"><a href="${google_url}">
							<img width="230" src="${pageContext.request.contextPath}/resources/img/btn_google_signin_dark_normal_web@2x.png"/></a></div>
							<a href="${google_url}"><li style="border: 1px solid #2962ff"><span class="span">구글로 가입하기</span></li></a>
							구글 로그인 창으로 이동 끝
							<br>
							-->
							
						
							<!-- 소셜로그인 아이콘인데 일단 둠 > 안쓰면 나중에 삭제
							<div class="social-line">
			                  <a href="#pablo" class="btn btn-just-icon btn-link">
			                    <i class="fa fa-facebook-square"></i>
			                  <div class="ripple-container"></div></a>
			                  <a href="#pablo" class="btn btn-just-icon btn-link">
			                    <i class="fa fa-twitter"></i>
			                  <div class="ripple-container"></div></a>
			                  <a href="#pablo" class="btn btn-just-icon btn-link">
			                    <i class="fa fa-google-plus"></i>
			                  <div class="ripple-container"></div></a>
			                </div>
							 -->
							
							<div class="text-center">
								 <a href="../index"><button type="submit" class="btn btn-primary">로그인</button></a>
							</div>
						</form>
									
					</div>
				</div>
			</div> <!-- /.row -->
		</div> <!-- /.side_overlay -->
	</div> <!-- /.container -->


	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>