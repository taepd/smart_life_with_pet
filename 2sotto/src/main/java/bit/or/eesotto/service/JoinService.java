package bit.or.eesotto.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import bit.or.eesotto.dao.UserDao;
import bit.or.eesotto.dto.User;

@Service
public class JoinService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	UserDao userDao;
	
	
	//아이디 중복체크
	public List<String> idCheck(String userid) { 

		List<String> list = null;

		try {
			
			userDao = sqlsession.getMapper(UserDao.class);
			list = userDao.getUserId(userid);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return list;
	}
	//일반 회원가입 
	public void normalJoin(User user) { 

		try {
			
			userDao = sqlsession.getMapper(UserDao.class);
			userDao.normalJoin(user);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}

}
