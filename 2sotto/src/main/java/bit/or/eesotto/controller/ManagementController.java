package bit.or.eesotto.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bit.or.eesotto.dto.Pet;
import bit.or.eesotto.dto.User;
import bit.or.eesotto.service.LoginService;
import bit.or.eesotto.service.ManagementService;

@Controller
@RequestMapping("/management/")
public class ManagementController {
	
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	@Autowired
	private ManagementService managementService;

	// 반려동물 관리 홈 보여주기
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String mainView() {
		return "management/main";
	}

	// 반려동물 등록 페이지 보여주기
	@RequestMapping(value = "register.bit", method = RequestMethod.GET)
	public String registerPets() {
		return "management/register";
	}
	
	// 반려동물 등록 처리
	@RequestMapping(value = "register.bit", method = RequestMethod.POST)
	public String registerPets(Pet pet, HttpSession session, RedirectAttributes redirectAttributes, Model model) {
		
		//////////////////////////파일 업로드 구현 빠진 상태////////////////////////////
		
		String userid = (String)session.getAttribute("userid");
		logger.info("반려동물을 등록한 유저 아이디: " + userid);
		
		// 반려동물 등록한 유저 아이디 저장
		pet.setUserid(userid);
		
		
		/*
		String a = pet.getAge_year();
		String b = pet.getAge_month();
		
		int age_year = Integer.parseInt(a);
		int age_month = Integer.parseInt(b);
		*/
		
		//동물 나이 저장
		pet.setAge( (pet.getAge_year()*12)+pet.getAge_month() );
		
		
		int result = managementService.newPet(pet);
		
		String msg = null;
		String url = null;
		
		if(result == 1) {
			
			logger.info("반려동물 등록 성공");
			
			msg = "반려동물이 등록되었습니다.";
	        url = "../index.jsp";
	        
		} else { 
			
			redirectAttributes.addFlashAttribute("failedRegisterPet", "failed");
			logger.info("반려동물 등록 실패");
			
			msg = "등록 실패";
			url = "javascript:history.back();";

		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "redirect";
	}
	
}
