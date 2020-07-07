package bit.or.eesotto.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mypage/")
public class MypageController {

<<<<<<< HEAD:2sottoNoGit/src/bit/or/eesotto/controller/MypageController.java
=======
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@Autowired		
	MypageService ms;
	
>>>>>>> 858ed5cad6a6f648d48aad101f615001d4320978:2sotto/src/main/java/bit/or/eesotto/controller/MypageController.java
	// 마이페이지 view
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String mainView() {
		return "mypage/main";
	}

	// 마이페이지 > 수정 view
	@RequestMapping(value = "edit.bit", method = RequestMethod.GET)
<<<<<<< HEAD:2sottoNoGit/src/bit/or/eesotto/controller/MypageController.java
	public String editView() {
		return "mypage/edit";
	}
=======
	public String editView(HttpSession session, Model model) {
		
		String userid = (String)session.getAttribute("userid");
		logger.info("로그인 유저 아이디: "+userid);
		
		User user = ms.getUserInfo(userid);
		
		if(user!=null) {
			
			logger.info("유저 정보 가져오기 성공");
			model.addAttribute(user);
			
			return "mypage/edit";
		}else {
			
			logger.info("유저 정보 가져오기 실패");
			
			return "redirect:/login/login.bit";
		}
	}
	
	// 마이페이지 > 수정 처리
	@RequestMapping(value = "edit.bit", method = RequestMethod.POST)
	public String editUser(HttpSession session, String crntPwd, String pwd, Model model) {
							
		String userid = (String)session.getAttribute("userid");
		logger.info("로그인 유저 아이디: "+userid);
		
		User user = ms.getUserInfo(userid);
		
		String msg = null;
		String url = null;
			
		int result = ms.editUser(user);
	
		if(result==1) {
			
			logger.info("회원정보 수정 완료");
			msg = "회원정보 수정 완료";
	        url = "edit.bit";
			
		}else { 
			
			logger.info("회원정보 수정 실패");
			msg = "회원정보 수정 실패";
	        url = "edit.bit";

		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "redirect";	
		
	}	
>>>>>>> 858ed5cad6a6f648d48aad101f615001d4320978:2sotto/src/main/java/bit/or/eesotto/controller/MypageController.java

	// 마이페이지 > 비밀번호 변경 view
	@RequestMapping(value = "editPwd.bit", method = RequestMethod.GET)
	public String editPwd() {
		return "mypage/editPwd";
	}
	
	// 마이페이지 > 비밀번호 변경 처리
	@RequestMapping(value = "editPwd.bit", method = RequestMethod.POST)
	public String editPwd(HttpSession session, String crntPwd, String pwd, Model model) {
							
		String userid = (String)session.getAttribute("userid");
		logger.info("로그인 유저 아이디: "+userid);
		User user = ms.getUserInfo(userid);
		
		String msg = null;
		String url = null;
		
		//현재 비밀번호 제대로 입력했는지 확인
		if(!pwEncoder.matches(crntPwd, user.getPwd())) {
			
			logger.info("현재 비밀번호 입력 불일치");
			msg = "현재 비밀번호 입력이 일치하지 않습니다";
	        url = "javascript:history.back();";
	    
	        //현재 비밀번호와 변경할 비밀번호가 같은 경우    
		}else if(crntPwd.equals(pwd)){
			
			logger.info("현재 비밀번호와 변경 비밀번호 동일");
			msg = "현재 비밀번호와 동일한 비밀번호로 변경할 수 없습니다";
	        url = "javascript:history.back();";
			
		}else {
			
			int result = ms.editPwd(pwEncoder.encode(pwd), userid);
						
			if(result==1) {
				
				logger.info("비밀번호 변경 완료");
				msg = "비밀번호 변경 완료";
		        url = "main.bit";
				
			}else { 
				
				logger.info("비밀번호 변경 실패");
				msg = "비밀번호 변경 실패";
		        url = "javascript:history.back();";
		        
			}
		}
				
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "redirect";	
		
	}
	

	// 마이페이지 > 회원 탈퇴 view
	@RequestMapping(value = "withdrawal.bit", method = RequestMethod.GET)
	public String withdrawal() {
		return "mypage/withdrawal";
	}
	
	// 마이페이지 > 회원 탈퇴 view
	@RequestMapping(value = "withdrawal.bit", method = RequestMethod.POST)
	public String withdrawalOk(Model model, HttpSession session) {
		
		String userid = (String)session.getAttribute("userid");
		logger.info("로그인 유저 아이디: "+userid);
		
		int result = ms.deleteUser(userid);
		
		String msg = null;
		String url = null;
		
		if(result==1) {
			session.removeAttribute("userid");
			session.invalidate();
			
			logger.info("회원탈퇴 처리완료");
			msg = "회원 탈퇴가 정상적으로 처리되었습니다.";
	        url = "../index.jsp";
			
		}else { 
			
			logger.info("회원탈퇴 처리실패");
			msg = "문제가 생겨 회원탈퇴가 정상적으로 이루어지지 않았습니다.";
	        url = "main.bit";

		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "redirect";	
		
	}

	// 마이페이지 > 반려동물 상세페이지 view
	@RequestMapping(value = "myPetPage.bit", method = RequestMethod.GET)
	public String myPetPage() {
		return "mypage/myPetPage";
	}

	// 마이페이지 > 반려동물 상세페이지 >> 반려동물 수정 view
	@RequestMapping(value = "editPet.bit", method = RequestMethod.GET)
	public String editPet() {
		return "mypage/editPet";
	}

}
