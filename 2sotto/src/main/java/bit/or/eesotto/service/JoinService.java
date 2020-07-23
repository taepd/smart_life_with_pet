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
	
	// SNS회원가입
	/*
	public void JoinWithSNS(UserVO userVO){
		userDao.JoinWithSNS(userVO);
	}
	*/

	// 아이디 중복체크
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

	// 닉네임 중복체크
	public List<String> nickCheck(String nick) {

		List<String> list = null;

		try {

			userDao = sqlsession.getMapper(UserDao.class);
			list = userDao.getNick(nick);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return list;
	}

	/*
	   
	  휴대폰 번호 중복체크 public List<String> cpnumberCheck(String cpnumber) {
	  
	  List<String> list = null;
	  
	  try {
	  
	 userDao = sqlsession.getMapper(UserDao.class); list =
	  userDao.getCpnumber(cpnumber);
	  
	 } catch (Exception e) { System.out.println(e.getMessage()); }
	  
	  return list; }
	 */

	// 일반 회원가입
	public int normalJoin(User user) {
		int result = 0;
		try {

			userDao = sqlsession.getMapper(UserDao.class);
			result = userDao.normalJoin(user);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}
	

}
