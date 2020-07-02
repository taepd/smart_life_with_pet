package bit.or.eesotto.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bit.or.eesotto.service.LoginService;

@Controller
public class MainController {
	
//		@Autowired
//		LoginService ls;
		
	
	    // 메인 페이지 
		@RequestMapping("main.bit")
		public String nomalLogin(String userid, String pwd, HttpSession session, Model model) {


			return "main";
		}

}
