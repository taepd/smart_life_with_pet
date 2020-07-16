package bit.or.eesotto.service;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import bit.or.eesotto.dao.UserDao;
import bit.or.eesotto.dto.User;

@Service
public class LoginService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	UserDao userDao;
	
	// SNS로그인 = SNS로그인
	
//	public User snsLogin(String uEmail) {
//		return userDao.normalLogin(uEmail);
//	}
	
	
	public User normalLogin(String userid) {

		userDao = sqlsession.getMapper(UserDao.class);

		return userDao.getUser(userid);
		
	}

}
