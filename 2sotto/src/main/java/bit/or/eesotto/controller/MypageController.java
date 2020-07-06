package bit.or.eesotto.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.or.eesotto.dto.User;
import bit.or.eesotto.service.MypageService;

@Controller
@RequestMapping("/mypage/")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired		
	MypageService ms;
	
	// 마이페이지 view
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String mainView() {
		return "mypage/main";
	}

	// 마이페이지 > 수정 view
	@RequestMapping(value = "edit.bit", method = RequestMethod.GET)
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
			
			return "redirect:/login.bit";
		}
	}
	
	// 마이페이지 > 수정 처리
	@RequestMapping(value = "edit.bit", method = RequestMethod.POST)
	public String editUser(User user, Model model) {
							
		int result = ms.editUser(user);
		
		String msg = null;
		String url = null;
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

	// 마이페이지 > 비밀번호 변경 view
	@RequestMapping(value = "editPwd.bit", method = RequestMethod.GET)
	public String editPwd() {
		return "mypage/editPwd";
	}

	// 마이페이지 > 회원 탈퇴 view
	@RequestMapping(value = "withdrawal.bit", method = RequestMethod.GET)
	public String withdrawal() {
		return "mypage/withdrawal";
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
