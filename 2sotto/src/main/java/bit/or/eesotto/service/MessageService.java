package bit.or.eesotto.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import bit.or.eesotto.controller.BlogController;
import bit.or.eesotto.dao.MessageDao;
import bit.or.eesotto.dao.QnaDao;
import bit.or.eesotto.dao.BlogDao;
import bit.or.eesotto.dao.UserDao;
import bit.or.eesotto.dto.Message;
import bit.or.eesotto.dto.Qna;
import bit.or.eesotto.dto.Blog;
import bit.or.eesotto.dto.User;

@Service
public class MessageService {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageService.class);

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	MessageDao messageDao;

	// 일반 회원가입
	public int writeMessage(Message message) {
		int result = 0;

		try {

			messageDao = sqlsession.getMapper(MessageDao.class);
			result = messageDao.writeMessage(message);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}

	public HashMap<String, Object> rPageView(String cp, String ps, String userid) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// List 페이지 처음 호출
		if (ps == null || ps.trim().equals("")) {
			// default 값 설정
			ps = "5"; // 5개씩
		}

		if (cp == null || cp.trim().equals("")) {
			// default 값 설정
			cp = "1"; // 1번째 페이지 보겠다
		}
		
		int pageSize = Integer.parseInt(ps);
		int cpage = Integer.parseInt(cp);
		int pageCount = 0;

		logger.info("pageSize" + pageSize);
		logger.info("cpage" + cpage);
		
		// DAO 데이터 받아오기
		List<Message> messageList = null;

		// mapper 를 통한 인터페이스 연결
		MessageDao messageDao = sqlsession.getMapper(MessageDao.class);

		int totalMsgCount = messageDao.getMessageCount(userid);
		
		//
		messageList = messageDao.getMessageSendList(cpage, pageSize, userid);
		
		// 페이지 크기에 맞춰 페이지 수 구하기
		if (totalMsgCount % pageSize == 0) {
			pageCount = totalMsgCount / pageSize;
		} else {
			pageCount = (totalMsgCount / pageSize) + 1;
		}
		
		map.put("messageList", messageList);
		map.put("cpage", cpage);
		map.put("pageSize", pageSize);
		map.put("pageCount", pageCount);
		map.put("totalMsgCount", totalMsgCount);
		
		return map;
	}
	
	
public HashMap<String, Object> sPageView(String cp, String ps, String userid) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// List 페이지 처음 호출
		if (ps == null || ps.trim().equals("")) {
			// default 값 설정
			ps = "5"; // 5개씩
		}

		if (cp == null || cp.trim().equals("")) {
			// default 값 설정
			cp = "1"; // 1번째 페이지 보겠다
		}
		
		int pageSize = Integer.parseInt(ps);
		int cpage = Integer.parseInt(cp);
		int pageCount = 0;

		logger.info("pageSize" + pageSize);
		logger.info("cpage" + cpage);
		
		// DAO 데이터 받아오기
		List<Message> messageList = null;

		// mapper 를 통한 인터페이스 연결
		MessageDao messageDao = sqlsession.getMapper(MessageDao.class);

		int totalMsgCount = messageDao.getMessageCount(userid);
		
		//
		messageList = messageDao.getMessageList(cpage, pageSize, userid);
		
		// 페이지 크기에 맞춰 페이지 수 구하기
		if (totalMsgCount % pageSize == 0) {
			pageCount = totalMsgCount / pageSize;
		} else {
			pageCount = (totalMsgCount / pageSize) + 1;
		}
		
		map.put("messageList", messageList);
		map.put("cpage", cpage);
		map.put("pageSize", pageSize);
		map.put("pageCount", pageCount);
		map.put("totalMsgCount", totalMsgCount);
		
		return map;
	}
	
	//글 상세보기 
	public Message getMessage(String msindex, String ruserid) {
				
		Message message = null;

		messageDao = sqlsession.getMapper(MessageDao.class);
		message = messageDao.getMessage(msindex);
		
		int result = 0;
		//세션 유저가 쪽지를 수신한 사람이여서 그 쪽지를 읽었을 때
		if(message!=null && message.getRuserid().equals(ruserid)) {
			result = messageDao.updateReadState(msindex);
		}
							
		return message;
	}
		
		//Message 삭제
	public int deleteMessage(Message msindex) {

		messageDao = sqlsession.getMapper(MessageDao.class);
		
							
		return messageDao.deleteMessage(msindex);
	}

	


}

