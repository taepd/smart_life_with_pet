package bit.or.eesotto.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.or.eesotto.dao.PetDao;
import bit.or.eesotto.dto.Pet;
import bit.or.eesotto.dto.PetLike;
import bit.or.eesotto.service.*;

@Controller
public class MainController {
	
	@Autowired
	BlogService bs;
	
	@Autowired
	MainService ms;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
//		@Autowired
//		LoginService ls;
		
	
	    // 메인 페이지 
		@RequestMapping("main.bit")
		public String nomalLogin(String userid, String pwd, HttpSession session, Model model) {


			return "redirect:/";
		}
		// 비로그인 메인 페이지 
		@RequestMapping(value = "mainTest.bit", method = RequestMethod.GET)
		public String mainView(String cp, String ps, Principal principal, Model model) {
			
		
			logger.info("작업시작이다..." );
			
			String userid=null;
			
			//블로그 인기글 조회(현재는 그냥 전체글)
			if(principal!=null) {
				userid =  principal.getName();
				logger.info("로그인 유저 아이디: " + userid);
			}
			
			
			HashMap<String, Object> map = bs.myMainView(cp, ps, userid);
			logger.info("모두의 블로그 글 리스트 조회 완료");
			
			// view까지 전달 (forward)
			model.addAttribute("cpage", map.get("cpage"));
			model.addAttribute("pageSize", map.get("pageSize"));
			model.addAttribute("postList", map.get("postList")); 		
			model.addAttribute("pageCount", map.get("pageCount"));
			model.addAttribute("totalPostCount", map.get("totalPostCount"));
			
			
			return "main";
		}
		
		// 로그인 메인 페이지 
		@RequestMapping(value = "mainTest2.bit", method = RequestMethod.GET)
		public String mainViewTest(String cp, String ps, Principal principal, Model model) {
			
			String userid = principal.getName();
			List<PetLike> list = ms.getPetLike(userid);
		
			logger.info("mainTest2로 petLike보내기");
			model.addAttribute("petLikeList", list);
			
			
			return "mainTest2";
		}
		
		
		// 페이결제 메인 페이지 
		@RequestMapping(value = "payTest.bit", method = RequestMethod.GET)
		public String payViewTest(String cp, String ps, Principal principal, Model model) {
			
		
			logger.info("다시작업시작이다..." );
			
			
			
			return "/payTest";
		}
		

}
