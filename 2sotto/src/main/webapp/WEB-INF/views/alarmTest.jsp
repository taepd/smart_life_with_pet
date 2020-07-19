<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
 
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
</head>
<body>
    <button onclick="calculate()">calculate</button>
    <button onclick="mailMe()">Mail me!</button>
 
    
</body>
<script type="text/javascript">
        window.onload = function () {
            if (window.Notification) {
                Notification.requestPermission();
            }
        }
 
        function calculate() {
            setTimeout(function () {
                notify();
            }, 5000);
        }
 
        function notify() {
            if (Notification.permission !== 'granted') {
                alert('notification is disabled');
            }
            else {
                var notification = new Notification('슬기로운 반려생활',  {
                    icon: 'http://img.naver.net/static/www/up/2014/0123/mat_19165764t.jpg',
                    body: '지금부터 테스트를 시작합니다 이걸 어디에 쓸지 고민해봅니다',
                });
 
                notification.onclick = function () {
                    //window.open('http://google.com');
                	window.open('http://localhost:8090/bit/');
                };
            }
        }
        
        function mailMe() {
        	  var parameter_noti = {
        		title:"제목을 입력 이걸 어디에 사용하지",
        		icon:"http://img.naver.net/static/www/up/2014/0123/mat_19165764t.jpg",
        		body:"지금부터 테스트를 시작합니다 이걸 어디에 쓸지 고민해봅니다"
        	  };
        	  if (!"Notification" in window) {
        	    alert("This browser does not support desktop notification");
        	  }
        	  else if (Notification.permission === "granted") {
        	    var notification = new Notification(parameter_noti.title,{
        	    	icon:parameter_noti.icon,
        	    	body:parameter_noti.body
        	    });
        	  }
        	  else if (Notification.permission !== 'denied') {
        	    Notification.requestPermission(function (permission) {
        	      if(!('permission' in Notification)) {
        	        Notification.permission = permission;
        	      }
        	      if (permission === "granted") {
        	        var notification = new Notification(parameter_noti.title,{
        	        	icon:parameter_noti.icon,
        	        	body:parameter_noti.body
        	        });
        	      }
        	    });
        	  }
        	}
        
    </script>
</html>

