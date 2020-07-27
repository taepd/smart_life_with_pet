<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<title>홈_슬기로운 반려생활</title>
	<%@ include file="/WEB-INF/include/import.jsp"%>
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css_2sotto/blog_main.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
	
		#tab-row {
    		margin-bottom: 100px;
    		margin-top: 73px;
    	}
    	#tab-list {
    		margin: 0 auto;
    	}
    	#mypage-img-wrapper img {
    		width: 280px;
    		height: 280px;
    	}
    	.main-card {
			background-color: #ffffff;
 			box-shadow: rgba(0, 0, 0, 0.08) 0px 20px 40px 0px;
			padding: 100px;
			border-radius: 6px;
			position: relative;	
		}
    	.mypage-card {
    		background-color: #ffffff;
 			box-shadow: rgba(0, 0, 0, 0.08) 0px 20px 40px 0px;
			padding: 40 100px;
			border-radius: 6px;	
			/* margin-bottom: 300px; */
			position: relative;
			height: 500px;
    	}
    	#mypage-img-wrapper {
    		position: absolute;
    		transform: translate(67%, 33%);
    	}
    	#mypage-myinfo-wrapper {
    		position: absolute;
    		width: 300px;
    		transform: translate(200%, 15%);
    	}
    	#edit-link {
    		 position: absolute;
    		 top: 385px;
    		 left: 285px;
    		 font-size: 13px;
    		 text-align: center;
    	}
    	.card-img-top {
			margin-top: 16px;
		}
		.card {
			margin-left: 10px;
			margin-right: 10px;
		}
		#mypage-editPwd-wrapper {
			width: 425px;
			position: absolute;
			transform: translate(83%, 32%);
		}
		#pwdEditBtn {
			position: absolute;		
			bottom: 72px;
			left: 500px;	
		}
		#delete {
			position: absolute;
			bottom: 0;
			right: 0;
			margin: 10px;
			font-size: 13px;
			color: #9E9E9E;
			font-weight: bold;
		}
		
		#back-icon {
		position: absolute;
		top: 7px;
		left: 10px;
		font-size: 34px;
		color: rgba(233, 33, 101, 0.2);
		}
	
	</style>
</head>
<body>





<!-- 																	  -->

	<!-- header -->
	<%@ include file="/WEB-INF/include/headerAndNavi.jsp"%>
	<!-- header -->

	<div class="container">
		<div class="side_overlay">
				<div class="row">
				
				<div class="col-12">
				
						<!---------- Point 내용  ------------------>
							<div class="mypage-card">
							<a href="main.bit"><span id="back-icon"><i class="fas fa-angle-double-left"></i></span></a>
									<div id="mypage-myinfo-wrapper">
							            <div class="form-group has-default bmd-form-group">
							            	<label>잔여포인트</label>
							            	<div><h4>${user.userPoint} point</h4></div>
							            	<hr>
							            	<label>사용 내역</label>
							            	<div><h4>${point.ptype}</h4></div>
							               	<hr>
							               	<label>변동포인트</label>
							               	<div><h4>${point.pcount}</h4></div>
							               	<hr>
						               	   <form action="donation/payInput.bit" method="POST">  
							           		 <div>
							            	<label>포인트 충전하기</label>
							                <input type="text" name="point" id="point" value="" placeholder="충전할 금액을 입력해 주세요 ">   	
											<button type="button" id="check_module" class="btn btn-sm btn-primary">포인트 충전하기</button>
							            	</div>
							            </form>
							            </div>
							          
							      
									</div>
									<div id="mypage-img-wrapper">
										<img id="previous-img" class="rounded-circle img-fluid" src="${pageContext.request.contextPath}/assets/images/${user.uimg}" rel="nofollow" alt="프로필 사진">
									</div>
							
							</div>
						
					</div>
				</div>
			
		</div>
	</div>

	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
<script type="text/javascript">

function Pay() {
    location.replace("../payTest.bit"); 
  }

function Hidden() {
	$('#payModal').modal('hide');
}

$("#check_module").click(function () {
var IMP = window.IMP; // 생략가능
IMP.init('imp77900278');
// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
IMP.request_pay({
pg: 'kakao', // version 1.1.0부터 지원.
//pg: 'inicis', // version 1.1.0부터 지원.
/*
'kakao':카카오페이,
html5_inicis':이니시스(웹표준결제)
'nice':나이스페이
'jtnet':제이티넷
'uplus':LG유플러스
'danal':다날
'payco':페이코
'syrup':시럽페이
'paypal':페이팔
*/
pay_method: 'card',
/*
'samsung':삼성페이,
'card':신용카드,
'trans':실시간계좌이체,
'vbank':가상계좌,
'phone':휴대폰소액결제
*/
merchant_uid: 'merchant_' + new Date().getTime(),
/*
merchant_uid에 경우
https://docs.iamport.kr/implementation/payment
위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
참고하세요.
나중에 포스팅 해볼게요.
*/
name: '김건휘 일상보고서',
//결제창에서 보여질 이름
amount: $('#point').val(),
//가격
buyer_email: '2sotto@sotto.do',
buyer_name: '김건휘',
buyer_tel: '010-1234-5678',
buyer_addr: '서울특별시 강남구 삼성동',
buyer_postcode: '123-456',
m_redirect_url: 'payInput.bit'
//m_redirect_url: 'http://localhost:8090/payments/complete' 
/*
모바일 결제시,
결제가 끝나고 랜딩되는 URL을 지정
(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
*/
}, function (rsp) {
console.log(rsp);
if (rsp.success) {
	//결제 완료시 DB에 반영
	 location.replace("${pageContext.request.contextPath}/donation/payInput.bit?point="+$('#point').val()+""); 	
var msg = '결제가 완료되었습니다.';
msg += '고유ID : ' + rsp.imp_uid;
msg += '상점 거래ID : ' + rsp.merchant_uid;
msg += '결제 금액 : ' + rsp.paid_amount;
msg += '카드 승인번호 : ' + rsp.apply_num;
$('#point').val(rsp.paid_amount); 
}else {
var msg = '결제에 실패하였습니다.';
//msg += '에러내용 : ' + rsp.error_msg;
}
alert(msg);
});
});


//https://github.com/iamport/iamport-manual/blob/master/%EC%9D%B8%EC%A6%9D%EA%B2%B0%EC%A0%9C/README.md 참고문서
//https://minaminaworld.tistory.com/78
</script>
<!-- 결제종료 -->
</html>