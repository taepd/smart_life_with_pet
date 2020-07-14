package bit.or.eesotto.controller;

import java.security.Principal;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.or.eesotto.service.LoginService;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
//		@Autowired
//		LoginService ls;
		
	
	    // 메인 페이지 
		@RequestMapping("main.bit")
		public String nomalLogin(String userid, String pwd, HttpSession session, Model model) {


			return "redirect:/";
		}
		// 비로그인 메인 페이지 
		@RequestMapping(value = "mainTest.bit", method = RequestMethod.GET)
		public String mainView(String cp, String ps, Principal principal, Model model) {
			
		
			logger.info("작업시작이다..." );
			
			
			
			return "main";
		}
		
		// 로그인 메인 페이지 
		@RequestMapping(value = "mainTest2.bit", method = RequestMethod.GET)
		public String mainViewTest(String cp, String ps, Principal principal, Model model) {
			
		
			logger.info("다시작업시작이다..." );
			
			
			
			return "mainTest";
		}

}
