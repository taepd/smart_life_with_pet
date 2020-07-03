package bit.or.eesotto.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import bit.or.eesotto.dto.User;
import bit.or.eesotto.service.JoinService;
import bit.or.eesotto.service.idCheckService;
import net.sf.json.JSONObject;


@Controller
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
	/*
 	@RequestMapping(value="joinForm.bit" , method=RequestMethod.POST) public
 	String join(User user) throws ClassNotFoundException, SQLException {
 	user.setPwd(this.bCryptPasswordEncoder.encode(user.getPwd())); return
 	joinservice.insert(user); }
	*/
		
		
	@ResponseBody
	@RequestMapping(value="idCheck.bit", method = RequestMethod.POST)
	public int idCheck(User user) throws Exception {
		int result = idcheckservice.idCheck(user);
		return result;
	}



	// 회원가입 post
	@RequestMapping(value = "joinForm.bit", method = RequestMethod.POST)
	public String postRegister(User user) throws Exception {
		/*logger.info("post register");*/
		int result = idcheckservice.idCheck(user);
		try {
			if(result == 1) {
				return "joinForm.bit";
			}else if(result == 0) {
				joinservice.insert(user);
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
			// 존재하지 않는다면 -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:index.bit";
	}

}
