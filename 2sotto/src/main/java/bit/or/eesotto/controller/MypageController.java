package bit.or.eesotto.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mypage/")
public class MypageController {

	// 마이페이지 view
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String mainView() {
		return "mypage/main";
	}

	// 마이페이지 > 수정 view
	@RequestMapping(value = "edit.bit", method = RequestMethod.GET)
	public String editView() {
		return "mypage/edit";
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
