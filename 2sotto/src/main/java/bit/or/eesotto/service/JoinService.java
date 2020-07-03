package bit.or.eesotto.service;

<<<<<<< HEAD
import java.sql.SQLException;
=======
import java.util.List;
>>>>>>> 552709afc25e3406a4f47703ec4b4dd622d858d3

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
<<<<<<< HEAD
import org.springframework.ui.Model; 
=======
import org.springframework.ui.Model;
>>>>>>> 552709afc25e3406a4f47703ec4b4dd622d858d3

import bit.or.eesotto.dao.UserDao;
import bit.or.eesotto.dto.User;

<<<<<<< HEAD

=======
>>>>>>> 552709afc25e3406a4f47703ec4b4dd622d858d3
@Service
public class JoinService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
<<<<<<< HEAD
	UserDao userdao;

	//회원 가입
	public String insert(final User user) throws ClassNotFoundException, SQLException {
		  
	userdao = sqlsession.getMapper(UserDao.class);
			
	try {
			userdao.insert(user);			
	} catch (Exception e) {
			e.printStackTrace();
	}
			
	return "redirect:login.bit";

=======
	UserDao userDao;

	public List<String> idCheck(String userid) { 

		List<String> list = null;

		try {
			userDao = sqlsession.getMapper(UserDao.class);
			
			list = userDao.getUserId(userid);
					

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return list;
		
>>>>>>> 552709afc25e3406a4f47703ec4b4dd622d858d3
	}

}
