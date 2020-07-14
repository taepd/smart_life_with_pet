package bit.or.eesotto.controller;

import java.io.*;
import java.util.*;

import javax.servlet.http.*;

import org.json.simple.*;
import org.json.simple.parser.*;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.authentication.*;
import org.springframework.security.core.*;
import org.springframework.security.core.authority.*;
import org.springframework.security.core.context.*;

import org.springframework.security.web.context.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.github.scribejava.core.model.*;

import bit.or.eesotto.dto.User;
import bit.or.eesotto.service.*;




@Controller
@RequestMapping("/login/") 
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	LoginService ls;
	
//	@Autowired
//	BCryptPasswordEncoder pwEncoder;
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	/* NaverLoginBO */
	
	// 로그인 view 기본 시작
	//@RequestMapping(value = "login.bit", method = RequestMethod.GET)
	//public String login() {
	//	return "login/loginForm";
	//}
	// 로그인 view 기본 끝
	// 로그인 view
	@RequestMapping(value = "login.bit", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
				logger.info("네이버:" + naverAuthUrl);	
				//네이버
				
				model.addAttribute("url", naverAuthUrl);
				logger.info("url:" + naverAuthUrl);
		return "login/loginForm";
	}
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "callback.bit", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest request)
			throws IOException, ParseException {
		logger.info("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
	//1. 로그인 사용자 정보를 읽어온다.
			apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
			/**
			 * apiResult json 구조 {"resultcode":"00", "message":"success",
			 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
			 **/
	//2. String형식인 apiResult를 json형태로 바꿈
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
	//3. 데이터 파싱
	//Top레벨 단계 _response 파싱
			JSONObject response_obj = (JSONObject) jsonObj.get("response");
	//response의 nickname값 파싱
			String name = (String) response_obj.get("name");
			String email = (String) response_obj.get("email");
			logger.info(name);
			logger.info(email);
	//4.파싱 닉네임 세션으로 저장
			session.setAttribute("sessionId", name); // 세션 생성
			session.setAttribute("sessionId", email); // 세션 생성
			model.addAttribute("result", apiResult);
			logger.info(apiResult);
			logger.info(email);
			logger.info(name);
	
	//스프링 시큐리티 수동 로그인을 위한 작업//
		//로그인 세션에 들어갈 권한을 설정
				List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
				list.add(new SimpleGrantedAuthority("ROLE_USER"));
	
				SecurityContext sc = SecurityContextHolder.getContext();
		//아이디, 패스워드, 권한을 설정. 아이디는 Object단위로 넣어도 무방하며
		//패스워드는 null로 하여도 값이 생성.
				sc.setAuthentication(new UsernamePasswordAuthenticationToken(email, null, list));
				session = request.getSession(true);
	
		//위에서 설정한 값을 Spring security에서 사용할 수 있도록 세션에 설정
				session.setAttribute(HttpSessionSecurityContextRepository.
		                       SPRING_SECURITY_CONTEXT_KEY, sc);
	//스프링 시큐리티 수동 로그인을 위한 작업 끝//
	
	//로그인 유저 정보 가져와서 세션객체에 저장  
	    User user = ls.normalLogin(email);
	    logger.info("유저네임: "+user.getUserid());      	   
	   
	    session = request.getSession();
	    session.setAttribute("user", user);
    //로그인 유저 정보 가져와서 세션객체에 저장 끝//		
		
	return "login/naverSuccess";

	}


	//로그아웃
	@RequestMapping(value = "logout.bit", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("여기는 logout");
		session.invalidate();
		return "redirect:index.jsp";
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
