package bit.or.eesotto.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.or.eesotto.dto.BlogComment;
import bit.or.eesotto.dto.User;

import bit.or.eesotto.service.BlogService;
import bit.or.eesotto.service.UserService;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	UserService us;
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class); 

	// human 보러가기
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String adminMain() {

		return "admin/main";
	}
	// detail 보러가기
	@RequestMapping(value = "list.bit", method = RequestMethod.GET)
	public String adminlist() {

		return "admin/list";
	}

	
	
	// detail 보러가기
	@RequestMapping(value = "detail.bit", method = RequestMethod.GET)
	public String adminDetail() {

		return "admin/detail";
	}

	// 대시보드 보러가기
	@RequestMapping(value = "adminMain.bit", method = RequestMethod.GET)
	public String adminViewMain() {

		return "admin/adminMain";
	}
	
	
	// UserTable 보러가기
	@RequestMapping(value = "userTable.bit", method = RequestMethod.GET)
	public String userTable() {

		return "admin/adminUserTable";
	}
	
	// 유저리스트 조회 Ajax  
	@ResponseBody
	@RequestMapping(value = "getUserList.bit", method = { RequestMethod.GET, RequestMethod.POST })
	public List<User> getUserList(User user, Principal principal, Model model) throws IOException {
		
		String userid = principal.getName();
		logger.info("로그인 유저 아이디: " + userid);
		logger.info("로그인 유저 아이디: " + userid);
		List<User> userList = us.getUserList(userid);
		logger.info("너는?: " + userid);
		logger.info("그리고 넌는?: " + userList);
		if(userList!=null) {
			logger.info("유저 "+userid+"유저 조회 완료");
		}else {
			logger.info("유저 "+userid+"유저 조회 실패");
		}
		
		return userList;
	}
	

}
