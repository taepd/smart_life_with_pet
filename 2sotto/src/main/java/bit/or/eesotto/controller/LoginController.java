package bit.or.eesotto.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bit.or.eesotto.dto.User;
import bit.or.eesotto.service.LoginService;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;

	@Autowired
	LoginService ls;

	
	// 로그인 view
	@RequestMapping(value = "login.bit", method = RequestMethod.GET)  
	public String login() { return "login/loginForm"; }
	 

	// 일반 로그인 처리
	@RequestMapping(value="nomalLogin.bit", method = RequestMethod.POST)
	public String nomalLogin(String userid, String pwd, HttpSession session, RedirectAttributes redirectAttributes, Model model) {
		
		User user = null;
		
		//db 유저정보 가져오기 
		user = ls.normalLogin(userid); 
		
		
		

		if (user != null && userid.equals(user.getUserid()) && pwEncoder.matches(pwd, user.getPwd())) {
			session.setAttribute("userid", userid);
			logger.info("로그인 성공");
			
			return "redirect:/";

		}else {
			redirectAttributes.addFlashAttribute("failedLogin", "failed"); //redirectAttributes 검색해 볼 것
			logger.info("로그인 실패");
			return "redirect:/login.bit";
		}

	}

}
