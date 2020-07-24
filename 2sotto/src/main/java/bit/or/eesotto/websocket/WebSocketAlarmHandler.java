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
		System.out.println("하이");
		String user_email = (String)session.getAttributes().get("user_email");
		log(user_email + " 접속");
		log(session.toString());
		users.put(user_email, session); //userid 와 session 저장
	}	
	
	//연결해제
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		String user_email = (String)session.getAttributes().get("user_email");
		if(session.getId() != null) {
			if(users.containsKey(user_email)) {
				users.remove(user_email); //연결해제된 id 삭제
				log(user_email + " 해제");
			}
		}
	}
	
	//데이터 전송
	/*
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		if(message.getPayload().equals("login")) {
			System.out.println("여기");
			QnaBrdDao qnabrddao = sqlsession.getMapper(QnaBrdDao.class);
			String user_email = (String)session.getAttributes().get("user_email");
			int count = 0;
			나중에 어드민으로 정한 이메일 또는 role이 어드민 일 경우로 바꾸자
			if(users.containsKey(user_email) && user_email.equals("kimdukkung@naver.com")) {
				//count = qnabrddao.getCountAdminNotRead();
				TextMessage msg = new TextMessage("읽지 않은 문의 : " + count + " 건");
				 users.get(user_email).sendMessage(msg);
				  
				  log(user_email + " / " + message.getPayload() + " / " + msg.getPayload());
			} else if(users.containsKey(user_email) && !user_email.equals("kimdukkung@naver.com")) {
				//count = qnabrddao.getCountUserNotRead(user_email);
				System.out.println("유저 카운트 : " +count);
				TextMessage msg = new TextMessage("답변이 온 문의 : " + count + " 건");
				 users.get(user_email).sendMessage(msg);
				  
				  log(user_email + " / " + message.getPayload() + " / " + msg.getPayload());
			}
			
		
		} else{
			System.out.println("문의 및 보내기");
			QnaBrdDao qnabrddao = sqlsession.getMapper(QnaBrdDao.class);
			String user_email = (String)session.getAttributes().get("user_email");
			
			if(user_email.equals("kimdukkung@naver.com")) {
				String qna_brd_title = message.getPayload().split(",")[0];
				String qna_brd_content = message.getPayload().split(",")[1];
				String qna_brd_ref = message.getPayload().split(",")[2];
				String to_user_email = message.getPayload().split(",")[3];
				log(qna_brd_title + " / " + qna_brd_content + " / " + qna_brd_ref + " / " + to_user_email);
				
				QnaBrdDto qnabrddto = new QnaBrdDto();
				qnabrddto.setUser_email(user_email);
				qnabrddto.setQna_brd_title(qna_brd_title);
				qnabrddto.setQna_brd_content(qna_brd_content);
				qnabrddto.setQna_brd_ref(Integer.parseInt(qna_brd_ref));
				qnabrddao.insertQnaAnsBrd(qnabrddto);
				qnabrddao.updateQnaRep(Integer.parseInt(qna_brd_ref));
				
				int count = qnabrddao.getCountUserNotRead(to_user_email);
				System.out.println("유저 카운트 : " +count);
				TextMessage msg = new TextMessage("답변이 온 문의 : " + count + " 건");
				 users.get(to_user_email).sendMessage(msg);
				  
				  log(to_user_email + " / " + message.getPayload() + " / " + msg.getPayload());
				
				
			} else {
				String qna_brd_title = message.getPayload().split(",")[0];
				String qna_brd_content = message.getPayload().split(",")[1];
				
				log(qna_brd_title + " / " + qna_brd_content);
				
				QnaBrdDto qnabrddto = new QnaBrdDto();
				qnabrddto.setUser_email(user_email);
				qnabrddto.setQna_brd_title(qna_brd_title);
				qnabrddto.setQna_brd_content(qna_brd_content);
				qnabrddao.insertQnaBrd(qnabrddto);
				
				qnabrddto.setQna_brd_ref(qnabrddto.getQna_brd_seq());
				qnabrddao.updateQnaBrd(qnabrddto);
				
				int count = 0;
				count = qnabrddao.getCountAdminNotRead();
				TextMessage msg = new TextMessage("읽지 않은 문의 : " + count + " 건");
				users.get("kimdukkung@naver.com").sendMessage(msg);
				log("kimdukkung@naver.com" + " / " + message.getPayload() + " / " + msg.getPayload());
			}
		}
		*/
//		else {
//			String fromid = message.getPayload().split(",")[1];
//			
//			Message savemsg = new Message(message.getPayload().split(",")[0], message.getPayload().split(",")[1], message.getPayload().split(",")[2]);
//			EmpDao empdao = sqlsession.getMapper(EmpDao.class);
//			  empdao.insertMessage(savemsg);
//			  
//			  int result = empdao.getmsgcount(fromid);
//			 
//			
//			if(users.containsKey(fromid)) {
//				
//				  TextMessage msg = new TextMessage("수신된 쪽지 : " + result + "건");
//				  users.get(fromid).sendMessage(msg); 
//				  log(fromid + " / " + message.getPayload()
//				  + " / " + msg.getPayload());
//				 
//			}
//			
//			System.out.println("fromid : " + fromid);
//			System.out.println(message.getPayload());
//		}
//	}
	
	//연결에 문제 발생시
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception{
		String user_email = (String)session.getAttributes().get("user_email");
		log(user_email + " / " + exception.getMessage());
	}

}

