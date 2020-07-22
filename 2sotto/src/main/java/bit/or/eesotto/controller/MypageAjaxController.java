package bit.or.eesotto.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import bit.or.eesotto.dto.User;
import bit.or.eesotto.service.MypageService;

@RestController
@RequestMapping("/mypage/")
public class MypageAjaxController {

	private static final Logger logger = LoggerFactory.getLogger(MypageAjaxController.class); 
	
	@Autowired		
	MypageService ms;
	
	// 마이페이지 > 수정 처리
	@RequestMapping(value = "edit.bit", method = RequestMethod.POST)
	public int editUser(User user) {
							
		//String userid = (String)session.getAttribute("userid");
		//String userid =  principal.getName();
		//int result = ms.editUser(user);
		/*
		String msg = null;
		String url = null;
			*/
		//int result = ;
	
		/*
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
		*/
		logger.info("회원정보 수정 완료");
		return ms.editUser(user);	
		
	}
	
	
	@RequestMapping(value = "nickCheck.bit", method = { RequestMethod.POST })
	public List<String> nickCheck(String nick) throws IOException {
		//String id = request.getParameter("nick");
		return ms.nickCheck(nick);
	}
}
