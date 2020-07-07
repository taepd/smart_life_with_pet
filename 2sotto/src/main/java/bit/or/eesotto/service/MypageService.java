package bit.or.eesotto.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.or.eesotto.dao.UserDao;
import bit.or.eesotto.dto.User;

@Service
public class MypageService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	UserDao userDao;
	
	//유저 정보 가져오기
	public User getUserInfo(String userid) {

		userDao = sqlsession.getMapper(UserDao.class);

		return userDao.getUser(userid);
		
	}
	
	//유저 정보 수정하기
	public int editUser(User user) {

		userDao = sqlsession.getMapper(UserDao.class);

		return userDao.editUser(user);
		
	}
	
	//유저 정보 삭제하기
	public int deleteUser(String userid) {

		userDao = sqlsession.getMapper(UserDao.class);

		return userDao.deleteUser(userid);
		
	}	
	
	//비밀번호 수정하기
	public int editPwd(String pwd, String userid) {

		userDao = sqlsession.getMapper(UserDao.class);

		return userDao.editPwd(pwd, userid);
			
	}
	
	
	

}
