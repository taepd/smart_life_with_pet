package bit.or.eesotto.websocket;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import bit.or.eesotto.dao.QnaDao;
import bit.or.eesotto.dto.Qna;
import bit.or.eesotto.dto.User;




//문의 질문, 답변 insert 전부 여기로 바꿈
public class WebSocketAlarmHandler extends TextWebSocketHandler{
	
	
	private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
		
	}

	
	private static Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();

	private void log(String msg) {
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = simple.format(new Date());
		System.out.println(date + " : " + msg);
	}
	
	//연결
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("보캐슬 보이나");
		User user = (User)session.getAttributes().get("user"); 
		String userid = user.getUserid();  
		log(userid + " 님 접속하셨다");
		log(session.toString());
		users.put(userid, session); //userid 와 session 저장
		System.out.println("값이 찍히는건가"+ userid);
	}	
	
	//연결해제
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		User user = (User)session.getAttributes().get("user");
		String userid = user.getUserid(); 
		if(session.getId() != null) {
			if(users.containsKey(userid)) {
				users.remove(userid); //연결해제된 id 삭제
				log(userid + " 해제");
			}
		}
	}
	
	//데이터 전송
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{  
		System.out.println("여기까지 확인완료.");
		JSONParser parser = new JSONParser();
		System.out.println(message.getPayload());
		JSONObject obj = (JSONObject) parser.parse(message.getPayload());
		String type = (String) obj.get("type");
		System.out.println("타입이 뭐로와?"+type);
		User user = (User)session.getAttributes().get("user");
		String userid = user.getUserid(); 
		QnaDao qnadao = sqlsession.getMapper(QnaDao.class);
		System.out.println("userid:값을보고싶다." + userid );
		
		if(type.equals("view")) {
		
			
			int count = 0;
			System.out.println("views"+ userid);
			System.out.println("users"+users);
			System.out.println("users.get"+users.containsKey(userid));
			//나중에 어드민으로 정한 이메일 또는 role이 어드민일 경우로 바꾸자
			if(users.containsKey(userid) && userid.equals("admin")) {
				System.out.println("타니?");
				count = qnadao.getCountAdminNotRead();
				if(count > 0) {
					obj.put("text", "새로운 문의가 도착했습니다.");
				} else {
					obj.put("text", "새로운 알림이 없습니다.");
				}
				obj.put("count", count);
				obj.put("now", "admin");
				
				System.out.println(obj.toJSONString());
				TextMessage msg = new TextMessage(obj.toJSONString());
				users.get(userid).sendMessage(msg);
				  log(userid + " / " + message.getPayload() + " / " + msg.getPayload());
				  
			} else if(users.containsKey(userid) && !userid.equals("admin")) {
				System.out.println("유저 카운트 : " +count);
				count = qnadao.getCountUserNotRead(userid);
				System.out.println("유저 카운트 : " +count);
				if(count > 0) {
					obj.put("text", "문의 답변이 도착했습니다.");
				} else {
					obj.put("text", "새로운 알림이 없습니다.");
				}
				
				obj.put("count", count);
				obj.put("now", "userid");
				System.out.println(obj.toJSONString());
				TextMessage msg = new TextMessage(obj.toJSONString());
				 users.get(userid).sendMessage(msg);
				  log(userid + " / " + message.getPayload() + " / " + msg.getPayload());
			}
		} else if(type.equals("userid")) {
			String title = (String)obj.get("title");
			String content = (String)obj.get("content");
			log(title + " / " + content);
			
			Qna qna = new Qna();
			qna.setUserid(userid);
			qna.setTitle(title);
			qna.setContent(content);
			
			qnadao.writeQna(qna);
			//qna.setReplyContent(Integer.parse(qna.getQaindex());
			qnadao.editPost(qna);
			
			int count = 0;
			count = qnadao.getCountAdminNotRead();
			
			obj.put("count", count);
			System.out.println(obj.toJSONString());
			TextMessage msg = new TextMessage(obj.toJSONString());
			users.get("admin").sendMessage(msg);
			log("admin" + " / " + message.getPayload() + " / " + msg.getPayload());
		} else {
			String title = (String)obj.get("title");
			String content = (String)obj.get("content");
			//String ref = (String)obj.get("qna_brd_ref");
			String to_userid = (String)obj.get("to_userid");

			//log(title + " / " + content + " / " + ref + " / " + to_user_email);
			log(title + " / " + content  + " / " + to_userid);
			Qna qna = new Qna();
			qna.setUserid(userid);
			qna.setTitle(title);
			qna.setContent(content);
			//qna.setQna_brd_ref(Integer.parseInt(ref));
			
			qnadao.writeQna(qna);
			//qnadao.updateQnaRep(Integer.parseInt(ref));
			
			int count = qnadao.getCountUserNotRead(to_userid);
			System.out.println("유저 카운트 : " +count);
			obj.put("count", count);
			System.out.println(obj.toJSONString());
			
			TextMessage msg = new TextMessage(obj.toJSONString());
			 users.get(to_userid).sendMessage(msg);
			  
			  log(to_userid + " / " + message.getPayload() + " / " + msg.getPayload());
		}
		
		
//		if(message.getPayload().equals("login")) {
//			System.out.println("여기");
//			QnaBrdDao qnabrddao = sqlsession.getMapper(QnaBrdDao.class);
//			String user_email = (String)session.getAttributes().get("user_email");
//			int count = 0;
//			//나중에 어드민으로 정한 이메일 또는 role이 어드민 일 경우로 바꾸자
//			if(users.containsKey(user_email) && user_email.equals("xntm1111@gmail.com")) {
//				count = qnabrddao.getCountAdminNotRead();
//				TextMessage msg = new TextMessage(count + ",로그인");
//				 users.get(user_email).sendMessage(msg);
//				  
//				  log(user_email + " / " + message.getPayload() + " / " + msg.getPayload());
//			} else if(users.containsKey(user_email) && !user_email.equals("xntm1111@gmail.com")) {
//				count = qnabrddao.getCountUserNotRead(user_email);
//				System.out.println("유저 카운트 : " +count);
//				TextMessage msg = new TextMessage(count + ",로그인");
//				 users.get(user_email).sendMessage(msg);
//				  
//				  log(user_email + " / " + message.getPayload() + " / " + msg.getPayload());
//			}
//			
//		
//		} else{
//			System.out.println("문의 및 보내기");
//			QnaBrdDao qnabrddao = sqlsession.getMapper(QnaBrdDao.class);
//			String user_email = (String)session.getAttributes().get("user_email");
//			
//			if(user_email.equals("xntm1111@gmail.com")) {
//				String qna_brd_title = message.getPayload().split(",")[0];
//				String qna_brd_content = message.getPayload().split(",")[1];
//				String qna_brd_ref = message.getPayload().split(",")[2];
//				String to_user_email = message.getPayload().split(",")[3];
//				String admin = message.getPayload().split(",")[4];
//				log(qna_brd_title + " / " + qna_brd_content + " / " + qna_brd_ref + " / " + to_user_email + " / " + admin);
//				
//				QnaBrdDto qnabrddto = new QnaBrdDto();
//				qnabrddto.setUser_email(user_email);
//				qnabrddto.setQna_brd_title(qna_brd_title);
//				qnabrddto.setQna_brd_content(qna_brd_content);
//				qnabrddto.setQna_brd_ref(Integer.parseInt(qna_brd_ref));
//				qnabrddao.insertQnaAnsBrd(qnabrddto);
//				qnabrddao.updateQnaRep(Integer.parseInt(qna_brd_ref));
//				
//				int count = qnabrddao.getCountUserNotRead(to_user_email);
//				System.out.println("유저 카운트 : " +count);
//				TextMessage msg = new TextMessage(count + "," + admin);
//				 users.get(to_user_email).sendMessage(msg);
//				  
//				  log(to_user_email + " / " + message.getPayload() + " / " + msg.getPayload());
//				
//				
//			} else {
//				String qna_brd_title = message.getPayload().split(",")[0];
//				String qna_brd_content = message.getPayload().split(",")[1];
//				String user = message.getPayload().split(",")[2];
//				log(qna_brd_title + " / " + qna_brd_content + " / " + user);
//				
//				QnaBrdDto qnabrddto = new QnaBrdDto();
//				qnabrddto.setUser_email(user_email);
//				qnabrddto.setQna_brd_title(qna_brd_title);
//				qnabrddto.setQna_brd_content(qna_brd_content);
//				qnabrddao.insertQnaBrd(qnabrddto);
//				
//				qnabrddto.setQna_brd_ref(qnabrddto.getQna_brd_seq());
//				qnabrddao.updateQnaBrd(qnabrddto);
//				
//				int count = 0;
//				count = qnabrddao.getCountAdminNotRead();
//				TextMessage msg = new TextMessage(count + "," + user);
//				users.get("xntm1111@gmail.com").sendMessage(msg);
//				log("xntm1111@gmail.com" + " / " + message.getPayload() + " / " + msg.getPayload());
//			}
//		}

	}
	
	//연결에 문제 발생시
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception{
		User user = (User)session.getAttributes().get("user");
		String userid = user.getUserid(); 
		log(userid + " / " + exception.getMessage());
	}

}

