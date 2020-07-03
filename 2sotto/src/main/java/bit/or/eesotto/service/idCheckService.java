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
public class idCheckService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	UserDao UserDao;
	
	@Autowired
	JoinService joinservice;

	//ID check(Ajax)
	public int idCheck(final User user) throws ClassNotFoundException, SQLException {
		  
	UserDao userdao = sqlsession.getMapper(UserDao.class);
			
	int daoresult = userdao.idCheck(user);
	
	/* logger.info("post register"); */
	
	try {
		if(daoresult == 1) {
			return "/join/register";
		}else if(daoresult == 0) {
			joinservice.insert(user);
		}
		// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
		// 존재하지 않는다면 -> register
	} catch (Exception e) {
		throw new RuntimeException();
	}
	return result;
	
	}

}
