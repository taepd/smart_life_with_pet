package bit.or.eesotto.controller;

import java.io.*;
import java.security.*;
import java.util.*;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.*;
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
	
	
	// 회원가입 화면 보러가기
	@RequestMapping(value = "register.bit", method = RequestMethod.GET)
	public String register(Model model) throws IOException {

		/* 구글code 발행 */
		// OAuth2Operations oauthOperations =
		// googleConnectionFactory.getOAuthOperations();
		/* SNS 로그인 인증을 위한 url 생성 */

		/* 생성한 url 전달 */
		
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
							 Principal principal, RedirectAttributes redirectAttributes,
							 Model model) throws IOException{
		
		
		//비밀번호 암호화 
		String inputPwd = user.getPwd();
		String encodingPW = pwEncoder.encode(inputPwd);
		user.setPwd(encodingPW);		
		logger.info("비밀번호 암호화 완료");	
		
		// 파일 업로드
		MultipartFile file = multiFile.getFile("file");
		if(file != null && file.getSize() > 0) { 
			    //String filename = file.getOriginalFilename();
			    String filename = UUID.randomUUID().toString();
				String path = request.getServletContext().getRealPath("/images");
				
				String fpath = path + "\\"+ filename; 
				
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
			user.setUimg("profile.png");
		}
		int result = joinService.normalJoin(user);
		
		String msg = null;
		String url = null;
		
		if(result==1) {
			
			logger.info(user.getUserid()+"님 회원가입 처리 완료");
			
			msg = "회원가입 성공";
	        url = "../index.jsp";
			
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
	@ResponseBody
	@RequestMapping(value = "idCheck.bit", method = { RequestMethod.POST })
	public List<String> idCheck(HttpServletRequest request, Model model) throws IOException {

		String id = request.getParameter("userid");

		return joinService.idCheck(id);
	}
	
	// nick 중복체크 Ajax 호출
	@ResponseBody
	@RequestMapping(value = "nickCheck.bit", method = { RequestMethod.POST })
	public List<String> nickCheck(HttpServletRequest request, Model model) throws IOException {

		String id = request.getParameter("nick");

		return joinService.nickCheck(id);
	}
		
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
