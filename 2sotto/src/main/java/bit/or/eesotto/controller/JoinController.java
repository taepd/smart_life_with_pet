package bit.or.eesotto.controller;

import java.io.*;
import java.security.*;
import java.util.*;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.authentication.*;
import org.springframework.security.core.*;
import org.springframework.security.core.authority.*;
import org.springframework.security.core.context.*;
import org.springframework.security.crypto.bcrypt.*;
import org.springframework.security.web.context.*;
import org.springframework.social.google.connect.GoogleOAuth2Template;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.multipart.commons.*;
import org.springframework.web.servlet.mvc.support.*;

import bit.or.eesotto.dto.*;
import bit.or.eesotto.service.*;

@Controller
@RequestMapping("/join/")
public class JoinController {
	
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);

	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	JoinService joinService;
	
	
	//메일인증  해야되서 사용중
	@Autowired
	UserService	UserService;
	//메일인증 끝
	
	
	//구글 테스트 시작
    @Autowired
    private GoogleOAuth2Template googleOAuth2Template;
    
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;
	//구글 테스트  끝 
	
	
	@Autowired
	private LoginService ls;
	
//	@Autowired
//	BCryptPasswordEncoder pwEncoder;
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	
	// 회원가입 화면 보러가기
	@RequestMapping(value = "register.bit", method = RequestMethod.GET)
	public String register(Model model, HttpSession session) throws IOException {

		/* SNS 로그인 인증을 위한 url 생성 */

		/* 생성한 url 전달 */
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//구글URL을 생성한다 시작.
		String googleUrl = googleOAuth2Template.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);        
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		logger.info("네이버:" + naverAuthUrl);	
		//네이버
		model.addAttribute("naver_url", naverAuthUrl);
		logger.info("naver_url:" + naverAuthUrl);
		//구글
		model.addAttribute("google_url", googleUrl);
		logger.info("구글:" + googleUrl);
		return "join/register";
	}

	// 회원가입 view
	@RequestMapping(value = "joinForm.bit", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinForm(Model model) throws IOException {
		// 이메일 인증번호 확인을 위한 랜덤숫자 생성
		// int ran = new Random().nextInt(900000) + 100000;
		// model.addAttribute("random", ran);

		return "join/joinForm";
	}

	// 일반 회원가입 처리
	@RequestMapping(value = "normalJoin.bit", method = RequestMethod.POST)
	public String normalJoin(User user, HttpServletRequest request, MultipartHttpServletRequest multiFile,
							 Principal principal, HttpSession session, RedirectAttributes redirectAttributes,
							 Model model,RedirectAttributes rttr) throws IOException{

		if(user.getSnstype()==null) { //소셜 가입은 암호가 없으므로
		//비밀번호 암호화 
		String inputPwd = user.getPwd();
		String encodingPW = pwEncoder.encode(inputPwd);
		user.setPwd(encodingPW);		
		logger.info("비밀번호 암호화 완료");	
		}
		// 파일 업로드
		MultipartFile file = multiFile.getFile("file");
		if(file != null && file.getSize() > 0) { 
			    //String filename = file.getOriginalFilename();
			    String filename = UUID.randomUUID().toString();
				//String path = request.getServletContext().getRealPath("/images");
				String path = request.getServletContext().getRealPath("/assets/images");
				//System.out.println("checkPath: "+checkPath);
				
				String fpath = path + "\\"+ filename; 
				System.out.println("fpath: "+fpath);
				
				if(!filename.equals("")) { //실 파일 업로드
					FileOutputStream fs;
					
					try {
						fs = new FileOutputStream(fpath);
						fs.write(file.getBytes());
						fs.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
			}
				user.setUimg(filename); //파일명을 별도 관리 (DB insert)
		}else { //프로필 사진 입력을 하지 않았을 경우
			user.setUimg("profile-circle.png");
		}
		
		int result = joinService.normalJoin(user);
		
		String msg = null;
		String url = null;
		
		if(result==1) {
			
			logger.info(user.getUserid()+"님 회원가입 처리 완료");
			
			msg = "회원가입 성공";
	        url = "../"; 
	        
	        //스프링 시큐리티 수동 로그인을 위한 작업//
			//로그인 세션에 들어갈 권한을 설정
					List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
					list.add(new SimpleGrantedAuthority("ROLE_USER"));
		
					SecurityContext sc = SecurityContextHolder.getContext();
			//아이디, 패스워드, 권한을 설정. 아이디는 Object단위로 넣어도 무방하며
			//패스워드는 null로 하여도 값이 생성.
					sc.setAuthentication(new UsernamePasswordAuthenticationToken(user.getUserid(), null, list));
					session = request.getSession(true);
		
			//위에서 설정한 값을 Spring security에서 사용할 수 있도록 세션에 설정
					session.setAttribute(HttpSessionSecurityContextRepository.
			                       SPRING_SECURITY_CONTEXT_KEY, sc);
		//스프링 시큐리티 수동 로그인을 위한 작업 끝//
		
		//로그인 유저 정보 가져와서 세션객체에 저장  
		    logger.info("유저네임: "+user.getUserid());      	   
		   
		    session = request.getSession();
		    session.setAttribute("user", user);
	    //로그인 유저 정보 가져와서 세션객체에 저장 끝//		
			
		}else { 
			
			redirectAttributes.addFlashAttribute("failedLogin", "failed");
			logger.info("회원가입 실패");
			
			msg = "문제가 생겨 회원가입이 정상적으로 이루어지지 않았습니다.";
			url = "javascript:history.back();";

		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "redirect";	
		
		
	} 

	// ID 중복체크 Ajax 호출
	//ID가 이메일이니까 인증도 같이 시작.
	@ResponseBody
	@RequestMapping(value = "idCheck.bit", method = { RequestMethod.POST })
	public String idCheck(String userid) throws IOException {
		//String id = request.getParameter("userid");
		return joinService.idCheck(userid);
	}
	
	// nick 중복체크 Ajax 호출
	@ResponseBody
	@RequestMapping(value = "nickCheck.bit", method = { RequestMethod.POST })
	public List<String> nickCheck(HttpServletRequest request, Model model) throws IOException {

		String id = request.getParameter("nick");

		return joinService.nickCheck(id);
	}
	
	
	
	//------------- 이메일 인증번호 전송 시작-------------
	@ResponseBody
	@RequestMapping("/confirmEmail")
	public int sendConfirmEmail(Email emaildto) throws Exception {
        return UserService.sendConfirmEmail(emaildto);
    }
	//------------- 이메일 인증번호 전송 끝-------------

		
	
	
	
	/*
	  // 휴대폰 중복체크 Ajax 호출
	  
	  @ResponseBody
	  
	  @RequestMapping(value = "join/cpnumberCheck.bit", method = {
	  RequestMethod.POST }) public List<String> cpnumberCheck(HttpServletRequest
	  request, Model model) throws IOException {
	  
	  String id = request.getParameter("cpnumber");
	  
	  return joinService.cpnumberCheck(id); }
	 */

}
