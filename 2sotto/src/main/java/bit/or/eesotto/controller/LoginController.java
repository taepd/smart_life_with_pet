package bit.or.eesotto.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.or.eesotto.dto.User;
import bit.or.eesotto.service.LoginService;

@Controller
public class LoginController {
//	private SqlSession sqlsession;
//
//	@Autowired
//	public void setSqlsession(SqlSession sqlsession) {
//		this.sqlsession = sqlsession;
//	}

	@Autowired
	LoginService ls;

	
	// 로그인 view
	@RequestMapping(value = "login.bit", method = RequestMethod.GET) 
	public String login() { return "login/loginForm"; }
	 

	// 일반 로그인 처리
	@RequestMapping(value="nomalLogin.bit", method = RequestMethod.POST)
	public String nomalLogin(String userid, String pwd, HttpSession session, Model model) {
		
		User user = null;
		
		user = ls.normalLogin(userid);
		
		String msg = "";
		String url = "";

		if (user != null && userid.equals(user.getUserid()) && pwd.equals(user.getPwd())) {
			session.setAttribute("userid", userid);
			msg = "로그인 성공";
			url = "Main.bit";

		} else {
			msg = "로그인 실패";
			url = "Main.bit";
			/* url = "./index.html"; */
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "redirect";
	}

}
