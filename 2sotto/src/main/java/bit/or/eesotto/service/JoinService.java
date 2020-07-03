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

	public List<String> idCheck(String userid) { 

		List<String> list = null;

		try {
			userDao = sqlsession.getMapper(UserDao.class);
			System.out.println("요것"+userid);
			list = userDao.getUserId(userid);
			System.out.println("이것"+list);
					

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return list;
		
	}

}
