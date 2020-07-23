package bit.or.eesotto.controller;

import java.io.*;
import java.util.*;

import javax.inject.Inject;
import javax.servlet.http.*;

import org.apache.commons.codec.binary.Base64;
import org.json.simple.*;
import org.json.simple.parser.*;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.*;
import org.springframework.security.core.*;
import org.springframework.security.core.authority.*;
import org.springframework.security.core.context.*;

import org.springframework.security.web.context.*;
import org.springframework.social.MissingAuthorizationException;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.UserOperations;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.google.connect.GoogleOAuth2Template;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.*;

import bit.or.eesotto.dto.AuthInfo;
import bit.or.eesotto.dto.FacebookInfo;
import bit.or.eesotto.dto.User;
import bit.or.eesotto.service.*;



@Controller
@RequestMapping("/login/") 
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private LoginService ls;
	
	//구글 작업중 시작
	@Inject
	private AuthInfo authInfo;
	//구글 작업중 끝

	
	/* GoogleLogin 시작*/
	//@Autowired
	//private GoogleConnectionFactory googleConnectionFactory;
	//@Autowired
	//private OAuth2Parameters googleOAuth2Parameters;
	/* GoogleLogin 끝*/
	//구글 테스트 시작
    @Autowired
    private GoogleOAuth2Template googleOAuth2Template;
    
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;
	//구글 테스트  끝 
    // 페이스북 oAuth 관련 시작
    @Autowired
    private FacebookConnectionFactory connectionFactory;
    @Autowired
    private OAuth2Parameters oAuth2Parameters;
    // 페이스북 oAuth 관련 끝
	
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
		String naver_url = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		//페이스북URL을 생성한다 시작.
		OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
        String facebook_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
		//페이스북URL을 생성한다 시작.
		//구글URL을 생성한다 시작.
		String googleUrl = googleOAuth2Template.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);        
		//OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		//String googleUrl = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		logger.info("구글:" + googleUrl);
		model.addAttribute("google_url", googleUrl);
		//model.addAttribute("google_url", url);
		 //구글URL을 생성한다 끝.
				logger.info("네이버:" + naver_url);	
				//네이버
				
				model.addAttribute("naver_url", naver_url);
				logger.info("url:" + naver_url);
				//페이스북 시작
				model.addAttribute("facebook_url", facebook_url);
		        System.out.println("/facebook" + facebook_url);
				//페이스북 끝
				
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
			
	//5.회원가입한 아이디 여부 판단하여 회원가입으로 보낼지 로그인 시킬지 결정
			if(ls.normalLogin(email)==null) {
				logger.info("가입안한 아이디면 여기로");
				
				model.addAttribute("sns_id", email);  //회원가입 시 id로 활용
				model.addAttribute("snstype", "naver"); //snstype 파악을 위해
				return "join/SNSJoinForm";  //나중에 redirect화 하자
			}
			
	
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
	
	// 구글 Callback호출 메소드 시작callback.bit /oauth2callback.bit
	///oauth2callback
	@RequestMapping(value = "/oauth2callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String doSessionAssignActionPage(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		logger.info("여기는 googleCallback");
		String code = request.getParameter("code");
		logger.info("code 확인" + code);
		
		//RestTemplate을 사용하여 Access Token 및 profile을 요청한다.
		RestTemplate restTemplate = new RestTemplate();
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("code", code);
        parameters.add("client_id", authInfo.getClientId());
        parameters.add("client_secret", authInfo.getClientSecret());
        parameters.add("redirect_uri", googleOAuth2Parameters.getRedirectUri());
        parameters.add("grant_type", "authorization_code");		
        logger.info("parameters" + parameters);
        
        
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(parameters, headers);
        ResponseEntity<Map> responseEntity = restTemplate.exchange("https://www.googleapis.com/oauth2/v4/token", HttpMethod.POST, requestEntity, Map.class);
        Map<String, Object> responseMap = responseEntity.getBody();
        
        // id_token 라는 키에 사용자가 정보가 존재한다.
        // 받아온 결과는 JWT (Json Web Token) 형식으로 받아온다. 콤마 단위로 끊어서 첫 번째는 현 토큰에 대한 메타 정보, 두 번째는 우리가 필요한 내용이 존재한다.
        // 세번째 부분에는 위변조를 방지하기 위한 특정 알고리즘으로 암호화되어 사이닝에 사용한다.
        //Base 64로 인코딩 되어 있으므로 디코딩한다.
        
        String[] tokens = ((String)responseMap.get("id_token")).split("\\.");
        Base64 base64 = new Base64(true);
        String body = new String(base64.decode(tokens[1]));
       
        System.out.println(tokens.length);
        System.out.println(new String(Base64.decodeBase64(tokens[0]), "utf-8"));
        System.out.println(new String(Base64.decodeBase64(tokens[1]), "utf-8"));
        
        //Jackson을 사용한 JSON을 자바 Map 형식으로 변환
        ObjectMapper mapper = new ObjectMapper();
        Map<String, String> result = mapper.readValue(body, Map.class);
        System.out.println(result);
        System.out.println("너는 어디에 찍히는값인가: "+result.get(""));
        
		String email = (String) result.get("email");
        
		//return "login/naverSuccess"; 여기까지가 성공
        
        if(ls.normalLogin(email)==null) {
			logger.info("가입안한 아이디면 여기로");
			
			model.addAttribute("sns_id", email);  //회원가입 시 id로 활용
			model.addAttribute("snstype", "google"); //snstype 파악을 위해
			return "join/SNSJoinForm";  //나중에 redirect화 하자
		}
		

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

	// 구글 Callback호출 메소드 끝
	
	//구글 콜백 시작
	/*
	@RequestMapping(value = "/oauth2callback", method = { RequestMethod.GET, RequestMethod.POST })
    public String googleCallback(HttpServletRequest request) throws Exception {
 
        String code = request.getParameter("code");
        System.out.println(code);
        
        return "login/naverSuccess";
 	
    }
	*/
	//구글 콜백 끝

	//페이스북 콜백 시작
	@RequestMapping(value = "/facebookSignInCallback", method = { RequestMethod.GET, RequestMethod.POST })
    public String facebookSignInCallback(@RequestParam String code,Model model, HttpSession session, HttpServletRequest request) throws Exception {
		logger.info("여기까지는 들어와있나요???");
        try {
             String redirectUri = oAuth2Parameters.getRedirectUri();
            System.out.println("Redirect URI : " + redirectUri);
            System.out.println("Code : " + code);
 
            OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
            AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, redirectUri, null);
            String accessToken = accessGrant.getAccessToken();
            System.out.println("AccessToken: " + accessToken);
            Long expireTime = accessGrant.getExpireTime();
            
       
            
            if (expireTime != null && expireTime < System.currentTimeMillis()) {
                accessToken = accessGrant.getRefreshToken();
                logger.info("accessToken is expired. refresh token = {}", accessToken);
            };
            
          
            Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
            Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
            UserOperations userOperations = facebook.userOperations();
            System.out.println("1번타니?"+ connection);
            System.out.println("2번 타니?"+ userOperations);
           
            String [] fields = { "email", "id",  "name"};
            FacebookInfo userProfile = facebook.fetchObject("me", FacebookInfo.class, fields);
            String id = (String) userProfile.getId();
            System.out.println("유저 id : " + userProfile.getId());
           
            if(ls.normalLogin(id)==null) {
    			logger.info("가입안한 아이디면 여기로");
    			
    			//model.addAttribute("sns_id", email);  //회원가입 시 id로 활용
    			model.addAttribute("snstype", id); //snstype 파악을 위해
    			return "join/joinForm";  //나중에 redirect화 하자
    		}
    		

    		//스프링 시큐리티 수동 로그인을 위한 작업//
			//로그인 세션에 들어갈 권한을 설정
					List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
					list.add(new SimpleGrantedAuthority("ROLE_USER"));
		
					SecurityContext sc = SecurityContextHolder.getContext();
			//아이디, 패스워드, 권한을 설정. 아이디는 Object단위로 넣어도 무방하며
			//패스워드는 null로 하여도 값이 생성.
					sc.setAuthentication(new UsernamePasswordAuthenticationToken(id, null, list));
					session = request.getSession(true);
		
			//위에서 설정한 값을 Spring security에서 사용할 수 있도록 세션에 설정
					session.setAttribute(HttpSessionSecurityContextRepository.
			                       SPRING_SECURITY_CONTEXT_KEY, sc);
		//스프링 시큐리티 수동 로그인을 위한 작업 끝//
		
		//로그인 유저 정보 가져와서 세션객체에 저장  
		    User user = ls.normalLogin(id);
		    logger.info("유저네임: "+user.getUserid());      	   
		   
		    session = request.getSession();
		    session.setAttribute("user", user);
    		//로그인 유저 정보 가져와서 세션객체에 저장 끝//
            
            
            
            //try
 
           // {            
               //String [] fields = { "email", "id",  "name"};
               //FacebookInfo userProfile = facebook.fetchObject("me", FacebookInfo.class, fields);
               //System.out.println("유저이메일 : " + userProfile.getEmail());
               //System.out.println("유저 id : " + userProfile.getId());
               //System.out.println("유저 name : " + userProfile.getName());
                
          //  } catch (MissingAuthorizationException e) {
          //      e.printStackTrace();
          //  }

        
        } catch (Exception e) {
 
           e.printStackTrace();
        
        }
        return "login/naverSuccess";
            
    }

	//페이스북 콜백 끝
	
	
	
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
