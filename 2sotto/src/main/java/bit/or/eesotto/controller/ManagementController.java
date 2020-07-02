package bit.or.eesotto.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.or.eesotto.dto.User;
import bit.or.eesotto.service.LoginService;

@Controller
@RequestMapping("/management/")
public class ManagementController {

//	@Autowired
//	LoginService ls;

	// 관리페이지 view
	@RequestMapping(value = "management.bit", method = RequestMethod.GET)
	public String mainView() {
		return "management/management";
	}

	// 관리>일정 페이지 view
	@RequestMapping(value = "schedule.bit", method = RequestMethod.GET)
	public String scheduleView() {
		return "management/schedule";
	}

	// 관리>병원기록 페이지 view
	@RequestMapping(value = "hospitalRecord.bit", method = RequestMethod.GET)
	public String hospitalRecord() {
		return "management/hospitalRecord";
	}

}
