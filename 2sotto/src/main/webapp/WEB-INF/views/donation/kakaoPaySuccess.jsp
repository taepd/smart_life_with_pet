<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container"> <div class="card-body text-center mt-5"> <h2>결제가 완료되었습니다.</h2> <table> <tr> <td> 주문번호 </td> <td> ${info.partner_order_id} </td> </tr> <tr> <td> 결제일시 </td> <td> ${info.approved_at} </td> </tr> <tr> <td> 상품명 </td> <td> ${info.item_name} </td> </tr> <tr> <td> 결제금액 </td> <td> ${info.total} </td> </tr> <tr> <td> 결제방법 </td> <td> ${info.payment_method_type} </td> </tr> </table> <button class="btn btn-outline-info mt-1" onclick="opener.parent.location.reload(); self.close() ">확인</button> </div>

</body>
</html>