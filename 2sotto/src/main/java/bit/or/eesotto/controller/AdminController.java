package bit.or.eesotto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/")
public class AdminController {

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
	

}
