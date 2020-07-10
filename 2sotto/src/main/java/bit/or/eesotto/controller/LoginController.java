package bit.or.eesotto.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
@RequestMapping("/login/")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

//	@Autowired
//	BCryptPasswordEncoder pwEncoder;

//	@Autowired
//	LoginService ls;

	// 로그인 view
	@RequestMapping(value = "login.bit", method = RequestMethod.GET)
	public String login() {
		return "login/loginForm";
	}

	// 스프링 시큐리티 도입으로 사용안함
	/*
	 * // 일반 로그인 처리
	 * 
	 * @RequestMapping(value="normalLogin.bit", method = RequestMethod.POST) public
	 * String nomalLogin(String userid, String pwd, HttpSession session,
	 * RedirectAttributes redirectAttributes, Model model) {
	 * 
	 * User user = null;
	 * 
	 * //db 유저정보 가져오기 user = ls.normalLogin(userid);
	 * 
	 * if (user != null && userid.equals(user.getUserid()) && pwEncoder.matches(pwd,
	 * user.getPwd())) { session.setAttribute("userid", userid);
	 * logger.info("로그인 성공");
	 * 
	 * return "redirect:/";
	 * 
	 * }else { redirectAttributes.addFlashAttribute("failedLogin", "failed");
	 * //redirectAttributes 검색해 볼 것 logger.info("로그인 실패");
	 * 
	 * return "redirect:/login/login.bit"; }
	 * 
	 * } 로그아웃
	 * 
	 * @RequestMapping(value = "logout.bit", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String logout(HttpSession session,
	 * HttpServletRequest request)throws IOException {
	 * 
	 * String loginId= (String)session.getAttribute("userid");
	 * 
	 * if(loginId != null) { session.removeAttribute("userid");
	 * session.invalidate();
	 * 
	 * // 자동 로그인 정보가 있을시 삭제 // 참고하려고 옮겨 // Cookie loginCookie =
	 * WebUtils.getCookie(request, "loginCookie"); // if(loginCookie != null) { //
	 * loginCookie.setMaxAge(0); // loginCookie.setPath("/"); //
	 * response.addCookie(loginCookie); // user.setSession_key("none"); //
	 * SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss"); //
	 * Calendar cal = Calendar.getInstance(); // String today = null; // today =
	 * formatter.format(cal.getTime()); //
	 * user.setSession_limit(Timestamp.valueOf(today)); // ls.keepLogin(user); //
	 * logger.info("자동 로그인 정보 삭제"); // } logger.info("로그아웃 성공"); }
	 * 
	 * return "redirect:/"; }
	 */
}
