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
import bit.or.eesotto.dao.QnaCommentDao;
import bit.or.eesotto.dao.BlogCommentDao;
import bit.or.eesotto.dao.BlogDao;
import bit.or.eesotto.dao.QnaDao;
import bit.or.eesotto.dao.UserDao;
import bit.or.eesotto.dto.Message;
import bit.or.eesotto.dto.Blog;
import bit.or.eesotto.dto.BlogComment;
import bit.or.eesotto.dto.Qna;
import bit.or.eesotto.dto.QnaComment;
import bit.or.eesotto.dto.User;

@Service
public class QnaService {

	private static final Logger logger = LoggerFactory.getLogger(QnaService.class);

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	QnaDao qnaDao;

	@Autowired
	QnaCommentDao qnaCommentDao;

	// 일반 회원가입
	public int writeQna(Qna qna) {
		int result = 0;

		try {

			qnaDao = sqlsession.getMapper(QnaDao.class);
			result = qnaDao.writeQna(qna);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}

//	public HashMap<String, Object> mainView(String cp, String ps, String userid) {
//		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		
//		// List 페이지 처음 호출
//		if (ps == null || ps.trim().equals("")) {
//			// default 값 설정
//			ps = "5"; // 5개씩
//		}
//
//		if (cp == null || cp.trim().equals("")) {
//			// default 값 설정
//			cp = "1"; // 1번째 페이지 보겠다
//		}
//		
//		int pageSize = Integer.parseInt(ps);
//		int cpage = Integer.parseInt(cp);
//		int pageCount = 0;
//
//		logger.info("pageSize" + pageSize);
//		logger.info("cpage" + cpage);
//		
//		// DAO 데이터 받아오기
//		List<Message> messageList = null;
//
//		// mapper 를 통한 인터페이스 연결
//		MessageDao messageDao = sqlsession.getMapper(MessageDao.class);
//
//		int totalMsgcount = messageDao.getMessageCount(userid);
//		
//		//
//		messageList = messageDao.getMessageSendList(cpage, pageSize, userid);
//		
//		// 페이지 크기에 맞춰 페이지 수 구하기
//		if (totalMsgcount % pageSize == 0) {
//			pageCount = totalMsgcount / pageSize;
//		} else {
//			pageCount = (totalMsgcount / pageSize) + 1;
//		}
//		
//		map.put("messageList", messageList);
//		map.put("cpage", cpage);
//		map.put("pageSize", pageSize);
//		map.put("pageCount", pageCount);
//		map.put("totalMsgcount", totalMsgcount);
//		
//		return map;
//	}

	public HashMap<String, Object> mainView(String cp, String ps, String userid) {

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
		List<Qna> qnaList = null;

		// mapper 를 통한 인터페이스 연결
		QnaDao qnaDao = sqlsession.getMapper(QnaDao.class);

		int totalQnaCount = qnaDao.getQnaCount(userid);

		//
		qnaList = qnaDao.getQnaList(cpage, pageSize);

		// 페이지 크기에 맞춰 페이지 수 구하기
		if (totalQnaCount % pageSize == 0) {
			pageCount = totalQnaCount / pageSize;
		} else {
			pageCount = (totalQnaCount / pageSize) + 1;
		}

		map.put("qnaList", qnaList);
		map.put("cpage", cpage);
		map.put("pageSize", pageSize);
		map.put("pageCount", pageCount);
		map.put("totalQnaCount", totalQnaCount);

		return map;
	}

	
	//글 상세보기 
		public Qna getPost(String qaindex) {
					
			Qna qna = null;

			qnaDao = sqlsession.getMapper(QnaDao.class);
			qna = qnaDao.getPost(qaindex);
								
			return qna;
		}
		
		//글 상세보기  서비스 다시
		public int editPost(Qna post) {

			qnaDao = sqlsession.getMapper(QnaDao.class);
			
								
			return qnaDao.editPost(post);
		}
		
		
		//글 상세보기  서비스 다시
		public int editReplyPost(Qna post) {

			qnaDao = sqlsession.getMapper(QnaDao.class);
			
								
			return qnaDao.editReplyPost(post);
		}
		
		//글 삭제
		public int deletePost(Qna post) {

			qnaDao = sqlsession.getMapper(QnaDao.class);
			
								
			return qnaDao.deletePost(post);
		}
		
		
		//QNA > 댓글 쓰기
		public int writeCommnet(QnaComment qnaComment) {
			
			int result = 0;

			try {

				qnaCommentDao = sqlsession.getMapper(QnaCommentDao.class);
				result = qnaCommentDao.writeComment(qnaComment);

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			return result;
		}


		//QNA > 댓글 수정
		public int editComment(QnaComment qnaComment) {
			
			int result = 0;

			try {

				qnaCommentDao = sqlsession.getMapper(QnaCommentDao.class);
				result = qnaCommentDao.editComment(qnaComment);

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			return result;
		}	
		//QNA > 댓글 조회
		public QnaComment getComment(int qnaindex) {
			
			QnaComment comment = null;

			try {

				qnaCommentDao = sqlsession.getMapper(QnaCommentDao.class);
				comment = qnaCommentDao.getComment(qnaindex);

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			return comment;
		}
		
		//QNA > 댓글 리스트 조회
		public List<QnaComment> getCommentList(String qaindex) {
			
			List<QnaComment> commentList = null;

			try {

				qnaCommentDao = sqlsession.getMapper(QnaCommentDao.class);
				commentList = qnaCommentDao.getCommentList(qaindex);
				System.out.println(commentList);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			return commentList;
		}
		
		
		//QNA > 댓글 삭제
		public int deleteComment(QnaComment comment) {

			qnaCommentDao = sqlsession.getMapper(QnaCommentDao.class);

			return qnaCommentDao.deleteComment(comment);
		}
	
	
}
