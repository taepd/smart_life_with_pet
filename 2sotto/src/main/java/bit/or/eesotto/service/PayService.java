package bit.or.eesotto.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.omg.CORBA.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import bit.or.eesotto.controller.BlogController;
import bit.or.eesotto.dao.BlogCommentDao;
import bit.or.eesotto.dao.BlogDao;
import bit.or.eesotto.dao.PayDao;
import bit.or.eesotto.dao.PointDao;
import bit.or.eesotto.dao.UserDao;
import bit.or.eesotto.dto.Blog;
import bit.or.eesotto.dto.BlogComment;
import bit.or.eesotto.dto.Point;
import bit.or.eesotto.dto.User;

@Service
public class PayService {
	
	private static final Logger logger = LoggerFactory.getLogger(PayService.class);

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	PayDao payDao;
	
	
	

	// USER테이블 point 입력
	public int payInput(User user) {//String userid, String point
		int result = 0;
		logger.info("payInput 서비스를 타기는 한다..");
		logger.info("로그인 유저 아이디: " + user.getUserid());
		logger.info("로그인 포인트: " + user.getPoint());
		/*
		 * User user = new User(); int upoint = user.getPoint() +
		 * Integer.parseInt(point); logger.info("합산 포인트: " + upoint);
		 */
		
		try {

			payDao = sqlsession.getMapper(PayDao.class);
			
			/*
			 * user.setUserid(userid); user.setPoint(upoint);
			 */
			result = payDao.payInput(user);
			logger.info("로그인 유저 아이디: " + user.getUserid());
			logger.info("로그인 포인트: " + user.getPoint());

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}
	
	
	
}

