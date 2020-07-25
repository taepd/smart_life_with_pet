package bit.or.eesotto.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import bit.or.eesotto.dto.User;

public class ChatHandShakeInterceptor extends HttpSessionHandshakeInterceptor{
	 @Override
	    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
	    	System.out.println("Before Handshake");
	    	ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
	    	HttpServletRequest req= ssreq.getServletRequest();
	    	
	    	User user  = (User) req.getSession().getAttribute("user");
	    	String room_number  = req.getParameter("room_number");

	        // 파라미터로 입력된 attributes에 put을 하면 WebSocketSession에서 접근가능
	    	
	    	attributes.put("user",user);
	    	attributes.put("room_number", room_number);
	    	
	        return super.beforeHandshake(request, response, wsHandler, attributes);
	    }
	  
	    @Override
	    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception ex) {
	        super.afterHandshake(request, response, wsHandler, ex);
	    }
}
