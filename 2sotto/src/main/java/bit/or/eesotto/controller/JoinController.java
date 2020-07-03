package bit.or.eesotto.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bit.or.eesotto.dto.User;
import bit.or.eesotto.service.JoinService;
import bit.or.eesotto.service.idCheckService;


@Controller
@RequestMapping("join")
public class JoinController {

	private JoinService joinservice;
	
	private idCheckService idcheckservice;
	
	@Autowired
	public void setIdCheckService(idCheckService idcheckservice) {
		this.idcheckservice = idcheckservice;
	}
	
	@Autowired
	public void setJoinservice(JoinService joinservice) {
		this.joinservice = joinservice;
	}
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//회원가입 화면 보러가기
	@RequestMapping(value = "register.bit", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView register(HttpSession session) throws IOException {

		/* 구글code 발행 */
		// OAuth2Operations oauthOperations =
		// googleConnectionFactory.getOAuthOperations();
		/* SNS 로그인 인증을 위한 url 생성 */

		/* 생성한 url 전달 */
		ModelAndView mav = new ModelAndView();
		mav.setViewName("join/register");

		return mav;
	}
	
	// 회원가입 view
	@RequestMapping(value = "joinForm.bit", method = RequestMethod.GET)
	public String joinForm(HttpSession session, Model model)throws IOException {	
	
		return "join/joinForm";
}

	
	//회원가입처리
		@RequestMapping(value="joinForm.bit" , method=RequestMethod.POST)
		public String join(User user) throws ClassNotFoundException, SQLException {			
		user.setPwd(this.bCryptPasswordEncoder.encode(user.getPwd()));
		return joinservice.insert(user);  
		}
		
		// 아이디 중복 체크
		@ResponseBody
		@RequestMapping(value="idCheck.bit", method = RequestMethod.POST)
		public int idChk(User user) throws Exception {
			int result = idcheckservice.idCheck(user);
			return result;
		}



		// 회원가입 post
		@RequestMapping(value = "", method = RequestMethod.POST)
		public String postRegister(User vo) throws Exception {			
			return "redirect:/";
		}
}
