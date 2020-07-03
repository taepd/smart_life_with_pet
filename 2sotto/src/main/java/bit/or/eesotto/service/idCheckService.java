package bit.or.eesotto.service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model; 

import bit.or.eesotto.dao.UserDao;
import bit.or.eesotto.dto.User;

import net.sf.json.JSONObject;


@Service
public class idCheckService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	UserDao userdao;
	
	@Autowired
	JoinService joinservice;

	//ID check(Ajax)
	public int idCheck(User user) throws Exception {
		int result = userdao.idCheck(user);
		return result;
	}

}
