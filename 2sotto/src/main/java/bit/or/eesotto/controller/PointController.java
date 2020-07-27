package bit.or.eesotto.controller;

import java.security.Principal;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.or.eesotto.dto.Point;
import bit.or.eesotto.dto.Qna;
import bit.or.eesotto.service.PointService;

@Controller
@RequestMapping("/point/")
public class PointController {
	
private static final Logger logger = LoggerFactory.getLogger(PointController.class);
	
	@Autowired
	PointService pointse;
	//임시 테스트중
	//포인트 보러가기
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String pointMain(String cp, String ps, Principal principal, Model model) {
	System.out.println("여기까지 들어오니?");
	//String userid = (String) session.getAttribute("userid");
	String userid =  principal.getName();
	logger.info("로그인 유저 아이디: " + userid);
	System.out.println("값이 없니?"+userid);
	HashMap<String, Object> map = pointse.pointView(cp, ps, userid);
	System.out.println("그럼지금 여기 map은"+map);
	// view까지 전달 (forward)
	model.addAttribute("cpage", map.get("cpage"));
	model.addAttribute("pageSize", map.get("pageSize"));
	model.addAttribute("pointList", map.get("pointList")); 		
	model.addAttribute("pageCount", map.get("pageCount"));
	model.addAttribute("totalPointCount", map.get("totalPointCount"));

	return "point/main";
	}
	//포인트 보러가기 끝
	

	// point 보러가기
	/*
	@RequestMapping(value = "main.bit", method = RequestMethod.GET)
	public String pointMain() {

		return "point/main";
	}
	*/
	// pointDetail 보러가기
	@RequestMapping(value = "detail.bit", method = RequestMethod.GET)
	public String pointDetail(String ptindex, Model model) {
		
		Point point = pointse.getPointDetail(ptindex);
		logger.info("내 Qna 글 조회 완료");
		model.addAttribute("point", point);
		
		
		return "point/detail";
	}

}
