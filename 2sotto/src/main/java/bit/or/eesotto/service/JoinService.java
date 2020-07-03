package bit.or.eesotto.service;

import java.sql.SQLException;

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

	}

}
