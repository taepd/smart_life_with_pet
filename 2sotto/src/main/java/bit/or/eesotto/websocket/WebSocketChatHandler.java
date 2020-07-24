package bit.or.eesotto.websocket;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import bit.or.eesotto.dao.ChatDao;
//import bit.or.eesotto.chat.dao.ChatDao;
//import bit.or.eesotto.chat.dto.ChatMemberDto;
import bit.or.eesotto.dto.User;



public class WebSocketChatHandler extends TextWebSocketHandler {

	// 접속한 클라이언트의 웹소켓 세션을 담는 List : webSocketSession
	List<WebSocketSession> webSocketSessionList = new ArrayList<WebSocketSession>();

	// 접속한 유저의 닉네임을 담는 map - key : WebSocketSession / value : uNickname(String)
	Map<WebSocketSession, String> usersMap = new HashMap<WebSocketSession, String>();

	// 채팅방에 접속한 유저가 속해있는 채팅방번호를 담는 map - key : WebSocketSession / value :
	Map<WebSocketSession, String> chatRoomIdMap = new HashMap<WebSocketSession, String>();

	
private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
		
	}
	
	private void log(String msg) {
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = simple.format(new Date());
		System.out.println(date + " : " + msg);
	}
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		webSocketSessionList.add(session); // webSocketSessionList: 접속한 클라이언트등의 웹소켓 세션

		Map<String, Object> map = session.getAttributes();

		User user = (User)session.getAttributes().get("user"); 
		
		String user_nickname= user.getNick();
		usersMap.put(session, user_nickname); // usersMap : key(접속한 클라이언트의 웹소켓 세션), value(접속한 클라이언트의 닉네임)

		String room_number = (String) map.get("room_number");
		chatRoomIdMap.put(session, room_number); // chatRoomIdMap : key(접속한 클라이언트의 웹소켓 세션), value(클라이언트가 접속한 채팅방 번호)
		
		System.out.println("[Server Message]" + usersMap.get(session) + " 님이 " + room_number+ "번 채팅방에 입장하셨습니다."); // 서버메세지
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("[Server Message] " +message.getPayload()); // 서버메세지
		/* System.out.println(message.getPayload().split()); */
		Map<String, Object> map = session.getAttributes();
		String room_number = (String) map.get("room_number");
		
		/*
		 * ChatDao chatdao = sqlsession.getMapper(ChatDao.class); int currentMember =
		 * chatdao.getMemberCount(Integer.parseInt(room_number)); List<ChatMemberDto>
		 * list = chatdao.getMemberList(Integer.parseInt(room_number)); String userlist
		 * = ""; for(ChatMemberDto mem : list) { userlist += mem.getUser_nickname() +
		 * "\n"; }
		 */
		
		
		// 현재 접속되어있는 클라이언트들에게 메세지 전달 TextMessage
		TextMessage msg = new TextMessage(message.getPayload());
	

		for (WebSocketSession sess : webSocketSessionList) {
			if (chatRoomIdMap.get(sess).equals(room_number)) {
				sess.sendMessage(msg);
			}
		}
	}
	//연결이 끊어지면 발생한다.
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> map = session.getAttributes();
		String room_number = (String) map.get("room_number");
		
		User user = (User)session.getAttributes().get("user"); 
		
		String userid = user.getUserid();
		System.out.println("[Server Message]" + usersMap.get(session) + "님이  " + room_number + "번 방에서 나가셨습니다.");

		webSocketSessionList.remove(session);
		usersMap.remove(session);
		chatRoomIdMap.remove(session);
		ChatDao chatdao = sqlsession.getMapper(ChatDao.class);
		chatdao.removeMember(userid, Integer.parseInt(room_number));
		
		
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " exception 발생: " + exception.getMessage());
	}

	

}

