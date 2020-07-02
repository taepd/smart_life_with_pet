package bit.or.eesotto.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JoinController {


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
	@RequestMapping(value = "joinForm.bit", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinForm(HttpSession session, Model model)throws IOException {
	
	// 이메일 인증번호 확인을 위한 랜덤숫자 생성
	//int ran = new Random().nextInt(900000) + 100000;
	//model.addAttribute("random", ran);
	
	return "join/joinForm";
}

}
